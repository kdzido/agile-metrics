# scrum-metrics
Helps you visualise datafrom your team's development cycle.
Provides feedback for the team that can help to improve.
Based on the book [Agile Metrics In Action](http://manning.com/davis2/).

# Getting started

Prerequisites:

    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-cachier          # optional
    vagrant plugin install vagrant-hostsupdater     # optional

Spin up a development environment with:

    vagrant up
    
It provisions machine with everything.

# Testing

Start components with:

    ./vagrant/docker-compose-run-metrics.sh

Check ELK and Mongo Express web UI your browser:
ELK:

    http://10.44.0.100:5601/app/kibana
    http://10.44.0.100:9200/
    
Mongo Express web admin UI:

    http://10.44.0.100:8081/