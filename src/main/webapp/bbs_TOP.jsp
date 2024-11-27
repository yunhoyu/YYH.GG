<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>YYG.GG</title>
<style type = "text/css">
	#a_1,a_1:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>

    <div class="container">
        <div class="row">
        <nav class="navbar navbar-light ">
         <a class="btn btn-success btn-arrow-left btn-light" onclick="location.href = 'bbs_POP.jsp'">인기</a>
         <a class="btn btn-success btn-arrow-left btn-light" onclick="location.href = 'bbs.jsp'">최신</a>
         <a class="btn btn-success btn-arrow-left btn-light" onclick="location.href = 'bbs_TOP.jsp'">TOP</a>
         <form class="d-flex mx-3 " action="result.jsp" method="GET">
	     <input class="form-control me-2" type="search" placeholder="내용을 검색하시오" aria-label="Search">
	     <button class="btn btn-outline-success" type="submit">select</button>
	     </form>
	     <a href="write.jsp " class="btn btn-primary pull-right">글쓰기</a>

	     </nav>
            <table class="table " style="text-align:center; border:1px solid #dddddd">
                <thead>
                </thead>
                <tbody>
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<Bbs> list = bbsDAO.TOPgetList(pageNumber);
                    for(int i = 0; i < list.size(); i++)
                    {
                %>
                
                    <tr>
                      <td><%=list.get(i).getBbsID() %></td> <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                      <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>" id="a_1"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>
                      <td><%=list.get(i).getUserID()%>
                      <td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13) + "시"%> 
                  	</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div class="text-center">
            <%
                if(pageNumber != 1) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left btn-light">이전</a>
            <%
                } if (bbsDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left btn-light">다음</a>
            <%
                }
            %>
			</div>
			</div>	
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>