<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
    String rollno = request.getParameter("rollno");
    String s1 = request.getParameter("s1");
    String s2 = request.getParameter("s2");
    String s3 = request.getParameter("s3");
    String s4 = request.getParameter("s4");
    String s5 = request.getParameter("s5");
    String s6 = request.getParameter("s6");
    String s7 = request.getParameter("s7");

    try (Connection con = ConnectionProvider.getCon()) {

        // 🔹 Check if result already exists for this rollno
        PreparedStatement check = con.prepareStatement("SELECT * FROM result WHERE rollno=?");
        check.setString(1, rollno);
        ResultSet rs = check.executeQuery();

        if (rs.next()) {
            out.println("<script>alert('⚠️ Result already exists for Roll No: " + rollno + "'); window.history.back();</script>");
        } else {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO result (rollno, s1, s2, s3, s4, s5, s6, s7) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, rollno);
            ps.setString(2, s1);
            ps.setString(3, s2);
            ps.setString(4, s3);
            ps.setString(5, s4);
            ps.setString(6, s5);
            ps.setString(7, s6);
            ps.setString(8, s7);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('✅ Result inserted successfully...'); window.location='adminHome.jsp';</script>");
            } else {
                out.println("<script>alert('❌ Failed to insert result!'); window.history.back();</script>");
            }

            ps.close();
        }

        rs.close();
        check.close();

    } catch (Exception e) {
        out.println("<script>alert('⚠️ Error adding result: " + e.getMessage() + "'); window.history.back();</script>");
    }
%>
