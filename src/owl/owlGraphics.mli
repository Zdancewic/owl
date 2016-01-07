type color

val rgb : red:int -> green:int -> blue:int -> color
       
val white  : color
val black  : color
val red    : color
val orange : color
val yellow : color
val green  : color
val blue   : color
val violet : color
val cyan    : color
val magenta : color
val brown   : color

val colors : string list
val set_color : color:color -> unit

val make_window  : unit -> unit
val clear_window : unit -> unit
val width  : unit -> int
val height : unit -> int		      

val dot     : x:int -> y:int -> unit
val line    : x1:int -> y1:int -> x2:int -> y2:int -> unit
val rect    : x:int -> y:int -> width:int -> height:int -> unit
val circle  : x:int -> y:int -> radius:int -> unit
val ellipse : x:int -> y:int -> rx:int -> ry:int -> unit
val text    : x:int -> y:int -> s:string -> unit
						      
val fill_rect    : x:int -> y:int -> width:int -> height:int -> unit
val fill_circle  : x:int -> y:int -> radius:int -> unit
val fill_ellipse : x:int -> y:int -> rx:int -> ry:int -> unit

val draw_owl : x:int -> y:int -> unit
