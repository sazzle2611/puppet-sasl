# @!visibility private
class sasl::authd::service {

  service { $::sasl::authd::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => $::sasl::authd::hasstatus,
    hasrestart => true,
  }
}
