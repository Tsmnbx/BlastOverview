InfCriteriaV3 <- function(loglikelihood, clusters,
                          dimension, nObservations = 100) {
  # calculate number of parameters based on Gaussian mixture
  kParameters <- ((dimension + 1) * dimension) / 2 +
    dimension + (clusters - 1)
  # calculate model selection criteria
  BIC <- - 2 * loglikelihood + (kParameters * log(nObservations))
  AIC <- - 2 * loglikelihood + (2 * kParameters)
  Results <- list(BICresults = BIC,
                  AICresults = AIC)
  class(Results) <- "InfCriteria"
  return(Results)
}
