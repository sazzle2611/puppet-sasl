require 'spec_helper'

describe 'sasl' do

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it { expect { should compile }.to raise_error(/not supported on an Unsupported/) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}", :compile do
      let(:facts) do
        facts
      end

      it { should contain_class('sasl') }
      it { should contain_class('sasl::config') }
      it { should contain_class('sasl::install') }
      it { should contain_class('sasl::params') }

      case facts[:osfamily]
      when 'Debian'
        it { should contain_file('/usr/lib/sasl2') }
        it { should contain_file('/usr/lib/sasl2/berkeley_db.active') }
        it { should contain_file('/usr/lib/sasl2/berkeley_db.txt') }
        it { should contain_package('libsasl2-2') }
      when 'RedHat'
        it { should contain_file('/etc/sasl2') }
        it { should contain_package('cyrus-sasl-lib') }
      end
    end
  end
end
