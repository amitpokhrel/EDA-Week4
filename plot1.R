# Loading provided datasets
SummaryPM25 <- readRDS("~/EDA/Week4/summarySCC_PM25.rds")

# Sampling
SummaryPM25_sampling <- SummaryPM25[sample(nrow(SummaryPM25), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(SummaryPM25[, 'Emissions'], by=list(SummaryPM25$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Generate the graph
png(filename='~/EDA/Week4/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()