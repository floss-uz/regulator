module RegulatorBot.State where

import Data.Text (Text)
import Data.Text qualified as T
import System.Environment (getEnv)
import Data.HashMap.Strict (HashMap)
import Control.Concurrent.STM (TVar, newTVarIO)


type Model = BotState

data BotState = BotState
  { botSettings :: Settings
  , rfc :: TVar (HashMap Text Text)
  }

data Settings = Settings
  { botName :: Text
  , botToken :: String
  }
  deriving (Show)

newBotState :: Settings -> IO BotState
newBotState settings = do
  pure BotState{botSettings = settings}

loadDefaultSettings :: IO Settings
loadDefaultSettings = do
  token <- getEnv "BOT_TOKEN"
  pure $ Settings{botName = "floss bot", botToken = token}

setBotState :: Settings -> IO BotState
setBotState settings@Settings{..} = do
  pure $ BotState{botSettings = settings}
