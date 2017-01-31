path = "/Users/mwilmes/Documents/MachineLearning/MLB_PengQiu_GT/MLB_gatech"
setwd(path)

library(ggplot2)
library(GGally)
library(grid)
library(gridExtra)


# Read data (for a single subject)
for (f in seq(1,8)){
d <- read.table(paste("./data/",f,".CSV", sep=""), header = TRUE, sep = ",")
assign(paste("d",f, sep=""), d)
}

## correlations in one plot
ggpairs(d1,
#upper = list(continuous = wrap("density", alpha = 0.5), combo = "box"),
lower = list(continuous = wrap("points", alpha = 0.1, size=0.1), 
              combo = wrap("dot", alpha = 0.4, size=0.2) ),
        ) + theme_bw()

ggplot(d8, aes(x=FS.Lin, y=SS.Log)) +
    geom_point()


# Histogram overlaid with kernel density curve
ggplot(d1, aes(x=FS.Lin)) + 
    geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
                   binwidth=50,
                   colour="black", fill="white") +
    geom_density(alpha=.2, fill="#FF6666")  # Overlay with transparent density plot


# plot distribution of all subjects per tube

# define transparent colors for 3 labels (normal, AML, NA)
tp_red <- rgb(255, 0, 255, max = 255, alpha = 125, names = "red50")
tp_blue <- rgb(0, 0, 255, max = 255, alpha = 125, names = "blue50")
tp_silver <- rgb(192, 192, 192, max = 255, alpha = 125, names = "silver50")

# read meta data
meta <- read.table(paste(path,"/AMLTraining.csv", sep=""), header=TRUE, sep=",")

# add column with color specification for status normal, AML or NA
meta$status <- NA
for (line in 1:nrow(meta)){
    if(is.na(meta[line,]$Label) == TRUE) meta[line,]$status <- tp_silver
    else{
    if(meta[line,]$Label == "normal") meta[line,]$status <- tp_blue
    if(meta[line,]$Label == "aml") meta[line,]$status <- tp_red
    }
}

for (tube in seq(1,8)){
tubes <- subset(meta, meta$TubeNumber == tube)
for(co in 1){ #seq(2,7)
    print(paste("Tube", tube, "Column", co, sep=" "))
    pdf(file=paste("./plots/density_tube",tube,"_column", co,".pdf", sep=""))
    for (f in 1:nrow(tubes)){
        dat <- read.table(paste("./data/", tubes[f,1],".CSV", sep=""), header = TRUE, sep = ",")
        if(f == 1 ) {
            if(co == 1){plot(density(dat[,co]), yaxt='n',  ylim=c(0,0.007), col=tubes$status[f], xlab="", main=paste("Tube",tube,", Column ", co, sep=""))
} else{ plot(density(dat[,co]), yaxt='n',  ylim=c(0,17), col=tubes$status[f], xlab="", main=paste("Tube",tube,", Column ", co, sep=""))}
            axis(2, at=seq(1,100, 2), labels=FALSE)
            mtext("normal", 3, line=2, col=tp_blue, at=0.2)
            mtext("aml", 3, line=1, col=tp_red, at=0.2)
            mtext("unlabeled", 3, line=0, col=tp_silver, at=0.2)
            }
            else {
                lines(density(dat[,co]), col=tubes$status[f])
            }
}
    dev.off()
}
}
