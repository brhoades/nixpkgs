{ stdenv, fetchFromGitLab, symlinkJoin, gfortran, perl, procps
, libyaml, libxc, fftw, blas, lapack, gsl, netcdf, arpack, autoreconfHook
, python3
}:

assert (!blas.isILP64) && (!lapack.isILP64);

stdenv.mkDerivation rec {
  pname = "octopus";
  version = "10.3";

  src = fetchFromGitLab {
    owner = "octopus-code";
    repo = "octopus";
    rev = version;
    sha256 = "1axr3j53mi30gm3f645ga5jkhxbc7rbx432w2k2lgg6g9dv3fcs4";
  };

  nativeBuildInputs = [ perl procps autoreconfHook ];
  buildInputs = [
    libyaml
    gfortran
    libxc
    blas
    lapack
    gsl
    fftw
    netcdf
    arpack
    (python3.withPackages (ps: [ ps.pyyaml ]))
  ];

  configureFlags = [
    "--with-yaml-prefix=${libyaml}"
    "--with-blas=-lblas"
    "--with-lapack=-llapack"
    "--with-fftw-prefix=${fftw.dev}"
    "--with-gsl-prefix=${gsl}"
    "--with-libxc-prefix=${libxc}"
  ];

  doCheck = false;
  checkTarget = "check-short";

  postPatch = ''
    patchShebangs ./
  '';

  postConfigure = ''
    patchShebangs testsuite/oct-run_testsuite.sh
  '';

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "Real-space time dependent density-functional theory code";
    homepage = "https://octopus-code.org";
    maintainers = with maintainers; [ markuskowa ];
    license = with licenses; [ gpl2Only asl20 lgpl3Plus bsd3 ];
    platforms = [ "x86_64-linux" ];
  };
}
