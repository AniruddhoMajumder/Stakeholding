package project;

import java.io.*;
import java.sql.*;
import dao.*;
import defaults.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Reports extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{
			int option = Integer.parseInt(request.getParameter("choice"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);

			Statement STAT = con.createStatement();
			if(option == 1){
				ResultSet RSET = STAT.executeQuery("select * from company");

				String resp = "<table class=\"table\">";

				while(RSET.next()){
					resp += "<tr>";
					resp += "<td>" + RSET.getString(2) + "</td>";
					resp += "</tr>";
				}

				resp += "</table>";

				response.setContentType("text/html");
				response.getWriter().write(resp);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}