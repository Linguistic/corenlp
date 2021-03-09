FROM openjdk:11-jre

ARG LANGUAGE=english
ARG CORENLP_VERSION=4.2.0

ENV LANGUAGE $LANGUAGE
ENV PROPERTIES StanfordCoreNLP-${LANGUAGE}.properties
ENV PORT 9000

RUN apt-get update
RUN useradd --create-home --shell /bin/bash corenlp

USER corenlp 

WORKDIR /home/corenlp 

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}.zip
RUN unzip stanford-corenlp-${CORENLP_VERSION}.zip && rm stanford-corenlp-${CORENLP_VERSION}.zip

WORKDIR stanford-corenlp-${CORENLP_VERSION}

SHELL ["/bin/bash", "-c"]

RUN if [ "$LANGUAGE" != "english" ]; then \
  wget https://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}-models-${LANGUAGE}.jar ; \
  fi

EXPOSE $PORT

CMD if [ "$LANGUAGE" == "english" ]; then \
  java -cp "*" -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000 ; \
  else \
  java -cp "*" -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -serverProperties ${PROPERTIES} -port 9000 -timeout 15000 ; \
  fi