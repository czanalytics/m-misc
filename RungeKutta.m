(* S.Wolfram: Mathematica (1988) p520 *)

RungeKutta::usage = "RungeKutta[f, {x,y}, {x0, y0}, h, ntot] gives
   ntot {x, y} pairs by integrating the equation y´==f by 
   4th order stepwise Runge-Kutta method. 

   In[1]:= RungeKutta[ 1-x y^2, {x, y}, {0, 0}, 0.1, 40]"

RungeKutta[f_, {x_, y_}, {x0, y0}, h_, ntot_] :=
  NestList[ RKStep[f, {x,y}, #, h]&, {x0, y0}, ntot ]

(* NestList[f, x, 2} gives {x, f[x], f[f[x]]} *)

RKStep[f_, {x_,y_}, {xn_, yn_}, h_] :=
  Block[ {k1, k2, k3, k4},
	 k1 = h f /. {x -> xn,         y -> yn} ; 
	 k2 = h f /. {x -> xn + h/3,   y -> yn + k1/3} ; 
	 k3 = h f /. {x -> xn + 2 h/3, y -> yn - k1/3 + k2} ; 
	 k4 = h f /. {x -> xn + h,     y -> yn + k1 - k2 + k3} ; 
         {xn + h, yn + (k1 + 3 k2 + 3 k3 + k4) / 8}
       ]
