<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%
    String username1 = request.getParameter("username").trim();
    String password1 = request.getParameter("password").trim();
    boolean isValid = false;

    try {
        // Check default admin
        if(username1.equalsIgnoreCase("jatinkumar638881@gmail.com") && password1.equals("Jatin@8953")) {
            isValid = true;
        } else {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE username=? AND password=?");
            ps.setString(1, username1);
            ps.setString(2, password1);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                isValid = true;
                out.println("✅ Login Success for: " + username1 + "<br>");
            } else {
                out.println("❌ No match found for username: " + username1 + " and password: " + password1 + "<br>");
            }

            rs.close();
            ps.close();
            con.close();
        }
    } catch(Exception e) {
        out.println("⚠️ Error: " + e.getMessage());
        e.printStackTrace();
    }

    if(isValid) {
        response.sendRedirect("adminHome.jsp");
    } else {
        response.sendRedirect("errorAdminLogin.html");
    }
%>
