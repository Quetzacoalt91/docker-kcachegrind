FROM ubuntu:14.04

ENV uid 1000
ENV gid 1000
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM 1

RUN apt-get update && apt-get install -y kcachegrind-converters khelpcenter4 graphviz valgrind kcachegrind


# Replace 1000 with your user / group id
RUN mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

CMD ["kcachegrind"]
