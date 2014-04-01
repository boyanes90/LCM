package grailsproject

class Location {
	
	String name
	String address
	
	static belongsTo = [company:Company]

    static constraints = {
    }
	
	String toString() {
		"$name"
	}
}

