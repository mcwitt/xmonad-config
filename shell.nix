{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { } }:
pkgs.haskellPackages.shellFor {
  packages = ps: with ps; [ xmonad ];
  withHoogle = true;
}
