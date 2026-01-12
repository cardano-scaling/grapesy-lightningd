{ mkDerivation
, base
, bytestring
, grapesy
, grapesy-lightningd
, lib
}:
mkDerivation {
  pname = "grapesy-lightningd-testing";
  version = "0.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base
    bytestring
    grapesy
    grapesy-lightningd
  ];
  description = "grapesy-lightningd-testing - Tests for grapesy-lightningd";
  license = lib.licenses.asl20;
  mainProgram = "alice";
}
