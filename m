Return-Path: <SRS0=Jc64=KY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF285C47082
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 08:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB0461132
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 08:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB0461132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GXIQUwKZ5uoQbwh3agjpy20FgjQwVLtYeGu5aRYyYX4=; b=E/apoIvrJfqqX/5pu9DhtjSnhN
	8DjJmHBINVEBa17QicflONq1coixgjaShfSwDphKW8aEMgrpQAqOELhrjHGhoVVKtP5T75uuKlI+S
	JXXJSFvKB++YkIQ4hvv5x3S68xjH7G9LA/Jul+jszyOHybDwYH5Xrw2LjjNoUhN+GnVYkYLRud22V
	hp4uYm9rw1LvdRLdqx8bAdkwCs8k1G4Y9z40J5PeH4kwdJswp/3f79pught+r0deOral5QltYCFkl
	8p5zOcI71tCe9Xi8a6AZmg80HTxqYq3i3XWIxihS2bdz2MWb5PvrHSaiw+AvA6JooQpSt8NL6wDPe
	Awe5DaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmubM-004EIr-A7; Sat, 29 May 2021 08:45:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmubF-004EGJ-Fj; Sat, 29 May 2021 08:45:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id l1so8822108ejb.6;
 Sat, 29 May 2021 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D20iUHWpcTrl1g9DRxn7txN46rv+Ge8+HYAa4p8pvE0=;
 b=IOxJPVyr8PUrfpeIrvlt3EKCFSYEYnIUdttkcy1iFWyDyj7C92yTTu91By9Oerf5WT
 RQTkJKUMxfwY01swaKfQvBiSqzKHFp8YocepLkVrEOpHVSb29w+d6pYA35rXP8/Pa10t
 0boFcPNnE0KgNxM+f+k1KLNA/H+7demzVjb8MozkZ7w3p7Hh7eAtl9MyeKw85IClVVt7
 LKW/E6xzsnMMF0AbANTroFRFIvwfZtfkXiuUY3ztAaSeokcETIcrk0bVn/A3Cyz0e7pM
 ffL1i8SL39tqdGkAwhNYNOjMrWQbSUbjguXYLuOqz1fnxRDZKxKZV+YHRK3kcFGMHM9c
 bdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D20iUHWpcTrl1g9DRxn7txN46rv+Ge8+HYAa4p8pvE0=;
 b=bCEIhQ+r5GNLwo7aFrVuhMh/yk5bMcvtxPBBXmlfrZ5vCl28qj39Ep/klxDWAWjhzC
 8M5Uy3FttZXUf/aw7IGeV/t+jK1VtXTl1mNWKk4Rwfn4SjQS/oo4BdLsSlCR3ORBILs7
 vcHisYWo339J0hysfl+Z1G0fWK7LdbI3QxgfTSjpfp/ccEPm/2aiJqcP/xWvQK/kAlN0
 9Z/HeKxjuVLZeUnUDEzzYC0oyoiYzgAH8y0v72xlRkxxKuPWgyR/9JlEytsdXtNrR5y2
 dXbtg01Yn+1/lqebQLz1NUUEy9pzr+2ALHsMt1vkUSg7HD89lLE4Tawy1GkQ1pVC4MSL
 X1Iw==
X-Gm-Message-State: AOAM532YOXqHRXPoxSMF3SOHo4fQom6/ctWenOMQxCYJ0Jrxx7GZ5HJk
 C5s/30JUu2Qfiv/44tX0mvk=
X-Google-Smtp-Source: ABdhPJwyCowdQHo7BASO/oJy/7jVpUZUzaHrAdEXH1DDOr7MTXNJiVF8Z+iB4vTJJiBY4mS7IxVNNw==
X-Received: by 2002:a17:906:5448:: with SMTP id
 d8mr13136804ejp.248.1622277938973; 
 Sat, 29 May 2021 01:45:38 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 e22sm4015428edu.35.2021.05.29.01.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 01:45:38 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] spi: rockchip-sfc: Bindings for Rockchip serial
 flash controller
To: Chris Morgan <macroalpha82@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
 <20210528170020.26219-3-macroalpha82@gmail.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <d94ddb6c-116d-5119-a731-0b89925505d1@gmail.com>
Date: Sat, 29 May 2021 10:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528170020.26219-3-macroalpha82@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_014541_590215_489C2B86 
X-CRM114-Status: GOOD (  24.69  )
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

Hi Chris,

Some comments. Have a look if it's useful.

Please try to order patches like:
(1) dt-binding - compatible addition
(2) driver patches
(3) devicetree node patches

On 5/28/21 7:00 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add binding document for the Rockchip serial flash controller.

... Serial Flash Controller (SFC)

