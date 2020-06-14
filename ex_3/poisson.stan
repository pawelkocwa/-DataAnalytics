
data {
    real<lower=0> lam;
}

generated quantities {
    int<lower=0> y;
    y = poisson_rng(lam);
}