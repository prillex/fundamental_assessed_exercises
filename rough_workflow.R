# Matt Prill
# Fundamentals Assessed Exercises
# Workflow R question


#Q4C

# Creating the loops for one day first:

# For the X1 outcomes ----

X1 <- 175  # This will become no. permutations for X1
X1_trials <- numeric(175)  # Where outcomes of each Bernoulli trial will be stored
X1_probs <- c(0.996, 0.004)  # The two probabilities for each X2 trial
results <- c(1, 0) # The corresponding outputs for the probabilities above 
no._X1_successes <- 0  # Initial number of successes (Will grow with loops)


for(i in 1:X1){  # Sampling everyone
  X1_trials[i] <- sample(results, 
                      size = 1, # 1 Bernoulli per person
                      replace = F,  # Only one decision per person (all people must be sampled)
                      prob = X1_probs)  # Pre-specified probabilities
  if (X1_trials[i] == 1) {  # 'If current trial is a success...'
    no._X1_successes <- no._X1_successes + 1  # '...Increase the number of success by 1
  }
}

print(no._X1_successes)




# For X2 outcomes ----

X2 <- 186  # This will become no. permutations for X1
X2_trials <- numeric(186)  # Where outcomes of each Bernoulli trial will be stored
X2_probs <- c(0.005, 0.996)  # The two probabilities for each X2 trial
results <- c(1, 0) # The corresponding outputs for the probabilities above 
no._X2_successes <- 0  # Initial number of successes (Will grow with loops)


for(i in 1:X2){  # Sampling everyone
  X2_trials[i] <- sample(results, 
                      size = 1, # 1 Bernoulli per person
                      replace = F,  # Only one decision per person (all people must be sampled)
                      prob = X2_probs)  # Pre-specificed probabilities
  if (X2_trials[i] == 1) {  # 'If current trial is a success...'
    no._X2_successes <- no._X2_successes + 1  # '...Increase the number of success by 1
  }
}


print(no._X2_successes)

No._B <- X1 - (X1 - no._X1_successes) + no._X2_successes  # No. B supporters after Day 1
No._M <- 361 - No._B  # No. M supporters after Day 1



# Now I need to have this iterated 14 times but have 'No._B' and 'No._M' values
# assigned to the 'X1' and 'X1_trials' and 'X2' and 'X2_trials' respectively 

# For the 14 days:
no._iterations <- 14  # No. days 


X1 <- 175  # This will become no. permutations for X1
X1_trials <- numeric(175)  # Where outcomes of each Bernoulli trial will be stored
no._X1_successes <- 0  # Initial number of successes (Will grow with loops)

X2 <- 186  # This will become no. permutations for X1
X2_trials <- numeric(186)  # Where outcomes of each Bernoulli trial will be stored
no._X2_successes <- 0  # Initial number of successes (Will grow with loops)



for (day in 1:no._iterations) { # Loop for each day (n = 14)
  X1_trials <- numeric(X1)  # Store outcomes for X1 trials
  no._X1_successes <- 0  # Reset success count for X1
  
  for (i in 1:X1) {
    X1_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X1_probs)
    if (X1_trials[i] == 1) {
      no._X1_successes <- no._X1_successes + 1
    }
  }
  
  # For X2 outcomes
  X2_trials <- numeric(X2)  # Store outcomes for X2 trials
  no._X2_successes <- 0  # Reset success count for X2
  
  for (i in 1:X2) {
    X2_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X2_probs)
    if (X2_trials[i] == 1) {
      no._X2_successes <- no._X2_successes + 1
    }
  }
  
  # Calculate No._B and No._M
  No._B <- X1 - (X1 - no._X1_successes) + no._X2_successes
  No._M <- 361 - No._B
  
  # Update X1 and X2 for the next iteration
  X1 <- No._B
  X2 <- No._M
}

print(X1)  # No. B supporters after 14 days
print(X2)  # No M supporters after 14 days














# Now to work out the probability that No._B > No._M, I will nest one more loop
# I will repeat the 14 days experiment thousands of times and 
# calculate what proportion of the outputs have No._B > No._M


# Final loop iterations ----
simulations <- 10000  # This sample size willallow the true probability to be inferred confidently
B_more_than_M <- 0  # Intial No. where B > M


X1 <- 175  # This will become no. permutations for X1
X1_trials <- numeric(175)  # Where outcomes of each Bernoulli trial will be stored
no._X1_successes <- 0  # Initial number of successes (Will grow with loops)

X2 <- 186  # This will become no. permutations for X1
X2_trials <- numeric(186)  # Where outcomes of each Bernoulli trial will be stored
no._X2_successes <- 0  # Initial number of successes (Will grow with loops)



# Run the simulation 10000
for (sim in 1:simulations) {
  
  # Run the 14-iteration loop
  for (day in 1:no._iterations) {
    # For X1 outcomes
    X1_trials <- numeric(X1)
    no._X1_successes <- 0
    
    for (i in 1:X1) {
      X1_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X1_probs)
      if (X1_trials[i] == 1) {
        no._X1_successes <- no._X1_successes + 1
      }
    }
    
    # For X2 outcomes
    X2_trials <- numeric(X2)
    no._X2_successes <- 0
    
    for (i in 1:X2) {
      X2_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X2_probs)
      if (X2_trials[i] == 1) {
        no._X2_successes <- no._X2_successes + 1
      }
    }
    
    # Calculate No._B and No._M
    No._B <- X1 - (X1 - no._X1_successes) + no._X2_successes
    No._M <- 361 - No._B
    
    # Update X1 and X2 for the next iteration
    X1 <- No._B
    X2 <- No._M
  }
  
  # Check if No._B > No._M in the final result and count it
  if (No._B > No._M) {
    B_more_than_M <- B_more_than_M + 1
  }
}

