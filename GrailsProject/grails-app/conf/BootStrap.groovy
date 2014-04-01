import grailsproject.*

class BootStrap {

	def init = { servletContext ->
		
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		
		def company1 = new Company(name: 'LCM').save(flush: true)
		def company2 = new Company(name: 'testCompany').save(flush: true)
		
		def admin = new User(username: 'admin', password:'1234', company:company1, enabled:true).save(flush: true)
		def sampleUser = new User(username:'sampleUser', password:'5678', company:company2, enabled:true).save(flush: true)
		
		UserRole.create admin, adminRole, true
		UserRole.create sampleUser, userRole, true
				
	}
	def destroy = {
	}
}
