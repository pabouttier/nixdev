{ stdenv, fetchgit, zlib, liblapack, fftw, qt56, blas, which,
  pkgs ? import <nixpkgs> {},
  gfortran ? pkgs.gfortran
}:

with pkgs;

stdenv.mkDerivation rec {
    version = "XXX";
    name = "geopsy";

    src = ./geopsy.tar.gz;

    buildInputs = [
    zlib
    liblapack
    fftw
    qt56.full 
    blas
    gfortran.cc.lib
    which
    ];

    propagatedNativeBuildInputs = [
    gfortran
    ];

#    preBuild="
#      export PATH=\"${gfortran.cc}\"/bin:$PATH
#    ";
    dontAddPrefix = true;
    configureFlags = [ "-prefix $out" ];

    meta = {
      description = "geopsy";
      license = stdenv.lib.licenses.gpl3Plus;
      maintainers = [ stdenv.lib.maintainers.eelco ];
      platforms = stdenv.lib.platforms.all;
    };
}

