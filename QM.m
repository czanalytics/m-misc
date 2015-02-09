(* Quantum mechanics and particles *)

(* gamma e -> gamma e scattering *)
p1 = h / lam0 {1,0,0,1}; (* photon four-moment, the initial wavelength  *)
p2 = m        {1,0,0,0}; (* electron, mass m *)

p3 = h / lam1 {1,     Sin[o1],0,    Cos[o1]}; (* scattering wavelength lam1 , angle o1 *)
p4 = m   gamf {1, -vf Sin[o2],0, vf Cos[o2]}; (* recoil velocity vf *)

eq1 = p1 + p2 == p3 + p4 //Thread; (* conservation of momentum *)
eq1 //ColumnForm


flux::usage = "flux[psi] returns the directed flux.";
flux[psi_] := (
    hbar / (2 I m) ( (psi//conjugate) Grad[psi] - Grad[psi//conjugate] (psi) )
)
