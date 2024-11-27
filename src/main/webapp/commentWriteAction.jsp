<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<jsp:useBean id="comment" class="comment.Comment" scope="page"/>
<jsp:setProperty name="comment" property="commentText" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YYH.GG</title>
</head>
<body>
    <%
        String userID = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        
        if(userID == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else {
        if(comment.getCommentText() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            CommentDAO commentDAO = new CommentDAO();
            int result = commentDAO.write(comment.getCommentText(), (String)userID);
                if(result == -1){ // 글쓰기에 실패했을 경우
                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else { // 글쓰기에 성공했을 경우
                    PrintWriter script = response.getWriter();                    
                    script.println("<script>");
                    script.println("location.href= 'bbs.jsp'");
                    script.println("</script>");
                    }
            }
        }
    %>
</body>
</html> 