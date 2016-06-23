# Your code here
require 'calculator'

describe Calculator do

	describe '#initialize' do

		it 'raises and ArgumentError with 2+ arguements' do

			expect{ Calculator.new(5,5) }.to raise_error( ArgumentError )

		end


	end


end