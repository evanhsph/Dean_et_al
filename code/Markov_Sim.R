#### Markov Chain Simulation Model ####
start_time <- Sys.time() #recording code start time

N <- 1e6 #number of agents
lambda <- 4 # exogenous arrival rate
mu <- 1e-2 #transition rate
rho <- lambda/mu 

inter.arr <- rexp(N,lambda) #inter arrival times
arrivals <- cumsum(inter.arr) #arrival times

service.req <- rexp(N,mu) #wait times

departures <- arrivals+service.req #exit times

timegrid <- seq(from=arrivals[floor(N/10)],to=departures[floor(9*N/10)],length.out=5000) 
#grid of times when the system is stationary

cum.arr <- function(t){sum(arrivals<t)} #cumulative arrivals up to time t
cum.dep <- function(t){sum(departures<t)} #cumulative exits up to time t

qlength <- function(t){cum.arr(t)-cum.dep(t)} #number of agents in state 1

q.length <- sapply(timegrid,qlength) #number of agents in state 1 on grid of times

#second queue

lambda2 <- lambda #assume transition probability one
mu2 <- 1e-1 #wait time in state 2
rho2 <- lambda2/mu2

arrivals2 <- departures #arrival times are exit times from previous state

service.req2 <- rexp(N,mu2) #wait times

departures2 <- arrivals2+service.req2 #exit times

timegrid2 <- seq(from=arrivals2[floor(N/10)],to=departures2[floor(9*N/10)],length.out = 5000) 
#grid of times when the system is stationary

cum.arr2 <- function(t){sum(arrivals2<t)} #cumulative arrivals up to time t
cum.dep2 <- function(t){sum(departures2<t)} #cumulative exits up to time t

qlength2 <- function(t){cum.arr2(t)-cum.dep2(t)} #number of agents in compartment 2

q.length2 <- sapply(timegrid2,qlength2) #number of agents in state 2 on grid of times

end_time <- Sys.time() #recording code end time
end_time - start_time #code run time

#plots

plot(timegrid,q.length,type="l",main="Number of Agents in State 1",xlab="Time",ylab="Number of Agents")

hist(q.length,xlab="Stationary Population Size",main="State 1 Population Size Empirical Distribution")


plot(timegrid2,q.length2,type="l",main="Number of Agents in State 2",xlab="Time",ylab="Number of Agents")

hist(q.length2,xlab="Stationary Population Size",main="State 2 Population Size Empirical Distribution")

#performance metrics to check simulations match theory

idle <- sum(q.length==0)/length(q.length) #stationary idle time
idle 
th.idle <- exp(-rho) #theoretical idle time
th.idle

av.length <- mean(q.length) #empirical mean population size
av.length
EN <- rho #theoretical mean population size
EN

av.sojourn <- mean(service.req) #empirical mean sojourn time
av.sojourn
EW <- EN/lambda #theoretical sojourn time
EW

idle2 <- sum(q.length2==0)/length(q.length2) #stationary idle time
idle2 
th.idle2 <- exp(-rho2) #theoretical idle time
th.idle2

av.length2 <- mean(q.length2) #empirical mean population size
av.length2
EN2 <- rho2 #theoretical mean population size
EN2

av.sojourn2 <- mean(service.req2) #empirical mean sojourn time
av.sojourn2
EW2 <- EN2/lambda2 #theoretical mean sojourn time
EW2






