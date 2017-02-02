require 'spec_helper'

if Puppet.version.to_f >= 4.4
  describe 'test::hostport', type: :class do
    describe 'accepts hosts and host+port tuples' do
      [
        '127.0.0.1',
        'host.example.com',
        ['127.0.0.1', 143],
        ['host.example.com', 143],
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
        ['127.0.0.1', '123'],
        '256.0.0.1',
        ['127.0.0.1', 65536],
      ].each do |value|
        describe value.inspect do
          let(:params) {{ value: value }}
          it { is_expected.to compile.and_raise_error(/parameter 'value' /) }
        end
      end
    end
  end
end
