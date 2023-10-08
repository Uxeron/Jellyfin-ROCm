FROM jellyfin/jellyfin:latest

# Build commands taken from https://jellyfin.org/docs/general/administration/hardware-acceleration/amd/#configure-with-linux-virtualization
RUN apt update && apt install -y curl gpg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://repo.radeon.com/rocm/rocm.gpg.key | gpg --dearmor -o /etc/apt/keyrings/rocm.gpg
RUN echo "Types: deb \n\
URIs: https://repo.radeon.com/rocm/apt/latest \n\
Suites: ubuntu \n\
Components: main \n\
Architectures: amd64 \n\
Signed-By: /etc/apt/keyrings/rocm.gpg" | tee /etc/apt/sources.list.d/rocm.sources
RUN apt update && apt install -y rocm-opencl-runtime
