package com.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		Login Info get
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();

//        read the values from user database
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT * FROM employee.adminlogin where mail='" + username + "' and pass = '" + password + "';");

//			reach database every row data
			if (rs.next()) {
				String u = rs.getString(2);
				String p = rs.getString(3);
				out.print(u + " " + p);
				if (username.equals(u) && password.equals(p)) {
					System.out.print("Loged in.....");
					response.sendRedirect("index.jsp");
				} else {
					response.sendRedirect("error.html");
					System.out.print("failed");
				}
			} else {
				response.sendRedirect("error.html");
			}
		} catch (Exception e) {
			e.getStackTrace();
		}

	}

}
