arg:
let
  repo = "https://github.com/NixOS/nixpkgs";
  rev = "335f0738cb2fa9708f3f428e39d2eae975d1338d";
  nixpkgs = import (builtins.fetchTarball {
    url = "${repo}/archive/${rev}.tar.gz";
    sha256 = "15ac9jjvzdqkxwjzldzpj46caibvh2gvc3f83wlgplb8d8bw8wsc";
  }) arg;
in
# Unstable channel no longer supports Intel architecture for macOS. We can use the 26.05 channel
# to keep testing on that platform for a little longer.
# TODO: remove this when 26.05 is EOL (end of 2026)
if builtins.currentSystem == "x86_64-darwin" then (import ./pkgs-26.05.nix arg) else nixpkgs
