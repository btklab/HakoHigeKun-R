# ============================================
# setup-offline.ps1
# Prepare local dependencies for offline use
# ============================================

# Define the library directory
$libDir = Join-Path $PSScriptRoot "../libs"
if (-not (Test-Path $libDir)) {
    New-Item -ItemType Directory -Path $libDir | Out-Null
    Write-Host "📁 Created directory: $libDir"
}

# List of files to download
$files = @(
    @{ Url = "https://cdn.tailwindcss.com";                               Out = "tailwindcss.js" },
    @{ Url = "https://cdn.plot.ly/plotly-2.32.0.min.js";                  Out = "plotly-2.32.0.min.js" },
    @{ Url = "https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.4.1/papaparse.min.js"; Out = "papaparse.min.js" },
    @{ Url = "https://cdn.sheetjs.com/xlsx-0.20.1/package/dist/xlsx.full.min.js";        Out = "xlsx.full.min.js" }
)

# Download each file into the "libs" folder
foreach ($f in $files) {
    $dest = Join-Path $libDir $f.Out
    Write-Host "⬇️  Downloading $($f.Out)..."
    Invoke-WebRequest -Uri $f.Url -OutFile $dest -UseBasicParsing
}

Write-Host ""
Write-Host "✅ All libraries have been downloaded successfully!"
Write-Host "📂 Location: $libDir"
Write-Host ""
Write-Host "You can now open 'index.html' in your browser completely offline."
