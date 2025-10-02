module RegulatorBot
  ( run
  ) where

import qualified Data.Text as T

import Telegram.Bot.API
import Telegram.Bot.Simple
import Data.ByteString.Lazy qualified as B
import RegulatorBot.Handler
import RegulatorBot.Parse
import RegulatorBot.State
import RegulatorBot.Types


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

run :: IO ()
run = do
  print "Floss regulator bot ready for run"
