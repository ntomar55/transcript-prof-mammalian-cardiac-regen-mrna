# 1.
# read gene_exp.diff using read.table
data <- read.table('/projectnb2/bf528/users/saxophone/data_p2/cuffdiff_out/gene_exp.diff', header = TRUE)
# data <- read.table('/gene_exp.diff', header = TRUE)

# order data using order() and using q_value column
data.order <- data[order(data$q_value),]
req_names <- c('gene', 'value_1', 'value_2', 'log2.fold_change.', 'p_value', 'q_value')

# subset to take 6 columns
data.sub <- data.order[, req_names]

# take top 10 rows from ordered data using head()
data.top <-  head(data.sub, 10)

# write top data into file using write.csv
write.csv(data.top, 'top_10_DEG.csv', row.names = FALSE)

###########################################################

# 2.
# plot histogram using graphics hist. Add appropriate breaks, colors, labels, title
hist(data$log2.fold_change., breaks = 20, col='lightblue',
     xlab = 'Log2 Fold Change', main = 'Histogram of Log2 fold change of all genes')

###########################################################

# 3.
# use subset() to conditionally access rows from data where significant column value is yes
data.signif <- subset(data, significant=='yes')
dim(data.signif) # number of genes with significant='yes'
# To find the genes with p_values < 0.01
data.p_val <- subset(data, p_value <0.01)
dim(data.p_val) # number of genes with p_value <0.01


###########################################################

# 4.
# plot histogram using graphics hist. Add appropriate breaks, colors, labels, title
hist(data.signif$log2.fold_change., breaks = 30,col='lightblue', 
     xlab = 'Log2 Fold Change', main = 'Histogram of Log2 fold change of significant genes')

###########################################################

# 5.
# use subset() to conditionally access rows from data where log2.folf_change. value is >/< 0
data.up <- subset(data.signif, log2.fold_change. > 0)
data.down <- subset(data.signif, log2.fold_change. < 0)
dim(data.up)
dim(data.down)

###########################################################

# 6.
# use write() to write up/down regulated gene data into csv files
write(data.up$gene, file='up_regulated_genes.csv', sep=',')
write(data.down$gene, file='down_regulated_genes.csv', sep=',')

######################### THE END #########################
