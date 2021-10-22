Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6A2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 22:48:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43369604DA
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 22:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43369604DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSp1JTkt1zxIrQ6pESUNZCZFszgXLvW0dCKgUUXulfc=; b=UhfmYX47QYVjZY
	Mh+8lEKcPNqpwT4ysuewNaxVn4tGdADpJW8edT22fyLHKiWp8PVo0Hgv0TJEF3CJC+TGLvszYILzY
	877uLKSlpxWi1RZHbxz/vIN5fJtXeyuf10OCJhz3oQ3NxQk74ANMg/U7jhhu7kib/eopbo9wO+IYM
	1rkQAQuD64w1LEvjvBdTKVDhv2+3OBqgVJJoDv6U0zdGf+loQRVYq9tsvxghq9DJem1q1awY8aTEd
	GypvAJ3ok/Dh7P9QFoGdECc6qJkZ8fblPI9tqSRWPSuEALu20bBbgZwHCHUqdVjz5HF//2ww9Lcob
	8baXfDWMPOibALpyPdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me3K7-00C43b-Q1; Fri, 22 Oct 2021 22:47:39 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me3K4-00C41o-2Q
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 22:47:37 +0000
Received: by mail-oi1-f181.google.com with SMTP id bk18so6837534oib.8
 for <linux-mtd@lists.infradead.org>; Fri, 22 Oct 2021 15:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NuD6bogNZk9RrvAuHPuJ1Tao9hcVN0ozF9HHBb/7+oc=;
 b=bwZ3GVUzqlTMbjSBeqzKTnaXjIzMyUasnQSAVItrnbVN6VWwkr48EG7I6fBhFGOX9K
 7/bMbp8OHsEmXFSDhIqoXgtnJhModH7B3nEmjyfffjPyTu+VBFIZFQJNVqvyxfZWW0n5
 ynsux04RzFw8O5zrP0SnSPSxO3atW9k/YJCNVG5F6NSvM1Y+CV+JiStCfc9ef5b/dSxu
 jUDQMY0wAYGNNkCGvDGO5wewbiN2eXNNICi+SpoWGqZdf8KHVY+aMpYctI/vM2q++Hrp
 qaRfrzLmKGrPQYfQONFcz4AdbokFxyDhdZbF6P7fce8CGs6L057eNsumqd0vMI5PHSU1
 GSDA==
X-Gm-Message-State: AOAM532YIr4BvLi1DqKJz5BE2U8PtBy9s52oHwu0yBL7LHkzUa3D+wxu
 ow9YjFMzb+foruTUS+GQGA==
X-Google-Smtp-Source: ABdhPJxlp2fL4Skst4jfVYsFRVcGyOBV+4iSlYe8p+vWxwSKWx6gTbwQwo/LS4qXMBg51++bzqqYQQ==
X-Received: by 2002:a05:6808:ec3:: with SMTP id
 q3mr1836622oiv.57.1634942852960; 
 Fri, 22 Oct 2021 15:47:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f13sm1953909oto.53.2021.10.22.15.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 15:47:32 -0700 (PDT)
Received: (nullmailer pid 3310215 invoked by uid 1000);
 Fri, 22 Oct 2021 22:47:30 -0000
Date: Fri, 22 Oct 2021 17:47:30 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>
Subject: Re: [PATCH 03/18] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Message-ID: <YXM/giZYKFc0BJHe@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_154736_144750_3BB1BC3B 
X-CRM114-Status: GOOD (  25.91  )
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

On Wed, Oct 20, 2021 at 04:27:54PM +0200, Miquel Raynal wrote:
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
> index 000000000000..1f230a3ee27d
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
> +additionalProperties: false

This is the source of the errors reported as this wasn't set before. If 
we're allowing custom properties (not defined here) within nand chip 
nodes, then each schema with custom properties has to reference 
nand-chip.yaml, set 'unevaluatedProperties: false', and then define 
their custom properties. And then this needs to be true. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
