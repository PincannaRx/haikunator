require "cannabinator/version"
require "securerandom"

module Cannabinator
  class << self
    def cannabinate(token_range = 9999, delimiter = "-")
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      sections = [
        adjectives[random_seed % adjectives.length],
        nouns[random_seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        medical smoky potent homegrown legal organic clean
        green healthy medicinal inhaled dank baked blazed
        cool chill fire sticky resinous filtered extracted
        premium select quality beneficial essential extra
        loud calm peaceful calming soothing mindful eloquent
        sophisticated experienced licensed superior cultivated
      )
    end

    def nouns
      %w(
        marijuana medicine weed terpenes health wellness vaporizor
        dispensary partners farms happiness wellbeing quickness
        fitness kindness benefit enjoyment pleasure satisfaction
        partnership water air earth partners advisors compassion
        cannabis cannabinoids cannabinol cannabidiol efficiency
      )
    end
  end
end
