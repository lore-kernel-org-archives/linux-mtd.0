Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4767C54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE5E206CC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFb4SxZa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE5E206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV5vRROEV6Vvzyur4577qZv5xiRH4cbhKzsi4P8ZdNY=; b=bFb4SxZaymkfD5
	Avr3yn8zAGV6yKB8877fYxwej6e/qjEIQTTVa+lvh8M074j/2G9WpuPAKQJcl97DjDQACVJThJ3EX
	duQEBoPs5FnkJD8maV0FqJmi/RRBwKXPTuJuv8nk5meO3QXxbJnZo6OW1ttANn27mBeGIQzkrmdag
	zrGefuZZoEjJTWfMws/t3QhM7CUoWEaCuJisQxTWOrhzA5LyHs4BGcZQEdTAlMtK4crXEGZ4uxnn7
	4wbvlcnyT9lKqqXzME4Jglz66yrPJpGtoGDBZsuIrD9NvZXFlAn40yCaEY8fU4a8FWSNkN6MayE/q
	8+E5oxVTl8GZ+ns019xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHNm-0005Oc-Nr; Mon, 11 May 2020 22:58:46 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHNk-0005Ns-65
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 22:58:46 +0000
Received: by mail-ot1-f67.google.com with SMTP id t3so9002296otp.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 15:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rrzNRH0uSWvioiFA8ipqkq3GpJZMvPktQNs+srV9scY=;
 b=jhib7n2Uicn5cmi4j0meCcPBt9daCvyCt1DTfwKRkveAVxzo6l8F2IENGXSLh1gPpg
 LEBsOi0yl2pSWLSsMmZMLCEe0u5A+RdLdrLtIbbM6s4BbKzz3/TPkNVwym/IHouSzMxV
 tHfKt2QeBK50Gb15SbY2e/oY4h/b+0hOJcgvlN1YUB+r9aehWMXSDD4ahM6WGemE6GmU
 i3ns5YNN1Aqy2AezPQaG+9x0DqbUHO88jXExEJukBBRaw1sZmb9MitawJKrACAOmQfqx
 8f+Wo3ZeAz4lLIRFCe9Un3Zru8PtkAmS7/fVuNauBwEWPQ2W7l2qupm71gtBlCX1wGTw
 cxug==
X-Gm-Message-State: AGi0PuZiV3RdAv01/GlRUbKjZYL9p2RQF2quux5NUEOGY8aMm0KbZDyp
 83oybxD6zuD+ica+m8hFW6jmeuQ=
X-Google-Smtp-Source: APiQypKwzM2WDv3O2Z/UvW7ZohbJlHJk1r0PETLR0iG+Nn823uYMaUaGQmmQom1Rrlysc2iBt31mHQ==
X-Received: by 2002:a05:6830:1449:: with SMTP id
 w9mr10582312otp.230.1589237921107; 
 Mon, 11 May 2020 15:58:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t26sm2971740otl.71.2020.05.11.15.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:58:40 -0700 (PDT)
Received: (nullmailer pid 8142 invoked by uid 1000);
 Mon, 11 May 2020 22:58:39 -0000
Date: Mon, 11 May 2020 17:58:39 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 5/8] dt-bindings: mtd: Convert ingenic, jz4780-nand.txt to
 YAML
