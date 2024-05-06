package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Indata
 */
@WebServlet("/Indata")
public class Indata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	  
	 PreparedStatement ps1;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		
		    Random rn=new Random();
			String id="PR"+rn.nextInt(99999999);
			
			String tab=request.getParameter("product");
			String b=request.getParameter("brand");
			String m=request.getParameter("model");
			String i="./IMGs/"+request.getParameter("img");
			String f=request.getParameter("feature");
			String disc=request.getParameter("discription");
			String pr=request.getParameter("price");
			String di=request.getParameter("discount");
			String opr=request.getParameter("oprice");
			String btncancel=request.getParameter("btn1");
			String btninsert=request.getParameter("btn2");
		    String query=null;
		    String query1=null;
		
	if(btninsert!=null)
	{
		    
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Electronicshop","root","mprathamsql1810");

			 
			
			query1="INSERT INTO product (id,type,brand,model,img,price,discount,oprice,feature,discription) VALUES (?,?,?,?,?,?,?,?,?,?) ";
			ps1=conn.prepareStatement(query1);
			
			ps1.setString(1, id);
			ps1.setString(2, tab);
			ps1.setString(3, b);
			ps1.setString(4, m);
			ps1.setString(5, i);
			ps1.setString(6, pr);
			ps1.setString(7, di);
			ps1.setString(8, opr);
			ps1.setString(9, f);
			ps1.setString(10, disc);
			
			int pro=ps1.executeUpdate();
			
			if(pro>0) {
				pw.println("data is insert");
			}else{
				pw.print("not insertd");
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
