data {
  int<lower=0> n;   //number of observations
  int<lower=0> Q;   //number of random effect levels
  int<lower=0> P;   //number of fixed effect levels
  int y[n];      //response vector
  matrix[n,Q] Z;     //indicator matrix for random effect levels
  matrix[n,P] X;     //design matrix for fixed effects
}

// The parameters accepted by the model. 
// accepts three sets of parameters 'beta', 'u' and 'sigma'.
parameters {
  vector[P] beta; //vector of fixed effects of length P.
  vector[Q] u; //vector of random effects of length Q.
  real<lower=0> sigma; //random effect standard deviation
}


// The model to be estimated. We model the output
// 'y' to be bernoulli with logit link function, 
// and assume a i.i.d. normal prior for u.
model {
  u ~ normal(0,sigma);                //prior for random effects.
  y ~ bernoulli_logit(X*beta+ Z*u);  //likelihood
  
} 
