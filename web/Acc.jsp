<%-- 
    Document   : Acc
    Created on : 21 Jul 2016, 11:43:08 AM
    Author     : KinG
--%>


<%@page import="java.sql.*"%>
<%@page import="javax.swing.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <%
    Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    String DM = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3307/mataj_bank";
    String user = "root";
    String password = "schoolboy";
    String sql =null;
    
   // String sql = "select * from tbl_login";
    
     int AccN = Integer.parseInt(request.getParameter("Acc"));
    long IDNo = Long.parseLong(request.getParameter("IDN"));
    String C = request.getParameter("Cpass");
    String P = request.getParameter("Ppass");
   
    
    
    
    sql = ("INSERT INTO `mataj_bank`.`t_online_account` (`acc_number`, `password`, `id`) VALUES ('"+AccN+"', '"+P+"', '"+IDNo+"')");
    
    
    con = DriverManager.getConnection(url,user,password);
    Statement st = con.createStatement();
    
    int i = st.executeUpdate(sql);
    
    
    if(i>0)
    {
        response.sendRedirect("index.html");
    }
    else
    {
        response.sendRedirect("Account.html");
    }
    

try{
    Class.forName(DM);
    con = DriverManager.getConnection(url,user,password);
    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();


    }
 catch(SQLException a)
     {
         out.println("Home" + a);
     }
          %>
