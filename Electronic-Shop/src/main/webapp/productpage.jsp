<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.javaBeans.*,java.util.*" %>
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
       <link rel="stylesheet" href="./AllCSS/productcss.css">
       <link rel="stylesheet" href="./AllCSS/laptopcss.css">
</head>
<body>
       
       <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
         PreparedStatement ps=conn.prepareStatement("select*from product where id=? ");
         ps.setString(1,request.getParameter("data"));
         ResultSet rs=ps.executeQuery();
         ArrayList<AllProducts>arr=new ArrayList<>();
         while(rs.next())
         {
        	 
        	 
        	 AllProducts p=new AllProducts();
        	  p.setId(rs.getString("id"));
        	  p.setBrand(rs.getString("brand"));
        	  p.setModel(rs.getString("model"));
        	  p.setImg(rs.getString("img"));
        	  p.setFeatures(rs.getString("feature"));
        	  p.setPrice(rs.getString("price"));
        	  p.setDiscount(rs.getString("discount"));
        	  p.setOprice(rs.getString("oprice"));
        	  p.setLink(rs.getString("link"));
        	  p.setId(rs.getString("id"));
        	  p.setDiscription(rs.getString("discription"));
        	  arr.add(p);
         }
          
        %>
        
        
        <%ListIterator i1=arr.listIterator(); %>
           <%while(i1.hasNext()){ %>
               
                    <%  AllProducts p1=(AllProducts)i1.next();%>
                    <div class="card">
              <div class="row">
                <div class="col">
                  <div class="img"> <img src='<%=p1.getImg() %>' class="img" alt="..." style="height: 300px;"></div>
                </div>
                <div class="col2">
                  <div class="card-body">
                     <h2><%=p1.getModel() %></h2>
                     <h3><%=p1.getFeatures() %></h3><hr class="line">
                     <h2><span class="discount">Up to <%=p1.getDiscount() %> % </span> Rs <%=p1.getPrice() %></h2>
                     <div class="sell">
                            <h5 class="price">M.R.P.: Rs <%=p1.getOprice() %></h5>
                     </div>
                    <div class="block">
                     <h4><%=p1.getDiscription() %></h4>
                      <div class="b1"> 
                       <label for="cart" class="label">Add to Cart</label>
                       <input type="checkbox" id="cart" class="ch" name="carts" >
                       
                        
                       
                        
                          <a href="orderpage.jsp?data=<%=p1.getId() %>"> <input type="button" value="Bay" name="check" class="btn"> </a>  
                   
                     </div>
                    </div>
                 </div>
                </div>
              </div>
        </div>
                    
                       
          <%} %>
        
        
        
        
        
        

         <%@include file="footer.html" %>

</body>
</html>