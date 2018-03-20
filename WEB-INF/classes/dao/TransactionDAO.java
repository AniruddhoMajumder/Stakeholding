package dao;

import java.sql.*;
import java.util.*;
import dao.*;
import project.*;
import defaults.*;

public class TransactionDAO{

   private Connection dbConnection;

   private String dbUrl,
         dbUser,
         dbPass;
   
   public TransactionDAO(String dbUrl, String dbUser, String dbPass){
      this.dbUrl = dbUrl;
      this.dbUser = dbUser;
      this.dbPass = dbPass;
   }

   private void connect() throws SQLException{
      if(dbConnection == null || dbConnection.isClosed()){
         try{
            Class.forName("com.mysql.jdbc.Driver");
            dbConnection = DriverManager.getConnection(dbUrl, dbUser, dbPass);
         }catch(Exception e){
            e.printStackTrace();
         }
      }
   }

   private void disconnect() throws SQLException{
      if(dbConnection != null || !dbConnection.isClosed()){
         dbConnection.close();
      }
   }

   public boolean transact(List<String> values) throws SQLException{
      //String insertQuery = "INSERT INTO Transaction VALUES(?, ?, ?, ?, ?, ?, now())";
      String insertQuery = "INSERT INTO Transaction VALUES(";

      connect();
      Statement insertTxnSTAT = dbConnection.createStatement();

      insertQuery += "'" + getNextId() + "', ";
      insertQuery += "'" + values.get(0) + "', ";
      insertQuery += "'" + values.get(1) + "', ";
      insertQuery += "'" + values.get(2) + "', ";
      insertQuery += values.get(3) + ", ";
      insertQuery += values.get(4) + "', now())";

      boolean inserted = insertTxnSTAT.executeUpdate(insertQuery)==0?false:true;

      disconnect();

      return inserted;
   }

   public String getNextId() throws SQLException{
      String newId = "txn";

      String getQuery = "SELECT COUNT(*) FROM transaction";

      connect();
      Statement getIdSTAT = dbConnection.createStatement();
      ResultSet getIdRSET = getIdSTAT.executeQuery(getQuery);

      getIdRSET.next();
      String id = getIdRSET.getString(1);
      id = (Integer.parseInt(id) + 1) + "";

      for (int i=7; i>id.length(); i--) {
         newId += "0";
      }
      newId += id;

      disconnect();

      return newId;
   }
}