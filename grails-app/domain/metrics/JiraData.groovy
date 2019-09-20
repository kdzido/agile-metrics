package metrics

class JiraData {
    static mapWith = "mongo"
    static searchable = true

    String couchId
    String key
    Date created

    static constraints = {
        couchId nullable: true
        created nullable: true
    }
}
