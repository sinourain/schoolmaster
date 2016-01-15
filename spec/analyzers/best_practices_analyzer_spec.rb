require "spec_helper"

describe Schoolmaster::BestPracticesAnalyzer do
	context "the command param" do
		it "should have the default system command" do
			analyzer = Schoolmaster::BestPracticesAnalyzer.new
			expected_command = "rails_best_practices . "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end

		it "should be able to be overridden" do
			analyzer = Schoolmaster::BestPracticesAnalyzer.new(command: "rails_best_practices app")
			expected_command = "rails_best_practices app "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end
end

