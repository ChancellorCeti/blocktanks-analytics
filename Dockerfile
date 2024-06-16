FROM rust AS builder
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update
COPY --from=builder ./target/release/bt_analytics ./target/release/bt_analytics
EXPOSE 3000
ENV RUST_LOG=info
RUN echo -e "nameserver 1.1.1.1\r\noptions ndots: 0" > /etc/resolv.conf
CMD ["/target/release/bt_analytics"]
