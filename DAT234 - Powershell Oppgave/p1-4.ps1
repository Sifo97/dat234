$global:encrypted_text = "Lfzcpbse!opu!gpvoe/!Qsftt!G2!up!dpoujovf"
$global:NonChipered = $null
$global:Chipered = $null
function decrypt([string]$inputString, [int]$decAmt) {
$global:NonChipered = $null
$StringArray = $inputString.TocharArray()
foreach ($SingleChar in $StringArray) {
$NewChar = [int][char]$SingleChar
$NewChar = $NewChar - $decAmt
$DecryptedChar = [char][int]$Newchar
$global:NonChipered += $DecryptedChar
}
}
function encrypt([string]$inputString, [int]$addAmt) {
$global:Chipered = $null
$StringArray = $inputString.TocharArray()
foreach ($SingleChar in $StringArray) {
$NewChar = [int][char]$SingleChar
$NewChar = $NewChar + $addAmt
$DecryptedChar = [char][int]$Newchar
$global:Chipered += $DecryptedChar
}
}
Write-Host "Do you want to decrypt or encrypt a text?"
Write-Host "1. Encrypt"
Write-Host "2. Decrypt"
$User_input = Read-Host -Prompt 'Enter option(1 or 2)'
if ($User_input -eq "1") {
Write-Host "Enter something to encrypt"
$Encrypt_input = Read-Host -Prompt 'Enter text to encrypt'
encrypt $Encrypt_input "1"
Write-Host $global:$Chipered
}
elseif($User_input -eq "2") {
$Decrypt_input = Read-Host -Prompt 'Enter text to decrypt'
decrypt $Decrypt_input "1"
Write-Host $global:$NonChipered
}
