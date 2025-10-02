module RegulatorBot.Reply where

import Data.Text
import Data.Text qualified as Text
import GHC.Stack (HasCallStack)
import Telegram.Bot.API
import Telegram.Bot.Simple

replyStart :: BotM ()
replyStart = do
  reply replyMsg
 where
  mkButton = uncurry urlButton
  keyboard =
    InlineKeyboardMarkup
      { inlineKeyboardMarkupInlineKeyboard =
          [mkButton <$> [("Jamiyat", "https://t.me/flossuzc"), ("Web Sahifa", "https://floss.uz")]]
      }
  replyMsgTxt =
    Text.unlines
      [ "Assalomu alaykum, hurmatli haker! "
      , "Floss jamiyati haqida hammasi shu yerda"
      ]
  replyMsg =
    (toReplyMessage replyMsgTxt)
      { replyMessageReplyMarkup = Just $ SomeInlineKeyboardMarkup keyboard
      }
