require "spec_helper"

describe Schoolmaster::TestAnalyzer do
	context "the command param" do
		it "should have the default system command" do
			analyzer = Schoolmaster::TestAnalyzer.new
			expected_command = "bundle exec rspec spec "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end

		it "should be able to be overridden" do
			analyzer = Schoolmaster::TestAnalyzer.new(command: "rake test")
			expected_command = "rake test "
			expect(analyzer).to receive(:system).with expected_command
			analyzer.run
		end
	end
end

