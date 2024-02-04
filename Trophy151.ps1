# This is a quick and dirty PowerShell script I cobbled together to count how many Eldritch Tentacles have been fought (not necessarily beaten) during a manually-defined set of session logs.
# Mainly for the purpose of obtaining Trophy Number 151 (https://kol.coldfront.net/thekolwiki/index.php/Tentacle_Tickler)

# STEP 1: Manually copy your session logs from the date of your most recent ascension. Paste them into a temporary directory of your choosing. This could be automated, but I'm lazy.
# STEP 2: Enter your desired session log temporary folder for $Path below.
# STEP 3: Run the script below via PowerShell:

$Path = "C:\Users\<your path here\"
$Text = "Encounter: Eldritch Tentacle named"
$PathArray = @()

# This section finds all of the files in $Path that end in ".txt" and contain your desired $Text.
Get-ChildItem $Path -Filter "*.txt" |
Where-Object { $_.Attributes -ne "Directory"} |
ForEach-Object {
If (Get-Content $_.FullName | Select-String -Pattern $Text) {
$PathArray += $_.FullName
$PathArray += $_.FullName
}
}
Write-Host "Contents of ArrayPath:"

# Shows the number of Eldritch Tentacles you've fought:
$PathArray|measure -line
