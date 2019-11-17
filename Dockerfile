FROM centos:7

RUN yum update -y
RUN yum install -y python2 file which wget libquadmath-devel mesa-libGL-devel
RUN mkdir build
ENV MIRROR https://fsl.fmrib.ox.ac.uk
RUN curl -o /build/fslinstaller.py $MIRROR/fsldownloads/fslinstaller.py 
WORKDIR /build
ENV FSLDIR /usr/local/fsl/
RUN python2 fslinstaller.py
ENV PATH "$FSLDIR/bin:$PATH"