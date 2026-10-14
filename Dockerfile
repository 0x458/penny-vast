# Penny Royal v3.0.1 adapted for Vast.ai: run as root and ship an SSH server,
# so Vast's SSH launch mode can inject keys. Runtime is otherwise unchanged.
FROM ghcr.io/jpezzulli/sglang-rtxpro6000:v3.0.1
USER root
RUN (dnf -y install openssh-server openssh-clients rsync tmux which procps-ng || microdnf -y install openssh-server openssh-clients rsync tmux which procps-ng) \
 && (dnf clean all || true) \
 && ssh-keygen -A \
 && mkdir -p /root/.ssh && chmod 700 /root/.ssh \
 && touch /etc/ssh/sshd_config
