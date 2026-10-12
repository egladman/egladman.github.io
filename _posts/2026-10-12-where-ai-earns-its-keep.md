---
title: "Where AI Earns Its Keep (and Where It Doesn't)"
description: A skeptic's notes on where AI earns a place in how I work (mostly thinking out loud) and where a person or a plain old tool still does better.
tags: [opinion, ai, adhd, devx, programming]
---

The last post here is from 2020. I came to AI tooling as a skeptic and I still am one. The long version of that is in [I think our tools are the problem](https://eli.gladman.cc/magus/blog/2026/08/18/i-think-our-tools-are-the-problem/). This one's more personal: where it's earned a place in how I work, and where it hasn't.

It started with [Goblin Tools](https://goblin.tools), a collection of small tools for when things feel too big or complicated. One breaks a task into steps, another turns a brain dump into a list of actions. I used them for daily life long before I let a model anywhere near my code. Small, sharp tools that each do one thing: the Unix philosophy pointed at executive function.

## Thinking out loud

I have ADHD, and ideas come faster than I can put them into words. Most of what I use a model for has nothing to do with code: turning a brain dump into a plan, or working out what I actually want to say.

A lot of it starts with voice dictation. I ramble, and the model helps me put words to what I already mean, especially when the right one is stuck on the tip of my tongue. (There's a word for that, lethologica, and fittingly I couldn't think of it.) Naming code is the same problem, and rambling through a few bad names out loud usually gets me to a decent one. What comes back is never finished, but it's on the page, and I can iterate on a page. A blank one has stopped me more often than a hard problem has.

It's fair to ask whether that's a crutch. I don't think it is. The thinking is still mine; the model keeps pace with it and gives me something to push against. If it ever starts doing the thinking for me, I'll stop.

It's also helped with follow-through. My side projects used to stall at ninety percent, right after I'd told somebody about them and something shinier came along. Having something to think out loud with gets me over that last stretch. [magus](https://eli.gladman.cc/magus/) is the furthest I've ever taken anything.

ADHD also gives me a good eye for patterns, and I'm still learning when to speak up about what I see. If I'm right, raising it early makes the problem cheaper to fix. If I'm wrong, I've spent people's attention on nothing.

## Home versus work

It took me a while to realize I shouldn't use it the same way in both places. At home I own the whole setup, and the bill is mine. Most of it goes into building magus. I decide what the work is for and exactly what goes into context, and one main session drafts the plan (usually Opus or Fable). Everything else fans out to subagents and only what matters comes back, so one session lasts me about two days.

Work is different, and I've had to adjust. The cost of a session there is shared and visible, and that's a fair thing for a team to care about. A habit that's fine on my own account reads differently on a company one. So I treat it like any other shared resource: I agree on scope, and what the work is worth spending, before I start. I do the planning myself, use Sonnet for implementation, and save the bigger models for the problems that need them. The next step is naming the public functions myself and handing over only the bodies.

Context is shared too, and in a monorepo nobody owns it. Anyone can add a skill or an instruction file, people use different editors, and each tool reads those files differently. It's easy to add something that helps your own setup and quietly bloats everyone else's context, and nobody gets a failing test for it. I don't think the industry has reckoned with that yet.

## Old problems, new names

For most implementation work you don't need a smarter model. You need a better harness, and by harness I mean the feedback loop around the model. Software that fights its users (inconsistent behavior, broken conventions, errors that tell you nothing) fights an agent the same way, so fixing it pays off twice. It starts with knowing who your users are. If you build developer tools, your users are technical, so give them an error they can act on, not "oops, something broke." Most of what gets sold as prompt engineering or graph engineering is an old computer science problem with a new name.

The best harness I've built is pointing magus at my own session data. Each agent transcript, read against magus's own trail, shows where magus stopped something and where it should have and didn't. I have an agent read those transcripts, fix what they show, and run it again. It's the fastest loop I've had on any project.

Plenty of those old problems already have good answers, and they aren't models. Static analysis catches whole classes of bugs the same way every time. Dependabot keeps dependencies current without anyone writing a prompt. Swapping either for an LLM trades a deterministic tool for a guess. Let's not reinvent the wheel.

Every line of code is tech debt the moment it's written, and the most secure code is still no code at all. Things last because of the people around them and what they cost to maintain, and maintenance is the part vibe coding skips. A model only knows what you told it. Give it thin context, add some scope creep, and you get a pile of half-considered code with dormant vulnerabilities inside. I think a lot of bad code is being written right now, and we'll be cleaning it up for a long time.

## Writing for people

Not long ago another engineer told me they'd started writing code comments for the agents, so the agents could read the rationale. They didn't mean anything by it, and it had never occurred to me, but it stuck. Comments written that way read like instructions to a model, not notes to a colleague. If we're writing for agents instead of for the next person, I think we've lost the plot. It's a slippery slope, and I don't know how widespread that mindset is, but it worries me. I wrote it into a draft of magus's review principles: code and comments are for a human reader, and text padded for an agent's context window is a defect.

The same goes for talking to each other. Slop on its own is fine. When I'm iterating fast, plenty of what a model hands me is slop. The problem is passing it along. Tobi Lütke at Shopify has a name for the worst version of that: a slop grenade, a pile of generated text thrown over the wall for whoever has to read it. Before something reaches another person it has to become a coherent thought, checked and put in my own words. Skip that step and the person on the other end is talking to a meat puppet, someone relaying a model's words as their own. I don't think most people who do it mean any harm. I overthink those exchanges enough that I understand the pull. A model can help me sort out what I think, but the words I send to another person should be mine.

## Adding versus deleting

In my experience, an agent left to itself adds. It reaches for another helper, another guard, another file, and it rarely suggests deleting anything unless I've told it that's on the table. I'm not the only one who's noticed. A paper from this summer, [To Add Is Machine, To Delete Is Human](https://arxiv.org/abs/2607.28887), measured it: on real repairs, frontier models removed at most about 72% of the code developers removed, and 29% of passing patches wrapped the code in a guard instead. The agent works inside limits nobody set, so I set them out loud: deleting this is fine, breaking that is fine.

Once deleting is on the table, review is where these tools have helped me most. I wrote a review skill that fans out into three agents. One checks style, one nits every exported signature, and one tries to break the code and then hunts for anything dead or half-finished. Each finding is a choice to finish the thing or delete it. It costs enough that I pick my moments, but it gave my Go a consistency I wouldn't have kept up alone.

Go says a little copying is better than a little dependency, and I've opened enough codebases where following one behavior meant opening a dozen files to believe it. Untangling that is a nightmare.

So I push back the way I would with any engineer I pair with, hardest when the big model is planning. It'll agree with almost anything. Somebody still has to drive the session, or the work never adds up to a coherent direction.

## Final thoughts

This is a strange time to be a software engineer, and we're all figuring it out as we go. I'm not sold on most of what gets claimed about this, and I doubt much of the current tooling survives. Software is where it holds up. (Art is a different conversation, and a less charitable one.)

AI rewards people who know their field inside and out. Someone with deep expertise and a lighter technical background can now build something people want because they understand the problem.

For me that field is developer experience, especially build tools and package managers, and the part I love sits underneath them: how a dependency graph works, and the algorithms that resolve and walk it. That's been a fascination of mine for as long as I can remember. Some people are like that about trains. I always had the background for something like [magus](https://eli.gladman.cc/magus/). What I didn't have was the time and energy to see it through. There are still plenty of evenings I don't want to be in front of a computer, but on the ones I do, I get further than I used to.

People just starting out are the ones I worry about. Nobody knows a field inside and out on day one; you get there by being bad at it first. Every developer has stared at a syntax error at one in the morning until they found the missing semicolon, and that friction is a rite of passage. A few years ago nobody pushed this on students; now it's everywhere in school. The big providers could change pricing or pull access anytime, and debugging without a model is a skill and a way of thinking. If a model always finds the semicolon for them, they never learn to find it themselves, and that does the next generation a real disservice.

Knowing your field doesn't make you immune, either. I'd like to think I use these tools well, but the longer I use them, the harder that is to judge from the inside. Even the way I write has shifted. I catch myself reaching for em dashes in places I never used to (just not in this post), and I couldn't tell you whether I picked that up from the models or they picked it up from people like me. So I read every line before it goes out. Whether it's code or a post like this one, whatever wrote the first draft, my name is on it, and I answer for it.
