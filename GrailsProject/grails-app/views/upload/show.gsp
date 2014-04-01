<!DOCTYPE html>
<html>
<%@page import="grailsproject.*" %>
	<head>

		<title>Upload page</title>
		<meta name="layout" content="main">
	</head>
	<body>
	<br /><p>&nbsp&nbspHere you can upload your PDF files<p>

     	<br /><g:uploadForm action="upload">
        &nbsp&nbsp<input type="file" name="fname" /> 
        
        <br /><br />&nbsp&nbsp<g:select name="location" from="${Location.list()}"/> Location
         <br /><br />&nbsp&nbsp<input type="text" name="name" /> Report name
         <g:if test="${flash.message}">
			<div class="errors">${flash.message}</div>
			</g:if>
        <br /><br />&nbsp&nbsp<input type="submit" />
             
    </g:uploadForm>
    
    
	</body>
</html>