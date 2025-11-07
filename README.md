# grapesy-lightningd

This repository contains a [grapesy](https://hackage.haskell.org/package/grapesy) client
for [lightningd](https://docs.corelightning.org/docs/grpc)

It is divided into packages:

* [grapesy-lightningd](grapesy-lightningd/) - Contains the metadata instances for use with grapesy, and a simple client as library code.
* [grapesy-lightningd-testing](grapesy-lightningdd-testing) - Contains an executable (not cabal test) for running a test against a live lightningd service.
* [proto-lens-lightningd](proto-lens-lightningd/) - Contains the protocol buffer bindings.

## Development

Do this to get started.

```
nix develop
cabal build all
```

## Testing

Testing the must be done against a real lightningd service, which is provided by a NixOS VM test in a flake check attribute. To run all of the tests, run

```
nix flake check
```

You may run the test executable against a version of lightningd installed on your host if you wish.
