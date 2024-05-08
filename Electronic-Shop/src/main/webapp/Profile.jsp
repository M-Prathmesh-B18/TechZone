<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,com.javaBeans.*" %>
 <%
if(session.getAttribute("flag")!=null){  %>
<%@include file="header.html" %>
<%} %><%else{ %>
 <%@include file="loginheader.html" %>
<%} %>
    
<!DOCTYPE html>
<html lang="en">
<head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
       <link rel="stylesheet" href="./AllCSS/profilecss.css">
        <link rel="stylesheet" href="./AllCSS/loginmsgcss.css">
</head>
<body>   
          <% if(session.getAttribute("flag")!=null) 
      {
            
           String n=(String)session.getAttribute("uname");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
          PreparedStatement ps=conn.prepareStatement("select*from userinfo ");
          ResultSet rs=ps.executeQuery();
          String un=null;
          String a=null;
          String m=null;
          while(rs.next())
           {
        	  if((n).equals(rs.getString("email"))){
        	   un=rs.getString("name");
               a=rs.getString("address");
               m=rs.getString("phoneNo");
        	  }
           }
       
        
        %>
          

         <div class="cont"> 
           <div class="profile">
               <div class="avtar">
                     <img src="./IMGs/avtar" alt="userlogo" style="height: 143px;">
                  </div>
                  <div class="info">
                      <span>
                        <span>UserName: <%=un %></span><hr>
                        <span>Email: <%=session.getAttribute("uname") %></span><hr>
                        <span>Address: <%= a%></span><hr>
                        <span>Phone No:<%=m %></span><hr>
                      </span>
                  </div>
                  <div><button class="btn"><a href="logoutpage.jsp" style="text-decoration: none;">LogOut</a></button></div>

               </div>
            </div>  
      <%} %><%else { %>
              
               <div class="continer">
              <div class="msg"><h3>Please Login the Web Site using the following Link</h3></div>
              <div class="link"><span><a href="Signin.html">SignIn</a></span></div>
       </div>
             
      <%} %>
      <%@include file="footer.html" %>
</body>
</html>