require 'rails_helper'

describe MotorcycleMake do

  describe 'name' do
    it 'should prevents duplicated names' do
      expect {
        MotorcycleMake.create!(name: 'HONDA')
        MotorcycleMake.create!(name: 'Honda')
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'length must be greater or equal than 3' do
      expect {
        MotorcycleMake.create!(name: 'Ho')
      }.to violate_check_constraint(:motorcycle_makes_name_format_check)
    end

    it 'should prevents empty strings' do
      expect {
        MotorcycleMake.create!(name: '')
      }.to violate_check_constraint(:motorcycle_makes_name_format_check)

      expect {
        MotorcycleMake.create!(name: '    ')
      }.to violate_check_constraint(:motorcycle_makes_name_format_check)
    end

    it 'should accept valids' do
      make1 = MotorcycleMake.create!(name: 'BMW')
      make2 = MotorcycleMake.create!(name: 'Harley Davidson')
      make3 = MotorcycleMake.create!(name: 'Honda')
      make4 = MotorcycleMake.create!(name: 'Yamaha')
      make5 = MotorcycleMake.create!(name: 'Kawasaki')

      expect(make1.name).to eql('BMW')
      expect(make2.name).to eql('Harley Davidson')
      expect(make3.name).to eql('Honda')
      expect(make4.name).to eql('Yamaha')
      expect(make5.name).to eql('Kawasaki')
    end
  end

end
