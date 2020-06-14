data {
    real<lower=0> alpha;
    real<lower=0> beta;
}
generated quantities {
    int<lower=0> y;
    y = neg_binomial_rng(alpha,beta);
}
