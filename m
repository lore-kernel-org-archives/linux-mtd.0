Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1972DC10F05
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 01:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9E120830
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 01:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CU4/kaaS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDz768n0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9E120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0NGMmvc8DpUtQZ6psau3MmSIHX6Nufmvt1kFd4hlnM=; b=CU4/kaaSsvzcJJ
	+IQkgTEwIYQy+Q6SgaXehYuuEZ6utOra5un34zbLDVXiUnyALexSeVNspp6OCxsVkiwiQ9dQk8e1g
	vmk0LgD+kUFNAc60iuJT6NF90aTrH3OkxZCUYswgNtXVJiVxUSmW8aHdvCwslrrhqXKZj6W0rAa9f
	V+RpmugiQL26UhuAmJ34ItKPMpr29JABVyQPYzOkY4IPfqPix2tl+UEfDwlZMP4u+LtAar4GqOOkj
	KI+gMjFB87XhSPEMZPNtZcuuDRAv4qne6gdCWino/kcleR+pmaiNZBkXYv9nsJthuJK89gCG1KmRW
	B6RlhTopPG80cipj7EZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB8hj-0002bk-G8; Tue, 02 Apr 2019 01:59:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB8ha-0002VJ-MD; Tue, 02 Apr 2019 01:59:04 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04DAE2084C;
 Tue,  2 Apr 2019 01:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554170342;
 bh=UAWURh5x2Co96NEqHrtUXEo0IXx4734GBTGwtxPIAgA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CDz768n0/rnh8ju+u36rgBsmwVIn/AQQqQBRWuslTirjipU9j8k3Lo8iYRR9cCD7Y
 GVtqG3NAAK2d3dQ9KlJF7ThYkzzLj55bCoqaAWoEO8+eJcGgMnhP65tK+8kP7jWY+M
 B84C6MknW00gIr/pThnHguaG+0RXVzGYhBLz+k4M=
Received: by mail-qk1-f172.google.com with SMTP id c189so6973498qke.6;
 Mon, 01 Apr 2019 18:59:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWDpeEtiydlGTkF9A8WNZxJFkzG19ewHcxB5PoRtmYw8jA2RN2T
 xMxUEos5rR+KavQMK907OLUjyt43Bvzzy6ZE+Q==
X-Google-Smtp-Source: APXvYqyhDcGprRX3gC+Q5Z+dL97XBOC6zWPb6nKj46kC04sdKLlyPG7jHwMf0HCgBOxjhzsDdFWmoyi9n0LKrE97xdY=
X-Received: by 2002:a37:5805:: with SMTP id m5mr53742218qkb.136.1554170341031; 
 Mon, 01 Apr 2019 18:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 1 Apr 2019 20:58:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
Message-ID: <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_185902_762264_0DBEB44C 
X-CRM114-Status: GOOD (  27.02  )
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

On Mon, Apr 1, 2019 at 4:14 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The NAND chips in MTD have a bunch of generic options that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> new file mode 100644
> index 000000000000..05b1afb34972
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND Chip and NAND Controller Generic Binding
> +
> +maintainers:
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>
> +
> +description: |
> +  The NAND controller should be represented with its own DT node, and
> +  all NAND chips attached to this controller should be defined as
> +  children nodes of the NAND controller. This representation should be
> +  enforced even for simple controllers supporting only one chip.
> +
> +  The ECC strength and ECC step size properties define the correction
> +  capability of a controller. Together, they say a controller can
> +  correct {strength} bit errors per {size} bytes.
> +
> +  The interpretation of these parameters is implementation-defined, so
> +  not all implementations must support all possible
> +  combinations. However, implementations are encouraged to further
> +  specify the value(s) they support.
> +
> +properties:
> +  $nodename:
> +    pattern: "^nand-controller(@.*)?"
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  ranges: true

'ranges' should not be here as nand chip addresses are not translatable.

> +
> +patternProperties:
> +  "^nand@[a-z0-9]$":
> +    properties:
> +      reg:
> +        description:
> +          Contains the native Ready/Busy IDs.
> +
> +      nand-ecc-mode:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
> +        description:
> +          Operation mode of the NAND ecc mode. soft_bch is deprecated
> +          and should be replaced by soft and nand-ecc-algo
> +
> +      nand-ecc-algo:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +          - enum: [ hamming, bch, rs ]
> +        description:
> +          Algorithm of NAND ECC.
> +
> +      nand-bus-width:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [ 8, 16 ]
> +          - default: 8
> +        description:
> +          Bus width to the NAND chip
> +
> +      nand-on-flash-bbt:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Enable the on-flash Bad Block Table
> +
> +      nand-ecc-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of bits to correct per ECC step.

Is there a range we can define here? Certainly there's a minimum
values of at least 1.

> +
> +      nand-ecc-step-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of data bytes covered by a single ECC step.

Same here.

> +
> +      nand-ecc-maximize:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Whether or not the ECC strength should be maximized. The
> +          maximum ECC strength is both controller and chip
> +          dependent. The controller side has to select the ECC config
> +          providing the best strength and taking the OOB area size
> +          constraint into account.  This is particularly useful when
> +          only the in-band area is used by the upper layers, and you
> +          want to make your NAND as reliable as possible.
> +
> +      nand-is-boot-medium:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Whether or not the NAND chip is a boot medium. Drivers might
> +          use this information to select ECC algorithms supported by
> +          the boot ROM or similar restrictions.
> +
> +      nand-rb:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Contains the native Ready/Busy IDs.
> +
> +    required:
> +      - reg
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    nand-controller {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      /* controller specific properties */
> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-ecc-mode = "soft";
> +        nand-ecc-algo = "bch";
> +
> +        /* controller specific properties */
> +      };
> +    };
>
> base-commit: aa63f222af3e5991099ebcecca7c474d8285c7c4
> --
> git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
