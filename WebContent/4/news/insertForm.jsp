<%-- 최초작성자 : 김예건
최초작성일 : 2023/02/15
교회소식추가 제목, 내용(썸머노트사진), 수정, 삭제버튼
버전  기록 : 0.1(시작 23/02/15) --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("newsAll.jsp");
		return;
	}
%>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>교회 소식 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>

<form id="insertForm" action="insertProc.jsp" method="post">
	<input type="hidden" name="content" id="content">
	
	<div class="input-group mb-2 input-group-lg">
		<span class="input-group-text col-2 mx-auto">제목</span> 
		<input type="text" class="form-control col-11" placeholder="제목을 입력하세요" name="title" id="title">
	</div>
	
	<div>
		<textarea id="summernote" class="mtop-10"></textarea>
	</div>
	
	<div class="d-flex justify-content-end my-4">
		<button class="btn btn-outline-primary mx-2" onclick="addItem()">등록</button>
		<input type="button" value="취소" onclick="history.back()"
			class="btn btn-outline-secondary mx-2">
	</div>
</form>
</div></div></div></div>

<%@ include file="/include/footer.jsp" %>

<script>
$(function(){
const urlParams = new URL(location.href).searchParams;
const msg = urlParams.get('msg');
if (msg == "fail") {
	popModal("오류 발생", "오류가 발생하였습니다. 다시 시도해주세요.")
}
});

</script>

 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

  <script>
   $('#summernote').summernote({
	placeholder : '내용을 입력해주세요',
     tabsize: 2,
     height: 500,
     toolbar: [
       ['style', ['style']],
       ['font', ['bold', 'underline', 'clear']],
       ['color', ['color']],
       ['insert', ['link', 'picture']],
       ['view', ['fullscreen']]
     ]
   });
   
   function addItem() {
		 $("#content").val($("#summernote").summernote("code"));
		 $("#insertForm").submit();
   }
 </script>

</body>


</html>