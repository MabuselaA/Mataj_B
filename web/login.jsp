<%-- 
    Document   : login
    Created on : 20 Jul 2016, 11:03:58 AM
    Author     : KinG
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

        <%
    Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    String DM = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3307/mataj_bank";
    String user = "root";
    String password = "schoolboy";
    
   String username = request.getParameter("uname");// Send to Acc table
    String Pass = request.getParameter("password");
    
    String sql = "SELECT acc_number,password FROM t_online_account WHERE acc_number = ? and password = ?";// Select Username & Password
   
    
try{
    Class.forName(DM);
    con = DriverManager.getConnection(url,user,password);
    ps = con.prepareStatement(sql);
    
    ps.setString(1,username); //username from database
    ps.setString(2,Pass); // get password from database
    
    rs = ps.executeQuery();

         if(rs.next())// username and pasword correct
            {
                
                 response.sendRedirect("Acc.html");
                
            }
         else// username and pasword incorrect
            {
                 out.println("Invalid username and password");
                 
            
            }
   
      // while(rs.next())
      // {
        // String acc = rs.getString("acc_number");
        // String pass = rs.getString("password");
               
        
        // out.write(acc + " password " + pass);
        // document.log.uname.value=name;
        // document.log.password.value=pass;
      // }
     }
  catch(SQLException a)
    {
       out.println("SQL Error. Try to fix your SQL statement now" + a);
    }
          %>