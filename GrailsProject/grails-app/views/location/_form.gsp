<%@ page import="grailsproject.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="location.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${locationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="location.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${grailsproject.Company.list()}" optionKey="id" required="" value="${locationInstance?.company?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${locationInstance?.name}"/>
</div>

