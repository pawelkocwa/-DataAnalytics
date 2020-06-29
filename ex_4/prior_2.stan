data 
{
//number of years
  int M;
}

generated quantities 
{
  real lambda=normal_rng(650,274);
  
  int y_sim[M];
  
  for (k in 1:M) 
  {
    y_sim[k] = poisson_rng(lambda);
  }
}
