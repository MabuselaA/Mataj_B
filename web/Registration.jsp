<%-- 
    Document   : Registration
    Created on : 20 Jul 2016, 11:55:09 AM
    Author     : KinG
--%>
 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

         <%
    Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   // null
    String DM = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3307/mataj_bank";
    String user = "root";
    String password = "schoolboy";
   
    String ID = request.getParameter("id");// Send to Acc table
    String Name = request.getParameter("Na");
    String Surname = request.getParameter("Sur");
    String Gender = request.getParameter("Gender");
    int Age= Integer.parseInt(request.getParameter("Ag"));
    String Race= request.getParameter("race");
    String National= request.getParameter("nationality");
    String Address = request.getParameter("address");
    String Email= request.getParameter("email");
    int Contact = Integer.parseInt(request.getParameter("contact"));
    double Monthly = Double.parseDouble(request.getParameter("monthly_income"));
    int Acc = Integer.parseInt(request.getParameter("VAL"));// Send to Acc table
    String Pass = request.getParameter("Ppass");
    
    String sql = ("INSERT INTO t_personal_info (id, name, surname, gender, age, race, nationality, address, email, contact, monthly_income) VALUES ('"+ID+"','"+Name+"','"+Surname+"','"+Gender+"','"+Age+"','"+Race+"','"+National+"','"+Address+"','"+Email+"','"+Contact+"','"+Monthly+"')");
    String sqlAcc = ("INSERT INTO t_online_account (id, acc_number, password) VALUES ('"+ID+"','"+Acc+"','"+Pass+"')"); // Insert into Acc table
    con = DriverManager.getConnection(url,user,password);
    
    Statement stm = con.createStatement();
    
    
    int ii = stm.executeUpdate(sql);
    int iii = stm.executeUpdate(sqlAcc);
   
     if (( ii > 0) && (iii > 0))
    { 

       response.sendRedirect("index.html");
       
    }
    else
    {
        response.sendRedirect("Register.html"); // change here
    }
     
       %>
          
