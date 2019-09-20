package metrics

import grails.gorm.transactions.Transactional

@Transactional
class JiraController {

    static defaultAction = "create"

    def create() {
        int randomNum = new Random().nextInt(100)
        def jiraData = new JiraData(key: "MD-${randomNum}", created: new Date(), couchId: "couch1234")
                .save(flush: true, failOnError: true)

        render "<h1>Create jira document: ${jiraData.key}</h1>"
    }
}
