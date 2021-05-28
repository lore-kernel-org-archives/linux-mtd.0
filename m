Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01790C47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 20:02:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1BA6108E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 20:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1BA6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQWwhIxHo/YJAtoyFV3TKaiK2TYXbLOIMGtxoKJI9d0=; b=dqf0heFdSM9s0V
	FQJDgHFVATctvOtAoBq2+0tOBdWOmVSYd/ecSA4w+yPm1oEQsyjPOT9CK7PQBvNpkYx6UWQ+LDTC9
	1uUnuQ7zz9i68srMz0Te3jkH7SPAv8JIKscYOxcVO944FGKpyV131cPB6RiTufRR8NxO2moFz78Pn
	GjkEbE9q5wRTBPZ17HwYghpsyH+efVmgEO55m5YS5gPNYLeT6fJpFcMrpWtLtd00veLzOz00xWSWM
	g/4vtqVgOH7HAB+uyQQss2+NKxXGJKMVLN3/O/16gPvkTxlL0Kdl6z5kQB/+XRW+xvv37gqldSMch
	bmHaUCBEfZ5rRZxJz+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmifS-000mDa-LN; Fri, 28 May 2021 20:01:14 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmifP-000mCF-Q3; Fri, 28 May 2021 20:01:13 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so4553952otc.12; 
 Fri, 28 May 2021 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nkPugmdRIoU7SqfyAS3vXJA2eIAIIzrSNggfLehj+TA=;
 b=iWN3sneRCsuOFZypUyCWimPIJDvMjNsCtTmr3NR7iDO46S9ad0uLhCIFDd7AG+XI+8
 x/wU13F2R5sYk8VvY5FrSlD1iWO6W5Ijg5Fcmp8C5YOyLjzVErbenBPjAGo4c9CgU0fk
 hQLl05E0YhQIocb482TzOkkA0Blb2KlERqScnkhvOS16u1H8NrgMVPREjxPoj+LarHT1
 u8wKHvH0YiTYiUZU56xiCgNy358aXJumwZx17AhdfoRygT3OhfB+6IetgGfTK7jIeEz1
 Tu10IbiVNhpS5iEYJd2Uk4IpjrpgVHijJ2IytavwlG1bWK+AqY7YSyXzIJUBMop0Dcxp
 lSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nkPugmdRIoU7SqfyAS3vXJA2eIAIIzrSNggfLehj+TA=;
 b=K+xRVHX/7d8hQS4I6PF7clDxYCO+IWqMTDH5PabN1qSf8syFiNHy4Oy3772dpbJe3Y
 w5Qg5oXF+I6JA2BrFNyTH0ntQ1qU8pu9MErOtS/pGt7XFxEImKz81gOdkvpqTLC9IRDw
 DpCRJ57mkXmjuBjQsXeBG1USo27PyMUBmPR/+aj1G/mhjW0j2BG8Xs4tB7fETPWDtM2h
 ZA0vJVFL3IIO0ISpqr0i2evg5buEbcCbZWs/wK6/0VcHnQZnCP/P1cIVPEv828WvmQ2u
 CHVhgshEt/fhc41XqUHB0hVZlUY7yO8/YXJ1Iz9y4NBiU1VpaqPL697mhRWOm+qTWHXS
 WnyQ==
X-Gm-Message-State: AOAM533mVMw8V1S+1SI/pgdIHJ2tW9I355Ca9WPUV0HibhTw3ybZXjPO
 84yXInYcQLz2w+jTWkqHKdo=
X-Google-Smtp-Source: ABdhPJzcChthd7MQdlHMmQE/9yYHjuEdW7jWKrWgpVuH1AhQiYUcZYyzuhfJxWq82mISoWTtc8rAxA==
X-Received: by 2002:a05:6830:20c6:: with SMTP id
 z6mr8859056otq.26.1622232070415; 
 Fri, 28 May 2021 13:01:10 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id q19sm453655oov.18.2021.05.28.13.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:01:09 -0700 (PDT)
