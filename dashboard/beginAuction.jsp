<%@ page import="dao.*" %>
<%@ page import="project.*" %>
<%@ page import="defaults.*" %>
<%
Thread ShareAuction = new Thread(new Auction((String) session.getAttribute("ID"), request.getParameter(SHARENO)));

ShareAuction.start();

%>
