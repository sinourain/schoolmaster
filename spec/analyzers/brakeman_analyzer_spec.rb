require "spec_helper"

describe Schoolmaster::BrakemanAnalyzer do
	context "the command param" do
		it "should have the default system command" do
			analyzer = Schoolmaster::BrakemanAnalyzer.new
			expected_command = "brakeman . -q"
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end

		it "should be able to be overridden" do
			analyzer = Schoolmaster::BrakemanAnalyzer.new(command: "brakeman app")
			expected_command = "brakeman app -q"
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end

	context "the debug param" do
		it "should allow debug to be turned on" do
			allow(Schoolmaster.configuration).to receive(:debug).and_return(10)
			analyzer = Schoolmaster::BrakemanAnalyzer.new
			expected_command = "brakeman . "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end
end

