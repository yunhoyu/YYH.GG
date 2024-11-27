<%@page import="comment.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="reco.Reco" %>
<%@ page import="reco.RecoDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int bbsID = 0;
    if (request.getParameter("bbsID") != null)
    {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    Comment comment = new CommentDAO().getComment(bbsID);
    Reco reco = new RecoDAO().getReco(bbsID);
    RecoDAO recoDAO = new RecoDAO();
%>

<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="row">
            <table class="table " style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">전체 글 보기</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:20%;">글 제목</td>
                        <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "시" 
                                + bbs.getBbsDate().substring(14,16) + "분"  %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height:200px;">
                        <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                        <%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>    
                    </tr>
                    <tr>
                    <%
              		  if(userID != null && userID.equals(bbs.getUserID()))
               			 {
       			 	%>
                        <td>추천</td>
                        <td colspan="2" style="min-height:200px;">
                        <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                        <a type="button" class="btn btn-primary" href="recoLikeAction.jsp?bbsID=<%=bbsID%>&userID=<%=userID%>">추천:<%=reco.getLike_No()%></a>
                        <a type="button" class="btn btn-danger" href="recoHateAction.jsp?bbsID=<%=bbsID%>&userID=<%=userID%>">비추천:<%=reco.getHate_No()%></a>
                        </td>   
                        
                     <%} %> 
                    </tr>
                </tbody>
            </table>
            <div>

            <a href="bbs.jsp" class="btn float-right">목록</a>
			
            <%
                if(userID != null && userID.equals(bbs.getUserID()))
                {
            %>
          
                <a href="update.jsp?bbsID=<%=bbsID %>" class="btn float-right">수정</a>

                <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="delectAction.jsp?bbsID=<%=bbsID%>" class="btn float-right">삭제</a>
         
            <%     
                }
            %>
            </div>
            <hr>
            <div class="justify-content-center">댓글 목록</div>
            <div class="container">
	<div class="form-group">
		<form method="post" action="commentWriteAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"><%=userID %></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="댓글을 적으시오." name = "commentText"></td>
					<td><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col d-flex justify-content-center">
	
	<table class="table mx-5" style="text-align:center; border:1px solid #dddddd">
                <thead>
                </thead>
                <tbody>
                <%
                    CommentDAO commentDAO = new CommentDAO();
                    ArrayList<Comment> list = commentDAO.getList();
                    for(int i = 0; i < list.size(); i++)
                    {
                %>
                    <tr>
                      <td><%=list.get(i).getBbsID() %></td> <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                      <td><%=list.get(i).getUserID()%></td>
                      <td><%=list.get(i).getCommentText()%></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
	</div>
</div>
        </div>
    </div>
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
