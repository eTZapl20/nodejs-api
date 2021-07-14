# NUS Money API – NodeJS

Using u1i/nodejs-api as the start point, this project is for learning Docker containers and the CI/CD piepline using the NUSmoney app in the following progressive steps.  With a very basic starting knowledge, it may not be possible to complete all steps by project show and tell date but will try to make as much progress as possible.

A. Fully understand each step to setup and run app.js (forked from u1i/nodejs-api repo) with nodejs as a backend API service in a Docker container.  Within Google Cloud Shell Editor, be able to manually clone, build and start the service in a Docker container rather than just being able to start the service that lecturer has deployed in Google Cloud.

B. Replicate step 1 for the NUSmoney app.  Add NUSmoney app backend files (.js) to repo and figure out how to run it as a backend API service in a Docker container.  To achieve this, need to learn how to install MYSQL client in the Docker container when setting it up.  Aside from the learning value, this would have addressed a real problem faced during the NUSmoney project.  After the NUSmoney backend was completed, each front end developer who wanted to test their front end application's interaction with the backend had to manually copy and install the backend components then run the backend API service on localhost before testing the front end.  Using the Docker container would have simplified all that.  Another alternative solution would have been to put the backend on cloud.

C. Automate the setup, build, publish and deploy for the NUSmoney app in github workflow using a yaml file so that any changes to NUSmonay app are automatically deployed.  Decided original step C was too challenging given limited time.  Instead explore a GitHub workflow to build and test node.js apps.

Use this readme page to document the understanding, activities carried out and learning.  Address changes.

A. Setup and run app.js in Docker container
1. In GitHub, fork u1inodejs-api to create this repo.
2. Start Google Cloud Shell Editor and run following in Google Clound Shell Editor command line.
3. git clone https://github.com/eTZapl20/nodejs-api => clones the source from github into "local" VM instance started up by Google Cloud Shell Editor
4. cd nodejs-api => change directory to nodejs-api
5. docker build . -t nodejs-api => builds the docker container image executing each line in Dockerfile, which include installing various packages needed
6. docker run -d -p 8080:8080 nodejs-api => runs docker container instance with app.js API service at port 8080 => this is done by executing the instruction found in the CMD line in the Dockerfile => the instruction is to run the shell script start.sh => the shell script contains instruction to run node app.js, therefore starting or running the API services found in app.js
7. curl -i http://localhost:8080/fx => test by calling the API end point (at port 8080) using curl command.
8. docker kill $(docker ps -q) => kills instances of Docker containers when no longer needed.

B. Setup and run NUSmoney backend in Docker container
1. NUSmoney backend is similar to app.js with added feature of nodejs interacting mysql client to query database on NUS database server.  Update GitHub repo with necessary changes.
2. Copy NUSmoney backend files main.js, database.js and aggregator.js into this repo.
3. Modify Dockerfile to copy these 3 files into /home/user instead of app.js.
4. Add line to Dockerfile to install mysql: RUN npm install --save mysql body-parser cors dotenv
5. Modify start.sh shell script to run node main.js instead of app.js.
6. GitHub repo is ready so go back to Google Cloud Shell Editor and perform the following steps.
7. Before starting kill previous Docker container instances to avoid confusion.
8. rm -r nodejs-api => delete the nodejs-api directory that contains old version of package
9. git clone https://github.com/eTZapl20/nodejs-api => clones latest version from GitHub
10. cd nodejs-api
11. docker build . -t nusmoney
12. docker run -d -p 8080:8080 nusmoney
13. curl -i http://localhost:8080/users/by-user-id/ => one of the APIs in NUSmoney app that calls database and returns user data.
14. curl -i http://localhost:8080/ => addition API created to test that msg is returned without having to call database because step 13 was returning.  
15. Step 13 & 14 failed.  Refer to test documentation in wiki.

C.  Create a GitHub workflow for build and test specifically node main.js.  
1. Created simple node.js test workflow using template.  
2. Failed to run a proper test after build but displayed some dummy messages to start understanding the workflow.  
3. Need more time to fully understand.  Refer to workflow runs in Actions.  
