# Preprocessing [Data wrangling, summary stats and visualisation]

# Read data (for a single subject)
for (f in seq(1,8)){
d <- read.table(paste("./data/000",f,".CSV", sep=""), header = TRUE, sep = ",")
assign(paste("d",f, sep=""), d)
## if (f == 1){colnames(d1) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"IgG1-FITC","IgG1-PE",paste("CD45-ECD_",f, sep=""),"IgG1-PC5","IgG1-PC7")}
## if (f == 2){colnames(d2) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"Kappa-FITC","Lambda-PE",paste("CD45-ECD_",f),"CD19-PC5","CD20-PC7")}
## if (f == 3){colnames(d3) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"CD7-FITC","CD4-PE",paste("CD45-ECD_",f), "CD8-PC5","CD2-PC7")}
## if (f == 4){colnames(d4) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"CD15-FITC","CD13-PE",paste("CD45-ECD_",f), "CD16-PC5","CD56-PC7")}
## if (f == 5){colnames(d5) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"CD14-FITC","CD11c-PE", paste("CD45-ECD_",f), "CD64-PC5","CD33-PC7")}
## if (f == 6){colnames(d6) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"HLA-DR-FITC","CD117-PE",paste("CD45-ECD_",f), "CD34-PC5","CD38-PC7")}
## if (f == 7){colnames(d7) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""),"CD5-FITC","CD19-PE",paste("CD45-ECD_",f), "CD3-PC5","CD10-PC7")}
## if (f == 8){colnames(d8) <- c(paste("FS_",f, sep=""), paste("SS_",f, sep=""), paste("NonSpecific_",f,".1", sep=""), paste("NonSpecific_",f,".2", sep=""), paste("NonSpecific_",f,".3", sep=""), paste("NonSpecific_",f,".4", sep=""), paste("NonSpecific_",f,".5", sep=""))}
}
    
# Data exploration
library(ggplot2)
library(GGally)


## correlations
ggpairs(d2,
#upper = list(continuous = wrap("density", alpha = 0.5), combo = "box"),
 lower = list(continuous = wrap("points", alpha = 0.3, size=0.1), 
              combo = wrap("dot", alpha = 0.4, size=0.2) ),
        ) + theme_bw()
