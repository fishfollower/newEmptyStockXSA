useR = Rnewest --vanilla --slave
BD = run
RD = res
SD = src
DD = data
CF = conf
LD = log
plot:
	rm -f $(LD)/plot.*
	echo 'source("src/plot.R");' | $(useR) 1> $(LD)/plot.out 2> $(LD)/plot.out2 || (mv $(LD)/plot.out2 $(LD)/plot.err; exit 1)
