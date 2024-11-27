<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>YYH.GG</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="text-center" >
<img id="main_Picture" src="media/main_picture.png">
</div>
<div class="container position-absolute top-50 start-50 translate-middle">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="loginAction.jsp">
                    <h3 style="text-align:center;">로그인 화면</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                </form>
                YYH.GG가 처음이신가요? <a href="join.jsp">회원가입 하기</a>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>

    
</body>
</html>