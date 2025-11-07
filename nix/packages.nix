{ inputs, self, ... }: {
  perSystem = { pkgs, lib, system, ... }:
    with pkgs.haskell.lib.compose;
    let

      overlay = final: _prev: {
        grapesy-lightningd = final.callCabal2nix "grapesy-lightningd" (lib.cleanSource "${self}/grapesy-lightningd") { };
        grapesy-lightningd-testing = final.callCabal2nix "grapesy-lightningd-testing" (lib.cleanSource "${self}/grapesy-lightningd-testing") { };
        proto-lens-lightningd = addSetupDepends [ pkgs.protobuf ] (final.callCabal2nix "proto-lens-lightningd" (lib.cleanSource "${self}/proto-lens-lightningd") { });
      };

      legacyPackages = inputs.horizon-advance.legacyPackages.${system}.extend overlay;

    in
    rec {

      devShells.default = legacyPackages.shellFor {
        packages = p: [ p.proto-lens-lightningd p.grapesy-lightningd p.grapesy-lightningd-testing ];
        buildInputs = [
          legacyPackages.cabal-install
          legacyPackages.proto-lens-protoc
          pkgs.haskellPackages.cabal-fmt
          pkgs.haskellPackages.fourmolu
          pkgs.hlint
          pkgs.nixpkgs-fmt
          pkgs.protobuf
        ];
      };

      packages = {
        inherit (legacyPackages)
          proto-lens-lightningd
          grapesy-lightningd
          grapesy-lightningd-testing;
      };

    };

}
