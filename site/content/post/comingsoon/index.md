---
title: "Coming soon"
date: 2022-09-12T14:57:34+01:00
draft: false
image: comingsoon.jpg
categories:
    - 
---


{{< highlight html >}}
<section id="main">
  <div>
   <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{< /highlight >}}

