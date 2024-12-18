yodamerge -o out$1_total1.yoda out$1_1*
yodamerge -o out$1_total2.yoda out$1_2*
yodamerge -o out$1_total.yoda out$1_total* out$1_0.yoda out$1_3.yoda out$1_4.yoda out$1_5.yoda out$1_6.yoda out$1_7.yoda out$1_8.yoda out$1_9.yoda
rm -f out$1_total1.yoda out$1_total2.yoda
