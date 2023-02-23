setwd("~/Oxford/Flight_group")

library("readxl")
df_na <- read_excel("finch_tunnel_data.xlsx", sheet = 1)
df <- subset(df_na,!(is.na(Entry)))
df$Treatment <- factor(df$Treatment, levels=unique(df$Treatment))

mean_entry <- tapply(df$Entry, df$Treatment, mean)
var_entry <- tapply(df$Entry, df$Treatment, var)
median_entry <- tapply(df$Entry, df$Treatment, median)
mean_entry
var_entry
median_entry

# get median of absolute point of entry (i.e. distance from centre):
abs_entry <- abs(df$Entry)
median(abs_entry)
#compute 95% CI 
bootmed = apply(matrix(sample(abs_entry, rep=TRUE, 10^4*length(x)), nrow=10^4), 1, median)
quantile(bootmed, c(.025, 0.975))

BW_df <- subset(df, Treatment=="Dark-Bright")
WB_df <- subset(df, Treatment=="Bright-Dark")
WW_df <- subset(df, Treatment=="Bright-Bright")
BB_df <- subset(df, Treatment=="Dark-Dark")
BW_WB_df <- subset(df, Treatment=="Bright-Dark" | Treatment=="Dark-Bright")
BB_WW_df <- subset(df, Treatment=="Dark-Dark" | Treatment=="Bright-Bright")
WB_WW_df <- subset(df, Treatment=="Bright-Dark" | Treatment=="Bright-Bright")
BW_WW_df <- subset(df, Treatment=="Dark-Bright" | Treatment=="Bright-Bright")



t.test(Entry ~ Treatment, data = BW_WB_df, paired = FALSE, alternative="greater")
wilcox.test(Entry ~ Treatment, data = BW_WB_df)


View(df)
hist(df$Entry,
     main="", 
     xlab="Horizontal position",
     breaks=10,
     xlim=c(-0.6,0.6),
     las=1)
hist(WW_df$Entry,
     main="", 
     xlab="",
     breaks=10,
     col="#FFFC90",
     xlim=c(-1,1),
     ylim=c(0,25),
     las=1)
hist(BW_df$Entry,
     main="", 
     xlab="",
     col="#97D4C4",
     breaks=10,
     xlim=c(-1,1),
     ylim=c(0,25),
     las=1)
hist(WB_df$Entry,
     main="", 
     xlab="",
     breaks=10,
     col="#EF85E5",
     xlim=c(-1,1),
     ylim=c(0,25),
     las=1)
hist(BB_df$Entry,
     main="", 
     xlab="Entry",
     breaks=6,
     col="#585858",
     xlim=c(-1,1),
     ylim=c(0,25),
     las=1)


freq_table <- with(subset(df, (Origin!='?' & Direction!='?')), table(Treatment, Origin, Direction))
freq_table2 <- with(subset(df, Origin!='?'), table(Treatment, Sex, Origin))
freq_table3 <- with(subset(df, Origin!='?'), table(Treatment, Sex, Dir_brightness))

origin_table <- with(subset(df, Origin!='?'), table(Treatment, Origin))
chisq.test(origin_table)

direction_table <- with(subset(df, Direction!='?'), table(Treatment, Direction))
chisq.test(direction_table)

t.test(Entry ~ Origin, data = subset(df, Origin!='?'), paired = FALSE, alternative="less")
wilcox.test(Entry ~ Origin, data = subset(df, Origin!='?'))

t.test(Entry ~ Direction, data = subset(df, Direction!='?' & Origin=='Left'), paired = FALSE, alternative="greater")
wilcox.test(Entry ~ Direction, data = subset(df, Direction!='?'))

library(ggplot2)
library("viridis")
cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
          "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



ggplot(as.data.frame(freq_table2), aes(factor(Sex), Freq)) +     
  geom_col(position = 'dodge')


ggplot(as.data.frame(freq_table), aes(factor(Origin), Freq, fill = Direction)) +     
  geom_col(position = 'dodge') 

### arrival freq plot:
ggplot(as.data.frame(freq_table), aes(factor(Treatment), Freq, fill = Direction)) +     
  geom_col(position = 'dodge') +
  labs(x = "Treatment") +
  scale_fill_manual(values = c("#CC79A7", "#009E73"))
###


### origin freq plot:
ggplot(as.data.frame(freq_table), aes(factor(Treatment), Freq, fill = Origin)) +
    geom_col(position = 'dodge') +
    labs(x = "Brightness condition") +
    scale_fill_manual(values = c("#F89933", "#F5D0A9"))

ggplot(as.data.frame(freq_table2), aes(factor(Treatment), Freq, fill = Sex)) +
  geom_col(position = 'dodge') +
  labs(x = "Treatment") +
  scale_fill_manual(values = c("#CC79A7", "#009E73"))


