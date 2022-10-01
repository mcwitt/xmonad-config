{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default =
        let
          haskellEnv =
            (pkgs.haskellPackages.ghcWithHoogle (ps: with ps; [
              xmonad
              xmonad-contrib
            ]));
        in
        pkgs.mkShell {
          buildInputs = [
            haskellEnv
            pkgs.haskell-language-server
            pkgs.hlint
            pkgs.ormolu
          ];
        };
    };
}
