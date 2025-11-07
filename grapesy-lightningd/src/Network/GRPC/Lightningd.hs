{-# OPTIONS_GHC -Wno-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Network.GRPC.Lightningd (
    module Proto.API.Lightningd,
) where

import Network.GRPC.Common (
    NoMetadata,
    RequestMetadata,
    ResponseInitialMetadata,
    ResponseTrailingMetadata,
 )
import Network.GRPC.Common.Protobuf (Protobuf)
import Proto.API.Lightningd

{-------------------------------------------------------------------------------
  Metadata
-------------------------------------------------------------------------------}

type instance RequestMetadata (Protobuf Node meth) = NoMetadata
type instance ResponseInitialMetadata (Protobuf Node meth) = NoMetadata
type instance ResponseTrailingMetadata (Protobuf Node meth) = NoMetadata
