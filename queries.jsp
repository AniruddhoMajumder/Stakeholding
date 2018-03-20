<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<!DOCTYPE html>
<html>
<head>
	<title>Stockmarket</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<style type="text/css">
		.modal-open {
			padding-right: 0px !important;
			overflow: auto !important;
		}
	</style>
</head>
<body>

<nav class="navbar sticky-top navbar-dark bg-info" style="padding-right: 0px !important;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">Meridia</a>
		</div>
	</div>
</nav>

<body>

<div class="container">
	<div class="row">
		<div class="col-12">
			<table class="table">
				<%
					String queryString = "";

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stocks", "root", "root");
					Statement getSTAT = con.createStatement();

					if(request.getParameter("query").equals("1")){
						queryString = "SELECT name as Name, licence as Licence, phone as Phone, email as Email, address as Address FROM company";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("2")){
						queryString = "SELECT concat(title, ' ', f_name, ' ', m_name, ' ', l_name) as Name, gender as Gender, id_proof as 'ID Proof', dob as 'Date of Birth', phone as Phone, email as 'E Mail',address as Address FROM trader";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("3")){
						queryString = "SELECT buyer_id as 'Buyer ID', seller_id as 'Seller ID', security_id as 'Security ID', number as 'Number', amount as'Amount', t_datetime as Date from transaction t, securities s WHERE s.company_id = '" + request.getParameter("cid") + "' AND t.security_id=s.id";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("4")){
						queryString = "SELECT buyer_id as 'Buyer ID',seller_id as 'Seller ID',security_id as 'Security ID',number as 'Number',amount as 'Amount',t_datetime as 'Date and Time' from transaction WHERE buyer_id = (SELECT id from transaction_party where trader_id = '" + request.getParameter("tid") + "')";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("5")){
						queryString = "SELECT buyer_id as 'Buyer ID',seller_id as 'Seller ID',security_id as 'Security ID',number as 'Number',amount as 'Amount',t_datetime as 'Date and Time' from transaction WHERE buyer_id = '" + request.getParameter("tid2") + "' and security_id = (select id from securities where company_id = '" + request.getParameter("cid2") + "')";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("6")){
						queryString = "SELECT concat(title, ' ', f_name, ' ', m_name, ' ', l_name) as Name,balance as Balance from trader t,transaction_party tp WHERE tp.balance > " + request.getParameter("price1") + " AND  t.id=tp.trader_id";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("7")){
						queryString = "SELECT concat(title, ' ', f_name, ' ', m_name, ' ', l_name) as Name,balance as Balance from trader t,transaction_party tp WHERE tp.balance <= " + request.getParameter("price1") + " AND  t.id=tp.trader_id";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("8")){
						queryString = "SELECT name as Name, company_id as 'Company ID', SUM(t.number) as 'Shares Sold', s.available as 'Shares Available' FROM securities s, transaction t,company c WHERE s.company_id=c.id AND t.seller_id=(select id from transaction_party tp where tp.company_id = c.id) group by Name order by company_id";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}else if(request.getParameter("query").equals("9")){
						queryString = "select c.name as Name, s.id as 'Security ID', price as Price from company c, securities s where s.company_id = c.id order by company_id";
						ResultSet rep1 = getSTAT.executeQuery(queryString);
						%>
							<thead>
						<%
							for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
								out.print("<th>" + rep1.getMetaData().getColumnName(j) + "</th>");
							}
						%>
							</thead>
						<%
						while(rep1.next()){
							%>
								<tr>
							<%
								for(int j=1; j<=rep1.getMetaData().getColumnCount(); j++){
									out.print("<td>" + rep1.getString(j) + "</td>");
								}
							%>
								<tr>
							<%
						}
					}
				%>
			</table>
		</div>
	</div>
</div>

</body>
</html>


