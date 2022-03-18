data <- read.table('~/saxophone/data_p2/P0_1_cufflinks/genes.fpkm_tracking',
                   header=TRUE)

png('~/saxophone/data_p2/new_log_FPKM_histogram.png',
    res=300, width=5, height=4, unit='in')

hist(log10(data$FPKM[data$FPKM > 1e-2]),
     breaks="Scott",
     plot=TRUE,
     xlab='log10(FPKM)',
     main='Log FPKM scores')
dev.off()

cat('Number of genes with FPKM > 0.01:', sum(data$FPKM > 1e-2))