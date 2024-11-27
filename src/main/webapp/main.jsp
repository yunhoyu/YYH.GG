<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YYH.GG</title>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<br>
<div class="text-center" >
<img id="main_Picture" src="media/main_picture.png">
</div>

<div class="d-flex justify-content-end">
  <div class="container-fluid">
    <form class="d-flex px-5" action="result.jsp" method="GET">
       <input class="form-control me-2" type="search" placeholder="아이디를 입력하시오." aria-label="Search" name="user">
      <button class="btn btn-outline-success" type="submit">select</button>
    </form>
  </div>
</div>
<br>
<br>
<div class="row ">

	<div class="col d-flex justify-content-center">
	
	<table class="table mx-5" style="text-align:center; border:1px solid #dddddd">
                <thead>
                </thead>
                <tbody>
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<Bbs> list = bbsDAO.POPgetList(1);
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
	</div>
	<div class="col d-flex justify-content-center">

	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>