answer <- B_more_than_M/ 10000  # Average number of times B has the majority

print(answer)  # = 0.0981




# Q4d ----

# Repeat but change no. iterations to 60
no._iterations_60 <- 60  # No. days 

# Final loop iterations ----
simulations <- 10000  # This sample size willallow the true probability to be inferred confidently
B_more_than_M <- 0  # Intial No. where B > M


X1 <- 175  # This will become no. permutations for X1
X1_trials <- numeric(175)  # Where outcomes of each Bernoulli trial will be stored
no._X1_successes <- 0  # Initial number of successes (Will grow with loops)

X2 <- 186  # This will become no. permutations for X1
X2_trials <- numeric(186)  # Where outcomes of each Bernoulli trial will be stored
no._X2_successes <- 0  # Initial number of successes (Will grow with loops)



# Run the simulation 10000
for (sim in 1:simulations) {
  
  # Run the 14-iteration loop
  for (day in 1:no._iterations_60) {
    # For X1 outcomes
    X1_trials <- numeric(X1)
    no._X1_successes <- 0
    
    for (i in 1:X1) {
      X1_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X1_probs)
      if (X1_trials[i] == 1) {
        no._X1_successes <- no._X1_successes + 1
      }
    }
    
    # For X2 outcomes
    X2_trials <- numeric(X2)
    no._X2_successes <- 0
    
    for (i in 1:X2) {
      X2_trials[i] <- sample(results, size = 1, replace = FALSE, prob = X2_probs)
      if (X2_trials[i] == 1) {
        no._X2_successes <- no._X2_successes + 1
      }
    }
    
    # Calculate No._B and No._M
    No._B <- X1 - (X1 - no._X1_successes) + no._X2_successes
    No._M <- 361 - No._B
    
    # Update X1 and X2 for the next iteration
    X1 <- No._B
    X2 <- No._M
  }
  
  # Check if No._B > No._M in the final result and count it
  if (No._B > No._M) {
    B_more_than_M <- B_more_than_M + 1
  }
}

answer <- B_more_than_M/ 10000  # Average number of times B has the majority

print(answer)  # = 0.989













# Q5C ----
#  Plotting the derivative of log likelihood function
# -n + \frac{\sum_{i=1}^n y_i}{\lambda}-\frac{ne^{-\lambda}}{1-e^{-\lambda}}

lambdas <- seq(1, 100, length.out = 100) # Creating values from 1-100 increasing by intervals of 1 to represent hypothetical lambda values
n <- 182  # Using given data from the question (n)
sumyi <- 60 # Using data from the question (sum of ys)
DLL_values <-  -n + (sumyi/lambdas) - ((n * exp(-lambdas)) / (1 - exp(-lambdas)))  # Converting the derivative of the LL equation into R


plotting_data <- data.frame(lambda = lambdas, DLL = DLL_values)  # Creating a dataframe of the lambdas and DDL vlaues


plotting_data %>%  # Specifying the dataframe
  ggplot(aes(x = DLL, y = lambda)) +  # Specifying the data
  geom_point() +  # Plotting the  data 
  geom_line() +  # Fitting a line that goes through every points
  theme_classic()  # Removing the background

plotting_data %>%  # Specifying the data frame 
  filter(DLL >=  0) %>%  # Removing all rows where the DLL is > 0
  row_number()  # Printing these. Now I can workout where it becomes positive


























#Q7----
# Data
ozone <- read.csv("data/ozone.csv")

# Libraries
library(tidyverse)  # For all data visualisation (ggplot2) and/or wrangling (dplyr)

# a)
# Exploratory Data Analysis
summary(ozone)  # Summarry statistics


# Multiplot ----
# Radiation
radiation_plot <- ozone %>%  # Choosing data frame and creating a plot with the pipe
  ggplot(aes(x = radiation, y = ozone)) +  # Setting variables for axis
  geom_point() +  # Scatterplot
  labs(x = "Radiation (langleys)", y = "Ozone (ppb)") + # Axis Labels 
  theme_classic()  # Make background white

# Temperature
temperature_plot <- ozone %>%  # Choosing data frame and creating a plot with the pipe
  ggplot(aes(x = temperature, y = ozone)) +  # Setting variables for axis
  geom_point() +  # Scatterplot
  labs(x = "Temperature (farenheit)", y = "Ozone (ppb)") + # Axis Labels 
  theme_classic()  # Make background white

# Wind speed
wind_plot <- ozone %>%  # Choosing data frame and creating a plot with the pipe
  ggplot(aes(x = wind, y = ozone)) +  # Setting variables for axis
  geom_point() +  # Scatterplot
  labs(x = "Wind Speed (mph)", y = "Ozone (ppb)") + # Axis Labels 
  theme_classic()  # Make background white


multiplot(radiation_plot, wind_plot, temperature_plot, cols = 3)

cor(ozone)  # Correlation coefficients between variables

ggpairs(ozone,  # Full matrix
        lower = list(continuous = "smooth"),  # Line OBF
        diag = list(continuous = "barDiag"),  # Order
        axisLabels = "show") +  # Axes
  theme_classic()



## 7b ----
# The mode
model <- lm (ozone ~ temperature + wind + radiation, data = ozone)
summary(model)

# Model validity checks 
# Plot including leverage, normality and homscedacity.
par(mfrow = c(2, 2))
plot(model)
dev.off()

## 7c ----
model_2 <- lm (log(ozone) ~ log(temperature) + log(wind) + log(radiation), data = ozone)
summary(model_2) # Radiation and temp more sig, wind less
par(mfrow = c(2, 1))
plot(model_2)

