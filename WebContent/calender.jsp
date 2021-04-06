<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>게시판 로그인</title>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID") != null){
			userID=(String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li class="active"><a href="callender.jsp">캘린더</a></li>
			</ul>
			<%
				 if(userID==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				 } else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul>
				</li>
			</ul>
			<%
				 }
			%>
			
		</div>
	</nav>
	<div class="container">
		  <%
			  java.util.Calendar cal=java.util.Calendar.getInstance(); //Calendar객체 cal생성
			  int currentYear=cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
			  int currentMonth=cal.get(java.util.Calendar.MONTH);
			  int currentDate=cal.get(java.util.Calendar.DATE);
			  String Year=request.getParameter("year"); //나타내고자 하는 날짜
			  String Month=request.getParameter("month");
			  int year, month;
			  if(Year == null && Month == null){ //처음 호출했을 때
			  year=currentYear;
			  month=currentMonth;
			  }
			  else { //나타내고자 하는 날짜를 숫자로 변환
			   year=Integer.parseInt(Year);
			   month=Integer.parseInt(Month);
			   if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
			   if(month>11) { month=0; year=year+1; }
			  }
		  %>

	  <table border=0>
	   <tr>
	    <td align=left width=200>
	    <a href="calender.jsp?year=<%out.print(year-1);%>&month=<%out.print(month);%>">◀</a>
	    <% out.print(year); %>년
	    <a href="calender.jsp?year=<%out.print(year+1);%>&month=<%out.print(month);%>">▶</a>
	    </td>
	    <td align=center width=300> <!-- 월 -->
	    <a href="calender.jsp?year=<%out.print(year);%>&month=<%out.print(month-1);%>">◀</a>
	    <% out.print(month+1); %>월
	    <a href="calender.jsp?year=<%out.print(year);%>&month=<%out.print(month+1);%>">▶</a>
	    </td>
	    <td align=right width=200><% out.print(currentYear + "-" + (currentMonth+1) + "-" + currentDate); %></td>
	   </tr>
	  </table>
	  <table border=1 cellspacing=0> <!-- 달력-->
	   <tr>
	    <td width=100>일</td>
	    <td width=100>월</td> 
	    <td width=100>화</td> 
	    <td width=100>수</td> 
	    <td width=100>목</td> 
	    <td width=100>금</td> 
	    <td width=100>토</td> 
	   </tr>
	   <tr height=30>
	   <%
	   cal.set(year, month, 1); 
	   int startDay=cal.get(java.util.Calendar.DAY_OF_WEEK);
	   int end=cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	   int br=0;
	   for(int i=0; i<(startDay-1); i++) {
	    out.println("<td>&nbsp;</td>");
	    br++;
	    if((br%7)==0) {
	     out.println("<br>");
	    }
	   }
	   for(int i=1; i<=end; i++) { //날짜출력
	    out.println("<td>" + i + "</td>");
	    br++;
	    if((br%7)==0 && i!=end) {
	     out.println("</tr><tr height=30>");
	    }
	   }
	   while((br++)%7!=0) //말일 빈칸출력
	    out.println("<td>&nbsp;</td>");
	   %>
	   </tr>
	  </table>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>