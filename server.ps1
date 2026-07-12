# TaskNest local launcher — serves the app and stores your data in a real file
# on disk (tasknest-data.json), completely outside the browser. This means
# clearing your browsing data NEVER affects your tasks, and the app reloads
# your data automatically every time — no re-linking, fully seamless.
#
# Uses only Windows' built-in PowerShell. No Node, no Python, no installs.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root
$dataFile = Join-Path $root 'tasknest-data.json'

$listener = New-Object System.Net.HttpListener
$port = 0
foreach ($p in 8787..8797) {
  try {
    $listener.Prefixes.Clear()
    $listener.Prefixes.Add("http://localhost:$p/")
    $listener.Start()
    $port = $p
    break
  } catch { }
}
if ($port -eq 0) {
  Write-Host "Could not start the local server (ports 8787-8797 are busy)." -ForegroundColor Red
  Read-Host "Press Enter to exit"
  exit 1
}

$url = "http://localhost:$port/"
Write-Host ""
Write-Host "  TaskNest is running at $url" -ForegroundColor Green
Write-Host "  Your data is saved in: $dataFile"
Write-Host "  Keep this window open while using the app. Close it to stop TaskNest."
Write-Host ""
Start-Process $url

$ctypes = @{
  '.html'='text/html; charset=utf-8'; '.js'='application/javascript'; '.mjs'='application/javascript';
  '.svg'='image/svg+xml'; '.json'='application/json'; '.webmanifest'='application/manifest+json';
  '.css'='text/css'; '.png'='image/png'; '.ico'='image/x-icon'; '.txt'='text/plain'
}
$rootFull = [System.IO.Path]::GetFullPath($root)

while ($listener.IsListening) {
  $ctx = $null
  try {
    $ctx = $listener.GetContext()
    $req = $ctx.Request
    $res = $ctx.Response
    $path = [System.Uri]::UnescapeDataString($req.Url.AbsolutePath)

    if ($path -eq '/api/data') {
      $res.Headers['Cache-Control'] = 'no-store'
      if ($req.HttpMethod -eq 'GET') {
        $res.ContentType = 'application/json; charset=utf-8'
        if (Test-Path $dataFile) { $bytes = [System.IO.File]::ReadAllBytes($dataFile) }
        else { $bytes = New-Object byte[] 0 }
        $res.OutputStream.Write($bytes, 0, $bytes.Length)
      }
      elseif ($req.HttpMethod -eq 'POST') {
        $reader = New-Object System.IO.StreamReader($req.InputStream, $req.ContentEncoding)
        $body = $reader.ReadToEnd(); $reader.Close()
        $tmp = "$dataFile.tmp"
        $utf8 = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($tmp, $body, $utf8)
        Move-Item -Force $tmp $dataFile
        $res.StatusCode = 204
      }
      else { $res.StatusCode = 405 }
    }
    else {
      $rel = $path.TrimStart('/')
      if ([string]::IsNullOrWhiteSpace($rel)) { $rel = 'index.html' }
      $file = Join-Path $root $rel
      $full = [System.IO.Path]::GetFullPath($file)
      if ($full.StartsWith($rootFull) -and (Test-Path $full -PathType Leaf)) {
        $ext = [System.IO.Path]::GetExtension($full).ToLower()
        if ($ctypes.ContainsKey($ext)) { $res.ContentType = $ctypes[$ext] } else { $res.ContentType = 'application/octet-stream' }
        $bytes = [System.IO.File]::ReadAllBytes($full)
        $res.OutputStream.Write($bytes, 0, $bytes.Length)
      } else {
        $res.StatusCode = 404
      }
    }
    $res.OutputStream.Close()
  } catch {
    if ($ctx -ne $null) { try { $ctx.Response.StatusCode = 500; $ctx.Response.OutputStream.Close() } catch {} }
  }
}
