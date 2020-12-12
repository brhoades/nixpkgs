import ./generic.nix (rec {
  version = "28.0.50";
  src = {
    # https://www.reddit.com/r/emacs/comments/k1f8oe/current_emacs_on_wayland_story_whats_the/
    # https://copr.fedorainfracloud.org/coprs/deathwish/emacs-pgtk-nativecomp/
    # https://github.com/A6GibKm/emacs-pgtk-nativecomp-copr
    #   which also uses https://github.com/A6GibKm/emacs-pgtk-nativecomp-copr/blob/master/emacs.spec#L20
    #   below

    owner = "flatwhatson";
    repo = "emacs";
    rev = "fc535f14c9621bcb43b7e140b9f47d53b017f27b";
    sha256 = "07iyhgwwcj5j65z9jxiq38yqw0f0pdb2bl2dwxw2q679dfar7csv";
  };
  patches = [
    ./clean-env.patch
  ];
})
