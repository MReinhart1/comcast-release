# Introduction

Welcome to the merlin-service, this metadata movie service handles the task of searching for movies using a very simple express app that calls an api. 

## Release Engineering
The CI/CD process works as follows:
* A pr is created that must pass all tests, these tests are run using jest 
* Upon a pr merge to main (which has passed all tests), a docker image is created and pushed up to ECR tagged in the workflows
    * A common practice is to tag images with github sha's but I find this can create for more images then required and also can make it hard to delineate between images
* When the repo's tags are changed it triggers a deployment, this has been left open as there are many different deployment patterns depending on what infrastructure is used for hosting


## Infrastructure 
I have also included an example of a possible infrastructure pattern to follow. This uses a pattern of reusable modules that can be accessed by environment. A continuation of this would require hosting state files in aws with s3 so that the repo (and anyone else with permissions) can access and mutate the state. A change to the `infrastructure` directory on a merge to main will trigger this action. The matrix runs in such a way as to allow for permission to be set on the environment, so for example the `prod` environment can be protected by requiring a code owner to approve github action runs. 


## Charts
For this project I envisioned the deployment to leverage Kubernetes for hosting. The `merlin-service` directory holds helm charts that can be made to host the merlin service. 


### Jenkins workflow
I also have a jenkins script running locally, it runs every 5 minutes to check for changes in the github repo (I would have built out a webhook but didnt have a proper redirect url due to local hosting). The script:

* Installs the dependencies 
* Runs tests on the code base
* Archives the entire codebase if the tests succeed and saves them as the last successful artifacts which for me can be found here:
http://localhost:8080/job/merlin-service/lastSuccessfulBuild/artifact/
