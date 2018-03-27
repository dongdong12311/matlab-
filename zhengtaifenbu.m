%% 从测试的结果来看，当数据量达到1000以后 正态分布和logistics分布的拟合效果已经很好了
%% t分布的拟合效果相对不好

%% 产生正态分布的随机数 进行参数估计
%产生随机数
data=random('norm',5,1,100,1);
%极大似然估计
phat=mle(data,'distribution','norm');
%自己定义正态分布的分布函数
cuspdf=@(data,mu,sigma) 1./(sqrt(2*pi)*abs(sigma))*exp(-1/2*(data-mu).^2/sigma^2);
phat2=mle(data,'pdf',cuspdf,'start',[5,1]);

% x=-5:0.1:5;
% y=tpdf(x,7);
% plot(x,y);
% hold on
%% 产生t分布的随机数并进行参数估计
%datat=random('t',7,500,1);
%[pdft,x]=ksdensity(datat);
%plot(x,pdft)
phat_t=mle(datat,'pdf',@tpdf,'start',10);
%从估计的结果来看，对小样本的t参数的估计效果不是很好！！
S= var(datat);
n = 2*S/(S-1);
%以上是采用距估计 效果也不是很好

%% 产生 logistic 分布的随机数 并进行参数的估计
mu=0;
sigma=1;
data_logistic=random('logistic',mu,sigma,1000,1);
phat_log=mle(data_logistic,'distribution','logistic');
x=-10:0.1:10;
% y=pdf('logistic',x,mu,sigma);
% plot(x,y);
% hold on
% y=pdf('logistic',x,phat_log(1),phat_log(2));
% plot(x,y);

%% scale-t分布
%产生随机数
data_scale=makedist('tLocationScale','mu',3,'sigma',1,'nu',1);
data_scale=random('tLocationScale',3,1,1,1000,1);
%极大似然估计
phat_scale=mle(data_scale,'distribution','tlocationscale');
phat_scale


