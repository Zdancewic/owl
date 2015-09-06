owl - an interactive toploop for OCaml education
================================================

Owl is a modified version of the [utop](https://github.com/diml/utop)
package, with simplified features and default libraries that
are geared toward novice programmers.

The main differences from utop are:

* owl provides simpler default settings and exposes fewer libraries
* owl wraps some of the OCaml libraries to make them more accessible
* owl comes bundled with some modules designed for learning about
  programming 

Installation 
------------

TODO!

Usage
-----

To use owl, simply run:

    $ owl

owl display a bar after the prompt which is used to show possible
completions in real-time. You can navigate in it using `M-left` and
`M-right`, and select one completion using `M-tab`. The `M` denotes
the meta key, which is `Alt` most of the time.


Utop
----

Owl would not be possible without utop.  Many thanks to Jeremie Dimino
<jeremie@dimino.org> who developed the original utop code base.
