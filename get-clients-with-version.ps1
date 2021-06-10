$clientJson=ceph tell mds.0 client ls | convertfrom-json
foreach ($client in $clientJson) {
  $id=$client.id
  $address=$client.inst.split(':')[1]
  $clienthostname=$client.client_metadata.hostname
  if ($client.client_metadata.ceph_version) {$version=$client.client_metadata.ceph_version.split(' ')[2]}
  else { $version='not reported' }
  "$id,$address,$clienthostname,$version" 
}
