# Installation of SonarQube Runner
class sonarqube::runner::install (
  $package_name = "scanner",
  $version = "2.5",
  $installroot = "/usr/local/",
  $download_url = "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli"
) {
  include ::archive

  $tmpzip = "/tmp/${package_name}-dist-${version}.zip"

  archive { "${tmpzip}" :
    ensure      => present,
    source      => "${download_url}/${version}/sonar-runner-dist-${version}.zip",
    extract     => true,
    extract_path  => "${installroot}",
  }

  # Sonar settings for terminal sessions.
  file { '/etc/profile.d/sonarhome.sh':
    content => 'export SONAR_RUNNER_HOME=/usr/local/sonar-runner',
  }
}
