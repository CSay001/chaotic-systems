# gnuplot commands used to inspect the TISEAN output files

# mutual information vs delay
plot "timedel_w.txt"

# reconstructed attractor (tau = 8)
plot "time_delay2" with lines
splot "time_delay3" with lines

# correlation sums and Gaussian kernel correlation integrals (log-log)
set logscale x
set logscale y
plot "w2.c2" with lines
plot "corrint" with lines

# false nearest neighbours
unset logscale
set grid
plot "fnn" with lines

# local slopes of the correlation sum (correlation dimension)
unset grid
set logscale x
plot "w2.d2" with lines

# correlation entropy (log-log)
set logscale y
plot "w2.h2" with lines

# Lyapunov stretching factor
unset logscale
plot "lyapk" with lines
