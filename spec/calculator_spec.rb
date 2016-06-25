# Your code here
require 'calculator'
require 'spec_helper'

describe Calculator do



 let(:calc) { Calculator.new }
 let(:calc_s) { Calculator.new( "5" ) }
 let(:calc_true) { Calculator.new( true )}


	describe '#initialize' do

		it 'raises and ArgumentError with 2+ arguements' do

			expect{ Calculator.new(5,5) }.to raise_error( ArgumentError )

		end

		it 'when intialized with no parameters, returns a Calc object' do

			expect( calc ).to be_an_instance_of( Calculator )

		end

		it 'sets stringify to default when no parameters' do

			expect( calc.instance_variable_get( :@stringify )).to be false

		end

		it 'creates #thingify with the passed value' do

			expect( calc_s.instance_variable_get( :@stringify ) ).to eq( "5")

		end

		it 'creates #memory and sets to nil' do

			expect( calc_s.instance_variable_get( :@memory )).to be_nil

		end

	end #/.intitialize






	describe '#add' do

		it 'should add two integers' do

			expect( calc.add( 5, 6 ) ).to eq( 11 )

		end

		it 'should add two strings' do

			expect( calc.add("hello", "there")).to eq("hellothere")

		end

		it 'should raise and ArgumentError if one argument passed' do

			expect{ calc.add("5") }.to raise_error(ArgumentError)

		end

		it 'should not accept mismatched parameters' do

			expect{ calc.add( 5 , "hello" ) }.to raise_error( TypeError )

		end

		it 'should add negative numbers' do

			expect( calc.add( 5, -5 )).to eq( 0 )

		end

		it 'should add floats' do

			expect( calc.add( 6.0, 7.12 )).to be_within(0.2).of( 13.12 )

		end

	end #/.add




	describe '#subtract' do

		it 'should subtract two integers' do

			expect( calc.subtract( 5, 6 ) ).to eq( -1 )

		end

		it 'should raise a MethodError if strings are passed' do

			expect{ calc.subtract("hello", "there") }.to raise_error( NoMethodError )

		end

		it 'should raise and ArgumentError if one argument passed' do

			expect{ calc.subtract("5") }.to raise_error(ArgumentError)

		end

		it 'should not accept mismatched parameters' do

			expect{ calc.subtract( 5 , "hello" ) }.to raise_error( TypeError )

		end

		it 'should subtract negative numbers' do

			expect( calc.subtract( 5, -5 )).to eq( 10 )

		end

		it 'should subtract floats' do

			expect( calc.subtract( 6.0, 7.12 )).to be_within(0.2).of( -1.12 )

		end

	end #/.subtract


	describe '#multiply' do

		it 'should multiply two integers' do

			expect( calc.multiply( 6, 7 )).to eq( 42 )

		end

		it 'should multiply a string and int' do

			expect( calc.multiply( "hi", 3 )).to eq("hihihi")

		end

		it 'should raise a TypeError when passed 2 strings' do

			expect{ calc.multiply( "hi", "hello" ) }.to raise_error( TypeError )

		end

	end #/Multiply







		describe '#divide' do

		it 'should divide two integers' do

			expect( calc.divide( 10, 3 )).to be_within(0.2).of( 3.33333 )

		end

		it 'should not be able to divide by zero' do

			expect{ calc.divide( 5, 0 )}.to raise_error( ArgumentError )

		end


		it 'should raise a FloatDomainError when passed 2 strings' do

			expect{ calc.divide( "hi", "hello" ) }.to raise_error( FloatDomainError )

		end

	end #/divide




	describe '#pow' do

		it 'properly powers with positive ints' do

			expect( calc.pow( 2, 3 )).to eq( 8 )

		end

		it 'properly powers with negative numbers' do

			expect( calc.pow( 2, -2 )).to eq( 0.25 )

		end


		it 'properly powers with decimals' do

			expect( calc.pow( 0.2, 0.4 )).to be_within(0.2).of( 0.525 )

		end


	end






	describe '#sqrt' do

		it 'properly sqrt positive numbers' do

			expect( calc.sqrt( 4 )).to eq( 2 )

		end

		it 'raises ArgumentError for negative numbers' do

			expect{ calc.sqrt( -4 )}.to raise_error( ArgumentError )

		end

		it 'returns an int for decimal values' do

			expect( calc.sqrt( 4.2 )).to eq( 2.05 )

		end

		it 'returns a 2-digit decimal for non-round roots' do

			expect( calc.sqrt( 10 )).to eq( 3.16 )

		end


	end #/sqrt



	describe '#memory' do





		it "should overwrite an object in memory storing the assigned value" do

			calc.memory = "54"
			expect(calc.memory).to eq("54")

		end

		it "should replace @memory with nil when returned" do

			calc.memory = "54"

			calc.memory

			expect(calc.memory).to be_nil

		end


	end #/.memory


	describe '#stringify' do


		describe "#output" do

			it "should return a string when @stringify is true" do


				expect(calc_true.add(4,5)).to eq("9")


			end


			it "should return an int when @stringify is false" do


				expect(calc.add(4,5)).to eq(9)


			end


		end




	end




end