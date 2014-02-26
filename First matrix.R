#Salmon

salmon=matrix(c(0,0,5,0,.8,.15,0,0,0,.8,0,-20,0,0,0,1.25), nr=4, byrow=TRUE)
salmon
N0=matrix(c(1000,5000,2000,20), nr=4, byrow=TRUE)
N0


N1=salmon %*% N0
N1
years=20

N.projections=matrix(0, nrow(salmon), ncol=years+1)
N.projections[,1] = N0

for (ii in 1:years) N.projections[,ii+1]= salmon%*% N.projections[,ii]
matplot(0:years, t(N.projections), type="l", lty=1:3, 
        col=1, ylab="Stage Abundance", xlab="Year", main="Salmon Over Time")
legend("topright",legend=c("Juvenille", "Adult", "Spawning", "Seals"),
       lty=1:4, col=1, bty="n")

eigen(salmon)
