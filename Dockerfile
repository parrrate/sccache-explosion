FROM rust:1.93.1
RUN rustup component add rustfmt clippy
RUN cargo install sccache
ENV RUSTC_WRAPPER=sccache
COPY test-crate /test-crate
WORKDIR /test-crate
RUN cargo clippy --release --workspace --locked --all-targets -- --deny=warnings && cargo build --release --locked
