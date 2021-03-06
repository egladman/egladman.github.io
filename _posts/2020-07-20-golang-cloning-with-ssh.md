---
layout="_layouts/post.html"
title="Golang: Using SSH instead of HTTPS to git clone packages"
tags="golang progamming git"
---

![Go Gopher - https://golang.org/doc/gopher/](/img/post/2020/07/20/appenginegopher.jpg)

<!--
The Go gopher was designed by Renee French. (http://reneefrench.blogspot.com/)
The design is licensed under the Creative Commons 3.0 Attributions license.
Read this article for more details: https://blog.golang.org/gopher
-->

## The Problem

By default `go get` clones git repository using `https`. This works for most people. `go get` will return `0`, and they'll carry on with their project. For me it wasn't quite as simple. Whenever I'd run `go get <package>` I'd be greeted with the following error message after staring at a blank cursor for what felt like an eternity:

    [eli@host]$ go get github.com/example/example
    # cd .; git clone -- https://github.com/example/example /home/eli/go/src/github.com/example/example
    Cloning into '/home/eli/go/src/github.com/example/example'...
    error: RPC failed; curl 18 transfer closed with outstanding read data remaining
    fatal: the remote end hung up unexpectedly
    fatal: early EOF
    fatal: index-pack failed
    package github.com/example/example: exit status 128


The smoking gun:

    curl 18 transfer closed with outstanding read data remaining
    
This meant the TCP connection to https://github.com/example/example was prematurely disconnected. 

## The Cause

It's sorta obvious but I'll say it anyways, `libcurl` was timing out due to shotty internet. 

You see, I have soul-crushingly slow satellite internet. Unlike most people in the developed world I'm dependant on a ~500Kbps connection with 800-1000ms ping. Over the years this has led to numerous problems and headaches. Add this to the list. 

## The Solution
    
Instead of using cloning repostories over `https` lets use `ssh`. This problem has already been solved, let's not reinvent the wheel, `ssh` keeps the connection alive. When given the choice I clone via `ssh` so this was the natural choice. In hindsight it's why I've had little to no trouble cloning larger git repositories.
    
All we have to do is amend our git config file to redirect github `https` clones with their `ssh` counterpart.

    git config --global --add url."git@github.com:".insteadOf "https://github.com/"

**Note:** `--global` specifies that we write to `$HOME/.gitconfig` if this is undesirable we can write to the repositories local `.git/config` *This is the default behavior of `git config`*

    git config --add url."git@github.com:".insteadOf "https://github.com/"

## Final Thoughts

Down the road I might run into a hiccup since I'm changing the default behavior of git, but I don't see much of a problem since I'm changing the behavior on a per project basis. Worse case I strip the line from `.git/config`
