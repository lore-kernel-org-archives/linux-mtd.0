Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B0DC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 17:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DCD610FC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 17:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28DCD610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo/x56uCBMskexyaVMPEo2SJj+r9hjqQqsCNEDpMCYo=; b=E499gBthqYaZnO
	kalWCK7K4DDto90VPg7hvMT0stcConr0HS7LiJae7QpnZ9suY5XhtjjBXbPFGOvlsnWYo62NbTQOc
	VB+auBEWcrAzvFtfDKsvouxBW19owdkhYTUIZp3hCOFPjVb15WzWq4EVNJ9CwxcCVvrRk87AvGoGs
	tpruxgFhBgr9MX0iL/z62ihd6zSIra+0plPZdcLmSL+J2iQSn68C3++sDH3NmPUaZjRdeGSeSA9gt
	znBrI5C1s4MA5GKt8Idig+RsdjTimum1r+toovRUS59qp/3lSMXrTOYZWqmfaNdEZ+Z/0JoC7gHbT
	NmX0eXfSW44w9s0AbfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnlYR-00Cz3B-Nc; Mon, 31 May 2021 17:18:19 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnlYO-00Cz22-MM; Mon, 31 May 2021 17:18:18 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so11699622otp.4; 
 Mon, 31 May 2021 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OMfkAK0zWm/JoJbyeVH83LTRYZu0QWxtMiEAF8cwpgM=;
 b=RfVc1l12ofqok9EPzStFDoUHeGuAhmgnjPm6ld8kQvKZBvOY1sido6a2sx22GkRfDb
 fWmdrq2mSo2xy0f0SWCbOA1w80ps/Bexsajpj4vQlajutiCxS1GgBenqWqw9+/1vhOr3
 t/CcPBopJ2xyNxX6dpATliUgzWIEsEAhjg/Y3S8IiceI1cvDvVnFBitAMXp6hK7wv6Gl
 jeJ5LMJyPJsT6V/vfl7fOIIfDKj87YMMmcTmWtml34/mpkmwhUKx/FcWSlSVqMYH1N3H
 Z6JzvkAR6oFfow2JJKTzKDT7K1jVX+Z4mH/i0y75Nhw8u2mIa06jqe8vVVvkAvWjJoNm
 Mg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OMfkAK0zWm/JoJbyeVH83LTRYZu0QWxtMiEAF8cwpgM=;
 b=PeTSm/YLsSnb+kYMT/S7wb4asNDDo2cB1Rdb8QMtcKzYKpftMlKoskybtir88Fr5Lz
 c68zFuEi1V5ylmIDk7Mym6Eb0HdMYvIfqlAbzsOfpoqppNdyrZJdqqEIjBi7hAsSfp70
 DivkmXxBrhAlJ0W7RnzdXpGI2kJ1c4J50CFvhQg8tglxfpGbUCwPXJ2M+ojYsHKLtuzL
 FS17WUASD7JClGmcUrX5kR8RS88gj+/qsXCZ4ePfcgV6P5GEeGk9qiapTBCgTW4Oek8X
 /BIcb+hIac+5bxZkgn57TOOoxGUkXEmimNVyX/VqJCtMmnnBhm9UPw7Bvl95K163YMx0
 4oFA==
X-Gm-Message-State: AOAM533C6TVVSd+Ldv6ydrUS3GvUy5Afnh7Vy20CRsXVmJvekWp29mxM
 Z8BzFG+MX1X7eRT6emUzXJk=
X-Google-Smtp-Source: ABdhPJxvPhU7uq4ycGdsD5BodIT0YKffl2TrOt2vjPy5KF97Uo1gJm8DG1kk+vPjJaRw3YuZjTas8Q==
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr17703135otd.13.1622481495143; 
 Mon, 31 May 2021 10:18:15 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v8sm2888045oiv.5.2021.05.31.10.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 10:18:14 -0700 (PDT)
Date: Mon, 31 May 2021 12:18:12 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, tudor.ambarus@microchip.com,
 michael@walle.cc, p.yadav@ti.com, heiko@sntech.de,
 robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/4] spi: rockchip-sfc: Bindings for Rockchip serial
 flash controller
