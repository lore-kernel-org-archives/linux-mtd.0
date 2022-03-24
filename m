Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+bExhTxixmwo7BWCbLzPyVUuOmazM8eKR1qog0KOf0=; b=jWSPqkv06xxxIc
	xL38cecxET8xX2UxphN5KLuqhBVo12XVUM4FZAany73631UrU/eaYxzdCfdAdpvNzpTaeKClu+Oua
	yDN5KWWT3Sk4hu0L8sLRjMKQtNEFxRxpMbZjjjO3VGMA/Gnja8AaOEjbbu1fzzYucaUpdnuMgW75a
	x2oSooDYV6uoRNjaZRqxndENDVS3URpj+lXuHwLueOSkMGVV2ntsMSBB3Lrr1OQbwlyWLSOIOJF9v
	crCu/bV+qokuL8lrOKWMPAoFbTZMtJ7mCTgK6hZBoTF00orMwZibfHwC1zBAt1yAhVwDz+rQoo/Pp
	OnWojPuNSDw4c0B3bBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXS8r-00HX7W-Pb; Thu, 24 Mar 2022 18:25:01 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXS8n-00HX6Z-Ds
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 18:25:00 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so1550800wmq.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2022 11:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OSMRMGJIbC2C7MmSEVIz7xmNnY44imVmj50ReOAokX8=;
 b=LCFQJAY9dxyFhiIbYMXrEbBtnnawlenoLDgXzg5+jsvA0uX+HL4d7q8HsG6bqHNJLc
 3eY0+gsR3VE1FHeH196b8hRsyIejegLY650860XGPGSHd9zSvQA0Uny+5apiuvXOMc7J
 7NR/MKjTn6yTge7uwQONRVFHkDHcrvI043AV2pzEqNQ7wyTF7KdwpbuRuqs4jBAYq4Mk
 5TJDBrDqP5O7s7GxESDpmJVuHpseirkunz76iLwctDI/iTUf+Wh3Io1eQZwAVtuTJTbm
 I/0/swAXgNbao36RTQLTqayMIygxVo62HfHk5sGw6hgDPTFY5A0DABrnNUvoC6I1Bt1U
 y7Dw==
X-Gm-Message-State: AOAM53071Qwa6PMRh+4dXIcnxThv3/hZE0Xnnl3zaf9ySUA56OownYZK
 U1K9MSPYZm2CeOkY8/FBZeF3vY6GRCfQHw==
X-Google-Smtp-Source: ABdhPJw/rF4r9nj7mbhYkVwCX7Am9nyFPeXI9rzmEK5DHmc29JhjK+K5TqRBneG0OxI0IImKNt+b6Q==
X-Received: by 2002:a1c:4e18:0:b0:38c:bd8d:6bd9 with SMTP id
 g24-20020a1c4e18000000b0038cbd8d6bd9mr5945883wmh.94.1648146295269; 
 Thu, 24 Mar 2022 11:24:55 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 l13-20020adfbd8d000000b002040daf5dffsm4763014wrh.18.2022.03.24.11.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:24:54 -0700 (PDT)
Message-ID: <622e5de3-12b3-0f5f-1c1b-6e062c39a626@kernel.org>
Date: Thu, 24 Mar 2022 19:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220323111851.4699-1-rogerq@kernel.org>
 <20220323111851.4699-2-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220323111851.4699-2-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_112457_510261_F27893E7 
X-CRM114-Status: GOOD (  21.01  )
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

On 23/03/2022 12:18, Roger Quadros wrote:
> Convert elm.txt to ti,elm.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 16 deletions(-)
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
> index 000000000000..24ed0fb84204
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> @@ -0,0 +1,48 @@
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
> +    items:

No items, just const.

> +      - const: ti,am3352-elm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    description:
> +      Name of the HWMOD associated with ELM. This is for legacy
> +      platforms only.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true

It was not deprecated before. Could you explain it in commit msg because
it is not a conversion only.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    elm: elm@0 {

This is error correction, right? So generic node name "ecc"?

> +        compatible = "ti,am3352-elm";
> +        reg = <0x0 0x2000>;
> +        interrupts = <4>;
> +    };


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
