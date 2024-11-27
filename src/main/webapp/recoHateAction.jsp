<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="reco.Reco" %>
<%@ page import="reco.RecoDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YYH.GG</title>
</head>
<body>
    <%
    	String bbsID= request.getParameter("bbsID");
    	String userID = request.getParameter("userID");
    	
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        RecoDAO recoDAO = new RecoDAO();
        int Cresult = recoDAO.check(bbsID);
        if (Cresult == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'bbs.jsp'");
            script.println("alert('계정당 한번만 비추천이 가능합니다.')");
            script.println("</script>");
        }else{
        int result = recoDAO.hate(bbsID, userID);
        if (result >= 0){

            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'bbs.jsp'");
            script.println("alert('비추천을 눌렀습니다.')");
            script.println("</script>");
        } 
        else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('오류가 발생했습니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        }

    %>
 
</body>
</html>