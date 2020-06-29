functions {
  vector tail_delta(vector y,       //unknowns
                    vector theta,   //parameters
                    real[] x_r,     // data(real)
                    int[] x_i) {    //data(integer)
    vector[2] deltas;

    deltas[1] = normal_cdf(theta[1], y[1], y[2]) - 0.95; //5% that more than 1066 deaths
    deltas[2] = normal_cdf(theta[2], y[1], y[2]) - 0.05; //5% that less than 223 deaths
    return deltas;
  }
}

data {
  vector<lower=0>[2] y_guess; // Initial guess of Gaussian standard deviation
  vector<lower=0>[2] theta;   // Target quantile
}

transformed data {
  vector[2] y;
  real x_r[0];
  int x_i[0];

  // Find gamma parameters that ensures 90% probabilty from 223 to 1066
  y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i);
  print("mu  = ", y[1]);
  print("sigma = ", y[2]);
}

generated quantities {
  real mu = y[1];
  real sigma = y[2];
}