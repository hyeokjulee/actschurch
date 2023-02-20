<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>

<%@page import="jdbc.docDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<script>
window.onload = function() {
 	var dno = <%=request.getParameter("dno")%>;
 	var sid = <%=sid%>
 	var admin = <%=admin%>
 	var email
  	function searchFunction(dno) {
 		
 		$.ajax({
 			type:'post',
 			url:'docViewProc.jsp',
 			data : {dno:dno},
			dataType:"text",
 			success:function(data){
 				var doc = JSON.parse(data.trim());
 				var title = "<h1>" + doc.dtitle + "</h1>";
				$("#title").html(title);
				$("#content").html(doc.dcontent);
				email = doc.email
 				} 
 			})
 		}
 	
  	function delItem(dno) {
 		$.ajax({
 			type:"post",
 			url: "docDel.jsp",
 			data : {dno:dno},
 			dataType:"text",
 			
 			success:function(data) {
				popModalRedirect("삭제", "삭제에 성공하셨습니다", "doctrine.jsp")

 			}
 		});
 	}

 		searchFunction(dno);
		if (sid==admin||sid==email) {
			$('.ad').show()
		} else {}
		$('.ad').hide()
 	}

	
	
 </script>
<div style="height: 100px;">
</div>

<div id="title"></div>
<hr>
<div name="content" id="content" class="mtop-10"></div>
<input type="button" value="이전으로" onclick="history.back()">

<input type="button" value="수정" onclick="location.href='docMod.jsp?dno=<%=request.getParameter("dno") %>'" class="ad">
<button type="button" class="ad" onclick="delItem(dno)">삭제</button>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>