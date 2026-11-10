:: Nonlinear time-series analysis of w2.txt with TISEAN 3.0
:: Run from a folder containing w2.txt, with the TISEAN binaries on the PATH.

:: (a) Delay time: time-delayed mutual information (first minimum -> tau)
mutual w2.txt -o timedel_w.txt

:: (a) Delay embedding with tau = 8 in 2 and 3 dimensions (phase portrait / phase space)
delay w2.txt -d8 -m2 -o time_delay2
delay w2.txt -d8 -m3 -o time_delay3

:: (b) Correlation sums, local slopes (correlation dimension) and correlation entropy
::     -> writes w2.c2, w2.d2, w2.h2, ...
d2 w2.txt -d8 -o w2

:: (b) Gaussian kernel correlation integrals from the correlation sums
c2g w2.c2 -o corrint

:: (b) False nearest neighbours: 1 component, embedding dimensions up to 10
false_nearest w2.txt -M1,10 -d8 -o fnn

:: (c) Maximal Lyapunov exponent (Kantz algorithm): stretching factor S(dn)
lyap_k w2.txt -d8 -o lyapk