Date: Fri, 28 May 2021 15:01:07 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, tudor.ambarus@microchip.com,
 p.yadav@ti.com, heiko@sntech.de, robh+dt@kernel.org,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/4] spi: rockchip-sfc: Bindings for Rockchip serial
 flash controller
Message-ID: <20210528200107.GA1598@wintermute.localdomain>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
 <20210528170020.26219-3-macroalpha82@gmail.com>
 <dd44fda9fa4da9cadf55916fdc4410fb@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd44fda9fa4da9cadf55916fdc4410fb@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_130111_876679_9462FFDA 
X-CRM114-Status: GOOD (  29.26  )
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

On Fri, May 28, 2021 at 08:48:29PM +0200, Michael Walle wrote:
> Am 2021-05-28 19:00, schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add binding document for the Rockchip serial flash controller.
> > New device specific parameter of rockchip,sfc-no-dma included in
> > documentation.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> The subject for this patch should start with "dt-bindings:". See
> Documentation/devicetree/bindings/submitting-patches.rst

Acknowledged. When I do v3 I'll make this change.

> 
> 
> > ---
> >  .../spi/rockchip,serialflash-controller.yaml  | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > new file mode 100644
> > index 000000000000..eb073130e82a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/spi/rockchip,serialflash-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip SoCs Serial FLASH Controller (SFC)
> > +
> > +maintainers:
> > +  - Andy Yan <andy.yan@rock-chips.com>
> > +
> > +allOf:
> > +  - $ref: spi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: rockchip,px30-sfc
> > +      - const: rockchip,rv1108-sfc
> > +      - items:
> > +        - const: rockchip,sfc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    items:
> > +      - description: Module Clock
> > +      - description: Bus Clock
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    items:
> > +      - const: clk-sfc
> > +      - const: clk-hsfc
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  rockchip,sfc-no-dma:
> > +    - descrption: Boolean value for disabling DMA
> > +
> > +patternProperties:
> > +  "^spi-nor@[0-3]$":
> 
> I guess this subnode shouldn't be here, because its alread being taken
> care of by the spi-controller.yaml.

Okay, will remove it from v3.

> 
> > +    type: object
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 3
> > +
> > +      spi-max-frequency:
> > +        maxItems: 1
> > +	  - description: Maximum frequency for SPI Flash
> > +
> > +      compatible:
> > +        oneOf:
> > +          - const: jedec,spi-nor
> > +
> > +      spi-rx-bus-width:
> > +        maxItems: 1
> > +          - description: RX Bus Width (1x, 2x, or 4x mode)
> > +
> > +      spi-tx-bus-width:
> > +        maxItems: 1
> > +          - description: TX Bus Width (1x, 2x, or 4x mode)
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
> > +sfc: spi@ff3a0000 {
> > +	compatible = "rockchip,px30-sfc","rockchip,sfc";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	reg = <0x0 0xff3a0000 0x0 0x4000>;
> > +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> > +	clock-names = "sfc", "hsfc";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> > +	power-domains = <&power PX30_PD_MMC_NAND>;
> > +
> > +	nor_flash: spi-nor@0 {
> flash@0 and the reference could probably be dropped.
> 
> > +		reg = <0>;
> > +		compatible = "xtx,xt25f128b","jedec,spi-nor";
> 
> This should only be only "jedec,spi-nor".
>
> You can check the schema with dt_bindings_check, see
> Documentation/devicetree/bindings/writing-schema.rst
> 
> Otherwise, Rob's bot will likely complain.
> 
> Please note, that these review comments are just the obvious
> ones and I don't have much experience with the schemas. Eg.
> the compatible looks fishy, too. But I'm not sure.
> 
> -michael
>

You are correct, I forgot to remove this before I submitted it. I put
the full chip name in there while I was working on this. When I send
v3 (which will come after the main SPI driver has had a chance to be
looked at) I'll make these changes too.

Thank you.
 
> > +		spi-rx-bus-width = <2>;
> > +		spi-tx-bus-width = <2>;
> > +		spi-max-frequency = <108000000>;
> > +	};
> > +};
> > +
> > +...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
