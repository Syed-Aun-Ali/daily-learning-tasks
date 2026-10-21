# Day 02 – HTML Structure and Personal Profile Page

**Date:** 21 October 2026
**Topic:** HTML document structure, semantic tags, headings, lists, links, images and tables
**Task:** Build the skeleton of a personal profile page using only HTML (no CSS yet).

---

## What I learned today

- [ ] The basic HTML document structure (`<!DOCTYPE html>`, `<html>`, `<head>`, `<body>`)
- [ ] Headings (`<h1>` to `<h6>`) and why a page should have only one `<h1>`
- [ ] Text tags: `<p>`, `<strong>`, `<em>`, `<br>`, `<hr>`
- [ ] Semantic tags: `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`
- [ ] Lists: unordered (`<ul>`), ordered (`<ol>`) and nested lists
- [ ] Links: to a section on the same page, to another website, `mailto:` and `tel:`
- [ ] Images with `alt` text, and `<figure>` with `<figcaption>`
- [ ] Tables with `<caption>`, `<thead>`, `<tbody>`, `<th>` and `<td>`

*(Tick each box when you are confident about it.)*

## Page structure

```
header   → name, tagline and navigation menu
main
 ├── section #about      → photo and short introduction
 ├── section #skills     → skills table
 ├── section #education  → ordered list (with a nested list)
 ├── section #projects   → article with a figure and a GitHub link
 └── section #contact    → email, phone and GitHub links
footer   → copyright
```

## Folder structure

```
2026-10-21-day-02/
├── README.md
├── index.html
└── images/
    ├── profile.jpg
    └── project1.jpg
```

## How to run

1. Open this folder in VS Code.
2. Right-click `index.html` and choose **Open with Live Server**.
3. Or just double-click `index.html` to open it in your browser.

## Checklist

- [ ] Only one `<h1>` and one `<main>` on the page
- [ ] No `<div>` used, only semantic tags
- [ ] Every nav link goes to the correct section
- [ ] Every image has `alt` text and loads without a 404 error
- [ ] No red errors in the DevTools Console
- [ ] 0 errors in the [W3C Validator](https://validator.w3.org/nu/)

## Mistakes I made and fixed

- *(Write one or two here, for example: "I forgot to close a `<p>` tag, so the heading inside it broke the layout.")*

## Next step

Add styling with CSS and Bootstrap to this page.

---

*Part of my daily web development practice.*
