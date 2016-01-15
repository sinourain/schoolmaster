require "spec_helper"

describe Schoolmaster::BundlerAuditAnalyzer do
	context "the command param" do
		it "should have the default system command" do
			analyzer = Schoolmaster::BundlerAuditAnalyzer.new
			expected_command = "bundle-audit check "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end

		it "should be able to be overridden" do
			analyzer = Schoolmaster::BundlerAuditAnalyzer.new(command: "check app")
			expected_command = "check app "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end

	context "the debug param" do
		it "should allow debug to be turned on" do
			allow(Schoolmaster.configuration).to receive(:debug).and_return(10)
			analyzer = Schoolmaster::BundlerAuditAnalyzer.new
			expected_command = "bundle-audit check "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end
end

