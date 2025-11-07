module Main (main) where

import Network.GRPC.Client (Address (Address), Connection, Server (ServerInsecure), withConnection)
import Network.GRPC.Common (def)
import Network.GRPC.Common.Protobuf (defMessage)
import Network.GRPC.Lightningd.Client.Simple qualified as Lightningd

{-------------------------------------------------------------------------------
  Call some methods of the Lightningd service
-------------------------------------------------------------------------------}

getInfo :: Connection -> IO ()
getInfo conn = Lightningd.getInfo conn defMessage >>= print

main :: IO ()
main = withConnection def server getInfo
  where
    server :: Server
    server = ServerInsecure $ Address "127.0.0.1" 2379 Nothing
