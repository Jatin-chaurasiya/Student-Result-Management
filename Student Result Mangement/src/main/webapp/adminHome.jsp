<%@include file="header.html"%>
<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>

<!DOCTYPE html>
<html>
<head>
<title>ABES ENGINEERING COLLEGE</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<img src="logo.png" align="left" width="100" height="100">
<center>
    <h3>ABES ENGINEERING COLLEGE </h3>
    <img src="apj sir.png" align="right" width="100" height="100">
</center>

<div class="w3-container">
  <div class="w3-bar w3-black">
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Student</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">Insert New Result</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Registered Students</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">All Student Result</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'AdminTab')">Add Admin</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'RemoveAdminTab')">Remove Admin</button>
    <a href="adminLogin.html" class="w3-bar-item w3-button tablink">Logout</a>
  </div>
  
  <!-- Add New Student -->
  <div id="London" class="w3-container w3-border city">
    <br>
    <main class="my-form">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">Add New Students</div>
              <div class="card-body">
                <form name="my-form" action="addNewStudent.jsp" method="post">
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Course Name</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="course">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Branch Name</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="branch">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Roll Number</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="rollno">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Name</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="name">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Father Name</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="fatherName">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Gender</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="gender">
                    </div>
                  </div>
                  <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">Save</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
  <!-- Add new Admin -->
<div id="AdminTab" class="w3-container w3-border city" style="display:none; margin-bottom: 50px;">
    <br>
    <main class="my-form">
        <div class="container" style="margin-bottom: 30px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add New Admin</div>
                        <div class="card-body">
                            <form action="saveAdmin.jsp" method="post">
                                <div class="form-group row" style="margin-bottom: 15px;">
                                    <label class="col-md-4 col-form-label text-md-right">Admin Email</label>
                                    <div class="col-md-6">
                                        <input type="email" class="form-control" name="username" placeholder="Enter the email" required>
                                    </div>
                                </div>

                                <div class="form-group row" style="margin-bottom: 15px;">
                                    <label class="col-md-4 col-form-label text-md-right" typeholder="Enter the password">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" class="form-control" name="password" placeholder="Enter the password" required>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4" style="margin-top: 10px;">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<!-- Remove Admin -->
<div id="RemoveAdminTab" class="w3-container w3-border city" style="display:none; margin-bottom: 50px;">
    <br>
    <main class="my-form">
        <div class="container" style="margin-bottom: 30px;">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header bg-danger text-white">Remove Admin</div>
                        <div class="card-body">
                            <form action="deleteAdmin.jsp" method="post">
                                <div class="form-group row" style="margin-bottom: 15px;">
                                    <label class="col-md-4 col-form-label text-md-right">Admin Email</label>
                                    <div class="col-md-6">
                                        <input type="email" class="form-control" name="username" placeholder="Enter admin email to remove" required>
                                    </div>
                                </div>

                                <div class="form-group row" style="margin-bottom: 15px;">
                                    <label class="col-md-4 col-form-label text-md-right">Confirm Password (Super Admin)</label>
                                    <div class="col-md-6">
                                        <input type="password" class="form-control" name="adminPassword" placeholder="Enter your password" required>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4" style="margin-top: 10px;">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                    <a href="adminHome.jsp" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

  <!-- Insert New Result -->
  <div id="Paris" class="w3-container w3-border city" style="display:none">
    <br>
    <main class="my-form">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">Insert New Result</div>
              <div class="card-body">
                <form name="my-form" action="insertNewResult.jsp" method="post">
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Roll Number</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="rollno">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Engg. Physics-I</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s1">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Engg. Chemistry</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s2">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Engg. Mathematics-I</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s3">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Basic Electrical Engg</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s4">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Electronic Engg.</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s5">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Engg. Chemistry Lab</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s6">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-md-4 col-form-label text-md-right">Engg. Physics Lab</label>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="s7">
                    </div>
                  </div>
                  <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">Save</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>

  <!-- Registered Students -->
  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
    <section>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <th>Course Name</th>
              <th>Branch Name</th>
              <th>Roll Number</th>
              <th>Name</th>
              <th>Father Name</th>
              <th>Gender</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
          <tbody>
          <%
            try (Connection con = ConnectionProvider.getCon();
                 PreparedStatement ps = con.prepareStatement("SELECT * FROM student");
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
          %>
            <tr>
              <td><%=rs.getString("course")%></td>
              <td><%=rs.getString("branch")%></td>
              <td><%=rs.getString("rollno")%></td>
              <td><%=rs.getString("name")%></td>
              <td><%=rs.getString("fatherName")%></td>
              <td><%=rs.getString("gender")%></td>
            </tr>
          <%
                }
            } catch (Exception e) {
                out.println("⚠️ Error fetching data: " + e.getMessage());
            }
          %>
          </tbody>
        </table>
      </div>
    </section>
  </div>

   <!-- All Student Result (Only Marks) -->
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
  <section>
    <div class="tbl-header">
      <table cellpadding="0" cellspacing="0" border="0">
        <thead>
          <tr>
            <th>Roll Number</th>
            <th>Engg. Physics-I</th>
            <th>Engg. Chemistry</th>
            <th>Engg. Mathematics-I</th>
            <th>Basic Electrical Engg</th>
            <th>Electronic Engg.</th>
            <th>Engg. Chemistry Lab</th>
            <th>Engg. Physics Lab</th>
          </tr>
        </thead>
      </table>
    </div>
    <div class="tbl-content">
      <table cellpadding="0" cellspacing="0" border="0">
        <tbody>
        <%
          try (Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("SELECT * FROM result")) {
              while (rs.next()) {
        %>
          <tr>
            <td><%= rs.getString("rollno") %></td>
            <td><%= rs.getString("s1") %></td>
            <td><%= rs.getString("s2") %></td>
            <td><%= rs.getString("s3") %></td>
            <td><%= rs.getString("s4") %></td>
            <td><%= rs.getString("s5") %></td>
            <td><%= rs.getString("s6") %></td>
            <td><%= rs.getString("s7") %></td>
          </tr>
        <%
              }
          } catch (Exception e) {
              out.println("⚠️ Error fetching result data: " + e.getMessage());
          }
        %>
        </tbody>
      </table>
    </div>
  </section>
</div>
   
   
</div>
<hr class="new1">
<center><h5>Note: Any errors occur then contact College Days. Designed & Developed by College Days Team</h5></center>
<hr class="new1">
<center><h5>All Right Reserved @ College Days :: 2002-2025</h5></center>
<hr class="new1">

</body>
</html>
