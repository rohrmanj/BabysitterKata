require './babysitter_kata.rb'

describe BabySitter do
  it 'gets paid $12 per hour till bedtime' do
   expect(subject.calc_pb_rate('5:00 PM', '8:00 PM', '8:00 PM')).to eq 36
  end

  it 'gets paid $8 from bed time to midnight' do
    expect(subject.calc_ab_rate('8:00 PM', '8:00 PM', '12:00 AM')).to eq 32
  end

  it 'gets paid $16 after midnight' do
    expect(subject.calc_am_rate('12:00 AM', '12:00 AM', '2:00 AM')).to eq 32
  end
end
