# @!visibility private
class sasl::install {

  package { $::sasl::package_name:
    ensure => present,
  }
}
