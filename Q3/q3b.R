rtn <- function(n,b,a,mu,Sigma){
  u <- runif(n)
  g <- pnorm((b-mu)/Sigma) - pnorm((a-mu)/Sigma)
  x <-qnorm((g) * u + pnorm((a-mu)/Sigma))*Sigma + mu 
}



x<- rtn(n=100000,b=100,a=0,mu = 0.5,Sigma = 1)

mu = 0.5
Sigma = 1
b=100
a=0


x<-sort(x)
true_den <- dnorm((x-mu)/Sigma)/(pnorm((b-mu)/Sigma) - pnorm((a-mu)/Sigma))

plot(density(x),col = 1,main="X > 0")
lines(x,true_den,col = 2,type = "l")
legend('topright',legend=c('Simulated','True'),col=1:2,lty=1,bty='n')



