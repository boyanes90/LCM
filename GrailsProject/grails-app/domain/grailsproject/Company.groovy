package grailsproject

class Company {
	
	String name

    static constraints = {
    }
	String toString() {
		"$name"
	}
}
