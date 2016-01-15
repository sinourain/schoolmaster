require "schoolmaster/version"
require "schoolmaster/configuration"
require "schoolmaster/suite_runner"
require "schoolmaster/base_analyzer"

Dir[File.dirname(__FILE__) + '/schoolmaster/analyzers/*.rb'].each { |f| require f }

module Schoolmaster
	class << self
		def configure(silent = false)
			yield(configuration)
		end

		def configuration
			@configuration ||= Configuration.new
		end
	end
end
