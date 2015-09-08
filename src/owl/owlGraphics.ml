(*
 * owl.ml
 * ----------------
 * Copyright : (c) 2015, Steve Zdancewic <steve.zdancewic@gmail.org>
 * Licence   : BSD3
 *
 * This file is a part of owl.
 *)

(* Wrapper for OCaml's graphics library. *)

type color = Graphics.color
		
let rgb ~red:r ~green:g ~blue:b : color =
  Graphics.rgb r g b
	       
(* redefine the color palette *)
let white   = rgb 255 255 255
let grey    = rgb 128 128 128			 
let black   = rgb 0 0 0
let red     = rgb 239 41 41
let orange  = rgb 245 121 0
let yellow  = rgb 252 233 79
let green   = rgb 78 154 6
let blue    = rgb 52 101 164
let violet  = rgb 117 80 123	       
let cyan    = rgb 0 255 255
let magenta = rgb 255 255 0
let brown   = rgb 180 95 0
		 
let colors = [
    "white";
    "black";
    "red";
    "orange";
    "yellow";
    "green";
    "blue";
    "violet";
    "cyan";
    "magenta";
    "brown";
  ]

let set_color ~color:c =
  Graphics.set_color c
		 
let make_window () =
  Graphics.close_graph ();
  Graphics.open_graph " 500x500";
  Graphics.set_window_title "Owl Graphics";
  Graphics.set_font "-*-helvetica-bold-r-*-*-17-120-*-*-*-*-iso8859-1";
  Graphics.set_line_width 3

let clear_window () =
  Graphics.clear_graph ()

let resize_window ~width:w ~height:h =
  Graphics.resize_window w h

let width () : int =
  Graphics.size_x ()

let height () : int =
  Graphics.size_y ()

let dot ~x ~y =
  Graphics.plot x y
		  
let line ~x1 ~y1 ~x2 ~y2 =
  Graphics.moveto x1 y1;
  Graphics.lineto x2 y2
		  
let rect ~x ~y ~width ~height =
  Graphics.draw_rect x y width height

let circle ~x ~y ~radius =
  Graphics.draw_circle x y radius

let ellipse ~x ~y ~rx ~ry =
  Graphics.draw_ellipse x y rx ry

let text ~x ~y ~s =
  Graphics.moveto x y;
  Graphics.draw_string s
			
let fill_rect ~x ~y ~width ~height =
  Graphics.fill_rect x y width height

let fill_circle ~x ~y ~radius =
  Graphics.fill_circle x y radius

let fill_ellipse ~x ~y ~rx ~ry =
  Graphics.fill_ellipse x y rx ry


			
let draw_owl ~x ~y =
  set_color brown;
  text x y "{";
  set_color black;
  Graphics.draw_string "o";
  set_color orange;
  Graphics.draw_string ",";
  set_color black;
  Graphics.draw_string "o";
  set_color brown;
  Graphics.draw_string "}";
  text x (y - 17) "/)__)";
  set_color orange;
  text x (y - 34) " \" \""
  
