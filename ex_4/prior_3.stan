data 
{
  //number of years analyzed
  int M;
  
  //number of deaths
  int Y[M];
}
parameters {
  real<lower=0>lambda;
}
model {
  lambda ~ normal(644,256);
  for (k in 1:M) {
    Y[k] ~ poisson(lambda);
  }
}
generated quantities {
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
  }
}
