<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/header.jsp"%>   
<%
request.setCharacterEncoding("utf-8");

<<<<<<< Updated upstream
=======
if (sid == null) {
	response.sendRedirect("newsAll.jsp");
	return;
}

>>>>>>> Stashed changes
int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.deleteNews(nno);

if (result){%>
<script>
window.onload = function(){ popModal2("교회 소식 삭제", "삭제를 성공하셨습니다", "/4/news/newsAll.jsp")}
</script>
<%} else {%>
<script>
window.onload =  function(){popModal2("교회 소식 삭제", "삭제를 실패하셨습니다", "/4/news/newsAll.jsp")}
</script>
<%}%>

<%@ include file="/include/footer.jsp"%>   