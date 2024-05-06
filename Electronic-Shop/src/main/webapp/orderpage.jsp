<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.javaBeans.*,java.util.*" %>
 <%
if(session.getAttribute("flag")!=null){  %>
<%@include file="header.html" %>
<%} %><%else{ %>
 <%@include file="loginheader.html" %>
      <%response.sendRedirect("loginmsg.jsp");%>
<%} %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./AllCSS/productcss.css">
       <link rel="stylesheet" href="./AllCSS/laptopcss.css">
       <link rel="stylesheet" href="./AllCSS/ordercss.css">
</head>
<body>

            <% 
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
              PreparedStatement ps=conn.prepareStatement("select*from product where id = ? ");
              ps.setString(1,request.getParameter("data"));
              ResultSet rs=ps.executeQuery();
              ArrayList<AllProducts> arr=new ArrayList<>();
              while(rs.next()){
            	  AllProducts p=new AllProducts();
            	  p.setImg(rs.getString("img"));
            	  p.setModel(rs.getString("model"));
            	  p.setPrice(rs.getString("price"));
            	  arr.add(p);
            	  
              }
            
            %>
      <%ListIterator i=arr.listIterator();%>
      <%while(i.hasNext()){ %>
          <%  AllProducts p1=(AllProducts)i.next();%>
          <div class="orderdata">
              <div class="img1"><img src='<%=p1.getImg() %>' alt="" style="width: 130px;"></div>
              <div class="info"><span></span></div>
              <div class="info2"><span><%=p1.getModel() %></span></div>
              <div class="purches"> Rs<%=p1.getPrice() %> </div>
              <div class="type">Cash on delivery</div>

       </div>
      <%} %>
<%@include file="footer.html" %>
</body>
</html>