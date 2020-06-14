functions {
  vector tail_delta(vector y, vector theta, real[] x_r, int[] x_i) {
    vector[2] deltas;
    //values between 5 and 10 with probabilty 98%
    deltas[1] = inv_gamma_cdf(theta[1], y[1], y[2]) -0.01; //only 1% will be <5
    deltas[2] = inv_gamma_cdf(theta[2], y[1], y[2]) -0.99; //olny 1% will be >10
    return deltas;
  }
}
data {
  vector<lower=0>[2] y_guess;
  vector<lower=0>[2] theta;
}
transformed data {
  vector[2] y;
  real x_r[0];
  int x_i[0];
  y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i, 1e-10, 1.2e-2, 1e6);
  print("alpha = ", y[1]);
  print("beta = ", y[2]);
}
generated quantities {
  real alpha = y[1];
  real beta = y[2];
}
