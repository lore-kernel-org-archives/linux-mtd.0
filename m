Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2ACC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LW/+Phi9t8ZuiE/5+0gtl6IVpHeTqgGD/6exU6kApA=; b=fj+IRPHD+xCzUn
	GPAgEptfdNKBzoUNz2NHVhubOf+2qwb7kqISHgTw8Nb7k9lNPMRkExI5s2sOQtJ6sFxJxoU9mMQk8
	hXLAdGrX8iFVjIR9F8hACQ4eDv7suM9iaz7Ck5eAUkzIW7vPFp39AbZsOPsWDfXc8HS2osuE8mcnb
	HZ/cOmDRefcfmETFUVQJwPbZ4pQy8jkxE+81U6HthHvL2FfcyimmoYzFEyhEplYlmzsHknhFCLolh
	TItYMtVEGBaARJgFA6QWk/XQ3kOnBRWGR/AdFVVt+rGzHfSUyrg3wNLnUK+FKSHtalOR3Z2Z4VD1Z
	7j4eWA6r4MNeQfooKuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXpnv-0037xZ-LU; Fri, 25 Mar 2022 19:40:59 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXpns-0037wt-N2
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 19:40:57 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-de3f2a19c8so9121737fac.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 12:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=39uH3YQKGGZBLgUBUd+I6NQzRCiICBllLB8z6fgI41s=;
 b=L/rMWyBtvglV7xCYW0b5fqmxMKhRO8r32TmmHYDfQHVZR2qhLM7ANt0aroqbU0Ii4E
 EPDrTDuBVe5Zlfsjm47dDaub3sUs/RXPp5pwDdUIsDIQqqA1RYNJA0SBuFC7u4BPBbLs
 yzHHa55G66QV19bry9ewhLY8ccVekOs4BFYMbWzZTvhrpRZrwErOuQ0H0S+eBo6+5L0/
 TT7RPPC6R6KbNeXdh5N7mMINi2Hbz22vyPgkexXZ+gD+tvUtWb3CTf/nbztfhVp2TJI2
 2E4XjykSREiENiFZB5YS6ZwYrZhko7uysl2SGhUTwaEwjYADo8n/LuqzBDRINQ/mUG3f
 ywpw==
X-Gm-Message-State: AOAM532ygc0pT7sjkB6DR6as+BPiXoqeJ4T00yuXLdQxqbgBLdrg0KbA
 ZaDldAg4PrP8K94GgPgLRg==
X-Google-Smtp-Source: ABdhPJzPJFxECJjjfdSMQ4DswXIqKqYxHnVtUvxc97pQEDJj3mfgHirhsL2vS/JmJi8uyarDbtNOvQ==
X-Received: by 2002:a05:6870:a99a:b0:ce:c0c9:64f with SMTP id
 ep26-20020a056870a99a00b000cec0c9064fmr9633791oab.161.1648237255377; 
 Fri, 25 Mar 2022 12:40:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s125-20020acaa983000000b002ecdbaf98fesm3205283oie.34.2022.03.25.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:40:54 -0700 (PDT)
Received: (nullmailer pid 315917 invoked by uid 1000);
 Fri, 25 Mar 2022 19:40:53 -0000
Date: Fri, 25 Mar 2022 14:40:53 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, nm@ti.com,
 richard@nod.at, kishon@ti.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Message-ID: <Yj4axbrQE0vEYDP1@robh.at.kernel.org>
References: <20220325123707.22020-1-rogerq@kernel.org>
 <20220325123707.22020-2-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220325123707.22020-2-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_124056_778746_A8AD88F7 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Mar 2022 14:37:05 +0200, Roger Quadros wrote:
> Convert elm.txt to ti,elm.yaml.
> 
> hwmod framework use is deprecated for new platforms
> so mark it so.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
