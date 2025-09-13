<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
    String course = request.getParameter("course");
    String branch = request.getParameter("branch");
    String rollno = request.getParameter("rollno");
    String name = request.getParameter("name");
    String fatherName = request.getParameter("fatherName");
    String gender = request.getParameter("gender");

    try (Connection con = ConnectionProvider.getCon();
         PreparedStatement ps = con.prepareStatement(
            "INSERT INTO student (course, branch, rollno, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)"
         )) {

        ps.setString(1, course);
        ps.setString(2, branch);
        ps.setString(3, rollno);
        ps.setString(4, name);
        ps.setString(5, fatherName);
        ps.setString(6, gender);

        int rowsInserted = ps.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<script>alert('✅ Student Inserted Successfully..'); window.location='adminHome.jsp';</script>");
        } else {
            out.println("<script>alert('❌ Failed to Insert Student!..'); window.history.back();</script>");
        }

    } catch (Exception e) {
        out.println("<script>alert('⚠️ Error while adding student: " + e.getMessage() + "'); window.history.back();</script>");
    }
%>
