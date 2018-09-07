#$global:encrypted_text = "Lfzcpbse!opu!gpvoe/!Qsftt!G2!up!dpoujovf"
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
function Encrypt_secure([string]$inputString, [int]$addAmt) {
$global:Chipered = $null
$EncodedText = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($InputString))
$global:Chipered += $EncodedText
}
function Decrypt_secure([string]$inputString) {
$global:NonChipered = $null
$EncodedText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($inputString))
Write-Host $EncodedText
$global:NonChipered += $EncodedText
}
function printOptions() {
Write-Host "Do you want to decrypt or encrypt a text?"
Write-Host "1. Encrypt"
Write-Host "2. Decrypt"
Write-Host "3. Encrypt(Secure)"
Write-Host "4. Decrypt(Secure)"
}



PrintOptions
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
#Take the encrypt() function with +3 as the adder. Then encode with base64. Do reverse for decode. 
#Base64 is not secure at all, but I could not find any good examples on AES/RC4. So we just modded RC4 A little :) 
elseif($User_input -eq "3") {
$User_input = Read-Host -Prompt 'Enter string: '
encrypt $User_input "3"
Encrypt_secure $global:$Chipered
Write-Host $global:$Chipered
}
elseif($User_input -eq "4") {
$User_input = Read-Host -Prompt 'Enter string: '
Decrypt_secure $User_input
Decrypt $global:$NonChipered "3"
Write-Host $global:$NonChipered
}
