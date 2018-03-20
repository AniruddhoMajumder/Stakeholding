<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<%
	SecurityDAO sdao = new SecurityDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
%>
<!DOCTYPE html>
<html>
<head>
	<title>Buy Shares</title>

	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form name="buy" method="post" action="transact.jsp">
					No. of Shares <input class="form-control" type="number" name="shares"> <%out.print("Available: " + sdao.getEquitySharesAvailable(request.getParameter("cid")));%>
					<br>
					<input class="form-control" type="hidden" name="sellerid" value="<%out.print(request.getParameter("cid"));%>">
					<input class="form-control" type="hidden" name="buyerid" value="<%out.print(((String) session.getAttribute("ID")));%>">
					<input class="form-control" type="hidden" name="price" value="<%out.print(request.getParameter("price"));%>">
					<input class="form-control btn btn-success" type="submit" name="submit">

				</form>		
			</div>
		</div>
	</div>
</body>
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/popper.js"></script>
<script src="../js/bootstrap.min.js"></script>
</html>