{ inputs, ... }: {

  perSystem = { pkgs, config, system, ... }: {
    checks.vm-test =
      let
        inherit ((import (inputs.nixpkgs + "/nixos/lib/testing-python.nix") { inherit system; })) makeTest;

      in
      makeTest {
        name = "grapesy-lightningd-test-vm";
        nodes = {
          alice = {
            networking.hostName = "alice";
            environment.systemPackages = [ pkgs.clightning ];
            networking.firewall.enable = false;
            virtualisation = {
              cores = 2;
              memorySize = 2048;
            };
          };
        };
        testScript = ''
          alice.start()
          alice.succeed("${pkgs.clightning}/bin/lightningd")
          alice.succeed("${config.packages.grapesy-lightningd-testing}/bin/alice")
        '';
      };
  };
}
