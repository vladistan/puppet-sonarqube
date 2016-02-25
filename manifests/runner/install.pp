# Installation of SonarQube Runner
class sonarqube::runner::install (
  $package_name,
  $version,
  $download_url,
  $installroot,
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
