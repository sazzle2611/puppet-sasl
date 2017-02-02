require 'spec_helper'

if Puppet.version.to_f >= 4.4
  describe 'test::auxprop', type: :class do
    describe 'accepts auxprop plugins' do
      [
        'ldapdb',
        'sasldb',
        'sql',
      ].each do |value|
        describe value.inspect do
          let(:params) {{ value: value }}
          it { is_expected.to compile }
        end
      end
    end
    describe 'rejects other values' do
      [
        123,
        'invalid',
      ].each do |value|
        describe value.inspect do
          let(:params) {{ value: value }}
          it { is_expected.to compile.and_raise_error(/parameter 'value' /) }
        end
      end
    end
  end
end
