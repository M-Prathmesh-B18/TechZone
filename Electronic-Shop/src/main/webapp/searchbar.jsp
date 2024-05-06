 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.javaBeans.*,java.util.*" %>
 
 
 <%  if(session.getAttribute("flag")!=null){  %>
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
       <link rel="stylesheet" href="./AllCSS/laptopcss.css">
</head>
<body>
 
       
       <% 
         String ser=request.getParameter("search");
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
         PreparedStatement ps=conn.prepareStatement("select*from product where  type=? or brand=? or model=?");
         
         ps.setString(1,ser);
         ps.setString(2,ser);
         ps.setString(3,ser);
         ResultSet rs=ps.executeQuery();
         ArrayList<AllProducts>arr=new ArrayList<>();
         int j=0;
         while(rs.next())
         {
        	 
        	 
        	 AllProducts p=new AllProducts();
        	  p=new AllProducts();
        	  p.setBrand(rs.getString("brand"));
        	  p.setModel(rs.getString("model"));
        	  p.setImg(rs.getString("img"));
        	  p.setFeatures(rs.getString("feature"));
        	  p.setPrice(rs.getString("price"));
        	  p.setDiscount(rs.getString("discount"));
        	  p.setOprice(rs.getString("oprice"));
        	  p.setLink(rs.getString("link"));
        	  arr.add(p);
        	  j++;
         }
          
        %>
        
        
       <div class="product">
           <%ListIterator i1=arr.listIterator(); %>
         <%if(j>0){ %>
           <%while(i1.hasNext()){ %>
              <div>
                    
                    <%  AllProducts p1=(AllProducts)i1.next();%>
                    
                     <a href='<%=p1.getLink()%>'><img src= '<%=p1.getImg() %>' alt="HP" class="imgs"></a>
                     <span class="pdata">
                            <h2><%=p1.getModel() %></h2>
                            <h3><%=p1.getFeatures() %></h3><hr class="line">
                            <h2> <span class="discount">Up to - <%=p1.getDiscount() %> % </span><%=p1.getPrice() %></h2>
                            <h5 class="price">M.R.P.: Rs<%=p1.getOprice() %></h5>
                     </span>
                
              </div> 
             <%} %>    
          <%}%><%else{ %> 
                          <h2>Result is not found</h2>
                       
                     <%} %>                                          
       </div>
</body>
</html>