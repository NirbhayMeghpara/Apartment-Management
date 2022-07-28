<%-- 
    Document   : insert
    Created on : 13-Mar-2022, 2:11:16 pm
    Author     : nirbh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
    <%
        try{
            String oname = request.getParameter("ownername");
            String ano = request.getParameter("apartmentno");
            String astatus = request.getParameter("apartmentstatus");
            String bno = request.getParameter("buildingno");
            String abhk = request.getParameter("bhk");
            
             //1. Register the driver
            Class.forName("com.mysql.jdbc.Driver");
            
            //2. establish connection by con object
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apartment","root","");
             
             //3. Create the statement object which is used to execute query in database
             PreparedStatement ps = con.prepareStatement("INSERT INTO `apartment` (`owner_name`,`apartment_number`,`apartment_status`, `building_number`, `bhk`) VALUES (?, ?, ?, ?, ?)");
             
             //step4 execute update  
              ps.setString(1,oname); 
              ps.setString(2,ano);
              ps.setString(3,astatus);
              ps.setString(4,bno);
              ps.setString(5,abhk);
              
              ps.executeUpdate();
            //5.close the connection
                con.close();
        }
                
            catch (Exception e) {
            out.println(e);
        }
    %>
    
        <%
        String redirectURL="viewall.jsp";
        response.sendRedirect(redirectURL);
        %>
        
    </body>
</html>
