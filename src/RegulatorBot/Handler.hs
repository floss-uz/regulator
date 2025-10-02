module RegulatorBot.Handler where

import RegulatorBot.Reply
import RegulatorBot.State
import RegulatorBot.Types
import GHC.Stack (HasCallStack)
import Telegram.Bot.Simple.Eff

handleAction :: (HasCallStack) => Action -> Model -> Eff Action Model
handleAction Start model =
  model <# do
    replyStart
