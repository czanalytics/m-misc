(* Basic language features. S.Wolfram: Mathematica (1988) *)

(* Representing mathematical knowledge *)

Integrate[ x / (1 - x^3), x]
Series[ Exp[-x] Sin[2x], {x,0,6}]
Solve[ { a x + b y == 0, x - y == c }, {x, y}]
{a, b, c} . {x, y, z}  (* dot product *)

(* Transformation rules specify how expressions are transformed into another form *)
log[1] = 0
log[E] = 1
log[x_ y_] := log[x] + log[y]
log[x_^n_] := n log[x]
?log (* gives the rules *)

(* transformations *)
ex = x^2 + 5 y^2 - y^4 
ex /. y^2 -> a
ex /. _^2 -> a
ex /. _^_ -> a
ex /. {{x -> a}, {y -> b}} /. a -> a^2
