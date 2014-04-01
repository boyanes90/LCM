package grailsproject

class Report {
	
	String name
	Date publicationDate
	String filename
	
	static belongsTo = [location:Location]

    static constraints = {
    }
}
