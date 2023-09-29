Sample Docker project with nodejs 20 and TypeScript


## Scripts
```
$ npm run start    - Builds the solution and starts the server in dev mode
$ npm docker-build - Builds the docker image
$ npm docker-run   - Runs the docker image in production mode 
                     Contianer exposes site as http://localhost:49160)
                     Internal applicaiton listens on port 8080
```

## Notes on Docker


### Building

```
$ docker build --progress=plain --no-cache -t kenfaubel/docker-typescript-express .

--progress=plain - Display the output from each step in the Dockerfile
--no-cache       - Start fresh without the cache of previous builds.
--tag <tagname>  - tag the image
```

### Running
```
$ docker run -p 49160:8080 -d kenfaubel/docker_web_app

-p <extern-port>:<internal-port> - expose internal port 8080 to external (host) port 49160
-d                               - run in detached mode
```

View with http://localhost:49160

### Misc
Show all of the local images
```
$ docker images
```
Show the running containers with their ids, tags, status, etc.
```
$ docker ps
```

Show the console output from the container
```
$ docker logs <container id>
```

Kill the container
```
$ docker kill <container id>
```

