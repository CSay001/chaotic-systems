"""Logistic map: bifurcation diagram and Lyapunov exponent.

The logistic map x_{n+1} = r * x_n * (1 - x_n) is iterated for many values of
the control parameter r. For each r we

  1. discard the first iterations (transient), so x settles onto its attractor,
  2. record the following iterations -> bifurcation diagram,
  3. average log|f'(x_n)| = log|r * (1 - 2 x_n)| over the same iterations
     -> Lyapunov exponent (lambda > 0: chaos, lambda < 0: periodic/stable).
"""
import os
import numpy as np
import matplotlib.pyplot as plt

R = np.linspace(1, 4, 10000)   # control parameter values
N_TRANSIENT = 500              # iterations discarded (transient)
N_KEEP = 200                   # iterations kept for the plots

rng = np.random.default_rng(0)

X, Y = [], []   # bifurcation diagram points (r, x)
LE = []         # Lyapunov exponent for each r

for r in R:
    x = rng.random()              # random initial condition in (0, 1)

    for n in range(N_TRANSIENT):  # ignore the transient
        x = r * x * (1 - x)

    log_derivs = []
    for n in range(N_KEEP):
        x = r * x * (1 - x)
        X.append(r)               # every iterate is a point on the attractor
        Y.append(x)
        # small floor avoids log(0) at superstable points (e.g. r = 2, x = 0.5)
        log_derivs.append(np.log(max(abs(r - 2 * r * x), 1e-12)))

    LE.append(np.mean(log_derivs))

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(9, 9), sharex=True)

ax1.plot(X, Y, ls='', marker=',', color='black', alpha=0.25)
ax1.set_title('Bifurcation diagram of the logistic map')
ax1.set_ylabel('x')

ax2.plot(R, LE, ls='', marker=',', color='tab:blue')
ax2.axhline(0, color='red', lw=0.8)
ax2.set_ylim(-8, 1)
ax2.set_title('Lyapunov exponent')
ax2.set_xlabel('r')
ax2.set_ylabel('λ')
ax2.grid(True, alpha=0.3)

plt.tight_layout()
os.makedirs('figures', exist_ok=True)
plt.savefig('figures/logistic_map.png', dpi=150)
plt.show()
