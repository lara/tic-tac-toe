require_relative './game_helper'

RSpec.describe GameHelper do
  context 'standard 3x3 table' do
    describe '#calculate_win' do
      subject { described_class.new(table).calculate_win }

      context 'empty table' do
        let(:table) { (1..9).to_a.map(&:to_s) }
        specify { expect(subject).to eq(false) }
      end

      context 'last row win' do
        let(:table) { %w[1 2 3 4 5 6 X X X] }
        specify { expect(subject).to eq(true) }
      end

      context 'last column win' do
        let(:table) { %w[1 2 X 4 5 X 7 8 X] }
        specify { expect(subject).to eq(true) }
      end

      context 'main diagonal win' do
        let(:table) { %w[X 2 3 4 X 6 7 8 X] }
        specify { expect(subject).to eq(true) }
      end

      context 'anti diagonal win' do
        let(:table) { %w[1 2 X 4 X 6 X 8 9] }
        specify { expect(subject).to eq(true) }
      end
    end
  end

  context 'expanded 4x4 table' do
    # same rules, but it requires 4 in a row/col/diagonal instead
    describe '#calculate_win' do
      subject { described_class.new(table).calculate_win }

      context 'empty table' do
        let(:table) { (1..16).to_a.map(&:to_s) }
        specify { expect(subject).to eq(false) }
      end

      context 'last row win' do
        let(:table) { %w[1 2 3 4 5 6 7 8 9 10 11 12 X X X X] }
        specify { expect(subject).to eq(true) }
      end

      context 'last column win' do
        let(:table) { %w[1 2 3 X 5 6 7 X 9 10 11 X 13 14 15 X] }
        specify { expect(subject).to eq(true) }
      end

      context 'main diagonal win' do
        let(:table) { %w[X 2 3 4 5 X 7 8 9 10 X 12 13 14 15 X] }
        specify { expect(subject).to eq(true) }
      end

      context 'anti diagonal win' do
        let(:table) { %w[1 2 3 X 5 6 X 8 9 X 11 12 X 14 15 16] }
        specify { expect(subject).to eq(true) }
      end
    end
  end
end
