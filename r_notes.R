# Matt Prill
# Fundamentals of Data Science
# Work from  Exercise Sheets

# Let X ??? Binom(5, 0.2). To get the probabilities (P(X = 3), P(X = 4), P(X = 5)) we can use the following command:
dbinom(x=3:5,10,0.2)


# Let Y ??? Pois(1). To get the probabilities (P(Y ??? 0), P(Y ??? 1), P(Y ??? 2)) we can use
ppois(q=0:2,lambda=1) # cumulative probability
dpois(0:2, lambda=1)  # Exact probabilites

# Number of failures before the first success (5 times over)
# Draw 5 samples from a Geom(0.3). Note that R uses the alternative definition of the geometric distribution. 
# Therefore to get samples using our original definition we have to add one to each sample. That is
rgeom(5,0.3) + 1

#Let X ∼ Binom(100, 0.2). To find the quartiles of X we use the following:
qbinom(c(0.25,0.5,0.75),100,0.2)

# Sample first 7 letters of alphabet randomly without replacment and ouptut 7
sample(LETTERS[1:7], 7)

sample(1:6, 3, replace = TRUE)  # roll 3fair dice


# Sampling 10 balls with replacement from an urn that contains 3 times as many black balls as gold ones.
rbinom(1, 10, 0.75) 
# or
balls <- c("Black", "Gold")
probabilities <- c(3/4, 1/4)  # 3 times as many black balls as gold

# Simulate drawing 10 balls with replacement
sampled_balls <- sample(balls, 10, replace = TRUE, prob = probabilities)
print(sampled_balls)


# . Choosing 5 random numbers from (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) without replacement.
sample(c(1:10), 5, replace = F) 


# Randomly select three distinct integers a, b, c from the set {1,2,3,4,5,6,7}. What is the probability that a +b > c?

sample(1:7, 3)


#Let X ∼ Pois(2). Find the probability that X is:

#a. zero,
dpois(0, lambda = 2)

#b. 2 or 3,
dpois(2, lambda = 2) + dpois(3, lambda = 2)

#c. at most 5,
ppois(5, lambda = 2) 

#d. at least 6.
1 - ppois(6, lambda = 2)


# What are the 1st, 2nd, and so forth 10-quantiles of the Binom(10,1/3) distribution?
qbinom(seq(0.1, 0.9, by = 0.1), 10, 1/3)


# We take 100 samples from a production line, that historically produces 5% defective product. Estimate
# the probability (using the relative frequency approach) that exactly 5 of the sampled items are defective,
# first using the sample function, then using the rbinom function. Compare your estimates with the exact
# probability, which you can obtain by using the dbinom function. (Don’t use Poisson approximation in this exercise.)

N <- 10000 # Number of simulations
n_samples <- 100 # Sample size

# Simulating the defect status (0 = non-defective, 1 = defective)
results <- replicate(N, sum(sample(c(0, 1), n_samples, replace = TRUE, prob = c(0.95, 0.05))))

# Estimating the relative frequency of exactly 5 defective items
relative_freq_sample <- sum(results == 5) / N
relative_freq_sample


binom_samples <- rbinom(N, size = n_samples, prob = 0.05)

# Estimate the relative frequency of exactly 5 defective items
relative_freq_rbinom <- sum(binom_samples == 5) / N
relative_freq_rbinom


dbinom(5, 100, 0.05)  # exact prob



# Let X ∼ Binom(50, 0.2).
# Find the exact expected value and variance of X using the dbinom function and the definitions of expectation and variance. 
# Recall that we can find the variance using V ar(X) = E(X2) − E(X) 2

50 * 0.2 # avg no. success

50 * 0.2 * (1 - 0.2) # Var(X)

all_prob <- dbinom(0:50, 50, prob = 0.2) # probabilties for each number of successes
expected_value <- sum(all_prob * 0:50)  # expected value


# variance
expected_value_X2 <- sum((0:50)^2 * all_prob)

# Compute the variance
variance <- expected_value_X2 - (expected_value)^2


# Rmarkdown notes ----
##### Using mixture of typeset and images of workings out

## See 'R Markdown and Literate programming pdf

<https://ele.exeter.ac.uk/pluginfile.php/4501313/mod_resource/content/3/docs/index.html>
  
  ## See also Rmarkdown cheatsheet
  
  <https://raw.githubusercontent.com/rstudio/cheatsheets/main/rmarkdown.pdf>
  
  #### Typeset Example: Spearmans rmarkdown
  
  $$\ r_s = 1 -\left(\frac{6\sum_{}D^2}{n(n^2-1)}\right)$$
  
  # Images
  
  Note that you must use out.width and out.height to scale external images (fig.height and fig.width won’t work). To see images, must knit file

```{r, echo = FALSE, out.width = "20%"}
library(knitr)
include_graphics("images/Culture.jpeg")

```

echo = FALSE\` parameter added to prevent printing of the R code \# Libraries

```{r libraries, echo = TRUE, message = FALSE, warning = FALSE}
library(ggplot2)  # For Plotting
library(dplyr)  # For data manipulation
```

