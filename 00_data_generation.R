library(MASS)            # MASS for generating multivariate Normal random variates
library(Matrix)          # Matrix package is for matrix computations, particularly for sparse matrices

p<-10  # Define the number of variables
N<-50  # Define the number of observations
q<-6   # Define the number of non-zero regression coefficients

# Start generating data from a Dirichlet distribution
alpha <- rep(1, p)  # Define the parameters for the Dirichlet distribution

# Initialize an empty matrix Z with N rows and p columns to hold the generated data
Z <- matrix(0, nrow = N, ncol = p)

# Fill the matrix Z with random values drawn from the Dirichlet distribution
for (i in 1:N) {
    Z[i,] <- rdirichlet(1, alpha)
}

# Define the true regression coefficients; first q coefficients are non-zero, rest are zero
beta_scenario <- c(-2, -1.5, -1, 0, 1, 1.5, 2, rep(0, p - q-1))

# Generate the outcome variable y as a linear combination of Z and beta_scenario, plus some random noise
y <- 1 + Z %*% beta_scenario + rnorm(N, sd = 0.1)
