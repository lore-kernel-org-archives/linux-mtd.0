Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFADC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:38:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792B8613AC
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792B8613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cbf6z53ZgyFwVP+em8K1bYLacgjy0lHisN/3rfmQl9o=; b=nsllfQqd32RoMn1zDdXDeughFp
	3FJzybZZVYX77edrauqpbLHhJGhXTtKid0aIuwWQ4C8WXYQ09h13dsbm/lIbY3hdlJfMTJtWIGVpt
	cjvrBgle23QBxxs7DvWRg5DR3/q6GGnaQWinbfZ3AkWd0mpu60biER5lMtGgf3if8jxqlR3nXacRV
	3HaG0w96r2TI0moOGgZU39UUUJ+HmOHfxPrGGL89PYbZMcC/kKJGuDIQGSmOhSVtjYt0sy19ZPXpW
	Gza7AJyDjSg3uacvCHhK8oO0qPhwjyFUKYqXZj/YsOAHwdUomxOxiFux8QQnotP/hj3By606IDzi+
	T0OaT3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMNj-002i2t-6y; Wed, 02 Jun 2021 08:37:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loM0T-002XeO-1g; Wed, 02 Jun 2021 08:13:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id u24so1817754edy.11;
 Wed, 02 Jun 2021 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NJbT+GVKPDC4PquS19Koqf34xY1ShZswCtWqXlvF5ws=;
 b=FJ4S6lEv42dREYzwtmI94/ouOhhuyRNxb5qgbT7WVkv/j9M4koMgLa9ivOAI6FHvDv
 e0j8TA4aaG/BJgH/8lHNFu48lx7CIe5BxNSkP2xD9MHUxXz1K8VIJ91wY1fmY7Nl+XZZ
 VvK5WUkrMFTyESgz+xbBH0T/MEXVA8CZoT8LdbVL6L1MQ8cm50s4MzIh8CYe43uQNT2b
 aXbER3CrZgyNAPZH5WYU2X2BteaY1XUv8pLCGqHMYjsfTmU3Y9ANd0S5oZurGAk8SWii
 S32Bpo27hRrVTGjtrFsD+gY7MG06LSQrSsoB71WIYxHMCnIJG7tdLxwtZPT0duyLkIH3
 ACBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NJbT+GVKPDC4PquS19Koqf34xY1ShZswCtWqXlvF5ws=;
 b=EjxUzlauZ2FcPivxspTIvV604x7Hpf/3sIG9kzYHLlU5QoYQ5Xy/M/TSg0mxdv/+vp
 IE6aHK98pMfqEtS2Yd5MBANuAAnyHbT0huOrO+MY6VSej5M8yXlqRA6lay/SseotBFv8
 iIq5/ro2/6BReFMW8wVfnfqCBx2dOGjfKIO/IgX8gi/yxWJRgqQGgUW7CUKb2djUQFJk
 6FVGDz7E7MMfmD3ZtXEv7nmsFRSe2bOWEbDQ3SL/JzuUX/VfQQpYEMlpuVZtwyhmt8Bu
 rhNKQbhhO0rU90XVgrKUIzZHoZhYoAZvYtrgqOTpcjloHamEuQShO/VcAR8eCWzDRbJa
 tbww==
X-Gm-Message-State: AOAM531Ml22SQ2LVz50ZO3RROmMUjAdVHwRG0vWhKfBVMmrVeJUSHeyr
 0MbysRI+qvNlErbpbWze+Ec=
X-Google-Smtp-Source: ABdhPJy5xk0aLKjTYluCHx4dDaGDpQjPObA6yY50zwQB8WC/JgFsBGbh1p7edajF0Dw4MkNd5974qA==
X-Received: by 2002:aa7:cc9a:: with SMTP id p26mr37011443edt.74.1622621619120; 
 Wed, 02 Jun 2021 01:13:39 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 m12sm823812edc.40.2021.06.02.01.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 01:13:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
To: Chris Morgan <macroalpha82@gmail.com>, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
References: <20210601201021.4406-1-macroalpha82@gmail.com>
 <20210601201021.4406-2-macroalpha82@gmail.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <e609752d-ac37-cbfe-2f53-e23c3bb1b4d8@gmail.com>
Date: Wed, 2 Jun 2021 10:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601201021.4406-2-macroalpha82@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_011341_160700_3DEAEE95 
X-CRM114-Status: GOOD (  27.13  )
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

===
About the title:

dt-bindings: spi: add Rockchip Serial Flash Controller

Include a driver group name.
Start with a verb.
No need to mention "bindings" twice.

===

In order to get this patch reviewed by rob+dt you must include:
devicetree@vger.kernel.org

Check your review status here:
https://patchwork.ozlabs.org/project/devicetree-bindings/list/

Get the other lists and maintainers with:
./scripts/get_maintainer.pl --noroles --norolestats --nogit-fallback
--nogit <patch1> <patch2>

===

Check document with:

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

Remove any errors before submitting.

===

