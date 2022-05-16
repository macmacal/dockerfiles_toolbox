FROM ubuntu:20.04 as ros_devel

LABEL maintainer="macal@agh.edu.pl"

ENV ROS_DISTRO=foxy

# LOCALE
# -------------------------------------------------------------------------------------------- #
ENV LANG en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo 'Etc/UTC' > /etc/timezone \
    && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && apt update \
    && apt upgrade -y \
    && apt install -q -y --no-install-recommends \
	bash \
        tzdata \
	locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen ${LC_ALL} \
    && dpkg-reconfigure locales


# ROS2 INSTALATION
# -------------------------------------------------------------------------------------------- #
RUN apt update && apt install  -y \
        curl \
        gnupg2 \
        lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
  
RUN apt update && apt install -y \
	 python3-pip \
         python3-argcomplete \ 
         python3-colcon-common-extensions \ 
         python3-colcon-mixin \ 
         python3-rosdep \ 
         python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U \
         argcomplete
    
RUN apt update && apt install -y \
        ros-${ROS_DISTRO}-ros-base \
    && rm -rf /var/lib/apt/lists/* \
    && rosdep init \
    && rosdep update


# TOOLS
# -------------------------------------------------------------------------------------------- #
RUN apt update && apt install -y \
	bash-completion \
	dnsutils \
	git \
	htop \
	iproute2 \
	iputils-ping \
	mc \
	net-tools \
	ranger \
	tmux \
	wget \
	zsh \
        neovim \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && usermod --shell /bin/zsh root

# ENTRYPOINT
# -------------------------------------------------------------------------------------------- #
COPY ros_entrypoint.zsh /root/.
ENTRYPOINT ["/root/ros_entrypoint.zsh"]
WORKDIR /ws
CMD ["zsh"]
