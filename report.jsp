<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<!DOCTYPE html>
<html>
<head>
	<title>Report</title>
	<style>
		body {
			font-family: arial;
			color: rgb(66,139,202);
		}
		.rad {
			margin: 15px;
		}
		.but {
			width: 150px;
			height: 40px;
			font-weight: bold;
			color: white;
			background-color: rgb(92,184,92);
			border: 2px solid rgb(92,184,92);
			border-radius: 3px;
			margin: 20px;
			margin-left: 35%;
		}
		.but:hover {
			background-color: white;
			color: rgb(92,184,92);
		}
		.out {
			width: 40%;
			margin: auto;
		}
		.txt {
			height: 27px;
			width: 150px;
			border: 2px solid rgb(66,139,202);
			border-radius: 3px;
			padding: 5px;
			margin: 10px;
			margin-left: 45px;
		}
		.sel {
			height: 40px;
			width: 150px;
			border: 2px solid rgb(66,139,202);
			border-radius: 3px;
			padding: 5px;
			margin: 10px;
			margin-left: 45px;
		}
	</style>
</head>
<body>
<div class="out">
	<form method="post" action="queries.jsp">
		<input type="radio" class="rad" name="query" value="1" required>List of all company details</input><br>
		<input type="radio" class="rad" name="query" value="2">List of all  trader details</input><br>
		<input type="radio" class="rad" name="query" value="3">List of all transactions using a company's share</input><br>
			<select name="cid" class="sel">
				<option value="">Select Company</option>
				<%
					String queryString = "";
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stocks", "root", "root");
					Statement getSTAT = con.createStatement();
					ResultSet getRSET = getSTAT.executeQuery("select id, name from company");

					while(getRSET.next()){
						out.println("<option value=\"" + getRSET.getString(1) + "\">" + getRSET.getString(2) + "</option>");
					}
				%>
			</select><br>
		<input type="radio" class="rad" name="query" value="4">List of all transactions done by a particular trader</input><br>
			<select name="tid" class="sel">
				<option value="">Select Trader</option>
				<%
					queryString = "";

					getRSET = getSTAT.executeQuery("select id, concat(title, ' ', f_name, ' ', m_name, ' ', l_name) from trader");

					while(getRSET.next()){
						out.println("<option value=\"" + getRSET.getString(1) + "\">" + getRSET.getString(2) + "</option>");
					}
				%>
			</select><br>
		<input type="radio" class="rad" name="query" value="5">List of all transactions done by a trader with a particular company's shares</input><br>
			<select name="cid2" class="sel">
				<option value="">Select Company</option>
				<%
					queryString = "";

					getRSET = getSTAT.executeQuery("select id, name from company ");

					while(getRSET.next()){
						out.println("<option value=\"" + getRSET.getString(1) + "\">" + getRSET.getString(2) + "</option>");
					}
				%>
			</select>
			<select name="tid2" class="sel">
				<option value="">Select Trader</option>
				<%
					queryString = "";

					getRSET = getSTAT.executeQuery("select tp.id, concat(title, ' ', f_name, ' ', m_name, ' ', l_name) from trader t, transaction_party tp where tp.trader_id = t.id");

					while(getRSET.next()){
						out.println("<option value=\"" + getRSET.getString(1) + "\">" + getRSET.getString(2) + "</option>");
					}
				%>
			</select><br>
		<input type="radio" class="rad" name="query" value="6">List of traders having a balance greater than the entered amount</input><br>
			<input class="txt" type="text" name="price1" placeholder="Enter Amount" pattern="[0-9]+$"></input><br>
		<input type="radio" class="rad" name="query" value="7">List of traders having a balance lesser than the entered amount</input><br>
			<input class="txt" type="text" name="price2" placeholder="Enter Amount" pattern="[0-9]+$"></input><br>
		<input type="radio" class="rad" name="query" value="8">List of companies with their respective shares sold and left</input><br>
		<input type="radio" class="rad" name="query" value="9">List of shares with only their price</input><br>
		<input type="submit" class="but" value="Select Query"></input>
	</form>
</div>
</body>
</html>