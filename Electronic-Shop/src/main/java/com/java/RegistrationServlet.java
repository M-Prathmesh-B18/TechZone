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

import java.sql.*;
import java.util.Random;

@WebServlet(
		urlPatterns = { "/RegistrationServlet" }, 
		initParams = { 
				@WebInitParam(name = "Driver", value = "com.mysql.jdbc.Driver"), 
				@WebInitParam(name = "url", value = "jdbc:mysql://localhost:3306/ElectronicShop"), 
				@WebInitParam(name = "username", value = "root"), 
				@WebInitParam(name = "password", value = "mprathamsql1810")
		})
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       PreparedStatement ps;
       Connection conn;
       
       public void init()
       {
    	   ServletConfig sc=getServletConfig();
    	   String Driver =sc.getInitParameter("Driver");
    	   String url=sc.getInitParameter("url");
    	   String username=sc.getInitParameter("username");
    	   String password=sc.getInitParameter("password");
    	   
    	   try {
			Class.forName(Driver);
			conn=DriverManager.getConnection(url,username,password);
			ps=conn.prepareStatement("insert into userinfo values(?,?,?,?,?,?)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	   
       }
       
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	   doPost(request, response);
       }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter pw=response.getWriter();
	     
	     String n=request.getParameter("uname");
	     String e=request.getParameter("uemail");
	     String p=request.getParameter("upass");
	     String a=request.getParameter("uaddr");
	     String m=request.getParameter("unumber");
	     Random rn=new Random();
	     String uid ="UID"+rn.nextInt(9999999);
	     
	     try {
	        ps.setString(1,uid);
			ps.setString(2,n);
			ps.setString(3,e);
			ps.setString(4,p);
			ps.setString(5,a);
			ps.setString(6,m);
			
		    int x=ps.executeUpdate();
		    if(x>0)
		    {
		           RequestDispatcher rd=request.getRequestDispatcher("Signin.html");
		           rd.forward(request, response);
		    }else {
		          RequestDispatcher rd=request.getRequestDispatcher("Signup.html");
		          rd.include(request, response);
		          pw.println("pleace enter valid information");
		          
		    }
		    
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 
	}

}
