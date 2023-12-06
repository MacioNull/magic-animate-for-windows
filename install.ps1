Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1

if (!(Test-Path -Path "venv")) {
    Write-Output  "Creating venv for python..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "Installing deps..."
pip install -U -r requirements-windows.txt

Write-Output "Checking models..."

if (!(Test-Path -Path "pretrained_models")) {
    Write-Output  "Creating pretrained_models..."
    mkdir "pretrained_models"
}

Set-Location .\pretrained_models

if (!(Test-Path -Path "MagicAnimate")) {
    Write-Output  "Downloading MagicAnimate models..."
    git clone https://huggingface.co/zcxu-eric/MagicAnimate
}

$install_SD15 = Read-Host "Do you need to download SD15? If you don't have any SD15 model locally select y, if you want to change to another SD1.5 model select n. [y/n] (Default is y)"
if ($install_SD15 -eq "y" -or $install_SD15 -eq "Y" -or $install_SD15 -eq ""){
    if (!(Test-Path -Path "stable-diffusion-v1-5")) {
    Write-Output  "Downloading stable-diffusion-v1-5 models..."
    git clone https://huggingface.co/bdsqlsz/stable-diffusion-v1-5
    }
}

Write-Output "Install completed"
Read-Host | Out-Null ;
