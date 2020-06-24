---
layout="layouts/post.html"
title="Parsing INI Files with Pure Bash"
tags="bash"
---
While working on my static site generator [squib](https://github.com/egladman/squib), I decided to transition the configuration file to a `.ini`. The rational being that I needed a simple format that could easily be parsed with minimal effort. Squib is written 100% in Bash, so I wanted a solution that didn't require additional dependencies.

Prior to this I'd sourced a shell script that exclusively contained variables. It worked relatively well until I needed variables with multi-line values. It became messy as I resorted to using a combination of heredocs and `cat`.

The solution below uses only Bash's builtins. It's rough around the edges and doesn't fully comply with the INI spec, but it does exactly what I need it to. If you have any feedback please comment in the [gist](https://gist.github.com/egladman/e2f3b0ee391cba1c7deb12452799327e).

### The Code

    parse_ini() {
        # Usage: parse_ini "path/to/file"
        #        parse_ini "path/to/file" false

        # By default variables will be evaluated. Disable this by passing in "false"

        local regex_contains_variable="^([a-zA-Z0-9_]{1,})([[:space:]]\=[[:space:]])(.*)$"
        local regex_contains_wrapped_quotes="^([\"\'])(.*)([\"\'])$"
        local regex_contains_inside_quotes="^([\"])(.*)([\"])(.*)([\"])$"

        local multi_line=""
        while IFS='' read -r line || [[ -n "$line" ]]; do
            # Strip trailing comments from line
            if [[ "$line" == *[[:space:]]\#* ]]; then
                line="${line%%\#*}"
            fi

            case "$line" in
                \#*|\;*)
                    # Ignore commented line
                    continue
                    ;;
                \[*|*\])
                    # There is no explicit "end of section" delimiter; sections end at
                    # the next section declaration
                    section="${line##\[}"     # Strip left bracket
                    section="${section%%\]}_" # Strip right bracket
                    continue
                    ;;
                *\\)
                    multi_line+="${line%%\\}\n"
                    ;;
                *)
                    if [[ -n "$multi_line" ]]; then
                        multi_line+="$line"
                        line="$multi_line"
                        multi_line=""
                    fi
                    ;;
            esac

            if [[ ! "$line" =~ $regex_contains_variable ]] || [[ -n "$multi_line" ]]; then
                continue
            fi

            local name val
            val="${line/*\= }"            # Everything after the equals sign
            name="${section}${line/$val}" # Invert match. This way we know we've captured everything
            name="${name%% *}"            # Remove trailing whitespace and equals sign

            # Wrap 'val' in quotes if they're missing
            if [[ ! "$val" =~ $regex_contains_wrapped_quotes ]]; then
                val="\"$val\""
            fi

            if [[ "$val" =~ $regex_contains_inside_quotes ]]; then
                local tmp
                tmp="${val##\"}"      # Strip left quote
                tmp="${tmp%%\"}"      # Strip right quote
                tmp="${tmp//\"/\\\"}" # Escape all quotes
                val="\"$tmp\""        # Add back the wrapped quotes
                unset tmp
            fi

            local declaration
            declaration="$(printf '%b\n' "$name=$val")"

            [[ "$2" == "false" ]] || eval "$declaration"
            printf '%s\n' "$declaration"
        done < "$1"

    }


### Sample INI

    # A comment 
    ; Another comment

    foo = Hello World

    ; First Section
    [Apples]

    key = "value"
    integer = 1234
    real = 3.14
    string1 = "Case 1"
    string2 = 'Case 2'

    ; Second Section
    [Oranges]

    key = new value
    integer = 1234
    real = 3.14
    pangram = The quick\
    brown fox\
    jumps over the lazy dog
    string2 = 'Case 2'

### Results

The following variables will be set:

    foo="Hello World"
    Apples_key="value"
    Apples_integer="1234"
    Apples_real="3.14"
    Apples_string1="Case 1"
    Apples_string2='Case 2'
    Oranges_key="new value"
    Oranges_integer="1234"
    Oranges_real="3.14"
    Oranges_string1="Case 1"
    Oranges_pangram="The quick\nbrown fox\njumps over the lazy dog"
    Oranges_string3="Case 3"



