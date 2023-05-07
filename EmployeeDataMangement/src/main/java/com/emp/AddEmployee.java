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
 * Servlet implementation class AddEmployee
 */
@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
			Statement stmt = con.createStatement();
		String name = request.getParameter("name");
		String age = request.getParameter("Age");
		String sakary = request.getParameter("Sakary");
		String photo = request.getParameter("photo");
		String adhar = request.getParameter("Adhar");
		String pan = request.getParameter("Pan");
		String department = request.getParameter("Department");
		String qualification = request.getParameter("Qualification");
		String status = request.getParameter("status");


			stmt.executeUpdate(
			"insert into employee.emplyee_data(e_name,e_age,e_salary,e_photo,e_adhar_no,e_pan_no,d_id,q_id,e_status) values('"
					+ name + "','" + age + "','" + sakary + "','" + photo + "','" + adhar + "','" + pan + "','"
					+ department + "','" + qualification + "','"+status+"')");

			System.out.print("injected");
			response.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
