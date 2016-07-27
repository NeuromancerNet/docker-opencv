FROM neuromancernet/dev-auto-box:0.1

RUN git clone https://github.com/opencv/opencv/ /usr/opencv --branch 2.4 && cd /usr/opencv && mkdir release && cd release

RUN cmake -DBUILD_SHARED_LIBS=ON -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/ .. && make && make install

COPY assets/opencvBanner.sh /
RUN chmod +x /opencvBanner.sh

ENTRYPOINT ["bash", "/opencvBanner.sh"]