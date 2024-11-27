<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YYH.GG</title>

</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<%
            // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
                if(userID == null)
                {
            %>
 	<nav class="navbar navbar-light bg-primary bg-gradient">
  <div class="container-fluid">
    <a class="navbar-brand text-white fw-bolder" href="main.jsp">YYH.GG</a>
    <a class="navbar-brand text-white active" href="main.jsp">홈</a>
    <a class="navbar-brand text-white" href="bbs.jsp">커뮤니티</a>
    <form class="d-flex" action="result.jsp" method="GET">
      <input class="form-control me-2" type="search" placeholder="아이디를 입력하시오." aria-label="Search">
      <button class="btn btn-outline-success" type="submit">select</button>
    </form>
	<a class="navbar-brand text-white" href="login.jsp">로그인</a>
  </div>
</nav>

<%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
            <nav class="navbar navbar-light bg-primary bg-gradient">
  <div class="container-fluid">
    <a class="navbar-brand text-white fw-bolder" href="main.jsp">YYH.GG</a>
    <a class="navbar-brand text-white active" href="main.jsp">홈</a>
    <a class="navbar-brand text-white" href="bbs.jsp">커뮤니티</a>
    <form class="d-flex" action="result.jsp" method="GET">
      <input class="form-control me-2" type="search" placeholder="아이디를 입력하시오." aria-label="Search">
      <button class="btn btn-outline-success" type="submit">select</button>
    </form>
    <a class="navbar-brand text-white" href="logoutAction.jsp">로그아웃</a>
  </div>
</nav>
            <%
                }
            %>
</body>
</html>