binding, document is same meaning?

> New device specific parameter of rockchip,sfc-no-dma included in
> documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../spi/rockchip,serialflash-controller.yaml  | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> new file mode 100644
> index 000000000000..eb073130e82a
> --- /dev/null

> +++ b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/rockchip,serialflash-controller.yaml#

rockchip-sfc.yaml is shorter,
but ask rob+dt or maintainer for correct name.
Documents seem to have the format:

(manufacturer), (SoC type)-(function).yaml

(manufacturer)-(function).yaml


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +

> +title: Rockchip SoCs Serial FLASH Controller (SFC)

title: Rockchip Serial Flash Controller (SFC)

> +

> +maintainers:

> +  - Andy Yan <andy.yan@rock-chips.com>

This is the original author years ago, but did you ask him to be maintainer?

  - Heiko Stuebner <heiko@sntech.de>

Add someone who can respond in a short period of time and who knows the
hardware in case rob+dt wants to delete something.

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

Compatible strings are supposed to be SoC orientated, so no generic ones
here.

"rockchip,sfc" can be found in the manufacturer tree:
px30.dtsi
rk1806.dtsi
rk1808.dtsi
rk3036.dtsi
rk312x.dtsi
rk3308.dtsi
rv1108.dtsi

Choose the first SoC in line with SFC and add that to your driver. All
SoCs with SFC compatible after that use a fallback string.

Example if rk3036 is first in line and has support in mainline:
    oneOf:
      - const: rockchip,rk3036-sfc
      - items:
          - enum:
              - rockchip,px30-sfc
              - rockchip,rk3308-sfc
              - rockchip,rv1108-sfc
          - const: rockchip,rk3036-sfc

Check indent with yamllint program.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:

> +    minItems: 2

Remove.
Already 2 items.

> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:

> +    minItems: 2

Remove.
Already 2 items.

> +    items:

> +      - const: clk-sfc
> +      - const: clk-hsfc

      - const: clk
      - const: hclk

Ask Heiko for exact name.
The driver internal uses:

+	clk_disable_unprepare(sfc->clk);
+	clk_disable_unprepare(sfc->hclk);

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  rockchip,sfc-no-dma:

===
  vendor,bool-property:
    description: Vendor specific properties must have a description. Boolean
      properties are one case where the json-schema 'type' keyword can
be used
      directly.
    type: boolean
===

> +    - descrption: Boolean value for disabling DMA

description:

without "-"

> +

> +patternProperties:

> +  "^spi-nor@[0-3]$":

  "^flash@[0-3]$":
Maybe restrict further to flash only?

> +    type: object
> +    properties:

> +
> +      compatible:
> +        oneOf:
> +          - const: jedec,spi-nor

Remove, use $ref to jedec,spi-nor.yaml.

===
      patternProperties:
        "^flash@[0-3]$":
          type: object

          $ref: "/schemas/mtd/jedec,spi-nor.yaml#"

          properties:
            reg:
              minimum: 0
              maximum: 3

          unevaluatedProperties: false
===

Could you try/test above example?

> +      reg:
> +        minimum: 0
> +        maximum: 3

This is a further restriction.
#define SFC_MAX_CHIPSELECT_NUM		4

> +
> +      spi-max-frequency:
> +        maxItems: 1
> +	  - description: Maximum frequency for SPI Flash

> +
> +      spi-rx-bus-width:
> +        maxItems: 1
> +          - description: RX Bus Width (1x, 2x, or 4x mode)
> +
> +      spi-tx-bus-width:
> +        maxItems: 1
> +          - description: TX Bus Width (1x, 2x, or 4x mode)

Already in spi-controller.yaml if nothing changed.

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

Recheck example indent.

> +	compatible = "rockchip,px30-sfc","rockchip,sfc";

	compatible = "rockchip,px30-sfc", "rockchip,rk3036-sfc";

See comment above.

> +	reg = <0x0 0xff3a0000 0x0 0x4000>;
> +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +	clock-names = "sfc", "hsfc";

clock-names = "clk", "hclk";

> +	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;

	pinctrl-names = "default";

sort

> +	power-domains = <&power PX30_PD_MMC_NAND>;

	#address-cells = <1>;
	#size-cells = <0>;

Things with "#" below in the list.

> +

> +	nor_flash: spi-nor@0 {

	nor_flash: flash@0 {

> +		reg = <0>;

> +		compatible = "xtx,xt25f128b","jedec,spi-nor";

		compatible = "jedec,spi-nor";

> +		spi-rx-bus-width = <2>;
> +		spi-tx-bus-width = <2>;
> +		spi-max-frequency = <108000000>;

sort

> +	};
> +};
> +
> +...
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
