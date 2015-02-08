(* The Balck-Scholes (1973) stock option formula *)
(* See E.Haug, http://www.espenhaug.com/black_scholes.html *)

cnd[z_] := (1 + Erf[ z / Sqrt[2] ]) / 2; (* Cumulative normal distribution *)

d1[S_, X_, T_, r_, v_] = (Log[S/X] + (r + v*v / 2) *T) / (v * Sqrt[T]);

d2[S_, X_, T_, r_, v_] = (Log[S/X] + (r - v*v / 2) *T) / (v * Sqrt[T]);

BlackScholesCall[S_, X_, T_, r_, v_] =
  S * cnd[ d1[S, X, T, r, v] ] - X * Exp[-r * T] * cnd[ d2[S, X, T, r, v] ];

BlackScholesPut[S_, X_, T_, r_, v_] =
  X * Exp[-r*T] * cnd[ -d2[S, X, T, r, v] ] - S  * cnd[-d1[S, X, T, r, v] ];
