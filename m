Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FACC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 23:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhTYRB8vWJTC9+2H7BDy/r0ET12VCMgaqdutzfC6J+A=; b=useAIh5+CLou72
	6JdDJyCeKAXA663RB43my5E35TQ6IgBlqj5iADFIJpjxnEFRpNWCEiLLMzsymQfMAH85LfQw8LKjl
	6WCscb6CGarFxJO1ZqwEOkjPZhNJPBaBZW4kE6hOrll8gnxH2uY+7ngI8r7FwDLUmcbJe1wypt8k4
	XrlVR3K1ONCXtQeuUxfiVawDugZXOe7nMHyhAUP2RUx6eLYnTi4sPREen6/ehNIAaMvoL2+SdZKrL
	cvV10+bnd+Bwjq6PzZew9sWXB/lr5k+Q018UGXVv3Kz5YcXqSozFx0bCvPlWmiUcExh4fRt3Vk31i
	HeV4OQUzOGQI6r7VpK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msYtl-00AKKf-Kw; Wed, 01 Dec 2021 23:20:25 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msYtj-00AKKG-7w
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 23:20:24 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso37501200otf.12
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 15:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3VfKp0svPniJPx3S2KRfg6+sZau5YCfKLct8VulnAI=;
 b=ETemT/xlDHAKCGhuf4n8u1Yd8+Lz9d057vLLsHczY2tHrAfmqrwfTP5w5wwMONiq28
 4syicUK6t+tqsho4FSc7asgVt/VFcr7TBfWpRtd64nQ1G1AYwTP8e0XnVcxG3vGLrhDt
 6HdX9A3yNOgu5PxLTYdggtORl40W9HDnf5yq/IYRQlceebhGFJyQ4AXWilxEkNw3DtEd
 QZW/qYoCa7d+0tbI8Cvkl417TmG8BHMbS6ydVBIokyTiKwg/n1+5/lpRfTwh3nh0BquO
 yeSujZousM9KmvKxbmTOMqaFkCfYDqGCpZjRC5a2ksijwLaqrfEuCMQD3py8uqsmRIg1
 tjVg==
X-Gm-Message-State: AOAM533/4VZ0BtRO1fhJNMiakGX3W2QXjwtzsfEux6pXepvTW5MmmTsC
 PevqfsGOdpz8mWgShni9pw==
X-Google-Smtp-Source: ABdhPJwgXa+JwMa+UIdiWdNVSPZAGFCYemTgRhJO5gLo2NywfsC7syhoN5+dj5qjTcDpaGEdqoWfUg==
X-Received: by 2002:a05:6830:2b14:: with SMTP id
 l20mr8617911otv.42.1638400822290; 
 Wed, 01 Dec 2021 15:20:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bb8sm629332oib.9.2021.12.01.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:20:21 -0800 (PST)
Received: (nullmailer pid 3150169 invoked by uid 1000);
 Wed, 01 Dec 2021 23:20:20 -0000
Date: Wed, 1 Dec 2021 17:20:20 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 03/20] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Message-ID: <YagDNLy+gGFiH5oU@robh.at.kernel.org>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <20211126113924.310459-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126113924.310459-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_152023_317964_AE842783 
X-CRM114-Status: GOOD (  26.53  )
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

On Fri, Nov 26, 2021 at 12:39:07PM +0100, Miquel Raynal wrote:
> Move the NAND chip description out of the NAND controller file. Indeed,
> a subsequent part of the properties supported by a raw NAND chip are
> also supported by SPI-NAND chips. So let's create a generic NAND chip
> description which will be pulled by nand-controller.yaml and later by
> spi-nand.yaml as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 71 +++++++++++++++++++
>  .../bindings/mtd/nand-controller.yaml         | 53 ++------------
>  2 files changed, 75 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-chip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> new file mode 100644
> index 000000000000..6d13e8cdbb21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND Chip and NAND Controller Generic Binding
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +description: |
> +  This file covers the generic description of a NAND chip. It implies that the
> +  bus interface should not be taken into account: both raw NAND devices and
> +  SPI-NAND devices are concerned by this description.
> +
> +properties:
> +  reg:
> +    description:
> +      Contains the chip-select IDs.
> +
> +  nand-ecc-engine:
> +    allOf:

Can you drop the allOf here.

> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle on the hardware ECC engine if any. There are
> +      basically three possibilities:
> +      1/ The ECC engine is part of the NAND controller, in this
> +      case the phandle should reference the parent node.
> +      2/ The ECC engine is part of the NAND part (on-die), in this
> +      case the phandle should reference the node itself.
> +      3/ The ECC engine is external, in this case the phandle should
> +      reference the specific ECC engine node.
> +
> +  nand-use-soft-ecc-engine:
> +    type: boolean
> +    description: Use a software ECC engine.
> +
> +  nand-no-ecc-engine:
> +    type: boolean
> +    description: Do not use any ECC correction.
> +
> +  nand-ecc-algo:
> +    description:
> +      Desired ECC algorithm.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [hamming, bch, rs]
> +
> +  nand-ecc-strength:
> +    description:
> +      Maximum number of bits that can be corrected per ECC step.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +
> +  nand-ecc-step-size:
> +    description:
> +      Number of data bytes covered by a single ECC step.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +
> +  secure-regions:
> +    $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +    description:
> +      Regions in the NAND chip which are protected using a secure element
> +      like Trustzone. This property contains the start address and size of
> +      the secure regions present.
> +
> +required:
> +  - reg
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 5cd144a9ec99..44825dc95412 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -52,32 +52,15 @@ properties:
>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
> +
> +    allOf:

Also not needed here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +      - $ref: "nand-chip.yaml#"
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
