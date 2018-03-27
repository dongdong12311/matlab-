%% ������������Բ�������mle���ƣ�����������Ŷȼ���
%% ��̬�ֲ��������
pd=makedist('norm','mu',0,'sigma',1);
data_norm=random(pd,1000,1);
param_norm=mle(data_norm,'distribswution','norm');
cd=fitdist(data_norm,'normal');
% ���п�������
[h,p]=chi2gof(data_norm,'CDF',cd);
% ������ͬ�ֲ�����̬�ֲ�
data_norm2=random(pd,1000,1);
[h,p]=kstest2(data_norm,data_norm2);

%% t�ֲ��������
n=7;
% pd=makedist('t',5);
data_t=random('t',5,1000,1);
param_t=mle(data_t,'distribution','t');
cd=fitdist(data_t,'t');
% ���п�������
[h,p]=chi2gof(data_t,'CDF',cd);
% ������ͬ�ֲ���t�ֲ�
data_t2=random('t',5,1000,1);
data_t1=random('t',5,1000,1);
[h,p]=kstest2(data_t1,data_t2)

%% logistic�ֲ��������
mu=2;
sigma=1;
% pd=makedist('t',5);
data_log=random('logistic',mu,sigma,1000,1);
param_log=mle(data_log,'distribution','logistic');
cd=fitdist(data_log,'logistic');
% ���п�������
[h,p]=chi2gof(data_log,'CDF',cd);
% ������ͬ�ֲ���logistic�ֲ�
data_log2=random('logistic',mu,sigma,1000,1);
[h,p]=kstest2(data_log,data_log2);

%% tlocation�ֲ��������
mu=3;sigma=1;m=1;
data_scale=random('tLocationScale',mu,sigma,m,1000,1);
param_scale=mle(data_scale,'distribution','tLocationScale');
cd=fitdist(data_scale,'tLocationScale');
% ���п�������
[h,p]=chi2gof(data_scale,'CDF',cd);
% ������ͬ�ֲ���tlocation�ֲ�
data_scale2=random('tLocationScale',mu,sigma,m,1000,1);
[h,p]=kstest2(data_scale,data_scale2);

