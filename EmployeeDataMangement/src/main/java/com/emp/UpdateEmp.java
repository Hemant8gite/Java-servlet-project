package com.emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.SendResult;

//import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class UpdateEmp
 */
@WebServlet("/UpdateEmp")
public class UpdateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			
			String id = (String)session.getAttribute("id");
			System.out.print("id  "+id);
			String nameu = request.getParameter("name");
			String age = request.getParameter("age");
			String sakary = request.getParameter("sakary");
			String department = request.getParameter("department");
			String qualification = request.getParameter("qualification");
			String status = request.getParameter("status");
			

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
			Statement stmt = con.createStatement();

			stmt.execute(
					"UPDATE employee.emplyee_data SET e_name = '"+nameu+"', e_age = '"+age+"', e_salary = '"+sakary+"',"
					+ " d_id = '"+department+"', q_id = '"+qualification+"', e_status = '"+status+"'  WHERE (id = "+id+");;");
			

			System.out.print("injected");
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
	}

}
