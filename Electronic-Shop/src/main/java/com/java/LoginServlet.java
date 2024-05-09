package com.java;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.Random;
@WebServlet(
		urlPatterns = { "/LoginServlet" }, 
		initParams = { 
				@WebInitParam(name = "Driver", value = "com.mysql.jdbc.Driver"), 
				@WebInitParam(name = "url", value = "jdbc:mysql://localhost:3306/ElectronicShop"), 
				@WebInitParam(name = "username", value = "root"), 
				@WebInitParam(name = "password", value = "mprathamsql1810")
		})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CallableStatement cs;
	CallableStatement cs1;
	PreparedStatement ps;
	Connection user;
	Connection admin;

	
	public void init()
	{
		ServletConfig sc=getServletConfig();
		String Driver=sc.getInitParameter("Driver");
 	    String url=sc.getInitParameter("url");
 	    String username=sc.getInitParameter("username");
 	    String password=sc.getInitParameter("password");
 	    
 	    try {
			Class.forName(Driver);
			user=DriverManager.getConnection(url,username,password);
			admin=DriverManager.getConnection(url,username,password);
			cs=user.prepareCall("{ ?=call funcheck1(?,?) } ");
			cs1=admin.prepareCall("{ ?=call admincheck(?,?)}");
		    ps=user.prepareStatement("select uid from userinfo where email= ? and password= ? ");
			
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
		 
		 String e=request.getParameter("loginid");
	     String p=request.getParameter("loginpass");
	     String id=null;
	     
	        try {
				ps.setString(1,e);
				ps.setString(2, p);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					id=rs.getString("uid");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
	    
		 
		 try {
			 
			cs1.setString(2, e);
			cs1.setString(3, p);
			cs1.registerOutParameter(1,Types.INTEGER);
			cs1.execute();
			int y=cs1.getInt(1);
			if(y==2) {
				RequestDispatcher rd=request.getRequestDispatcher("adminpage.jsp");
				rd.forward(request, response);
			}else {
			
			cs.setString(2, e);
			cs.setString(3, p);
			cs.registerOutParameter(1, Types.INTEGER);
			cs.execute();
			int x=cs.getInt(1);
			if(x>0)
			{
				
				HttpSession s1 =request.getSession();
				s1.setAttribute("uname", e);
				s1.setAttribute("upass",p);
				s1.setAttribute("flag",1);
				s1.setAttribute("usid", id);
			    RequestDispatcher rd=request.getRequestDispatcher("mainHome.jsp");
			    rd.forward(request, response);
			}
			else
			   {
				RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.html");
				rd.forward(request, response);
			   }
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
