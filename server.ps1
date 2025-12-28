$port = 8000
$url = "http://localhost:$port/"
$path = $PSScriptRoot

Write-Host "Starting HTTP Server..." -ForegroundColor Green
Write-Host "Serving files from: $path" -ForegroundColor Yellow
Write-Host "Open your browser and go to: $url" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Gray
Write-Host ""

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $localPath = $request.Url.LocalPath
        if ($localPath -eq "/") {
            $localPath = "/index (1).html"
        }
        
        $filePath = Join-Path $path $localPath.TrimStart('/')
        $filePath = $filePath -replace '%20', ' '
        
        if (Test-Path $filePath) {
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $extension = [System.IO.Path]::GetExtension($filePath).ToLower()
            
            $contentType = switch ($extension) {
                ".html" { "text/html; charset=utf-8" }
                ".css" { "text/css" }
                ".js" { "application/javascript" }
                ".jpeg" { "image/jpeg" }
                ".jpg" { "image/jpeg" }
                ".png" { "image/png" }
                ".gif" { "image/gif" }
                ".mpeg" { "audio/mpeg" }
                ".mp3" { "audio/mpeg" }
                ".mp4" { "video/mp4" }
                default { "application/octet-stream" }
            }
            
            $response.ContentType = $contentType
            $response.ContentLength64 = $content.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
            $notFound = [System.Text.Encoding]::UTF8.GetBytes("404 - File Not Found")
            $response.ContentLength64 = $notFound.Length
            $response.OutputStream.Write($notFound, 0, $notFound.Length)
        }
        
        $response.Close()
    }
} finally {
    $listener.Stop()
    Write-Host "`nServer stopped." -ForegroundColor Red
}

