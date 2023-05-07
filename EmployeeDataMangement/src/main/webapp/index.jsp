<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<%@ page import="java.sql.*,com.mysql.cj.protocol.Resultset"%>
<style>
@import"style.css"
</style>
</head>

<body>
	<!-- start page -->
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
	Statement stmt = con.createStatement();
	%>
	<div class="sidebar">
		<div class="logo_details">
			<i class='bx bx-code-alt'></i>
			<div class="logo_name">Admin</div>
		</div>
		<ul>
			<li><a href="#" class="active"> <i class='bx bx-grid-alt'></i>
					<span class="links_name"> Dashboard </span>
			</a></li>
			<li class="links_name" data-bs-toggle="modal"
				data-bs-target="#staticBackdropOne" id="updateBTN"><a href="#">
					<i class='bx bx-user'></i> <span class="links_name"> Update
				</span>
			</a></li>
			<li><a href="#"> <i class='bx bxs-truck'></i> <span
					class="links_name"> Sales </span>
			</a></li>
			<li><a href="#"> <i class='bx bx-dollar'></i> <span
					class="links_name"> Earning </span>
			</a></li>
			<li class="links_name" data-bs-toggle="modal"
				data-bs-target="#staticBackdroptwo"><a href="#"> <i
					class='bx bxs-user-plus'></i> <span class="links_name"> add
				</span>
			</a></li>
			<li><a href="#"> <i class='bx bx-cart-alt'></i> <span
					class="links_name"> Order </span>
			</a></li>
			<li><a href="#"> <i class='bx bx-heart'></i> <span
					class="links_name"> Saved </span>
			</a></li>
			<li><a href="#"> <i class='bx bx-cog'></i> <span
					class="links_name"> Setting </span>
			</a></li>
			<li class="login"><a href="Logout" accesskey="1" > <span
					class="links_name login_out"> Login Out </span> <i
					class='bx bx-log-out' id="log_out"></i>
			</a></li>
		</ul>
	</div>
	<!-- End Sideber -->
	<section class="home_section">
		<div class="topbar">
			<div class="toggle">
				<i class='bx bx-menu' id="btn"></i>
			</div>
			<!-- <div class="search_wrapper">
				<label> <span> <i class='bx bx-search'></i>
				</span> <input type="search" placeholder="Search...">
				</label>
			</div> -->
			<div class="user_wrapper">
				<img src="Images/user.jpg" alt="">
			</div>
		</div>
		<!-- End Top Bar -->
		<div class="card-boxes">
			<div class="box">
				<div class="right_side">
					<%
					ResultSet countEmp = stmt.executeQuery("select count(e_name) from employee.emplyee_data");
					countEmp.next();
					%>
					<div class="numbers"><%=countEmp.getInt(1)%></div>
					<div class="box_topic">Total Employee</div>
				</div>
				<i class="fa-solid fa-users-viewfinder"></i>
			</div>
			<div class="box">
				<div class="right_side">
					<%
					ResultSet activeEmp = stmt.executeQuery("select count(e_status) from employee.emplyee_data where e_status = 1;");
					activeEmp.next();
					%>
					<div class="numbers"><%=activeEmp.getInt(1)%></div>
					<div class="box_topic">Active</div>
				</div>
				<i class="fa-solid fa-chart-line"></i>
			</div>
			<div class="box">
				<div class="right_side">
					<%
					ResultSet unactiveEmp = stmt.executeQuery("select count(e_status) from employee.emplyee_data where e_status = 0;");
					unactiveEmp.next();
					%>
					<div class="numbers"><%=unactiveEmp.getInt(1)%></div>
					<div class="box_topic">Unactive</div>
				</div>
				<i class="fa-solid fa-person-circle-xmark"></i>
			</div>
			<div class="box">
				<div class="right_side">
					<%
					ResultSet maxEmp = stmt.executeQuery("select max(e_salary) from employee.emplyee_data;");
					maxEmp.next();
					%>

					<div class="numbers"><%=maxEmp.getInt(1)%></div>
					<div class="box_topic">Max Salary</div>
				</div>
				<i class="fa-regular fa-star"></i>
			</div>
		</div>
		<!-- End Card Boxs -->
		<!-- model -->
		<div class="modal fade" id="staticBackdropOne"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Update
							Fild using ID</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<form action="UpdateEmp" method="post">
							<div class="row">
								<div class="col">

									<label for="name" class="form-lable mt-2">Employee Name</label>
									<input type="text" name="name"
										value="<%=request.getAttribute("name")%>" id=""
										class="form-control">
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee Age</label>
									<input type="text" value="<%=request.getAttribute("e_age")%>"
										name="age" id="" class="form-control">
								</div>
								<div>

									<label for="name" class="form-lable mt-2">Employee
										Salary</label> <input type="text"
										value="<%=request.getAttribute("e_salary")%>" name="sakary"
										id="" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Photo</label> <input type="file"
										value="<%=request.getAttribute("e_photo")%>" id="photo"
										name="photo" class="form-control">
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Aadhaar No</label> <input type="text"
										value="<%=request.getAttribute("e_adhar_no")%>" name="adhar"
										id="" class="form-control">
								</div>
							</div>
							<div>
								<label for="name" class="form-lable mt-2">Employee Pan
									No</label> <input type="text" name="Pan"
									value="<%=request.getAttribute("e_pan_no")%>" id=""
									class="form-control">
							</div>

							<div class="row">
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Department</label> <select class="form-select"
										aria-label="Default select example" name="department"
										id="Department">

										<option selected>--Select Department--</option>

										<option value="1">Accounts and Finance</option>
										<option value="2">HR</option>
										<option value="3">Sales and marketing (Business
											development)</option>
										<option value="4">Infrastructures</option>
										<option value="5">Research and development</option>
										<option value="6">Learning and development</option>
										<option value="7">IT services</option>
										<option value="8">Product development</option>
										<option value="9">Admin department</option>
										<option value="10">Security and transport.</option>
									</select>
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Qualification</label> <select class="form-select"
										aria-label="Default select example" name="qualification"
										id="Qualification">
										<option selected>--Select Qualification--</option>

										<option value="1">Diploma</option>
										<option value="2">Graduate</option>
										<option value="3">Post Graduate</option>
										<option value="4">Master</option>
										<option value="5">Phd</option>
										<option value="6">MBA</option>
										<option value="7">MSD</option>
									</select> <input type="hidden" name="status" value="1" />
								</div>
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-dark w-25 inputIN mt-2">UPDATE</button>
							</div>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary inputIN"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="staticBackdroptwo"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Add New
							Employee</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="AddEmployee" method="post">
							<div class="row">
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee Name</label>
									<input type="text" name="name" id="" class="form-control">
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee Age</label>
									<input type="text" name="Age" id="" class="form-control">
								</div>
								<div>

									<label for="name" class="form-lable mt-2">Employee
										Salary</label> <input type="text" name="Sakary" id=""
										class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Photo</label> <input type="file" id="photo" name="photo"
										class="form-control">
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Aadhaar No</label> <input type="text" name="Adhar" id=""
										class="form-control">
								</div>
							</div>
							<div>
								<label for="name" class="form-lable mt-2">Employee Pan
									No</label> <input type="text" name="Pan" id="" class="form-control">
							</div>

							<div class="row">
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Department</label> <select class="form-select"
										aria-label="Default select example" name="Department"
										id="Department">
										<option selected>--Select Department--</option>

										<option value="1">Accounts and Finance</option>
										<option value="2">HR</option>
										<option value="3">Sales and marketing (Business
											development)</option>
										<option value="4">Infrastructures</option>
										<option value="5">Research and development</option>
										<option value="6">Learning and development</option>
										<option value="7">IT services</option>
										<option value="8">Product development</option>
										<option value="9">Admin department</option>
										<option value="10">Security and transport.</option>
									</select>
								</div>
								<div class="col">
									<label for="name" class="form-lable mt-2">Employee
										Qualification</label> <select class="form-select"
										aria-label="Default select example" name="Qualification"
										id="Qualification">
										<option selected>--Select Qualification--</option>

										<option value="1">Diploma</option>
										<option value="2">Graduate</option>
										<option value="3">Post Graduate</option>
										<option value="4">Master</option>
										<option value="5">Phd</option>
										<option value="6">MBA</option>
										<option value="7">MSD</option>
									</select> <input type="hidden" name="status" value="1" />
								</div>
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-dark inputIN w-25 mt-2">ADD</button>
							</div>
						</form>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary inputIN"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- model end -->
		<div class="details">
			<div class="recent_project">
				<div class="card_header">
					<h2>Employee</h2>
				</div>
				<!-- table -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#ID</th>
							<th scope="col">Name</th>
							<th scope="col">Age</th>
							<th scope="col">Salary</th>
							<th scope="col">Dipartment</th>
							<th scope="col">Qualification</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>

						<%
						ResultSet rs = stmt.executeQuery(
								"SELECT emplyee_data.id, emplyee_data.e_name,emplyee_data.e_age,emplyee_data.e_salary,qualification.e_qualification,department.d_name,state.e_state"
								+ " FROM employee.emplyee_data, employee.department,employee.qualification,state"
								+ " where emplyee_data.q_id=qualification.q_id and emplyee_data.d_id=department.d_id and emplyee_data.e_status=state.idstatus;	");

						while (rs.next()) {
						%>
						<tr>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getInt("id")%>" name="id"></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getString("e_name")%>" name="name"></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getInt("e_age")%>" name="age"></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getDouble("e_salary")%>" name="sakary"></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getString("e_qualification")%>" name=""></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getString("d_name")%>" name=""></td>
							<td><input type="text"
								class="form-control inputIN form-controlIN"
								value="<%=rs.getString("e_state")%>" name=""></td>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<!-- table end -->
			</div>
			<div class="recent_customers">
				<div class="card_header">
					<h4>Check ID and Update</h4>
				</div>
				<div class="text-center d-flex justify-content-center">
					<div class="">
						<form action="Check" method="post">
							<div class="">
								<div class="p-3">
									<div class="w-100">
										<input type="text" name="id" id="" class="form-control mb-3"
											placeholder="Employee id">
									</div>
									<input type="submit" value="check"
										class="btn btn-dark inputIN w-25 me-2">
								</div>
							</div>
							<h6 class="text-success" id="pass"><%=request.getAttribute("pass")%></h6>
							<h6 class="text-danger" id="fail"><%=request.getAttribute("fail")%></h6>

						</form>
					</div>
				</div>
			</div>
		</div>

		<section class="search w-100 overflow-auto">


			<section class="search mt-3 container">
				<form class="d-flex" role="search" action="">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" name="srch">
					<button class="btn btn-outline-success" type="submit">Search</button>


					<%
					String s = request.getParameter("srch");
					ResultSet searchrs = stmt.executeQuery(
							"SELECT emplyee_data.id,e_name,e_age,e_salary,d_name,e_qualification FROM emplyee_data,qualification,department WHERE "
							+ "emplyee_data.d_id=department.d_id and emplyee_data.q_id=qualification.q_id "
							+ "and e_name like '%"+s+"%';");
					
					System.out.print("Hemant");
				
					%>
				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#ID</th>
							<th scope="col">Name</th>
							<th scope="col">Age</th>
							<th scope="col">Salary</th>
							<!-- <th scope="col">Photo</th>
                        <th scope="col">Aadhaar no</th>
                        <th scope="col">Pan no</th> -->
							<th scope="col">Department</th>
							<th scope="col">Qualification</th>
						
						</tr>
					</thead>
					<tbody>
					<% 
						while(searchrs.next()){
							
						
					%>
						<tr>
							<th scope="row"><%=searchrs.getInt(1) %></th>
							<td><%=searchrs.getString(2) %></td>
							<td><%=searchrs.getInt(3) %></td>
							<td><%=searchrs.getDouble(4) %></td>
							<td><%=searchrs.getString(5) %></td>
							<td><%=searchrs.getString(6) %></td>
						</tr>
						<%
						}
						%>
				</table>
			</section>
		</section>


	</section>

	<!-- end page  -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script>
	
	
		const pass = document.getElementById("pass").textContent;
		const fail = document.getElementById("fail").textContent;
		const updateBTN = document.getElementById("updateBTN");
		
		

        let sidebar = document.querySelector(".sidebar");
        let closeBtn = document.querySelector("#btn");
    

        // menu BTN
        closeBtn.addEventListener("click", () => {
          sidebar.classList.toggle("open");
          // call function
          changeBtn();
        });
    
        function changeBtn() {
          if(sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
          } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
          }
        }

		
        // update BTN
		if ("You can use this ID" === pass) {
			updateBTN.style.visibility = "visible";
		} else if ("ID not Exist!!" === fail) {
			updateBTN.style.visibility = "hidden";
		}
		
		 if(pass==="null"){
	            pass.style.visibility = "hidden";
	      }
	     if(fail==="null"){
	            pass.style.visibility = "hidden";
	        }
	</script>
</body>

</html>