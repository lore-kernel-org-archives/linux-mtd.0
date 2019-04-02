Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A4AC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 06:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9722820840
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 06:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QgWGPICg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9722820840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzZ3X+QvFEGLQGQeIr0H07CRCvhFzi6j6rJxFY4K97I=; b=QgWGPICgPOEtey
	FbBXY6tCiiRk3lIDbQ0C/DRP3ccgsfWBb48jzAwAvKsr6cLsm31jKZXZgLmBgYv1fk+lVxZvPJxab
	OGe5zAM9gUu5Nvce7v2enH+3hXlhUx6W4nPb6McON4hW0tv6meiU6N60TO84YlGI4wbvW/IrDAIpd
	XWgE7FHkH7DRmE0oX4VTLCP4/iznHTWNcgC82ZkfOAdff+hYKkTLxcQk0tsYVfyY8+vN5HZCmGJFQ
	hjmIe/kA0jTjsQnuMZGTANAgt7hxKAScluc9oxcoBThUL/VDo7RYS5IOXiO8zJ/XK+QwE9g4iv2tp
	ftYxAqSNIQMcu3JwxJxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBChh-0001zs-1K; Tue, 02 Apr 2019 06:15:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBChW-0001W1-6E; Tue, 02 Apr 2019 06:15:17 +0000
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 525D5E000A;
 Tue,  2 Apr 2019 06:15:06 +0000 (UTC)
Date: Tue, 2 Apr 2019 08:15:05 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Message-ID: <20190402061505.34r53q75spqtuqcv@flea>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_231514_640916_EF63436B 
X-CRM114-Status: GOOD (  26.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Mon, Apr 01, 2019 at 08:58:49PM -0500, Rob Herring wrote:
> On Mon, Apr 1, 2019 at 4:14 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The NAND chips in MTD have a bunch of generic options that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > new file mode 100644
> > index 000000000000..05b1afb34972
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NAND Chip and NAND Controller Generic Binding
> > +
> > +maintainers:
> > +  - Boris Brezillon <bbrezillon@kernel.org>
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +  - Richard Weinberger <richard@nod.at>
> > +
> > +description: |
> > +  The NAND controller should be represented with its own DT node, and
> > +  all NAND chips attached to this controller should be defined as
> > +  children nodes of the NAND controller. This representation should be
> > +  enforced even for simple controllers supporting only one chip.
> > +
> > +  The ECC strength and ECC step size properties define the correction
> > +  capability of a controller. Together, they say a controller can
> > +  correct {strength} bit errors per {size} bytes.
> > +
> > +  The interpretation of these parameters is implementation-defined, so
> > +  not all implementations must support all possible
> > +  combinations. However, implementations are encouraged to further
> > +  specify the value(s) they support.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^nand-controller(@.*)?"
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  ranges: true
>
> 'ranges' should not be here as nand chip addresses are not translatable.

Apparently, some are. It was part of the original binding, hence why
it's there.

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/mtd/nand.txt#L16

> > +
> > +patternProperties:
> > +  "^nand@[a-z0-9]$":
> > +    properties:
> > +      reg:
> > +        description:
> > +          Contains the native Ready/Busy IDs.
> > +
> > +      nand-ecc-mode:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/string
> > +          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
> > +        description:
> > +          Operation mode of the NAND ecc mode. soft_bch is deprecated
> > +          and should be replaced by soft and nand-ecc-algo
> > +
> > +      nand-ecc-algo:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/string
> > +          - enum: [ hamming, bch, rs ]
> > +        description:
> > +          Algorithm of NAND ECC.
> > +
> > +      nand-bus-width:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +          - enum: [ 8, 16 ]
> > +          - default: 8
> > +        description:
> > +          Bus width to the NAND chip
> > +
> > +      nand-on-flash-bbt:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          Enable the on-flash Bad Block Table
> > +
> > +      nand-ecc-strength:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Number of bits to correct per ECC step.
>
> Is there a range we can define here? Certainly there's a minimum
> values of at least 1.

It doesn't look like there is from a quick grep. The DT seems to be in
the 4 - 32 range, but I'm not sure if it would make sense to have
something higher.

I'll let Miquel and Boris comment.

> > +
> > +      nand-ecc-step-size:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Number of data bytes covered by a single ECC step.
>
> Same here.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
