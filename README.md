# Toxic code explorer demo

Click [here](https://kornysietsma.github.io/toxic-code-explorer-demo/) to see the live demo!

A fairly simple treemap to view simple language-agnostic code metrics:

- Lines of code
- Age since last change (months)
- Number of authors
- Indentation as a proxy for complexity
    - average (actually median) indentation
    - greatest (actually P95) indentation

These are fairly simple measures that just point you in the general direction
of toxic code.  They should not be mistaken for code quality metrics!

However, they have the huge advantage that they can be determined in an almost
language-agnostic way, and quite quickly.  I have other tools that will be
published soon that use:

- cloc to get lines-of-code measures
- code-maat to get code age and number of authors from git or other SCM systems
- simple clojure code to measure source code indentation

Stay tuned - I'll update this readme when the other bits are available.

Pre-generated metrics are included for several big open-source projects. In time
I'll publish the tools and scripts to calculate similar files yourself.  At the
moment it's all hard-coded to make it easy to demo.

## About the code

Code is originally based on some thrown-together work a few years ago.

It is far from perfect - it's been cleaned up but has some ugly warts around
state management, still needs a fair bit of lovin'

D3 approach is from my sample at https://github.com/kornysietsma/d3-modern-demo :

- native es6, this won't work on any browser more than a few months old!
Specifically, it needs es6 module support - https://caniuse.com/#feat=es6-module - so no IE support for a start.
- it uses css grids in a fairly basic way, similarly needing a new browser
- it tries to prefer immutable data structures using immutable.js - actually I gave up
and used mutating state in several areas, as d3 mutates things all over the place.
- no Ajax needed - data is exported as JavaScript objects so you can view
the demo structures with a trivial http server, or on Github.

Run 'simple_server.sh' to view this on localhost - or when I have it set up
properly you'll be able to view it on github.
