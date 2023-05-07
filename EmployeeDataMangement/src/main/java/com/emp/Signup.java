package com.emp;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		email, user name c, phoneNumber, password
		

//		get input values by getParameter()
		
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

//		Validation matches
			String regexphone = "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}";
		String regexmail = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
				+ "A-Z]{2,7}$";
		String regexpass = "^(?=.*[0-9])" + "(?=.*[a-z])(?=.*[A-Z])" + "(?=.*[@#$%^&+=])" + "(?=\\S+$).{8,20}$";

//		validation checking

//			Inject data in MySQL
			try {

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/employee", "root",
						"root");
				Statement stmt = con.createStatement();
				stmt.executeUpdate("insert into employee.adminlogin(mail,pass,number) values ('" + email + "','" + password + "','" + phoneNumber + "');");

//				out.println(username + " " + phoneNumber + " " + email + " " + password);
				response.sendRedirect("index.jsp");

				System.out.print("sucseed");
				con.close();

			} catch (Exception e) {
				e.getStackTrace();
			}
		

	}

}
