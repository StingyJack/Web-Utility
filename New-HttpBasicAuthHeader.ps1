function New-HttpBasicAuthHeader
{
    [CmdletBinding()]
    Param(
        [string]$UserName,
        [string]$Password
    )
    

    $plaintext= "$($UserName):$($Password)"
    $encoded = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($plaintext))

    $headerValue= "Basic $encoded"
    $headers = @{
        Authorization = $headerValue
    }
    return $headers
}