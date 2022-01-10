FROM docker/for-desktop-kernel:5.10.76-505289bcc85427a04d8d797e06cbca92eee291f4 AS ksrc

FROM ubuntu:latest

WORKDIR /
COPY --from=ksrc /kernel-dev.tar /
RUN tar xf kernel-dev.tar && rm kernel-dev.tar

RUN apt-get update
RUN apt install -y kmod python3-bpfcc clang-11 wget make

RUN wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
ENV PATH="/usr/lib/llvm-11/bin/:/usr/local/go/bin:$PATH"

COPY hello_world.py /root
COPY docker-entrypoint.sh /root

WORKDIR /root
ENTRYPOINT ["/root/docker-entrypoint.sh"]
CMD ["/bin/bash"]
