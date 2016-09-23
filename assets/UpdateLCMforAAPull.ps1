[DscLocalConfigurationManager()]
Configuration ConfigureLCMforAAPull
{
    param
    (
        [Parameter(Mandatory=$True)]
        $RegistrationUrl = "https://eus2-agentservice-prod-1.azure-automation.net/accounts/2dca0b64-339d-4f41-aefc-70c859c41731",

        [Parameter(Mandatory=$True)]
        [PSCredential]$RegistrationKey = "FPezu+lf2oEnPoZIgvbn2igvW7D0VFLnpe2RZ1A5TXT6OVqJ5mPfL7wdmmhPzSC+68I7zZ1fb6g0ry9MYZ1MZA==",

        [Int]$RefreshFrequencyMins = 30,
            
        [Int]$ConfigurationModeFrequencyMins = 15,
            
        [String]$ConfigurationMode = "ApplyAndAutoCorrect",
            
        [String]$NodeConfigurationName = "ABB_is_default.boklinux4",

        [Boolean]$RebootNodeIfNeeded= $True,

        [String]$ActionAfterReboot = "ContinueConfiguration",

        [Boolean]$AllowModuleOverwrite = $True,

        [String]$Timestamp = ""
    )

    if(!$RefreshFrequencyMins -or $RefreshFrequencyMins -eq "")
    {
        $RefreshFrequencyMins = 30
    }

    if(!$ConfigurationModeFrequencyMins -or $ConfigurationModeFrequencyMins -eq "")
    {
        $ConfigurationModeFrequencyMins = 15
    }

    if(!$ConfigurationMode -or $ConfigurationMode -eq "")
    {
        $ConfigurationMode = "ApplyAndAutoCorrect"
    }

        if(!$ActionAfterReboot -or $ActionAfterReboot -eq "")
    {
        $ActionAfterReboot = "ContinueConfiguration"
    }

    $ConfigurationNames = $NodeConfigurationName
	
    Settings
    {
        RefreshFrequencyMins = $RefreshFrequencyMins
        RefreshMode = "PULL"
        ConfigurationMode = $ConfigurationMode
        AllowModuleOverwrite  = $AllowModuleOverwrite
        RebootNodeIfNeeded = $RebootNodeIfNeeded
        ActionAfterReboot = $ActionAfterReboot
        ConfigurationModeFrequencyMins = $ConfigurationModeFrequencyMins
    }

    ConfigurationRepositoryWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
        ConfigurationNames = $ConfigurationNames
    }

    ResourceRepositoryWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
    }

    ReportServerWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
    }
}