Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6477AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvRvet5JUV0O0BCBXNWyqzDTPgboMlTxidSUHIx9dHM=; b=RZTlLAudP0llyB
	+SLJmeNdw/d7lJtWYwtsvOa1GBFiN1WqA+4wQc/GZ61NmwtISTkOPbadjHtXaap5d/jmO8UDUbDBE
	6Th/VSxAk0XC7S87+uLzdYqAnWbn/dn/RvadL0hyrp4I5aMxkAt50sc3V7ATDjT+2LPbNNEQ97QLv
	mMItc6y74+aresEJboJus3r1Lc+XUn0LlXJs/kKqZODcJohs5764aF3V0LOG18W8kPlmuOVPFbSck
	pItG/7hwtHC8w5Gu+mWR5INdzdZK1nusCSJY36+0ohdMoTwWtNdsR++2+tou84kYKTSziec/WupGs
	f7+JbWQIvrFDRbNKVLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXmjV-002bQh-8G; Fri, 25 Mar 2022 16:24:13 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXmjS-002bQ6-F4
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 16:24:12 +0000
Received: by mail-ej1-f52.google.com with SMTP id bi12so16431931ejb.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 09:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=60DYi1ncM2j6YrJ9+xc2tJcVqmdNibjYDu1dqzMc90U=;
 b=EfL6+0iteCPdTLCJ0DkRjdjPzQnnQByI7AJ+GxCf8pdt5fZGHsuG77YbXMf0X9VY/e
 7QLhwfQ/X+NjCVtoj5BTkp05DArl7VK9rrga2qzEFSu2+lKZ03R6urDIzLIj+g+oqTdm
 hVxlPKmENfSg//frTJcVq7KM/rwy5Pi7KxX3plQx2A42+utxfm6ZwJtMbj1Bqp3P596q
 dnGb56oz+psXF23fMbj//jpRz/usvOUUk+QBNqwjEp0+VLzIbyUHypWGDiA5FkUCNk1q
 IiCDDjKtoJ/0v5t4Rmrfc5SDvHCoPGX1FYyMXmtD1m247yMfH3f2iY4uHd2oNVk+gKQp
 wn9g==
X-Gm-Message-State: AOAM530dg5zsWCOfK+L6RXy5pVgE2MlbI9wm0U2v1KJkAZqtpcL04vqs
 b0tOpvXcwUMtJpSPqAETXeQ=
X-Google-Smtp-Source: ABdhPJzjldhgEdYua2CoNIuh/dJSlmVw42Q3Lpn4a09I41O1mZibUTcrs4YHyXIE0BApFuhGH4lXMA==
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id
 gb33-20020a170907962100b006d7355d6da5mr12540109ejc.195.1648225447869; 
 Fri, 25 Mar 2022 09:24:07 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 d2-20020a1709067a0200b006df8c996b36sm2484988ejo.26.2022.03.25.09.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:24:07 -0700 (PDT)
Message-ID: <23160ef7-359e-40a6-847c-7547760f041a@kernel.org>
Date: Fri, 25 Mar 2022 17:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220325123707.22020-1-rogerq@kernel.org>
 <20220325123707.22020-2-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325123707.22020-2-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_092410_543502_B6F6B6FC 
X-CRM114-Status: GOOD (  19.37  )
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

On 25/03/2022 13:37, Roger Quadros wrote:
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
> diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
> deleted file mode 100644
> index 59ddc61c1076..000000000000
> --- a/Documentation/devicetree/bindings/mtd/elm.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Error location module
> -
> -Required properties:
> -- compatible: Must be "ti,am3352-elm"
> -- reg: physical base address and size of the registers map.
> -- interrupts: Interrupt number for the elm.
> -
> -Optional properties:
> -- ti,hwmods: Name of the hwmod associated to the elm
> -
> -Example:
> -elm: elm@0 {
> -	compatible = "ti,am3352-elm";
> -	reg = <0x48080000 0x2000>;
> -	interrupts = <4>;
> -};
> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> new file mode 100644
> index 000000000000..e36452b742c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ti,elm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Error Location Module (ELM).
> +
> +maintainers:
> +  - Roger Quadros <rogerq@kernel.org>
> +
> +description:
> +  ELM module is used together with GPMC and NAND Flash to detect
> +  errors and the location of the error based on BCH algorithms
> +  so they can be corrected if possible.
> +
> +properties:
> +  compatible:
> +    const: ti,am3352-elm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

make dtbs complains, but it will be fixed in patch #2, so looks good:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
