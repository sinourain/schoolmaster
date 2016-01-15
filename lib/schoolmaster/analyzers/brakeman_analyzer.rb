module Schoolmaster
	class BrakemanAnalyzer < BaseAnalyzer

		def initialize(params = {})
			super
			@command = "brakeman ." if command.empty?
		end

		def default_args
			brakeman_opts = []

			unless Schoolmaster.configuration.debug
				brakeman_opts << "-q"
			end

			brakeman_opts
		end
	end
end
