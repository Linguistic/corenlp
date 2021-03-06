# CoreNLP for Docker

This repository provides [Docker](https://docker.com) images for every major CoreNLP language server (Arabic, Chinese, English, French, German, and Spanish). Each server runs on `localhost:9000`, but can easily be mapped to a different port using [Docker's `-p flag`](https://docs.docker.com/config/containers/container-networking/#published-ports).

More info on how to interface with the server via the CoreNLP Java Client or REST API can be [found here](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html).

## Running Language-Specific Servers

The Docker images are publicly available through the [GitHub Container Registry](ghcr.io) and can be easily ran:

### Arabic

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-arabic
```

### Chinese

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-chinese
```

### English

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-english
```

### French

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-french
```

### German

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-german
```

### Spanish

```
$ docker run -p 9000:9000 ghcr.io/linguistic/corenlp-spanish
```
