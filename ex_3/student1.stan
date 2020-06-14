data {
    real<lower=0> nu;
    real mu;
    real<lower=0> sigma;
}

parameters {
    real y;
}

model {
    y ~ student_t(nu, mu, sigma);
}
