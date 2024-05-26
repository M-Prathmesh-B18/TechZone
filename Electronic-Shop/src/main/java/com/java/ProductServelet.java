package com.java;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 

/**
 * Servlet implementation class ProductServelet
 */
@WebServlet("/ProductServelet")
public class ProductServelet extends HttpServlet {
	Connection conn;
	PreparedStatement ps;
	 
	 
	public void init() {
		  
			try {
				Class.forName("com.mysql.jdbc.Driver");
			    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectronicShop","root","mprathamsql1810");
			    ps=conn.prepareStatement("insert into buy values(?,?)");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
			
			
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		  PrintWriter pw=response.getWriter();
		 HttpSession session=request.getSession();
		
		String pids=request.getParameter("data");
		String uids=(String)session.getAttribute("usid");
		 
		
        try {
		    ps.setString(1, uids);
			ps.setString(2,pids);
			int x=ps.executeUpdate();
			    if(x>0)
			    {
			    	RequestDispatcher rd=request.getRequestDispatcher("orderpage.jsp");
					rd.forward(request, response);
			    }else {
			    	RequestDispatcher rd=request.getRequestDispatcher("loginmsg.jsp");
					rd.forward(request, response);
			    }
			 
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
