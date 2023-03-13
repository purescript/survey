module Main where

import Prelude

import Data.Filterable (filterMap)
import Data.Foldable (intercalate)
import Data.Maybe (Maybe(..))
import Data.Monoid (guard)
import Effect (Effect)
import Effect.Console (log)
import Safe.Coerce (coerce)
import Survey (HasOther(..), Option(..), Question(..), Survey(..), SurveyQuestion(..), survey)

asString :: Survey -> String
asString (Survey survey) = intercalate "\n\n" $ survey # filterMap  case _ of
  SelectResponse (Question question) options -> Just $ question <> "\n" <> intercalate "\n" (coerce options :: Array String)
  CheckSeveralResponse (Question question) options (HasOther hasOther) -> Just $ question <> "\n" <> intercalate "\n" (coerce options :: Array String) <> guard hasOther "\nOther"
  FreeFormResponse _ -> Nothing
  ChooseACountryResponse _ -> Nothing

-- surveymonkey initial export
main :: Effect Unit
main = log (asString survey)