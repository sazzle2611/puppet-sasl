# @!visibility private
class sasl::authd::install {

  package { $::sasl::authd::package_name:
    ensure => present,
  }
}
