 package com.emp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
			Statement stmt = con.createStatement();

			String id = request.getParameter("id");

			session.setAttribute("id", id);

			ResultSet rsid = stmt.executeQuery("select * from employee.emplyee_data where id=" + id + ";");

			if(rsid.next()){
			System.out.print("id checking " + rsid.getInt(1));

			if (id != null && Integer.parseInt(id) == rsid.getInt(1)) {

				ResultSet rs = stmt.executeQuery("SELECT * FROM employee.emplyee_data where id = " + id + "; ");
				if(rs.next()){
				String name = rs.getString("e_name");

				String e_age = rs.getString("e_age");
				String e_salary = rs.getString("e_salary");
				String e_photo = rs.getString("e_photo");
				String e_adhar_no = rs.getString("e_adhar_no");
				String e_pan_no = rs.getString("e_pan_no");
				String d_id = rs.getString("d_id");
				String q_id = rs.getString("q_id");

				request.setAttribute("name", name);
				request.setAttribute("e_age", e_age);
				request.setAttribute("e_salary", e_salary);
				request.setAttribute("e_photo", e_photo);
				request.setAttribute("e_adhar_no", e_adhar_no);
				request.setAttribute("e_pan_no", e_pan_no);
				request.setAttribute("d_id", d_id);
				request.setAttribute("q_id", q_id);
				
				String pass = "You can use this ID";
				if(pass != null) {					
					request.setAttribute("pass", pass);
				}

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				
				}
			} 
			}else{


				String fail = "ID not Exist!!";
				if(fail != null) {					
					request.setAttribute("fail", fail);
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
