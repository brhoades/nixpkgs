import ./generic.nix (rec {
  version = "28.0.50";
  src = {
    owner = "flatwhatson";
    repo = "emacs";
    rev = "pgtk-nativecomp";
    sha256 = "04p6kvp3rw49z5bf7g4j1p2s82m1im4x397pyb322ms30yyyj7qg";
  };
  patches = [
    ./clean-env.patch
  ];
})
