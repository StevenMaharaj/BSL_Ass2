library(parallel)
numCores = detectCores()


fx <- function(starts,a){
  for (j in 1:starts) {
    h <- j*a
  }
}

pfx <-function(starts){
  return(fx(starts,a=2))
}

starts = 1:10000

system.time(
  results <- lapply(starts, fx,a=2)
)


system.time(
  results <- mclapply(starts, pfx, mc.cores = numCores)
)

