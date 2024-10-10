
#Set the working directory
setwd("~/Downloads/Nexford University/Programming_in_R_and_Python/module1")

#Install and Load the R6 library which is used for Object Oriented Programming in R
install.packages("R6", dependencies = FALSE)
library(R6)

# Define the Worker class using R6
Worker <- R6Class("Worker",public = list(
  worker_id = NULL,
  fname = NULL,
  lname = NULL,
  age = NULL,
  gender = NULL,
  pay = NULL,
  employee_level = NULL,
  # Constructor method to initialize the Worker object
  initialize = function(worker_id, fname, lname, age, gender, pay) {
    self$worker_id <- worker_id
    self$fname <- fname
    self$lname <- lname
    self$age <- age
    self$gender <- gender
    self$pay <- pay
  },
  # Method to assign employee level based on salary and gender
  level_assign = function() {
    tryCatch({
      if (self$pay > 10000 & self$pay < 20000) {
        self$employee_level <- "A1"
      }
      if (self$pay > 7500 & self$pay < 30000 & tolower(self$gender) == "female") {
        self$employee_level <- "A5-F"
      }
    }, error = function(e) {
      message(sprintf("Could not assign level for worker %s: %s", self$worker_id, e))
    })
  },
  
  # Method to generate payment slip
  generate_payment_slip = function() {
    sprintf("Worker ID: %s, Name: %s %s, Salary: $%s, Employee Level: %s",
            self$worker_id, self$fname, self$lname, self$pay, self$employee_level)
  }
)
)

# Example usage: Creating a worker instance and generating a payment slip

# Create an instance of the Worker class
worker1 = Worker(worker_id=1, fname="Dominic", lname="Njue", age=35, gender="Male", pay=15000)
# Assign employee level
worker1$level_assign()

# Generate and print the payment slip
print(worker1$generate_payment_slip())