<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int vno = Integer.parseInt(request.getParameter("vno"));
	
	int result = VowDAO.delete(vno);

	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>