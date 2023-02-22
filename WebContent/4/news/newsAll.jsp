<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>교회 소식</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>

				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted">
							<select class="form-select form-select-sm w-50 d-inline"
								id="selectAmount">
								<option value="8" selected>8</option>
								<option value="16">16</option>
								<option value="24">24</option>
							</select> <span class="d-inline">개씩 보기</span>
						</div>
						<div class="col-9 text-end">
					<% if (sid != null) { // 세션 처리 %>
							<a href="insertForm.jsp" class="btn btn-sm btn-outline-success">게시물
								등록 </a>
						<%} %>
						</div>
					</div>
					<hr class="my-4">

					<table class="table table-hover shadow bg-body rounded">
						<thead>
							<tr style="background-color: #548687; color: white;">
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody id="imgList">


						</tbody>
					</table>
					<hr class="my-4">
					<div class="row">
						<div class="col-8">
							<ul class="pagination justify-content-center" id="pagination">

							</ul>
						</div>
						<div class="col-4">
							<div class="d-flex text-end">
								<select class="form-select" id="selectType">
									<option value="T" selected>제목</option>
									<option value="C">내용</option>
									<option value="TC">제목/내용</option>
								</select> <input class="form-control form-control-sm" type="search"
									placeholder="검색어" id="keyword">
								<button class="btn btn-sm btn-outline-success" type="button"
									id="searchBtn">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/include/footer.jsp"%>

	<script src="/resources/js/page.js"></script>

	<script>
		function getUserName(a) {
			$.ajax({
				type : 'post',
				url : '/user/userInfoProc.jsp',
				data : {
					email : a
				},
				dataType : "text",
				async : false,
				success : function(data) {
					var user = JSON.parse(data.trim());
					name = user.name
				}
			});
			return name
		}
		/*
		 [form id 이걸로 하셈]

		 검색 버튼 : searchBtn
		 검색 입력 인풋 : keyword
		 검색 선택 셀렉트 : selectType
		 게시글 표시 갯수 셀렉트 : selectAmount
		 */

		/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getTotalCountUrl() {
			return '/4/news/totalNumProc.jsp'
		}
		/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getListUrl() {
			return '/4/news/newsListProc.jsp'
		}

		function printList(data) {
			//TODO: 리스트 출력 처리 하세요
			var imgHTML = '';
			for (var i = 0; i < data.length; i++) {
				var name = getUserName(data[i].email)
				var date = getDate(data[i].ndate)
				imgHTML += ''
						+ "<tr onclick=\"location.href='newsDetail.jsp?nno="
						+ data[i].nno + "'\"><td>" + data[i].ntitle + "</td>"
						+ '<td>' + name + "</td>" + '<td>'
						+ date + "</td></a></tr>"
			}
			$('#imgList').html(imgHTML);
		}
		
		$(function(){
			   const urlParams = new URL(location.href).searchParams;
			   const msg = urlParams.get('msg');

			   if (msg == "deleteSuccess") {
			      popModal("삭제 성공", "삭제에 성공하였습니다.")
			   } else if (msg == "fail") {
			      popModal("오류 발생", "오류가 발생하였습니다. 다시 시도해주세요.")
			   }
			});
			
		function getDate(input) {
			date = new Date(input)
			today = new Date()
			timegap = today - date
			if(timegap>1000*60*60*24){
				// 년월일
				return date.toISOString().split('T')[0]
			} else {
				if(today.getDate()==date.getDate()){
				// 시 분
					if(date.getHours()<12){
						if (date.getHours()<10){
							if(date.getMinutes()<10){
								return 'AM '+'0'+date.getHours()+' : 0'+date.getMinutes()
							} else {
								return 'AM '+'0'+date.getHours()+' : '+date.getMinutes()
							}
						} else {
							if(date.getMinutes()<10){
								return 'AM '+date.getHours()+' : 0'+date.getMinutes()
							} else {
								return 'AM '+date.getHours()+' : '+date.getMinutes()
							}
						}
					} else if (date.getHours()==12){
						if(date.getMinutes()<10){
							return 'PM '+date.getHours()+' : 0'+date.getMinutes()
						} else {
							return 'PM '+date.getHours()+' : '+date.getMinutes()
						}
					} else {
						if (date.getHours()<22){
							if(date.getMinutes()<10){
								return 'PM '+'0'+(date.getHours()-12)+' : 0'+date.getMinutes()
							} else {
								return 'PM '+'0'+(date.getHours()-12)+' : '+date.getMinutes()	
							}
						} else {
							if(date.getMinutes()<10){
								return 'PM '+(date.getHours()-12)+' : 0'+date.getMinutes()
							} else {
								return 'PM '+(date.getHours()-12)+' : '+date.getMinutes()
							}
						}
					}
				} else {
					// 년월일
					return date.toISOString().split('T')[0]
				}
			}
		}
	</script>

</body>
</html>