Message-ID: <20210531171812.GA1729@wintermute.localdomain>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
 <20210528170020.26219-3-macroalpha82@gmail.com>
 <d94ddb6c-116d-5119-a731-0b89925505d1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d94ddb6c-116d-5119-a731-0b89925505d1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_101816_771753_CE1CC16C 
X-CRM114-Status: GOOD (  45.80  )
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

On Sat, May 29, 2021 at 10:45:35AM +0200, Johan Jonker wrote:
> Hi Chris,
> 
> Some comments. Have a look if it's useful.
> 
> Please try to order patches like:
> (1) dt-binding - compatible addition
> (2) driver patches
> (3) devicetree node patches
> 
> On 5/28/21 7:00 PM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add binding document for the Rockchip serial flash controller.
> 
> ... Serial Flash Controller (SFC)
> 
> binding, document is same meaning?

Yes, will be more clear in follow up.

> 
> > New device specific parameter of rockchip,sfc-no-dma included in
> > documentation.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../spi/rockchip,serialflash-controller.yaml  | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > new file mode 100644
> > index 000000000000..eb073130e82a
> > --- /dev/null
> 
> > +++ b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spi/rockchip,serialflash-controller.yaml#
> 
> rockchip-sfc.yaml is shorter,
> but ask rob+dt or maintainer for correct name.
> Documents seem to have the format:

I think rockchip-sfc.yaml works better, it fits the
(manufacturer)-(function).yaml format.

> 
> (manufacturer), (SoC type)-(function).yaml
> 
> (manufacturer)-(function).yaml
> 
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> 
> > +title: Rockchip SoCs Serial FLASH Controller (SFC)
> 
> title: Rockchip Serial Flash Controller (SFC)
> 
> > +
> 
> > +maintainers:
> 
> > +  - Andy Yan <andy.yan@rock-chips.com>
> 
> This is the original author years ago, but did you ask him to be maintainer?
> 
>   - Heiko Stuebner <heiko@sntech.de>
> 
> Add someone who can respond in a short period of time and who knows the
> hardware in case rob+dt wants to delete something.

I asked Heiko on IRC if he would be okay with me listing him and myself
as maintainers. I'm comfortable enough with the hardware now to be able
to respond/fix basic issues with it, though it would also be good to
have a veteran of the hardware involved too.

> 
> > +
> > +allOf:
> > +  - $ref: spi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> 
> > +    oneOf:
> > +      - const: rockchip,px30-sfc
> > +      - const: rockchip,rv1108-sfc
> > +      - items:
> > +        - const: rockchip,sfc
> 
> Compatible strings are supposed to be SoC orientated, so no generic ones
> here.
> 
> "rockchip,sfc" can be found in the manufacturer tree:
> px30.dtsi
> rk1806.dtsi
> rk1808.dtsi
> rk3036.dtsi
> rk312x.dtsi
> rk3308.dtsi
> rv1108.dtsi
> 
> Choose the first SoC in line with SFC and add that to your driver. All
> SoCs with SFC compatible after that use a fallback string.
> 
> Example if rk3036 is first in line and has support in mainline:
>     oneOf:
>       - const: rockchip,rk3036-sfc
>       - items:
>           - enum:
>               - rockchip,px30-sfc
>               - rockchip,rk3308-sfc
>               - rockchip,rv1108-sfc
>           - const: rockchip,rk3036-sfc
> 
> Check indent with yamllint program.

Thanks, acknowledged. The BSP driver does a runtime check to see if the
underlying hardware is a v3 or a v4 of the IP, whereas this driver only
works as expected on the v3 of the hardware. I don't know which of
those chips are which of the hardware. I'll try and pull datasheets for
each of them, but failing that I can only say for sure this should work
on the rv1108 and px30 (and I can only test against the px30). If it
comes down to only being able to validate what I already know, I'll
pick the oldest SoC by release date and use that one as the const and
list the other one as the compatible.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> 
> > +    minItems: 2
> 
> Remove.
> Already 2 items.

Okay.

