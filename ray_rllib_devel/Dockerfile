FROM macmacal/rl_devel:latest as base
LABEL maintainer="macal@agh.edu.pl"

# Ray + RLLib
# -------------------------------------------------------------------------------------------- #
USER user
RUN python3 -m pip install -U "ray[rllib]" \
    && rm -rf /home/user/.cache/pip

# ENTRYPOINT
# -------------------------------------------------------------------------------------------- #
COPY entrypoint.sh /home/user/.
ENTRYPOINT ["/home/user/entrypoint.sh"]
WORKDIR /mnt/ws
CMD ["zsh"]
