# NUS Money API – NodeJS

Using u1i/nodejs-api as the start point, this project is for learning Docker containers and the CI/CD piepline using the NUSmoney app in the following progressive steps.  With a very basic starting knowledge, it may not be possible to complete all steps by project show and tell date but will try to make as much progress as possible.

1. Fully understand each step to setup and run app.js (from u1i/nodejs-api repo) as a backend API service in a Docker container.  Within Google Cloud Shell Editor, be able to manually clone, build and start the service in a Docker container rather than just being able to start the service that lecturer has deployed in Google Cloud.
2. Replicate step 1 for the NUSmoney app.  Add javascript files for NUSmoney app backend and learn how to run it as a backend API service in a Docker container.  To achieve this, need to learn how to install MYSQL client in the Docker container when setting it up.
3. Automate the steup, build, publish and deploy for the NUSmoney app in github workflow using a yaml file so that any changes to NUSmonay app are automatically deployed.

Document the testing and lessons learnt, as there will be many.

========================================

Documentation copied over from u1i/nodejs-api readme.

docker run -d -p 8080:8080 u1ih/nodejs-api

curl -i http://localhost:8080/fx

CI/CD pipeline implemented using GitHub Actions:

* create docker container
* push to gcr.io container registry
* deploy to Google Cloud Run (knative / PaaS)

Live endpoint available at: [https://nodejsapi-tgihgzgplq-uc.a.run.app/](https://nodejsapi-tgihgzgplq-uc.a.run.app/)

[https://nodejsapi-tgihgzgplq-uc.a.run.app/fx](https://nodejsapi-tgihgzgplq-uc.a.run.app/fx)


The CI/CD build workflow needs documentation. For now, here is how you connect it to GCP: [https://gcp-examquestions.com/ci-cd-solutions-deploy-to-google-cloud-run-using-github-actions/](https://gcp-examquestions.com/ci-cd-solutions-deploy-to-google-cloud-run-using-github-actions/)

In order for this to be provisioned on your Google Cloud instance, you need to make sure you create/update these GitHub secrets:

* GCP_APPLICATION
* GCP_CREDENTIALS
* GCP_EMAIL
* GCP_PROJECT

You'll also need to activate a couple of APIs in Google Cloud, the first deployment will probably fail and point you into the right direction. Alternatively, you could deploy the first version manually.
