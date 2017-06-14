.libPaths(".")
  install.packages("latticeExtra", repos='http://cran.us.r-project.org')
  install.packages("FLAssess", repos="http://flr-project.org/R")
  install.packages("FLXSA", repos="http://flr-project.org/R")

source("src/common.R")

plotcounter<-1
tit.list<-list()

setcap<-function(title="", caption=""){   
 tit.list[length(tit.list)+1]<<-paste("# Title",plotcounter,"\n")
 tit.list[length(tit.list)+1]<<-paste(title,"\n")
 tit.list[length(tit.list)+1]<<-paste("# Caption",plotcounter,"\n")
 tit.list[length(tit.list)+1]<<-paste(caption,"\n")
 plotcounter<<-plotcounter+1 
}

library(FLXSA)
data(ple4)
data(ple4.indices)
ple4 <- ple4+FLXSA(ple4,ple4.indices,FLXSA.control())

plots<-function(){
  print(plot(ple4)) # print needed because of lattice nonsense 
  #stampit()
}

setwd('res')
file.remove(dir(pattern='png$'))

stamp<-gsub('-[[:digit:]]{4}$','',gsub(':','.',gsub(' ','-',gsub('^[[:alpha:]]{3} ','',date()))))
png(filename = paste(stamp,"_%03d.png", sep=''), width = 480, height = 480,
    units = "px", pointsize = 10, bg = "white")
  plots()
dev.off()

png(filename = paste("big_",stamp,"_%03d.png", sep=''), width = 1200, height = 1200, 
    units = "px", pointsize = 20, bg = "white")
  plots()
dev.off()

#file.remove(dir(pattern='pdf$'))
#pdf(onefile=FALSE, width = 10, height = 8)
#  plots()
#dev.off()

cat('',file='footprint') 

