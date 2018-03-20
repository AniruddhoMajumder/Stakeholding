<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<%
	TransactionDAO tdao = new TransactionDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
	SecurityDAO sdao = new SecurityDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
	TransactionPartyDAO tpdao = new TransactionPartyDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);

	List<String> values = new ArrayList<String>();

	values.add(tpdao.getTraderTpid(request.getParameter("buyerid")));
	values.add(tpdao.getCompanyTpid(request.getParameter("sellerid")));
	values.add(sdao.getEquityShareID(request.getParameter("sellerid")));
	values.add(request.getParameter("shares"));
	values.add(Double.toString( (Double.parseDouble(request.getParameter("price")) * Integer.parseInt(request.getParameter("shares"))) ));

	try{
		Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
    	String insertTxnQuery = "INSERT INTO Transaction VALUES(";
    	insertTxnQuery += "'" + tdao.getNextId() + "', ";
		insertTxnQuery += "'" + values.get(0) + "', ";
		insertTxnQuery += "'" + values.get(1) + "', ";
		insertTxnQuery += "'" + values.get(2) + "', ";
		insertTxnQuery += values.get(3) + ", ";
		insertTxnQuery += values.get(4) + ", now())";

		String updateSecuritiesQuery = "UPDATE securities set available = available - " + values.get(3) + " where id = '" + sdao.getEquityShareID(request.getParameter("sellerid")) + "'";
		String updateTransactionPartyQuery = "UPDATE transaction_party SET balance = balance - " + values.get(4) + " where id = '" + values.get(0) + "'";

		Statement insertTxnSTAT = con.createStatement();
		boolean ins1 = insertTxnSTAT.executeUpdate(insertTxnQuery)==0?false:true;
		boolean ins2 = insertTxnSTAT.executeUpdate(updateSecuritiesQuery)==0?false:true;
		boolean ins3 = insertTxnSTAT.executeUpdate(updateTransactionPartyQuery)==0?false:true;
		if(ins1 && ins2 && ins3){
		response.sendRedirect("/stocks/dashboard/index.jsp");
		}else{
			out.println("Transaction Failed <a href=\"/index.jsp\">Back to Dashboard</a>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>