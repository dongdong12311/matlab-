%% �Ӳ��ԵĽ�����������������ﵽ1000�Ժ� ��̬�ֲ���logistics�ֲ������Ч���Ѿ��ܺ���
%% t�ֲ������Ч����Բ���

%% ������̬�ֲ�������� ���в�������
%���������
data=random('norm',5,1,100,1);
%������Ȼ����
phat=mle(data,'distribution','norm');
%�Լ�������̬�ֲ��ķֲ�����
cuspdf=@(data,mu,sigma) 1./(sqrt(2*pi)*abs(sigma))*exp(-1/2*(data-mu).^2/sigma^2);
phat2=mle(data,'pdf',cuspdf,'start',[5,1]);

% x=-5:0.1:5;
% y=tpdf(x,7);
% plot(x,y);
% hold on
%% ����t�ֲ�������������в�������
%datat=random('t',7,500,1);
%[pdft,x]=ksdensity(datat);
%plot(x,pdft)
phat_t=mle(datat,'pdf',@tpdf,'start',10);
%�ӹ��ƵĽ����������С������t�����Ĺ���Ч�����Ǻܺã���
S= var(datat);
n = 2*S/(S-1);
%�����ǲ��þ���� Ч��Ҳ���Ǻܺ�

%% ���� logistic �ֲ�������� �����в����Ĺ���
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

%% scale-t�ֲ�
%���������
data_scale=makedist('tLocationScale','mu',3,'sigma',1,'nu',1);
data_scale=random('tLocationScale',3,1,1,1000,1);
%������Ȼ����
phat_scale=mle(data_scale,'distribution','tlocationscale');
phat_scale


