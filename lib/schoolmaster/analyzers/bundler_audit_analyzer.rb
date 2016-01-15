module Schoolmaster
	class BundlerAuditAnalyzer < BaseAnalyzer

		def initialize(params = {})
			super
			@command = "bundle-audit check" if command.empty?
		end
	end
end

