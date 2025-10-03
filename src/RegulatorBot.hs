module RegulatorBot
  ( run
  ) where

import Data.Text qualified as T

import Data.Aeson (decode)
import Data.ByteString.Lazy qualified as B
import RegulatorBot.Handler
import RegulatorBot.Parse
import RegulatorBot.State
import RegulatorBot.Types
import Telegram.Bot.API
import Telegram.Bot.Simple

regulatorBot :: Model -> BotApp Model Action
regulatorBot st =
  BotApp
    { botInitialModel = st
    , botAction = actionParser
    , botHandler = handleAction
    , botJobs = []
    }
 where
  actionParser update BotState{..} = updateToAction botSettings update

parseCommunities :: B.ByteString -> Maybe [Community]
parseCommunities = decode



run :: IO ()
run = do
  print "Floss regulator bot ready for run"
