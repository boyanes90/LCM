package grailsproject

import grails.plugins.springsecurity.Secured
import org.springframework.web.multipart.MultipartFile
import groovy.time.TimeCategory

class UploadController {
	def springSecurityService
	
	@Secured(['ROLE_ADMIN'])
	def index() {
		render (view:"show")
	}
	
	@Secured(['ROLE_ADMIN'])
	def upload() {
		def f = request.getFile('fname')
		if (f.empty) {
			flash.message = 'File cannot be empty'
			render(view: 'show')
			return
		}
		
		if (params.name.empty) {
			flash.message = 'Report name cannot be empty'
			render(view: 'show')
			return
		}
		
		if (params.location == null) {
			flash.message = 'Location cannot be empty'
			render(view: 'show')
			return
		}
		
		params.filename = 'Report ' + params.name
		
		f.transferTo(new File('./web-app/images/Reports/' + params.filename + '.pdf'))	

		params.location = Location.find {name == params.location}
		params.publicationDate = new Date()
		def reportToSave = new Report(params)
		reportToSave.save(flush:true, failOnError:true)
		redirect(action: "list", params:params)
	 }
	
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def downloadFile (String id) {
				
		def file = new File('./web-app/images/Reports/' + id + '.pdf')
		def fileName = id + '.pdf'
		
		if(file.exists()){
			
			response.setContentType("application/octet-stream")
			response.setHeader("Content-Disposition", "attachment; filename=\"${fileName}\"")
			response.setHeader("Content-Length", "${file.size()}")
			response.outputStream << file.newInputStream()
					
		}
	}
	
	
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		
		def now = new Date()
		def yearFromNow
		use (TimeCategory){
		yearFromNow = now - 1.year
		}
		
		def principal = springSecurityService.principal
		
		String uname = principal.username
		
		def us = User.find {username==uname}
		
		def loc = Location.findAll{company==us.company}
		
		def mostrar = []
		
		for (i in loc) {
			
			mostrar += Report.findAll{(location==i) && (publicationDate > yearFromNow) && (publicationDate < now)}
		}
		
		if (mostrar.empty) {
			flash.message = 'Sorry but there are no currently available reports'
		
		} else {
		
		mostrar.sort{mostrar.groupBy{it.location}.publicationDate}.reverse(true)
		}
						
		[reportInstanceList: mostrar, reportInstanceTotal: mostrar.size()]
		
		
				
	}
	
	@Secured(['ROLE_ADMIN'])
	def show() {
		render (view:"show")
	}
	
}
