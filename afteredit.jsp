<html>

<body>
    
    <%@page import="java.sql.*" %>
    <%
        try{
            String oname = request.getParameter("ownername");
            String ano = request.getParameter("apartmentno");
            String astatus = request.getParameter("apartmentstatus");
            String bno = request.getParameter("buildingno");
            String abhk = request.getParameter("bhk");
            String id = request.getParameter("id");
             //1. Register the driver
            Class.forName("com.mysql.jdbc.Driver");
            
            //2. establish connection by con object
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apartment","root","");
             
             //3. Create the statement object which is used to execute query in database
//             Statement stmt=con.createStatement();  
               PreparedStatement ps = con.prepareStatement("UPDATE apartment SET owner_name = ? , apartment_number = ? , building_number = ? , apartment_status = ? , bhk = ? WHERE ID = ? ");
             
             //step4 execute query  
              ps.setString(1,oname); 
              ps.setString(2,ano);
              ps.setString(3,bno);
              ps.setString(4,astatus);
              ps.setString(5,abhk);
              ps.setString(6, id);
              
              ps.executeUpdate();
        }
        catch(Exception e){
            
        }
        %>
        
        <%
        String redirectURL="viewall.jsp";
        response.sendRedirect(redirectURL);
        %>
         
</body>
</html>