# Heston Option Pricing Calibration

Heston1993KahlJaeckelLordRev3 is the Heston option pricing function based on the implementation by Christian Kahl, Peter Jäckel and Roger Lord. The standard Heston formula exhibits a high numerical instability of the integral which is remedied in this implementation.

This function works for plain vanilla (European-style) put and call options and also implements an automatic estimation of the optimal alpha required for the integrand. A user generated alpha can also be used as an optional last argument.

Included are also a Black-Scholes-Merton (BSM) function (bsmec.m) to price European vanilla options and bsmivec.m for calculating the BSM implied volatilites - in case the Financial Toolbox is not available.

## References

* Roger Lord, Christian Kahl. Optimal Fourier inversion in semi-analytical option pricing. 2007
* Roger Lord, Christian Kahl. Why the Rotation Count Algorithm Works. 2006
* Christian Kahl, Peter Jäckl. Not-so-complex logarithms in the Heston model. 2009
* Steven L. Heston. A Closed-Form Solution for Options with Stochastic Volatility with Applications to Bond and Currency Options. 1993

## Usage

Run HestonCalibration.m to perform a sample calibration.

Usage of Heston1993KahlJaeckelLordRev3:

 Input: (PC till q can be vectorized)
 *      PC: 1 for Calls, 2 for Puts
 *      S: Spot
 *      K: Strike
 *      T: Maturity
 *      t: start date
 *      r: interest rate
 *      q: dividend
 *      v0: initial variance
 *      theta: long run mean variance
 *      kappa: mean reversion speed of  volatility
 *      sigma: volatility of volatility
 *      rho: correlation between returns volatility
 *      (alpha:) vector of alphas. if unset function generates alphas

   Output: 
 *      Price for each option
 *      (Alphas)

## Tips
 
Smaller upper boundaries of [100 100 1-eps 100  100  ] instead of [Inf Inf 1-eps Inf Inf ] and trying different starting parameters might help if the calibration gets stuck in a local minimum.


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

30/04/2016: added the bsmec.m and bsmivec.m functions


## License

MIT
