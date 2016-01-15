module Schoolmaster
  class BestPracticesAnalyzer < BaseAnalyzer

  	def initialize(params = {})
  		super
  		@command = "rails_best_practices ." if command.empty?
  	end
  end
end
