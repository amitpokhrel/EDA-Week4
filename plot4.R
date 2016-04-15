# Load ggplot2 library
require(ggplot2)

# Loading provided datasets
SummaryPM25 <- readRDS("~/EDA/Week4/summarySCC_PM25.rds")
Src_Classification <- readRDS("~/EDA/Week4/Source_Classification_Code.rds")

# Coal combustion related sources
Src_Classification.coal = Src_Classification[grepl("coal", Src_Classification$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=SummaryPM25, y=Src_Classification.coal, by='Src_Classification')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Generate the graph
png(filename='~/Exploratory_Data_Analysis/Assignment_2/plot4.png')

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
    geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
    ggtitle(expression('Total Emissions of PM'[2.5])) + 
    ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
    geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
    theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()
