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
  
  

  
  # Probability
P(Alice Then going onto win) = $(1 - β) \times α$
  
Therefore, P(Alice misses first then goes onto win) = $P_{1} = P((1-β\times)α|1-α)$