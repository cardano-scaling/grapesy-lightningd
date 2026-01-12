{ mkDerivation
, base
, exceptions
, grapesy
, lib
, proto-lens-lightningd
}:
mkDerivation {
  pname = "grapesy-lightningd";
  version = "0.1.0";
  src = ./.;
  libraryHaskellDepends = [
    base
    exceptions
    grapesy
    proto-lens-lightningd
  ];
  description = "grapesy-lightningd - GRPC interface to lightningd";
  license = lib.licenses.asl20;
}
