<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content = "text/html; charset=utf-8">
<title>JSP 게시판 웹 사이트 </title>
</head>
<body>
 <% 
   session.invalidate();
    
 %>
  <script>
   location.href = 'main.jsp';
   
  </script>
   
</body>
</html>