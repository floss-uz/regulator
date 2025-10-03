module RegulatorBot.Parse where

import Telegram.Bot.API
import Telegram.Bot.Simple.UpdateParser

import Data.Maybe
import RegulatorBot.State
import RegulatorBot.Types

updateToAction :: Settings -> Update -> Maybe Action
updateToAction settings@Settings{..} update
  | isCommand "start" update = handleStart settings update
  | isCommand "group" update = handleGroup settings update
  | otherwise = Nothing
 where
  isCommand cmd = isJust . parseUpdate (commandWithBotName botName cmd)

handleStart :: Settings -> Update -> Maybe Action
handleStart _ Update{..} = Just Start

handleGroup :: Settings -> Update -> Maybe Action
handleGroup _ Update{..} = Just Group
