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

Installation via opam
---------------------
TODO!

Usage
-----

To use owl, simply run:

    $ owl

owl display a bar after the prompt which is used to show possible
completions in real-time. You can navigate in it using `M-left` and
`M-right`, and select one completion using `M-tab`. The `M` denotes
the meta key, which is `Alt` most of the time.

Creating a custom utop-enabled toplevel
---------------------------------------

### With jbuilder

The recommended way to build a custom utop toplevel is via
[jbuilder][jbuilder]. The entry point of the custom utop must call
`UTop_main.main`. For instance write the following `myutop.ml` file:

```ocaml
let () = UTop_main.main ()
```

and the following jbuild file:

```scheme
(executable
 ((name myutop)
  (link_flags (-linkall))
  (libraries (utop))))
```

then to build the toplevel, run:

```
$ jbuilder myutop.bc
```

Note the `-linkall` in the link flags. By default OCaml doesn't link
unused modules, however for a toplevel you don't know in advance what
the user is going to use so you must link everything.

If you want to include more libraries in your custom utop, simply add
them to the `(libraries ...)` field.

Additionally, if you want to install this topevel, add the two
following fields to the executable stanza:

```scheme
  (public_name myutop)
  (modes (byte))
```

The `(modes ...)` field is to tell jbuilder to install the byte-code
version of the executable, as currently native toplevels are not fully
suported.

[jbuilder]: https://github.com/janestreet/jbuilder


Utop
----

Please see the [utop documentation]:https://github.com/diml/utop for more
configuration options.

Owl would not be possible without utop.  Many thanks to Jeremie Dimino
<jeremie@dimino.org> who developed the original utop code base.
