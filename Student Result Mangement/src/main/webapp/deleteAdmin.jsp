<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
    String username = request.getParameter("username");
    String adminPassword = request.getParameter("adminPassword");

    if (username != null) username = username.trim();
    if (adminPassword != null) adminPassword = adminPassword.trim();

    try (Connection con = ConnectionProvider.getCon()) {

        
        PreparedStatement verifyPs = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
        verifyPs.setString(1, "amitk@mysoundx.com");   // change to your super admin username
        verifyPs.setString(2, adminPassword);
        ResultSet verifyRs = verifyPs.executeQuery();

        if (!verifyRs.next()) {
            out.println("<script>alert('❌ Invalid Super Admin password!'); window.history.back();</script>");
        } else {
         
            PreparedStatement checkPs = con.prepareStatement("SELECT * FROM admin WHERE username=?");
            checkPs.setString(1, username);
            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                out.println("<script>alert('⚠️ No admin found with this email!'); window.history.back();</script>");
            } else {
               
                if (username.equalsIgnoreCase("amitk@mysoundx.com")) {
                    out.println("<script>alert('⚠️ Super Admin cannot be removed!'); window.history.back();</script>");
                } else {
                    PreparedStatement ps = con.prepareStatement("DELETE FROM admin WHERE username=?");
                    ps.setString(1, username);
                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        out.println("<script>alert('✅ Admin removed successfully!'); window.location='adminHome.jsp';</script>");
                    } else {
                        out.println("<script>alert('❌ Failed to remove admin!'); window.history.back();</script>");
                    }
                }
            }
        }
    } catch (Exception e) {
        out.println("<script>alert('⚠️ Error: " + e.getMessage() + "'); window.history.back();</script>");
    }
%>
