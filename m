Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177ECC2B9F7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 18:49:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1456613B4
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 18:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1456613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtJI++6Zrh2BYdT7S8VIapbxHcgtOirB8Xaniwv4QM8=; b=4WZQQPlLtrTZ06NquETxtAPyib
	jdMGMi2cJ6BLSYNt+yTxRFXDeM5eKzn1XdZ8ee0OHmhb82ocgvX6Zn2tKhpc5xafv6aU5moXKbuud
	PcplN+nnA/BAem/yS14Vv0PTRzMVx1aJC8dT8x/bdDK5RiNSowS2Dq0us6Pbf2zb8jUly0cVoCLEP
	eS6R0xHYR6QdJ3uRMDtWkprFGpT8SzpkvuZKqVTlS+0RVHyTlTtTN/dEsmLdoyHjjA4Rx9KmQUZC6
	z3wroY6qeU6i74LvErLbSVPtU1vyjdT4hd2wi3G2eRq3BxRM0qazlJviQ3oJTGtXBESH+YwCwDytW
	jDWpQbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhXG-000PHe-8M; Fri, 28 May 2021 18:48:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhX9-000PCC-CT; Fri, 28 May 2021 18:48:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6CBEC22172;
 Fri, 28 May 2021 20:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622227710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtAJQ/fcxCS71m6N6ALuZxLfxWqZYCx6sUGpTsaHeEQ=;
 b=Uprvdqh3FoGAlb3qQVhpGvpjvviaMA/XxZRNr5ZpEysdvcEWzKVUPJQAXZYtk/UFznhY0V
 gS9aANEgg44/l2E9+AfOk4zNQPoLb9qvLBNoOkhDwaa4Ds6nRjT+XbzPu71HQZDwwTOgf1
 4CcMjqi2us1krJK+BKQsD6owZwlBewE=
MIME-Version: 1.0
Date: Fri, 28 May 2021 20:48:29 +0200
From: Michael Walle <michael@walle.cc>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/4] spi: rockchip-sfc: Bindings for Rockchip serial
 flash controller
In-Reply-To: <20210528170020.26219-3-macroalpha82@gmail.com>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
 <20210528170020.26219-3-macroalpha82@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dd44fda9fa4da9cadf55916fdc4410fb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114835_824063_F48BE77A 
X-CRM114-Status: GOOD (  18.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-05-28 19:00, schrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add binding document for the Rockchip serial flash controller.
> New device specific parameter of rockchip,sfc-no-dma included in
> documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

The subject for this patch should start with "dt-bindings:". See
Documentation/devicetree/bindings/submitting-patches.rst


> ---
>  .../spi/rockchip,serialflash-controller.yaml  | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> new file mode 100644
> index 000000000000..eb073130e82a
> --- /dev/null
> +++ 
> b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> http://devicetree.org/schemas/spi/rockchip,serialflash-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoCs Serial FLASH Controller (SFC)
> +
> +maintainers:
> +  - Andy Yan <andy.yan@rock-chips.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,px30-sfc
> +      - const: rockchip,rv1108-sfc
> +      - items:
> +        - const: rockchip,sfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: clk-sfc
> +      - const: clk-hsfc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  rockchip,sfc-no-dma:
> +    - descrption: Boolean value for disabling DMA
> +
> +patternProperties:
> +  "^spi-nor@[0-3]$":

I guess this subnode shouldn't be here, because its alread being taken
care of by the spi-controller.yaml.

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      spi-max-frequency:
> +        maxItems: 1
> +	  - description: Maximum frequency for SPI Flash
> +
> +      compatible:
> +        oneOf:
> +          - const: jedec,spi-nor
> +
> +      spi-rx-bus-width:
> +        maxItems: 1
> +          - description: RX Bus Width (1x, 2x, or 4x mode)
> +
> +      spi-tx-bus-width:
> +        maxItems: 1
> +          - description: TX Bus Width (1x, 2x, or 4x mode)
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/px30-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +sfc: spi@ff3a0000 {
> +	compatible = "rockchip,px30-sfc","rockchip,sfc";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x0 0xff3a0000 0x0 0x4000>;
> +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +	clock-names = "sfc", "hsfc";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> +	power-domains = <&power PX30_PD_MMC_NAND>;
> +
> +	nor_flash: spi-nor@0 {
flash@0 and the reference could probably be dropped.

> +		reg = <0>;
> +		compatible = "xtx,xt25f128b","jedec,spi-nor";

This should only be only "jedec,spi-nor".

You can check the schema with dt_bindings_check, see
Documentation/devicetree/bindings/writing-schema.rst

Otherwise, Rob's bot will likely complain.

Please note, that these review comments are just the obvious
ones and I don't have much experience with the schemas. Eg.
the compatible looks fishy, too. But I'm not sure.

-michael

> +		spi-rx-bus-width = <2>;
> +		spi-tx-bus-width = <2>;
> +		spi-max-frequency = <108000000>;
> +	};
> +};
> +
> +...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
