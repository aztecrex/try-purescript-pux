module Main where

import Prelude hiding (div)
import Control.Monad.Eff (Eff)
import Pux (CoreEffects, EffModel, start)
import Pux.DOM.Events (onClick)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (button, div, span, br)
import Text.Smolder.Markup (text, (#!))

data Event = Increment Int | Reset

type State = Int

-- | Return a new state (and effects) from each event
foldp :: ∀ fx. Event -> State -> EffModel State Event fx
foldp (Increment amt) n = { state: n + amt, effects: [] }
foldp Reset n = { state: 0, effects: [] }

-- | Return markup from the state
view :: State -> HTML Event
view count =
  div do
    button #! onClick (const $ Increment (-5)) $ text "-5"
    button #! onClick (const $ Increment (-1)) $ text "-"
    span $ text (show count)
    button #! onClick (const $ Increment 1) $ text "+"
    button #! onClick (const $ Increment 5) $ text "+5"
    br
    button #! onClick (const Reset) $ text "Reset"

-- | Start and render the app
main :: ∀ fx. Eff (CoreEffects fx) Unit
main = do
  app <- start
    { initialState: 0
    , view
    , foldp
    , inputs: []
    }

  renderToDOM "#app" app.markup app.input
