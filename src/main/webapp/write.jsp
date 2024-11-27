<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="row">
        <form method="post" action="writeAction.jsp" >
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color:#eeeeee; text-align:center;">새로운 글</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목"  name="bbsTitle" maxlength="50" ></td>
                    </tr>
                    <tr>
                    <td><textarea class="form-control" placeholder="글 내용"  name="bbsContent" maxlength="2048" style="height:350px" ></textarea></td>
                    </tr>
                    
                </tbody>
            </table>
                <input type="submit"  class="btn btn-primary pull-right" value="글쓰기">
            </form>
        </div>
    </div>
    
</body>
</html>
