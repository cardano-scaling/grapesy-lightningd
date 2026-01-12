{
  perSystem = { config, pkgs, ... }:
    let
      cabal2nixWrapper = pkgs.writeShellScriptBin "cabal2nix-wrapper" ''
        dir=$(dirname "$1")
        cd $dir
        ${pkgs.haskellPackages.cabal2nix}/bin/cabal2nix . > default.nix
      '';
    in
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        settings.formatter.cabal2nix = {
          command = "${cabal2nixWrapper}/bin/cabal2nix-wrapper";
          includes = [
            "grapesy-lightningd/default.nix"
            "grapesy-lightningd-testing/default.nix"
            "proto-lens-lightningd/default.nix"
          ];
        };
      };
    };
}
