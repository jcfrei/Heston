# Heston Option Pricing Calibratin

Heston1993KahlJaeckelLordRev3 is the Heston option pricing function based on the implementation by Christian Kahl, Peter Jäckel and Roger Lord. The standard Heston formula exhibits a high numerical instability of the integral, hence different approaches had to be devised to circumvent the instability. 

This function implements an automatic estimation of the optimal alpha required for the integrand. A user generated alpha can also be used as an optional last argument.

## Usage

Run HestonCalibration.m to perform a sample calibration.

Usage of Heston1993KahlJaeckelLordRev3:

 Input: (PC till q can be vectorized)
       PC: 1 for Calls, 2 for Puts
       S: Spot
       K: Strike
       T: Maturity
       t: start date
       r: interest rate
       q: dividend
       v0: initial variance
       theta: long run mean variance
       kappa: mean reversion speed of  volatility
       sigma: volatility of volatility
       rho: correlation between returns volatility
       alpha: alpha can be supplied by the user, otherwise the function
       attempts to find an payoff-dependent optimum alpha

   Output: Price for each option

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history


## License

MIT
