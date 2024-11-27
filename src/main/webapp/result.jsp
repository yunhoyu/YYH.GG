<%@page import="com.google.gson.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>소환사님의 전적</title>
</head>
<body>
<%

BufferedReader br = null;
String username = request.getParameter("user");
String key 		= "RGAPI-0ae4b0b1-ef41-45e2-bfd2-99939fab6a9e";
String SummonerRequestURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+ username + "?api_key=" + key;
	
URL url = new URL(SummonerRequestURL);
HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
urlconnection.setRequestMethod("GET");
br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
String result = "";
String line;
while((line = br.readLine()) != null) { 
	result = result + line;
} 
JsonParser jsonParser = new JsonParser();
JsonObject k = (JsonObject) jsonParser.parse(result);
int profileIconId = k.get("profileIconId").getAsInt();
String name = k.get("name").getAsString();
String puuid = k.get("puuid").getAsString();
long summonerLevel = k.get("summonerLevel").getAsLong();
long revisionDate = k.get("revisionDate").getAsLong();
String id = k.get("id").getAsString();
String accountId = k.get("accountId").getAsString();


%>

<jsp:include page="header.jsp"></jsp:include>

<p class="text-center"><%= name%>님의 정보</p>
<div class="container p-5 shadow-lg p-3 mb-5 bg-white rounded" >
		<div class="row h-100 justify-content-center align-items-center">
				<div class ="col-sm-4">
				</div>
				<div class ="col-sm-1"> </div>
				<div class ="col-sm-7" id="idLevel">
					<h3></h3>
					<p>IID. <%= profileIconId%></p>
					<p>Name. <%= name%></p>
					<p>PID. <%= puuid%></p>
					<p>Lv. <%= summonerLevel%></p>
					<p>Date. <%= revisionDate%></p>
					<p>ID. <%= id%></p>
					<p>AID. <%= accountId%></p>
				</div>
		</div>
	</div>	

</body>
</html>
