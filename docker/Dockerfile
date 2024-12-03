FROM ubuntu:22.04

RUN apt-get update && apt-get install -y unzip wget

# adds user "checker"
RUN useradd --create-home --shell /bin/bash checker

# downlaod and setup Vampire
RUN cd /usr/bin && wget https://github.com/vprover/vampire/releases/download/v4.9casc2024/vampire
RUN chmod +x /usr/bin/vampire

RUN mkdir /project
RUN chown checker:checker /project

WORKDIR /project

CMD ["tail -f /dev/null"]
