module Network.GRPC.Lightningd.Client.Simple (
    getInfo,
) where

import Control.Monad.Catch (MonadMask)
import Control.Monad.IO.Class (MonadIO)
import Network.GRPC.Client (Connection, rpc)
import Network.GRPC.Client.StreamType.IO (biDiStreaming, nonStreaming)
import Network.GRPC.Common.NextElem qualified as NextElem
import Network.GRPC.Common.Protobuf (Proto, Protobuf)
import Network.GRPC.Lightningd qualified as LN

getInfo :: (MonadIO m) => (MonadMask m) => Connection -> Proto LN.GetinfoRequest -> m (Proto LN.GetinfoResponse)
getInfo conn = nonStreaming conn (rpc @(Protobuf LN.Node "getinfo"))
