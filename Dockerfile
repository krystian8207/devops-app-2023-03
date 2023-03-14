# Choose your base image
FROM rocker/rstudio:4.2.2

RUN apt-get update && apt-get install -y \
      libcurl4-gnutls-dev \
      libssl-dev \
      libpng-dev \
      vim \
      nano \
      libxml2 \
      libxml2-dev \
      curl \
      gnupg2 \
      build-essential libssl-dev \
      libz-dev

ENV RENV_VERSION 0.16.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /project
COPY renv.lock renv.lock

ENV RENV_PATHS_ROOT /renv
ENV RENV_PATHS_LIBRARY /renv/project
ENV RENV_PATHS_CACHE /renv/cache
ENV RENV_PATHS_LOCKFILE /project/renv.lock

RUN R -e "renv::restore()"

COPY set_wd /home/rstudio/.Rprofile

RUN chown -R rstudio:rstudio /renv
