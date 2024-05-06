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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./AllCSS/laptopcss.css">
</head>
<body>
         <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
         PreparedStatement ps=conn.prepareStatement("select*from product");
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
        	  p.setId(rs.getString("id"));
        	  arr.add(p);
        	  j++;
         }
          
        %>
        
        
       <div class="product">
           <%ListIterator i1=arr.listIterator(); %>
           <%while(i1.hasNext()){ %>
              <div>
                    <%  AllProducts p1=(AllProducts)i1.next();%>
                    
                      <a href="productpage.jsp?data=<%=p1.getId() %>"><img src= '<%=p1.getImg() %>' alt='<%=p1.getBrand() %>' class="imgs"></a>
                     <span class="pdata">
                            <h2><%=p1.getModel() %></h2>
                            <h3><%=p1.getFeatures() %></h3><hr class="line">
                            <h2> <span class="discount">Up to - <%=p1.getDiscount() %> % </span>Rs<%=p1.getPrice() %></h2>
                            <h5 class="price">M.R.P.: Rs<%=p1.getOprice() %></h5>
                     </span>

              </div>  
          <%} %>                                           
       </div>
       <%@include file="footer.html" %>
</body>
</html>