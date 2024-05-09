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
	HttpSession session;
	PrintWriter pw;
	Connection conn;
	PreparedStatement ps;
	int flags=(int)session.getAttribute("flag");
	 
	public void init() {
		  
			try {
				Class.forName("com.mysql.jdbc.Driver");
			    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");
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
	  if(flags==1)
	  {	  
		pw=response.getWriter();
		 session=request.getSession();
		
		String pids=request.getParameter("data");
		String uids=(String)session.getAttribute("usid");
		pw.println(uids+" "+pids);
		try {
			ps.setString(1, uids);
			ps.setString(2,pids);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	  }else {
		  
		   response.sendRedirect("loginmsg.jsp");
	  }
				
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
