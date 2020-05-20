#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests
run_only_test() {
  if [[ "$SUT_IP" != "$1" ]] && [[ "$SUT_IP" != "$2" ]] && [[ "$SUT_IP" != "$2" ]]; then
    skip
  fi
}

#setup() {
#  run_only_test "172.18.0.3" "172.18.0.4" "172.18.0.5"
#}


@test 'Prometheus listens 6900' {
  run bash -c "curl http://${SUT_IP}:6900/metrics"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'go_goroutines' ]]
}

@test 'Prometheus config file exists' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds/TRAVIS/prometheus-0/prometheus.yml"
  echo "output: "$output
  [[ "${status}" -eq "0" ]]
}

@test 'All targets contain valid YAML' {
    run bash -c "docker exec -ti ${SUT_ID} find /etc/oio/sds/TRAVIS/prometheus-0/ -name \*.yml -exec python -c \
    'import sys,yaml; yaml.load(open(sys.argv[1]).read(), Loader=yaml.SafeLoader);' {} \;"
    echo "output: "$output
    [[ "${output}" -eq "" ]]
}
