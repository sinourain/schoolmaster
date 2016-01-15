require "spec_helper"

describe Schoolmaster::BaseAnalyzer do
	context "when inheriting the BaseAnalyzer" do
		it "should execute the configured command" do
			params = {
				command: "madeup spec"
			}

			@klass = Class.new(Schoolmaster::BaseAnalyzer)

			analyzer = @klass.new(params)
			expect(analyzer).to receive(:system).with("#{params[:command]} ")
			analyzer.run
		end

		it "should allow args to be injected into command str" do
			params = {
				command: "madeup spec"
			}

			@klass = Class.new Schoolmaster::BaseAnalyzer do
				def default_args
					["beam_me_up"]
				end
			end

			analyzer = @klass.new(params)
			expect(analyzer).to receive(:system).with("#{params[:command]} beam_me_up")
			analyzer.run
		end
	end
end

