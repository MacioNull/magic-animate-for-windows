Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1

if (!(Test-Path -Path "venv")) {
    Write-Output  "����python���⻷��venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "��װ����..."
pip install -U -r requirements-windows.txt -i https://mirror.baidu.com/pypi/simple

Write-Output "���ģ��..."

if (!(Test-Path -Path "pretrained_models")) {
    Write-Output  "����ģ���ļ���..."
    mkdir "pretrained_models"
}

Set-Location .\pretrained_models

if (!(Test-Path -Path "MagicAnimate")) {
    Write-Output  "����MagicAnimateģ��..."
    git clone https://huggingface.co/zcxu-eric/MagicAnimate
}
if (Test-Path -Path "MagicAnimate/.git/lfs") {
    Remove-Item -Path MagicAnimate/.git/lfs/* -Recurse -Force
}

$install_SD15 = Read-Host "�Ƿ���Ҫ����huggingface��SD15ģ��? ��������û���κ�SD15ģ��ѡ��y�������Ҫ������SD1.5ģ��ѡ�� n��[y/n] (Ĭ��Ϊ y)"
if ($install_SD15 -eq "y" -or $install_SD15 -eq "Y" -or $install_SD15 -eq "") {
    if (!(Test-Path -Path "stable-diffusion-v1-5")) {
        Write-Output  "���� stable-diffusion-v1-5 ģ��..."
        git clone https://huggingface.co/bdsqlsz/stable-diffusion-v1-5
        
    }
    if (Test-Path -Path "stable-diffusion-v1-5/.git/lfs") {
        Remove-Item -Path stable-diffusion-v1-5/.git/lfs/* -Recurse -Force
    }
}

Write-Output "��װ���"
Read-Host | Out-Null ;
