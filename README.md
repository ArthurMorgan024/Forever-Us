# For Jaaaanu - Romantic Website

A beautiful romantic website with password protection, music, images, and special effects.

## Features

- Password-protected access
- Background music
- Image gallery (4 images on left, 4 on right)
- Balloons and confetti effects
- Animated background
- Responsive design

## Deployment to GitHub Pages

### Option 1: Using GitHub Desktop (Easiest)

1. Download and install [GitHub Desktop](https://desktop.github.com/)
2. Sign in to your GitHub account
3. Click "File" → "Add Local Repository"
4. Select this project folder
5. Click "Publish repository" (make it public)
6. Go to your repository on GitHub.com
7. Click "Settings" → "Pages"
8. Select "Deploy from a branch" → choose "main" branch → "/ (root)"
9. Click "Save"
10. Your site will be live at: `https://yourusername.github.io/repository-name/`

### Option 2: Using Git Command Line

1. Install Git from [git-scm.com](https://git-scm.com/download/win)
2. Open PowerShell in this folder
3. Run these commands:

```powershell
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/your-repo-name.git
git push -u origin main
```

4. Go to GitHub repository → Settings → Pages
5. Select "Deploy from a branch" → "main" → "/ (root)"
6. Your site will be live!

## Important Notes

- Make sure the HTML file is named `index.html` (not `index (1).html`)
- All image files must be in the same folder
- Audio file must be in the same folder
- GitHub Pages supports static files (HTML, CSS, JS, images, audio)

## File Structure

```
project/
├── index.html (or index (1).html - rename to index.html)
├── photo_2025-12-28_21-01-04.jpg
├── photo_2025-12-28_21-01-07.jpg
├── photo_2025-12-28_21-01-13.jpg
├── photo_2025-12-28_21-01-16.jpg
├── photo_2025-12-28_21-01-20.jpg
├── photo_2025-12-28_21-01-23.jpg
├── photo_2025-12-28_21-01-33.jpg
├── photo_2025-12-28_21-01-36.jpg
└── WhatsApp Audio 2025-12-28 at 8.13.57 PM.mpeg
```

## Password

Default password: `forever.us`

