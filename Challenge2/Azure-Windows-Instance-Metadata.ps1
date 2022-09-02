#Initialize variables
$ImdsServer = "http://169.254.169.254"
$InstanceEndpoint = $ImdsServer + "/metadata/instance"

#Function to get the instance metadata
function Query-InstanceEndpoint
{
    $uri = $InstanceEndpoint + "?api-version=2021-02-01"
    $result = Invoke-RestMethod -Method GET -NoProxy -Uri $uri -Headers @{"Metadata"="True"}
    return $result
}

#Call the Instance Endpoint function to get the metadata
$result = Query-InstanceEndpoint
$result | ConvertTo-JSON -Depth 99
