---
title: "First post"
date: 2022-03-05T14:57:34+01:00
draft: false
image: monstera.jpg
categories:
    - Minimalism
---
I'm at the cabin

{{< tweet user="SanDiegoZoo" id="1453110110599868418" >}}

[Neat]({{< ref "page/about.md" >}})
[Who]({{< relref "about.md#about-this-site" >}})

{{< param categories >}}

{{< highlight go >}} A bunch of code here {{< /highlight >}}

{{< gist spf13 7896402 >}}

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

