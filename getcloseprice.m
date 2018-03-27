function s=getcloseprice(conn,sql)
curs = exec(conn, sql);
dataset = fetch(curs);
data=dataset.data;
s=cell2mat(data(:,2));