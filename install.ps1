# Lazy3D – inštalácia jedným príkazom vo Windows (bez upozornenia SmartScreen, lebo súbor nesťahuje prehliadač).
# Stiahne najnovší inštalátor z GitHubu, nainštaluje Lazy3D pre prihláseného používateľa (bez správcu) a otvorí ho.
#   irm https://raw.githubusercontent.com/Dionissro/lazy3d-releases/main/install.ps1 | iex
& {
  $ErrorActionPreference = 'Stop'
  $ProgressPreference = 'SilentlyContinue' # v starom PowerShelli inak sťahovanie výrazne spomalí
  [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

  $url = 'https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D-Setup.exe'
  $setup = Join-Path $env:TEMP ('Lazy3D-Setup-' + [guid]::NewGuid().ToString('N') + '.exe')
  try {
    Write-Host 'Sťahujem Lazy3D (asi 120 MB)…'
    Invoke-WebRequest -Uri $url -OutFile $setup -UseBasicParsing
    Write-Host 'Inštalujem…'
    # /S = bez okien, /RUN = po inštalácii otvoriť; bežiace Lazy3D inštalátor zavrie sám.
    # Nie Start-Process -Wait – to čaká aj na spustené Lazy3D, kým sa nezavrie.
    $p = Start-Process -FilePath $setup -ArgumentList '/S', '/RUN' -PassThru
    $null = $p.Handle # bez toho Windows PowerShell nevráti ExitCode
    $p.WaitForExit()
    if ($p.ExitCode -ne 0) { throw "inštalátor skončil s kódom $($p.ExitCode)" }
    $exe = Join-Path $env:LOCALAPPDATA 'Programs\Lazy3D\Lazy3D.exe'
    $ver = (Get-Item $exe).VersionInfo.ProductVersion
    Write-Host "Hotovo – Lazy3D $ver je nainštalované (ponuka Štart a plocha) a práve sa otvára." -ForegroundColor Green
  } catch {
    Write-Host "CHYBA: $($_.Exception.Message)" -ForegroundColor Red
  } finally {
    Remove-Item $setup -Force -ErrorAction SilentlyContinue
  }
}
