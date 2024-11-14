# Matt Prill
# Fundamentals assessed exercises 
# Throwaway Notes


# Worse matrix presentation

```{r}
matrix_lambda <- matrix(c("1 - \u03BB", 1, 1,
                          1, "10 - \u03BB", 4,
                          1, 4, "10 - \u03BB"), nrow = 3)

kable(matrix_lambda)


```


\
\
\

#### Identifying Eigenvalues (NOT NEEDED?):

$$
  \Large
\begin{bmatrix}
1 - \lambda & 1 & 1 \\
1 & 10 - \lambda & 4 \\
1 & 4 & 10 - \lambda
\end{bmatrix}
$$
  
  
  
# Quadratic solve not needed
  Therefore, to solve:
  $$
  \Large
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
= x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$
  
  
$$
  \Large
\begin{bmatrix}
x & y & z \\
y & 3 z\\
z \ 
\end{bmatrix} =
  \begin{bmatrix}
1 \\
0 \\
0
\end{bmatrix}
$$
  
  
  diff(pnorm(c(0, 420.75), mean = 426, sd = 2.1))

  
  # Probability
P(Alice Then going onto win) = $(1 - β) \times α$
  
Therefore, P(Alice misses first then goes onto win) = $P_{1} = P((1-β\times)α|1-α)$

# BERNOULLI OR BINOMIAL
This precludes it from being binomial; this would be the case if trials were repeated 1 through till 175, t  It is not repeated n times for each sample $(i)$. If this were the case then the distribution would become binomial.**
  
  This encompasses repeating the trial n-times, thus making both $X_i^{(1)}$ and $X_i^{(2)}$ follow a Binomial distribution. This is because the sum of Bernoulli random variable trail successes $(\sum X_i = X_1 + X_2...,X_{175})$ will denote the number of successes amongst the number if if Is Binomial.
If these were repeated and summed (where $n$ is known (186 or 175)), this repetition would change it from the Bernoulli to a Binomial distribution. This would holds because even though each sample (person) is different, we know that they have the same probability of switching allegiance. 
If this were the case then it would change from from $X_i^{(1)} \sim \text{Bernoulli}(p)$ to $\sum_{i=1}^{175} X_i^{(1)} \sim \text{Binomial}(175, p)$. However the question asks for each individual trail rather than the summed trials so this is not the case.


no._samples <- 175  # No. of Bernoulli trials (one per person)


# q5
# Biases and sample variance for point inference

2.$\hat{\lambda}_2 = \frac{1}{n-1}\times\sum_{i=1}^{n} y_i =  s^2 = \lambda$
  
  Bias: $\text{Bias}(\lambda_2)= E(\lambda_2)- \lambda_2$
  Expectation of lambda: $E(\hat{\lambda}_2) = \frac{1}{n-1}\times \lambda $
  $E(\hat{\lambda}_2) = \frac{\lambda }{n-1} $
  
  
  
  \hat{\mu}


This is a more reliable foundation for a point predictor than variance because variance has wider distribution and is less concentrated around the true λ value.

I can confirm this 
