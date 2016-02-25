# Configuration of SonarQube Runner
class sonarqube::runner::config (
  $package_name,
  $version,
  $installroot,
  $sonarqube_server = 'http://localhost:9000',

  # the same JDBC configuration is located in init.pp
  # has to be a way to have the runner and sonarquebe installer use the same
  # JDBC configuration so they don't get out of sync.
  $jdbc             = {
    url      => 'jdbc:h2:tcp://localhost:9092/sonar',
    username => 'sonar',
    password => 'sonar',
  },
) {
  # Sonar Runner configuration file
  file { "${installroot}/${package_name}-${version}/conf/sonar-runner.properties":
    content => template('sonarqube/sonar-runner.properties.erb'),
    require => Archive["/tmp/${package_name}-dist-${version}.zip"],
  }
}
