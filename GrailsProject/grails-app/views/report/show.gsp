
<%@ page import="grailsproject.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-report" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list report">
			
				<g:if test="${reportInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="report.filename.label" default="Filename" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${reportInstance}" field="filename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="report.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${reportInstance?.location?.id}">${reportInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="report.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${reportInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.publicationDate}">
				<li class="fieldcontain">
					<span id="publicationDate-label" class="property-label"><g:message code="report.publicationDate.label" default="Publication Date" /></span>
					
						<span class="property-value" aria-labelledby="publicationDate-label"><g:formatDate date="${reportInstance?.publicationDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportInstance?.id}" />
					<g:link class="edit" action="edit" id="${reportInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
