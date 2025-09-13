<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

   
    if (username != null) username = username.trim();
    if (password != null) password = password.trim();

    String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
    boolean isValidEmail = username != null && username.matches(emailRegex);

    if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
        out.println("<script>alert('❌ Username and Password cannot be empty!'); window.history.back();</script>");
    } else if (!isValidEmail) {
        out.println("<script>alert('❌ Invalid Email format!'); window.history.back();</script>");
    } else {
        try (Connection con = ConnectionProvider.getCon()) {
      
            PreparedStatement checkPs = con.prepareStatement("SELECT * FROM admin WHERE username=?");
            checkPs.setString(1, username);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('⚠️ This email is already registered as admin!'); window.history.back();</script>");
            } else {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO admin(username, password) VALUES (?, ?)"
                );
                ps.setString(1, username);
                ps.setString(2, password);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                   
                    out.println("<script>alert('✅ Admin added successfully! Username: " + username + "'); window.location='adminHome.jsp';</script>");
                } else {
                    out.println("<script>alert('❌ Failed to add admin!'); window.history.back();</script>");
                }
            }
        } catch (Exception e) {
            out.println("<script>alert('⚠️ Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
%>
