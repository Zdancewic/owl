(*
 * plotFun.ml
 * ----------------
 * Copyright : (c) 2016, Steve Zdancewic <steve.zdancewic@gmail.org>
 * Licence   : BSD3
 *
 * This file is a part of owl.
 *)

;; open OwlGraphics

type vis = {
  f : float -> float;
  c : OwlGraphics.color
}

type plot = {
  functions : vis list;
  x_min : float;
  x_max : float;
  y_min : float;
  y_max : float;
}

let base : plot = {
  functions = [];
  x_min = -1.0;
  x_max = 1.0;
  y_min = -1.0;
  y_max = 1.0;
}

(*
  width (int)  0 : w
  x \in  x_min .. x_max

  x_discrete = int_of_flot ((x - x_min) *. (float_of_int w) /. (x_max - x_min))

  0 = x_min .. w = x_max - x_min 

  example x_min = -1.0  x_max = 1.0
   1.0 -. -1.0 = 2.0
  2.0 /. 500.0 = "scale"
*)

let plot_x p x =
  int_of_float ((x -. p.x_min) *. (float_of_int (width ())) /. (p.x_max -. p.x_min))

let plot_y p y =
  int_of_float ((y -. p.y_min) *. (float_of_int (width ())) /. (p.y_max -. p.y_min))

let fun_x p x =
  ((float_of_int x) /. (float_of_int (width ()))) *. (p.x_max -. p.x_min) +. p.x_min

let draw_axes (p:plot) =
  let px0 = plot_x p 0.0 in
  let py0 = plot_y p 0.0 in
  Graphics.set_line_width 1;
  set_color (rgb 220 220 240);
  line px0 0 px0 (height ());
  line 0 py0 (width ()) py0

let draw_vis p {f; c} =
  let pts = Array.init (width ())
      (fun x -> (x, (plot_y p (f (fun_x p x)))))
  in
  set_color c;
  Graphics.set_line_width 1;
  Graphics.draw_poly_line pts
