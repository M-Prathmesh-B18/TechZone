package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Deldata
 */
@WebServlet("/Deldata")
public class Deldata  extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  
		 PreparedStatement ps1;
	     
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter pw=response.getWriter();
			
			
			
		
			    String query=null;
				String id=request.getParameter("id");
				 
				String m=request.getParameter("model");
				String btncancel=request.getParameter("btn1");
				String btndelete=request.getParameter("btn2"); 
				
		if(btndelete!=null)	
		{
			 
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");

				 
				
				query="delete from product where id=? and model=?";
				ps1=conn.prepareStatement(query);
				
				ps1.setString(1, id);
				ps1.setString(2, m);
				 
				
				int pro=ps1.executeUpdate();
				
				if(pro>0) {
					pw.println("data is deleted");
				}else{
					pw.print("not deleted");
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
