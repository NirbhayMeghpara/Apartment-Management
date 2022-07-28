<%-- 
    Document   : edit
    Created on : 28-Mar-2022, 1:01:36 pm
    Author     : nirbh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Edit Apartment Details</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
        try{
          Class.forName("com.mysql.jdbc.Driver");
            
            //2. establish connection by con object
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apartment","root","");
             
             //3. Create the statement object which is used to execute query in database
             Statement stmt=con.createStatement();  
             
             //step4 execute query  
             String id = request.getParameter("ID");
             ResultSet rs =stmt.executeQuery("select * from apartment where ID = "+id+"");
             
      if(rs.next())
        %>
        
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
            </center>
        
        
        <div class="container col-md-5">
            <div class="card" style="margin: 60px">
                <div class="card-body" >
                    
                    <form action="afteredit.jsp" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <fieldset>
                            <legend><h2>Edit Apartment Details</h2></legend>
                        
                        <fieldset class="form-group">
                            <label>Owner Name</label> <input type="text" value="<%= rs.getString("owner_name")%>" class="form-control"
                                    name="ownername" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Apartment Number</label> <input type="text"
                                    value="<%= rs.getString("apartment_number")%>" class="form-control"
                                    name="apartmentno">
                        </fieldset>
                            
                        <fieldset class="form-group">
                            <label>Apartment Status</label>
                                <select class="form-control" name="apartmentstatus" required>
                                  <option selected=""><%= rs.getString("apartment_status")%></option>
                                  <option value="Owned">Owned</option>
                                  <option value="Empty">Empty</option>
                                </select> 
                        </fieldset>
                            
                        <fieldset class="form-group">
                            <label>Building Number</label> 
                            <select class="form-control" name="buildingno" required>
                                <option selected=""><%= rs.getString("building_number")%></option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                              </select>
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>BHK</label>
                                <select class="form-control" name="bhk" required>
                                  <option selected=""><%= rs.getString("bhk")%></option>
                                  <option value="4">4</option>
                                  <option value="3">3</option>
                                  <option value="2">2</option>
                                </select>
                        </fieldset>
                        
                        <br>    
                        <button style="width:20%; font-size: 18px;" type="submit" class="btn btn-success">Edit</button>
                        
                    </form>
                </div>
            </div>
        </div>
        <%  }catch(Exception e){            
        }
        %>
    </body>
</html>
