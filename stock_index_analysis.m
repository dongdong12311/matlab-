conn = database('stock_index', 'root', '123123', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3306/');
%获取上证宗指的数据
sql=['SELECT * FROM stock_index.`000016.sh`  where date > "',...
    '2005-01-01','" and date<="','2013-01-01','";'];
data1=getcloseprice(conn,sql);
rt1=log(data1(2:end)./data1(1:end-1));
sql=['SELECT * FROM stock_index.`000016.sh`  where date > "',...
    '2010-01-01','" and date<="','2018-01-01','";'];
data2=getcloseprice(conn,sql);rt2=log(data2(2:end)./data2(1:end-1));
[h,p]=kstest2(rt1,rt2)
[pdft,x]=ksdensity(rt1);
plot(x,pdft)
hold on 
[pdft,x]=ksdensity(rt2);
plot(x,pdft)