ggplot(subset(df, Treatment=="Dark-Bright" | Treatment=="Bright-Dark"), aes(x=Treatment, y=Entry)) + 
  geom_boxplot() + scale_value_manual(values =c("#E69F00", "#56B4E9"))


ggplot(subset(df, Direction!='?'), aes(x=Direction, y=Entry, fill=Treatment)) + 
  geom_boxplot() + scale_fill_manual(values =c("#E69F00", "#56B4E9","#999999","#000000")) 


ggplot(subset(df, (Origin!='?' & Direction!='?')), aes(x=Origin, y=Entry, fill=Treatment)) + 
  geom_boxplot() + scale_fill_manual(values = c("#E69F00", "#56B4E9","#999999","#000000")) 

ggplot(subset(df, (Origin!='?' & Direction!='?')), aes(x=Direction, y=Entry, fill=Origin)) + 
  geom_boxplot()+ scale_fill_manual(values = c("#CC79A7", "#009E73"))

ggplot(subset(df, (Origin!='?' & Direction!='?')), aes(x=Origin, y=Entry, fill=Direction)) + 
  geom_boxplot()+ scale_fill_manual(values = c("#CC79A7", "#009E73"))

p <- ggplot(subset(df, (Origin!='?')), aes(Origin, group = Treatment)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_y_continuous(labels=scales::percent) +
  scale_fill_manual(values = c("#CC79A7", "#009E73")) +
  ylab("Relative frequencies") +
  facet_grid(~Treatment)
p + theme(legend.position = "none")

p <- ggplot(subset(df, (Direction!='?')), aes(Direction, group = Treatment)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + 
  scale_y_continuous(labels=scales::percent) +
  scale_fill_manual(values = c("#CC79A7", "#009E73")) +
  ylab("Relative frequencies") +
  facet_grid(~Treatment)
p + theme(legend.position = "none")



# check for normality of (sub-)groups

model <- lm(Entry ~ Origin + Treatment + Direction, data = df)
res <- resid(model)
plot(fitted(model), res)
qqnorm(res)
qqline(res)
plot(density(res))


### analysis of variance

sub_df <-  subset(df,Origin!='?' & Direction!='?'& (Treatment=='Dark-Bright' | Treatment=='Bright-Dark'))

# Figure 2B: 2-way ANOVA with data grouped by treatment (Brightness) and Origin
anova2B <- aov(Entry ~ Origin*Treatment, data = sub_df)
summary(anova2B)

# Figure 2C: 2-way ANOVA with data grouped by Direction and Origin
anova2C <- aov(Entry ~ Origin*Direction, data = sub_df)
summary(anova2C)


# pairwise t-tests
# Figure 2B
subdf_2B1 <- subset(df, Origin=='Left' & (Treatment=='Dark-Bright' | Treatment=='Bright-Dark'))
t.test(Entry ~ Treatment, data = subdf_2B1, paired = FALSE, alternative="two.sided")

subdf_2B2 <- subset(df, Origin=='Right' & (Treatment=='Dark-Bright' | Treatment=='Bright-Dark'))
t.test(Entry ~ Treatment, data = subdf_2B2, paired = FALSE, alternative="two.sided")


# Figure 2C
subdf_2C1 <- subset(df, Origin=='Left' & Direction!='?')
t.test(Entry ~ Direction, data = subdf_2C1, paired = FALSE, alternative="two.sided")

subdf_2C2 <- subset(df, Origin=='Right' & Direction!='?')
t.test(Entry ~ Direction, data = subdf_2C2, paired = FALSE, alternative="two.sided")


# Non parametric (pairwise Mann-Whitney / wilccox tests)
wilcox.test(Entry ~ Treatment, data = subdf_2B1)
wilcox.test(Entry ~ Treatment, data = subdf_2B2)

wilcox.test(Entry ~ Direction, data = subdf_2C1)
wilcox.test(Entry ~ Direction, data = subdf_2C2)

# Hartigan's dip test 
library(diptest)
dip.test(WW_df$Entry)
dip.test(BB_df$Entry)
dip.test(WB_df$Entry)
dip.test(BW_df$Entry)

# Mode estimation
library(multimode)
WW_modes <- locmodes(WW_df$Entry, mod0 = 2, display=TRUE, addplot=FALSE, addLegend=FALSE)
BB_modes <- locmodes(BB_df$Entry, mod0 = 2, display=TRUE, addplot=FALSE, addLegend=FALSE)
BW_modes <- locmodes(BW_df$Entry, mod0 = 2, display=TRUE, addplot=FALSE, addLegend=FALSE)
WB_modes <- locmodes(WB_df$Entry, mod0 = 1, display=TRUE, addplot=FALSE, addLegend=FALSE)


