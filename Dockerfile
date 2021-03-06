FROM openjdk:11-jre

ENV VERSION=4.2.0

ARG LANGUAGE=english

ENV PROPERTIES=StanfordCoreNLP-${LANGUAGE}.properties

RUN apt-get update

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-${VERSION}.zip

RUN unzip stanford-corenlp-${VERSION}.zip && rm stanford-corenlp-${VERSION}.zip

WORKDIR stanford-corenlp-${VERSION}

RUN if [ "$LANGUAGE" != "english" ]; then \
  wget https://nlp.stanford.edu/software/stanford-corenlp-${VERSION}-models-${LANGUAGE}.jar ; \
  fi

ENV PORT 9000

EXPOSE $PORT

CMD if [ "$LANGUAGE" = "english" ]; then \
  java -cp "*" -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000 ; \
  else \
  java -cp "*" -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -serverProperties ${PROPERTIES} -port 9000 -timeout 15000 ; \
  fi