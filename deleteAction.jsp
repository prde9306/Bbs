<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import ="bbs.bbsDAO" %>
<%@ page import ="bbs.Bbs" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
  
   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content = "text/html; charset=utf-8">
<title>JSP 게시판 웹 사이트 </title>
</head>
<body>
 
<%
 
 String userID = null;
 if (session.getAttribute("userID") != null){
	 userID = (String) session.getAttribute("userID");
 }
 if (userID == null){
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('로그인을 하세요')");
	    	script.println("location.href = 'login.jsp'");
	    	script.println("</script>");	 
 } 
 int bbsID = 0;
 if (request.getParameter("bbsID")!=null) {
 	   bbsID= Integer.parseInt(request.getParameter("bbsID")); 
 }
 if(bbsID ==0) {
 	 PrintWriter script = response.getWriter();
 	script.println("<script>");
 	script.println("alert('유효하지 않은 글입니다.')");
 	script.println("location.href = 'bbs.jsp'");
 	script.println("</script>");
 }
 Bbs bbs = new bbsDAO().getBbs(bbsID);
 if(!userID.equals(bbs.getUserID())){
 	   PrintWriter script = response.getWriter();
 	   	script.println("<script>");
 	   	script.println("alert('권한이 없습니다.')");
 	   	script.println("location.href = 'bbs.jsp'");
 	   	script.println("</script>");
 } else { 
 
    	bbsDAO BbsDAO = new bbsDAO();
        int result = BbsDAO.delete(bbsID);
        if(result== -1){ //여기 계속 글 삭제 실패 
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('글 삭제에 실패했습니다.')");
        	script.println("history.back()");
        	script.println("</script>");	
        }
        else {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("location.href = 'bbs.jsp'");
        	script.println("</script>");
        }
    }
 
    	
%>
</body>
</html>