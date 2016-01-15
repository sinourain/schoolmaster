module Schoolmaster
	class SuiteRunner
		def self.run
			Schoolmaster::CaneAnalyzer.new(args: Schoolmaster.configuration.cane_custom_args).run
			Schoolmaster::BestPracticesAnalyzer.new(args: Schoolmaster.configuration.best_practices_custom_args).run if defined?(Rails)
			Schoolmaster::BrakemanAnalyzer.new(args: Schoolmaster.configuration.brakeman_custom_args).run
			Schoolmaster::TestAnalyzer.new(args: Schoolmaster.configuration.test_custom_args).run
			Schoolmaster::BundlerAuditAnalyzer.new(args: Schoolmaster.configuration.bundler_audit_custom_args).run
		end
	end
end

