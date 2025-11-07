{
  perSystem = { self', lib, ... }: {
    coding.standards.hydra = {
      enable = true;
      haskellPackages = with self'.packages; [
        grapesy-lightningd
        grapesy-lightningd-testing
        proto-lens-lightningd
      ];
    };
    weeder.enable = lib.mkForce false;
    werrorwolf.extra-flags = lib.mkForce [ ];
  };

}
