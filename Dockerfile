FROM docker:git
ENV HOME /cab
ENV PATH /cab/bin:$PATH
RUN echo $PATH
