#--------------- initial settings ------------------#
if(!require(ggplot2)){install.packages('ggplot2')}
if(!require(effsize)){install.packages('effsize')}
library(ggplot2)
library(effsize)
options(digits=10,scipen=999)
#---------------------------------------------------#


###===================== adjust these values ==========================####
### set effect size and group size
d <-  0.5 # set the true effect size
n  <-  20  # set sample size for each experimental group in each experiment
alpha <- 0.05 # set alpha
set.seed(9876) # set a different seed to get different random numbers
###====================================================================####


#---------------------------------- simulate data ----------------------------------------#
m1 <- 100 #set mean for group 1 (example is based on IQ)
sd1 <- 15.59 #set sd for group 1 (example is based on male SD for IQ)
sd2 <- 14.32 #set sd for group 2 (example is based on female SD for IQ)
m2 <-  m1 - d*(sqrt((sd1*sd1+sd2*sd2)/2)) #calculate mean for group 2 based on d
mat <- data.frame()  #create an empty matrix to fill with values from sampled experiments

l <-  10000  #set number of sampled experiments

###draw samples, run tests
for(i in 1:l){ #draw l samples of n size from each population group 1 and 2, store mean and sd for each sample and d and p for each experiment in mat
  
  sample1 <- rnorm(n, mean=m1, sd=sd1)
  sample2 <- rnorm(n, mean=m2, sd=sd2)
  
  t <- t.test(sample1, sample2, alternative = "two.sided", paired = FALSE, var.equal = TRUE, conf.level = 0.95) #perform the t-test against mu (set to value you want to test against)
  mat[i,1] <- t$p.value #get the p-value and store it
  cohensd <- cohen.d(sample1, sample2) #compute Cohen's d
  mat[i,2] <- cohensd$estimate #get Cohen's d and store it
}

colnames(mat) <- c("p", "d") # name columns of mat
d_all <- mat[,"d"] # create a vector with all effect sizes
d_sig <- mat[mat$p<alpha,"d"] # create a vector with significant effect sizes only 
d.min <- min(abs(d_sig)) # calculate the smallest significant effect size
d.sig.mean <- mean(d_sig) # calculate the mean significant effect size
#------------------------------------------------------------------------------------------#

#----------------------------- create plots --------------------------------#
# create plot of all effect sizes
dallplot <- ggplot(as.data.frame(d_all), aes(d_all))  +  #plot psig
  geom_histogram(colour="black", fill="grey", binwidth = 0.01)+ 
  geom_vline(aes(xintercept=0)) +
  geom_vline(aes(xintercept=d), colour="#0095ff") +
  annotate("text", x=d, y=170, label = "true effect (d)", colour="#0095ff", hjust = -0.05) +
  scale_x_continuous(limits=c(-d-1.2, d+1.2), breaks=seq(-1.6, 1.6, 0.2)) 

# create plot of only significant effect sizes (extreme publication bias)
dsigplot <- ggplot(as.data.frame(d_sig), aes(d_sig))  +  
  geom_histogram(colour="black", fill="grey", binwidth = 0.01)+ 
  geom_vline(aes(xintercept=0)) +
  geom_vline(aes(xintercept=d), colour="#0095ff") +
  geom_vline(aes(xintercept=d.sig.mean), linetype = "dotted", colour="#B43AEA") +
  annotate("text", x=d, y=170, label = "true effect (d)", colour="#0095ff", hjust = -0.05) +
  annotate("text", x=d.sig.mean, y=150, label = "mean of sig. effects", colour="#B43AEA", hjust = -0.05) +
  scale_x_continuous(limits=c(-d-1.2, d+1.2), breaks=seq(-1.6, 1.6, 0.2))
#---------------------------------------------------------------------------#

###============== show plots  =================####
dallplot # show plot of all effect sizes
dsigplot # show plot of significant effect sizes
###============================================####

###======= the smallest & mean significant effect size  ============####
d.min # the smallest significant effect
d.sig.mean # the average significant effect
###=================================================================####

