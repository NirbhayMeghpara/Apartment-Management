<%-- 
    Document   : viewall
    Created on : 25-Mar-2022, 11:00:18 am
    Author     : nirbh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
        <title>View All Apartment</title>
    </head>
    <body>
    <center>
        
        <%@page import="java.sql.*" %>
    <%
        try{
             //1. Register the driver
            Class.forName("com.mysql.jdbc.Driver");
            
            //2. establish connection by con object
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apartment","root","");
             
             //3. Create the statement object which is used to execute query in database
             Statement stmt=con.createStatement();  
             
             //step4 execute query  

             ResultSet rs=stmt.executeQuery("select * from apartment"); %>
              
            <br>
            <center>
                <h2>APARTMENT MANAGEMENT</h2>
                <br>
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.html">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="insert.html">Add Apartment</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="viewall.jsp">Show Apartment</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </center><br>
              
            <%  out.println("<a href='insert.html' class='btn btn-success'>Add New Apartment Details</a> <br><br>");
              out.println("<table class='table table-bordered' style='width : 70%;' >");
                out.println("<tr><th>No.</th><th>Owner Name</th><th>Apartment Number</th><th>Apartment Status</th><th>Building Number</th><th>BHK</th><th colspan='2'>Actions</th></tr>");
                
                while(rs.next())  
                {
                int id = rs.getInt("ID");
                out.print("<tr>");
                out.println("<td>"+ rs.getInt("ID")+"</td>");
                out.println("<td>"+ rs.getString("owner_name")+"</td>");                
                out.println("<td>"+ rs.getString("apartment_number")+"</td>");
                out.println("<td>"+ rs.getString("apartment_status")+"</td>");
                out.println("<td>"+ rs.getString("building_number")+"</td>");
                out.println("<td>"+ rs.getString("bhk")+"</td>");%>
                
                <td><a href="edit.jsp?ID=<%=id%>">Edit</a></td>
                
                <td><a href="delete.jsp?ID=<%=id%>">Delete</a></td>
                
                <%
                out.print("</tr>");
                }
                out.print("</table>");
                
            //5.close the connection
                con.close();
        }
                
            catch (Exception e) {
            out.println(e);
        }
    %>
    </center>
    </body>
</html>