> 
> > +    items:
> > +      - description: Module Clock
> > +      - description: Bus Clock
> > +
> > +  clock-names:
> 
> > +    minItems: 2
> 
> Remove.
> Already 2 items.

Okay.

> 
> > +    items:
> 
> > +      - const: clk-sfc
> > +      - const: clk-hsfc
> 
>       - const: clk
>       - const: hclk
> 
> Ask Heiko for exact name.
> The driver internal uses:
> 
> +	clk_disable_unprepare(sfc->clk);
> +	clk_disable_unprepare(sfc->hclk);

I'll ask, as the BSP has this all over the place (both).

> 
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  rockchip,sfc-no-dma:
> 
> ===
>   vendor,bool-property:
>     description: Vendor specific properties must have a description. Boolean
>       properties are one case where the json-schema 'type' keyword can
> be used
>       directly.
>     type: boolean
> ===
> 
> > +    - descrption: Boolean value for disabling DMA
> 
> description:
> 
> without "-"
> 
> > +
> 
> > +patternProperties:
> 
> > +  "^spi-nor@[0-3]$":
> 
>   "^flash@[0-3]$":
> Maybe restrict further to flash only?
> 
> > +    type: object
> > +    properties:
> 
> > +
> > +      compatible:
> > +        oneOf:
> > +          - const: jedec,spi-nor
> 
> Remove, use $ref to jedec,spi-nor.yaml.
> 
> ===
>       patternProperties:
>         "^flash@[0-3]$":
>           type: object
> 
>           $ref: "/schemas/mtd/jedec,spi-nor.yaml#"
> 
>           properties:
>             reg:
>               minimum: 0
>               maximum: 3
> 
>           unevaluatedProperties: false
> ===
> 
> Could you try/test above example?

My hardware has only a single flash chip soldered to CS 0. I'm afraid
I'm not able to test any more configurations. The best I can say is
the registers on the hardware for CS accept a 2 bit value so anything
between 0 and 3 should be acceptable.


> 
> > +      reg:
> > +        minimum: 0
> > +        maximum: 3
> 
> This is a further restriction.
> #define SFC_MAX_CHIPSELECT_NUM		4

Correct, because I have 2 bits to work with, bits 31:30 of SFC_CMD
(0x0100) to define the chip select.

> 
> > +
> > +      spi-max-frequency:
> > +        maxItems: 1
> > +	  - description: Maximum frequency for SPI Flash
> 
> > +
> > +      spi-rx-bus-width:
> > +        maxItems: 1
> > +          - description: RX Bus Width (1x, 2x, or 4x mode)
> > +
> > +      spi-tx-bus-width:
> > +        maxItems: 1
> > +          - description: TX Bus Width (1x, 2x, or 4x mode)
> 
> Already in spi-controller.yaml if nothing changed.
> 
> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/px30-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> 
> > +sfc: spi@ff3a0000 {
> 
> Recheck example indent.

Will do, I'll make sure the next version I try to fix the indents
better.

> 
> > +	compatible = "rockchip,px30-sfc","rockchip,sfc";
> 
> 	compatible = "rockchip,px30-sfc", "rockchip,rk3036-sfc";
> 
> See comment above.
> 
> > +	reg = <0x0 0xff3a0000 0x0 0x4000>;
> > +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> > +	clock-names = "sfc", "hsfc";
> 
> clock-names = "clk", "hclk";
> 
> > +	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> 
> 	pinctrl-names = "default";
> 
> sort
> 
> > +	power-domains = <&power PX30_PD_MMC_NAND>;
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> Things with "#" below in the list.
> 
> > +
> 
> > +	nor_flash: spi-nor@0 {
> 
> 	nor_flash: flash@0 {
> 
> > +		reg = <0>;
> 
> > +		compatible = "xtx,xt25f128b","jedec,spi-nor";
> 
> 		compatible = "jedec,spi-nor";
> 
> > +		spi-rx-bus-width = <2>;
> > +		spi-tx-bus-width = <2>;
> > +		spi-max-frequency = <108000000>;
> 
> sort
> 
> > +	};
> > +};
> > +
> > +...
> > 

Thank you for your comments. I'll try to get it all sorted out with the
next update.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
