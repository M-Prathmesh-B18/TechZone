package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Updata
 */
@WebServlet("/Updata")
public class Updata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 PreparedStatement ps1;
     
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter pw=response.getWriter();
			
			    
				
				String id=request.getParameter("id");
				String b=request.getParameter("brand");
				String m=request.getParameter("model");
				String i="./IMGs/"+request.getParameter("img");
				String f=request.getParameter("feature");
				String disc=request.getParameter("discription");
				String pr=request.getParameter("price");
				String di=request.getParameter("discount");
				String opr=request.getParameter("oprice");
				String btncancel=request.getParameter("btn1");
				String btnupdate=request.getParameter("btn2");
			    String query1=null;
			
		if(btnupdate!=null)
		{
			    
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");

				 
				
				query1="update product set model=?,img=?,price=?,discount=?,oprice=?,feature=?,discription=? where brand=? and id=? ";
				ps1=conn.prepareStatement(query1);
				
				ps1.setString(1, m);
				ps1.setString(2, i);
				ps1.setString(3, pr);
				ps1.setString(4, di);
				ps1.setString(5, opr);
				ps1.setString(6, f);
				ps1.setString(7, disc);
				ps1.setString(8, b);
				ps1.setString(9, id);
				
				int pro=ps1.executeUpdate();
				
				if(pro>0) {
					pw.println("data is updates");
				}else{
					pw.print("not updated");
				}
		        
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("adminpage.jsp");
			rd.forward(request, response);
		}
	         
		}

	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

}
