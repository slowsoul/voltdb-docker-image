# voltdb-docker-image
Build a docker image with VoltDB distribution bundled.

The only thing you need is a URL pointing to a tar.gz of VoltDB distribution.

To build the docker image, run:
```bash
./build.sh <URL> <image name>
```

To run a container in the background and get into it interactively, run:
```bash
CMD="XXX" ./run.sh <image name> <container name>
```

**Note**: You can change the launching commands by overriding the `CMD` environtment variable, the default command is "voltdb create".

