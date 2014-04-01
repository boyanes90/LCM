<%@ page import="grailsproject.Report" %>



<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'filename', 'error')} ">
	<label for="filename">
		<g:message code="report.filename.label" default="Filename" />
		
	</label>
	<g:textField name="filename" value="${reportInstance?.filename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="report.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${grailsproject.Location.list()}" optionKey="id" required="" value="${reportInstance?.location?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="report.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${reportInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'publicationDate', 'error')} required">
	<label for="publicationDate">
		<g:message code="report.publicationDate.label" default="Publication Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publicationDate" precision="day"  value="${reportInstance?.publicationDate}"  />
</div>

