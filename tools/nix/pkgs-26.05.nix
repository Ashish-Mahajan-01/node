arg:
let
  repo = "https://github.com/NixOS/nixpkgs";
  rev = "51fe96f9107566e6b8eeb7fc4ba696c01e548b04";
  nixpkgs = import (builtins.fetchTarball {
    url = "${repo}/archive/${rev}.tar.gz";
    sha256 = "12xqsh00v9vm0pcph31z7mx30cbrcc1iii8dk05qm6gcp4y0ngfa";
  }) arg;
in
# Unstable channel no longer supports Intel architecture for macOS. We can use the 26.05 channel
# to keep testing on that platform for a little longer.
# TODO: remove this file when 26.05 is EOL (end of 2026)
nixpkgs
