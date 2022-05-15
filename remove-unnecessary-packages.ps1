
$packages = @(
    "*CandyCrush*",
    "*Disney*",
    "*Zune*",
    "Clipchamp.Clipchamp",
    "Microsoft.3DBuilder",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.Bing*",
    "Microsoft.Messaging",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MixedReality.Portal",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.SkypeApp",
    "Microsoft.Todos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsMaps",
    "Microsoft.Xbox*Overlay",
    "Microsoft.YourPhone",
    "SpotifyAB.SpotifyMusic",
    "NORDCURRENT.COOKINGFEVER",
    "Microsoft.Office.OneNote",
    "Fitbit.FitbitCoach",
    "microsoft.windowscommunicationsapps"
)

foreach ($pkg in $packages) {
    Write-Output $pkg
    Write-Output "Get-AppxProvisionedPackage"
    Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like $pkg} | Remove-AppxProvisionedPackage
    Write-Output "Get-AppxPackage -AllUsers"
    Get-AppxPackage -AllUsers $pkg | Remove-AppxPackage -AllUsers
    Write-Output "Get-AppxPackage"
    Get-AppxPackage $pkg | Remove-AppxPackage
}