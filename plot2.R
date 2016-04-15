# Loading provided datasets
SummaryPM25 <- readRDS("~/EDA/Week4/summarySCC_PM25.rds")

# Sampling
SummaryPM25_sampling <- SummaryPM25[sample(nrow(SummaryPM25), size=5000, replace=F), ]

# Subset data and append two years in one data frame
MD <- subset(SummaryPM25, fips=='24510')

# Generate the graph
png(filename='~/Exploratory_Data_Analysis/Assignment_2/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()