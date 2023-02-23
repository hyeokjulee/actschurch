<!-- 예배추가(썸머노트) - 혁주-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>

<%
sid = "a";
if(sid == null) { // 보안 처리
		response.sendRedirect("wSelectAll.jsp");
		return;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>예배 설교 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>
	<form action="wInsertCheck.jsp" method="post">
		
		<div class="input-group mb-2 input-group-lg">
				<span class="input-group-text col-2 mx-auto" >제목</span> 
				<input type="text" class="form-control col-11" placeholder="제목을 입력하세요" id="wtitle" name="wtitle" required>
			</div>
		<div class="input-group mb-3 input-group-lg">
				<span class="input-group-text col-2" >설교자</span> 
				<input type="text" class="form-control col-11" id="wname" name="wname" placeholder="설교자를 입력하세요">
			</div>
			<div>
				<textarea name="wcontent" id="summernote" class="mtop-10"></textarea>
			</div>
			
			<div class="d-flex justify-content-end my-4">
				<button class="btn btn-outline-primary mx-2" type="submit">등록</button>
				<input type="button" value="취소" onclick="history.back()"
					class="btn btn-outline-secondary mx-2">
			</div>
	</form>
	</div></div></div></div>
<%@ include file="/include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript">
		$('#summernote').summernote({
		    tabsize: 2,
		    height: 500,
		    toolbar: [
		      ['style', ['style']],
		      ['font', ['bold', 'underline', 'clear']],
		      ['color', ['color']],
		      ['para', ['ul', 'ol', 'paragraph']],
		      ['table', ['table']],
		      ['insert', ['link', 'picture', 'video']],
		      ['view', ['fullscreen', 'codeview', 'help']]
<<<<<<< Updated upstream
		    ]
=======
		    ],
		    placeholder:"내용을 입력해주세요"
>>>>>>> Stashed changes
		  });
	</script>
</body>
</html>