In this serie you are introducing 4 new compatible strings, then also
add 4 entries to dtsi files for the completeness.
Could you give us a complete package?

rockchip,px30-sfc
rockchip,rk3036-sfc
rockchip,rk3308-sfc
rockchip,rv1108-sfc

ARM: dts: rockchip: add sfc node for rv1108
Copy node from manufacturer tree in rv1108.dtsi

ARM: dts: rockchip: add sfc node for rk3036
https://github.com/rockchip-linux/kernel/commit/57bfc68e70cb58bd4786a6baff6315f252a19088

arm64: dts: rockchip: add sfc node for PX30

arm64: dts: rockchip: add sfc node for rk3308
https://github.com/rockchip-linux/kernel/commit/036e7e07a41c264a076c70ebf20cfeca031799a0

Fix there commit message and clock names.

===

Johan

On 6/1/21 10:10 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add bindings for the Rockchip serial flash controller. New device
> specific parameter of rockchip,sfc-no-dma included in documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/spi/rockchip,sfc.yaml | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> 

> diff --git a/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> new file mode 100644
> index 000000000000..d5f8edd621ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/rockchip,sfc.yaml#

rockchip-sfc.yaml

The comma is only used between <manufacturer>,<SoC name>-<function> I think.
Ask a maintainer for exact name.


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Serial Flash Controller (SFC)
> +
> +maintainers:

> +  - Heiko Stuebner <heiko@sntech.de>
> +  - Chris Morgan <macromorgan@hotmail.com>

sort
no hotmail because it screws the message-ID

> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:

> +    oneOf:

This format is wrong. Use fall back strings.

> +      - const: rockchip,px30-sfc

> +      - const: rockchip,rk1806-sfc
> +      - const: rockchip,rk1808-sfc
> +      - const: rockchip,rk312x-sfc

remove
I would advice against introducing compatible strings for boards that we
don't have support for in mainline. Limit to things that we know what
they look like.

> +      - const: rockchip,rk3308-sfc
> +      - const: rockchip,rv1108-sfc
> +      - items:
> +          - const: rockchip,rk3036-sfc

    oneOf:
      - const: rockchip,rk3036-sfc
      - items:
          - enum:
              - rockchip,px30-sfc
              - rockchip,rk3308-sfc
              - rockchip,rv1108-sfc
          - const: rockchip,rk3036-sfc

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:

> +      - description: Bus Clock
> +      - description: Module Clock

swap

> +
> +  clock-names:
> +    items:

> +      - const: ahb
> +      - const: sfc

swap
You must keep them in the same order as in your example and in the dtsi
files (both mainline as manufacturer tree).

Maybe use this:

      - const: clk
      - const: hclk


#define HCLK_SFC		257
#define SCLK_SFC		58

	COMPOSITE(SCLK_SFC, "clk_sfc", mux_gpll_cpll_p, 0,
			PX30_CLKSEL_CON(22), 7, 1, MFLAGS, 0, 7, DFLAGS,
			PX30_CLKGATE_CON(6), 7, GFLAGS),

	GATE(HCLK_SFC, "hclk_sfc", "hclk_mmc_nand", 0, PX30_CLKGATE_CON(6), 11,
GFLAGS),

===

From clk-rk3036.c:

	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
			RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, DFLAGS,
			RK2928_CLKGATE_CON(10), 5, GFLAGS),


	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED,
RK2928_CLKGATE_CON(3), 14, GFLAGS),

The HCLK_SFC is missing and ignored in rk3036-cru.h and clk-rk3036.c
Maybe this needs a fix?

#define HCLK_SFC		454

See:
clk: rockchip: rk3036: export the sfc clocks
https://github.com/rockchip-linux/kernel/commit/8373cf713ddd32037dc86462cac2d2d3cc859a99

Maybe add more patches to your serie? ;)

===

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  rockchip,sfc-no-dma:

> +    vendor,bool-property:

remove
See example vendor,bool-property at:
Documentation/devicetree/bindings/example-schema.yaml

> +      descrption: Boolean value for disabling DMA

description:

> +      type: boolean
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

    #include <dt-bindings/power/px30-power.h>

> +
> +    sfc: spi@ff3a0000 {
> +        compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
> +        reg = <0x0 0xff3a0000 0x0 0x4000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +        clock-names = "sfc", "ahb";
> +        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> +        pinctrl-names = "default";

> +        power-domains = <&power PX30_PD_MMC_NAND>;

Add include for PX30_PD_MMC_NAND.

Check your example with scripts before you submit!

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

> +        flash@0 {

This controller handles only serial flash for now.
So limit that with patternProperties.
Also users can't add more then 4 subnodes.
That's where these documents are for, so add!


> +            compatible = "jedec,spi-nor";

> +            reg = <0>;

            spi-max-frequency = <108000000>;

> +            spi-rx-bus-width = <2>;
> +            spi-tx-bus-width = <2>;

The sort order is:
compatible
reg
interrupts
the rest in alphabetical order
(no status in YAML examples)


> +        };
> +    };
> +
> +...
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
