FROM rdccosmo/wrf-hdf5

RUN wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz && \
    tar xzvf netcdf-4.1.3.tar.gz && \
    rm -f netcdf-4.1.3.tar.gz && \
    cd netcdf-4.1.3 && \
    LD_LIBRARY_PATH=$PREFIX/lib/:$LD_LIBRARY_PATH CPPFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib ./configure --prefix=$PREFIX --disable-dap --disable-netcdf-4 --disable-shared && \
    make && \
    make install 

ENV PATH $PREFIX/bin:$PATH
ENV NETCDF $PREFIX
