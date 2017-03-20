#require(devtools)
#devtools::install_github('taiyun/recharts')
library(recharts)
load("data.rda")
tmp=dat2[dat2$datetime==sam.time[1],]
tmp$volume3=cut(tmp$volume2,seq(6.7,8.7,length=20))
pdata=data.frame(table(tmp$volume3,tmp$pct_chg2))
eBar(dat=pdata,xvar=~Var1,yvar=~Freq,series=~Var2)+
  eTitle(title=sam.time[1],x="center",y=10)
tmp$volume4=cut(tmp$volume,seq(66000,30000000,length=50))
pdata2=data.frame(table(tmp$volume4,tmp$pct_chg2))
eBar(dat=pdata2,xvar=~Var1,yvar=~Freq,series=~Var2)+
  eTitle(title=sam.time[1],x="center",y=10)

ePoints(dat=dat2[dat2$open<40,],xvar=~open,yvar=~pct_chg,series=~datetime,toolbox.x = "right", toolbox.y = "bottom")
#require(devtools)
#install_github('ramnathv/rCharts')


gupiao=read.csv("/Users/Lisiyan/Documents/作业/数据可视化作业/第二次作业/dailyprice2.csv",header=T,sep=",")
gupiao2=gupiao[gupiao$open>20 & gupiao$open<25,]
sa=as.character(unique(gupiao2$trade_code))[1:10]
sa=na.omit(sa)
gupiao3=gupiao[gupiao$trade_code %in% sa,]

eBar(dat=gupiao3,xvar=~datetime,yvar=~close,series=~trade_code,toolbox.x="right", toolbox.y="bottom")

eLine(dat=gupiao3,xvar=~datetime,yvar=~close,series=~trade_code,toolbox.x="right", toolbox.y="bottom")