Message-ID: <20200511225839.GA3153@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-5-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_155844_231784_ADB91346 
X-CRM114-Status: GOOD (  23.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Apr 26, 2020 at 08:58:53PM +0200, Paul Cercueil wrote:
> Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
>  .../devicetree/bindings/mtd/ingenic,nand.yaml | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> deleted file mode 100644
> index c02259353327..000000000000
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -* Ingenic JZ4780 NAND/ECC
> -
> -This file documents the device tree bindings for NAND flash devices on the
> -JZ4780. NAND devices are connected to the NEMC controller (described in
> -memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
> -be children of the NEMC node.
> -
> -Required NAND controller device properties:
> -- compatible: Should be one of:
> -  * ingenic,jz4740-nand
> -  * ingenic,jz4725b-nand
> -  * ingenic,jz4780-nand
> -- reg: For each bank with a NAND chip attached, should specify a bank number,
> -  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
> -
> -Optional NAND controller device properties:
> -- ecc-engine: To make use of the hardware ECC controller, this
> -  property must contain a phandle for the ECC controller node. The required
> -  properties for this node are described below. If this is not specified,
> -  software ECC will be used instead.
> -
> -Optional children nodes:
> -- Individual NAND chips are children of the NAND controller node.
> -
> -Required children node properties:
> -- reg: An integer ranging from 1 to 6 representing the CS line to use.
> -
> -Optional children node properties:
> -- nand-ecc-step-size: ECC block size in bytes.
> -- nand-ecc-strength: ECC strength (max number of correctable bits).
> -- nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" by default
> -- nand-on-flash-bbt: boolean to enable on flash bbt option, if not present false
> -- rb-gpios: GPIO specifier for the busy pin.
> -- wp-gpios: GPIO specifier for the write protect pin.
> -
> -Optional child node of NAND chip nodes:
> -- partitions: see Documentation/devicetree/bindings/mtd/partition.txt
> -
> -Example:
> -
> -nemc: nemc@13410000 {
> -	...
> -
> -	nandc: nand-controller@1 {
> -		compatible = "ingenic,jz4780-nand";
> -		reg = <1 0 0x1000000>;	/* Bank 1 */
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ecc-engine = <&bch>;
> -
> -		nand@1 {
> -			reg = <1>;
> -
> -			nand-ecc-step-size = <1024>;
> -			nand-ecc-strength = <24>;
> -			nand-ecc-mode = "hw";
> -			nand-on-flash-bbt;
> -
> -			rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
> -			wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
> -
> -			partitions {
> -				#address-cells = <2>;
> -				#size-cells = <2>;
> -				...
> -			}
> -		};
> -	};
> -};
> -
> -The ECC controller is a separate SoC component used for error correction on
> -NAND devices. The following is a description of the device properties for a
> -ECC controller.
> -
> -Required ECC properties:
> -- compatible: Should be one of:
> -  * ingenic,jz4740-ecc
> -  * ingenic,jz4725b-bch
> -  * ingenic,jz4780-bch
> -- reg: Should specify the ECC controller registers location and length.
> -- clocks: Clock for the ECC controller.
> -
> -Example:
> -
> -bch: bch@134d0000 {
> -	compatible = "ingenic,jz4780-bch";
> -	reg = <0x134d0000 0x10000>;
> -
> -	clocks = <&cgu JZ4780_CLK_BCH>;
> -};
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> new file mode 100644
> index 000000000000..0e4cb1b55385
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs NAND controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: ../memory-controllers/ingenic,nemc-client.yaml#

You don't need this here because the schema is already applied with the 
parent's schema.

> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4740-nand
> +      - ingenic,jz4725b-nand
> +      - ingenic,jz4780-nand
> +
> +  reg:
> +    items:
> +      - description: Bank number, offset and size of first attached NAND chip
> +      - description: Bank number, offset and size of second attached NAND chip
> +      - description: Bank number, offset and size of third attached NAND chip
> +      - description: Bank number, offset and size of fourth attached NAND chip
> +    minItems: 1
> +
> +  ecc-engine: true
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    properties:
> +      rb-gpios:
> +        description: GPIO specifier for the busy pin.
> +        maxItems: 1
> +
> +      wp-gpios:
> +        description: GPIO specifier for the write-protect pin.
> +        maxItems: 1
> +
> +  "^partitions$":

This is at the wrong level. It should be under 'nand@...' node.

It is also not a pattern.

> +    type: object
> +    description:
> +      Node containing description of fixed partitions.
> +      See Documentation/devicetree/bindings/mtd/partition.txt
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +    nemc: memory-controller@13410000 {
> +      compatible = "ingenic,jz4780-nemc";
> +      reg = <0x13410000 0x10000>;
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <1 0 0x1b000000 0x1000000>,
> +         <2 0 0x1a000000 0x1000000>,
> +         <3 0 0x19000000 0x1000000>,
> +         <4 0 0x18000000 0x1000000>,
> +         <5 0 0x17000000 0x1000000>,
> +         <6 0 0x16000000 0x1000000>;
> +
> +      clocks = <&cgu JZ4780_CLK_NEMC>;
> +
> +      nand-controller@1 {
> +        compatible = "ingenic,jz4780-nand";
> +        reg = <1 0 0x1000000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ecc-engine = <&bch>;
> +
> +        ingenic,nemc-tAS = <10>;
> +        ingenic,nemc-tAH = <5>;
> +        ingenic,nemc-tBP = <10>;
> +        ingenic,nemc-tAW = <15>;
> +        ingenic,nemc-tSTRV = <100>;
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pins_nemc>;
> +
> +        nand@1 {
> +          reg = <1>;
> +
> +          nand-ecc-step-size = <1024>;
> +          nand-ecc-strength = <24>;
> +          nand-ecc-mode = "hw";
> +          nand-on-flash-bbt;
> +
> +          pinctrl-names = "default";
> +          pinctrl-0 = <&pins_nemc_cs1>;
> +
> +          partitions {
> +            compatible = "fixed-partitions";
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            partition@0 {
> +              label = "u-boot-spl";
> +              reg = <0x0 0x0 0x0 0x800000>;
> +            };
> +
> +            partition@800000 {
> +              label = "u-boot";
> +              reg = <0x0 0x800000 0x0 0x200000>;
> +            };
> +
> +            partition@a00000 {
> +              label = "u-boot-env";
> +              reg = <0x0 0xa00000 0x0 0x200000>;
> +            };
> +
> +            partition@c00000 {
> +              label = "boot";
> +              reg = <0x0 0xc00000 0x0 0x4000000>;
> +            };
> +
> +            partition@4c00000 {
> +              label = "system";
> +              reg = <0x0 0x4c00000 0x1 0xfb400000>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.26.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
