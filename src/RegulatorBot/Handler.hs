module RegulatorBot.Handler where

import GHC.Stack (HasCallStack)
import RegulatorBot.Reply
import RegulatorBot.State
import RegulatorBot.Types
import Telegram.Bot.Simple.Eff

handleAction :: (HasCallStack) => Action -> Model -> Eff Action Model
handleAction Start model =
  model <# do
    replyStart
handleAction Group model =
  model <# do
    replyCommunities model

