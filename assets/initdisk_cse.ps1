param(
  [parameter(Mandatory=$false)] [string]$disks
)

if($disks -ne "0"){
    $friendlypoolname = "primarydiskpool"
    $dktopool = Get-PhysicalDisk | Where-Object {$_.CanPool -eq $true}
    $subsystem = Get-StorageSubSystem
    New-StoragePool -FriendlyName $friendlypoolname -StorageSubSystemFriendlyName $subsystem.FriendlyName -PhysicalDisks $dktopool
    $protype = "fixed"
    $resilsetting = "Simple"
    $count = 0;
    Start-Sleep -s 10
    $adisks = $disks.Split(",")
    foreach ($disk in $adisks){
        $disk = [int32]$disk 
        $vdisk = New-VirtualDisk -StoragePoolFriendlyName $friendlypoolname -FriendlyName ("DataDisk_"+$count)  -Size ($disk*1GB) -ResiliencySettingName $resilsetting -ProvisioningType $protype
        Initialize-Disk -VirtualDisk (Get-VirtualDisk -FriendlyName ("DataDisk_"+$count))
        $curdisk = get-disk -VirtualDisk $vdisk
        $partition = New-Partition -DiskNumber $curdisk.Number -UseMaximumSize -AssignDriveLetter
        Format-Volume -DriveLetter $partition.DriveLetter -Confirm:$false | out-null
        $count++
    }
}
