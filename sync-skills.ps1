# sync-skills.ps1
# Auto-commits and pushes any changes in the claude-skills repo to GitHub

$repoDir = "C:\Users\prateesingh\Desktop\AC\claude-skills"
Set-Location $repoDir

# Check if there are any changes
$status = git status --porcelain
if (-not $status) {
    Write-Host "No changes to sync."
    exit 0
}

# Stage all changes
git add .

# Build a commit message listing changed skills
$changed = git diff --cached --name-only | ForEach-Object { ($_ -split '/')[0] } | Sort-Object -Unique | Where-Object { $_ -ne 'README.md' -and $_ -ne 'sync-skills.ps1' }
if ($changed) {
    $msg = "Update skills: " + ($changed -join ", ")
} else {
    $msg = "Update claude-skills repo"
}

git commit -m "$msg"
git push origin main

Write-Host "Synced to GitHub: $msg"
