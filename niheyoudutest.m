%% 产生随机数，对参数进行mle估计，并进行拟合优度检验
%% 正态分布的随机数
pd=makedist('norm','mu',0,'sigma',1);
data_norm=random(pd,1000,1);
param_norm=mle(data_norm,'distribswution','norm');
cd=fitdist(data_norm,'normal');
% 进行卡方检验
[h,p]=chi2gof(data_norm,'CDF',cd);
% 两个相同分布的正态分布
data_norm2=random(pd,1000,1);
[h,p]=kstest2(data_norm,data_norm2);

%% t分布的随机数
n=7;
% pd=makedist('t',5);
data_t=random('t',5,1000,1);
param_t=mle(data_t,'distribution','t');
cd=fitdist(data_t,'t');
% 进行卡方检验
[h,p]=chi2gof(data_t,'CDF',cd);
% 两个相同分布的t分布
data_t2=random('t',5,1000,1);
data_t1=random('t',5,1000,1);
[h,p]=kstest2(data_t1,data_t2)

%% logistic分布的随机数
mu=2;
sigma=1;
% pd=makedist('t',5);
data_log=random('logistic',mu,sigma,1000,1);
param_log=mle(data_log,'distribution','logistic');
cd=fitdist(data_log,'logistic');
% 进行卡方检验
[h,p]=chi2gof(data_log,'CDF',cd);
% 两个相同分布的logistic分布
data_log2=random('logistic',mu,sigma,1000,1);
[h,p]=kstest2(data_log,data_log2);

%% tlocation分布的随机数
mu=3;sigma=1;m=1;
data_scale=random('tLocationScale',mu,sigma,m,1000,1);
param_scale=mle(data_scale,'distribution','tLocationScale');
cd=fitdist(data_scale,'tLocationScale');
% 进行卡方检验
[h,p]=chi2gof(data_scale,'CDF',cd);
% 两个相同分布的tlocation分布
data_scale2=random('tLocationScale',mu,sigma,m,1000,1);
[h,p]=kstest2(data_scale,data_scale2);

