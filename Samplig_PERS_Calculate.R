


## packages necesaries
packages = c("tidyverse", "pwr",
             "Sample.Size", "sampling","samplesize")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

# Load packages
load_pkg <- rlang::quos(tidyverse, pwr, Sample.Size, sampling, samplesize)

invisible(lapply(lapply(load_pkg, rlang::quo_name),
                 library,
                 character.only = TRUE
))

# Calculate sampling
delta <- 1.45
sigma <- 14.4589
d <- delta/sigma
pwr.t.test(d=d, sig.level=.05, power = .90, type = 'two.sample')
