FROM node:22

COPY ./script.sh .
RUN chmod +x /script.sh

CMD /script.sh
