{ mkDerivation
, base
, Cabal
, composite-base
, lib
, proto-lens-protobuf-types
, proto-lens-protoc
, proto-lens-runtime
, proto-lens-setup
}:
mkDerivation {
  pname = "proto-lens-lightningd";
  version = "0.1.0";
  src = ./.;
  setupHaskellDepends = [ base Cabal proto-lens-setup ];
  libraryHaskellDepends = [
    base
    composite-base
    proto-lens-protobuf-types
    proto-lens-runtime
  ];
  libraryToolDepends = [ proto-lens-protoc ];
  description = "proto-lens-lightningd - protobuffer lenses for lightningd provided by protoc-lens-protoc";
  license = lib.licenses.asl20;
}
