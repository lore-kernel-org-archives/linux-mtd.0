Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA86C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZpafGC3kzOFG2mL6PqTdoWQ9+SBYGrjPNQPhC4Ly/w=; b=tg9Y/c0AhyQ9H6
	Px5z6aptTYrBb4op32MIrxOhOS3RunUeSMwckaVnCNQ3bfenCz7M1/e7UdHHBWz7mOn97DmOmPLsQ
	IqQG9qHLuVhgYONenG70qQzrluZW2aYhUnXQzQZ2lfC2FBy9uThb8YB/Gt5fYDrbetg0FLKe9iMkB
	KDuGDTLrqTE4KVDkFYxXCN3Bpe6WCUyReYVk7bBc13DhoPSoMEYL7p76mtSzJffp9rC8TGSXgWd4o
	KU0i+U/eTJn/Jndd3YC1aKrzy4qzMHRljo+ZKE818P1jN3j7iLV94rB1ORTDDJ6DYK1x+JhZ31TG/
	eLDCa70l1ynjE5FoER4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaCz-000XhW-QF; Mon, 28 Nov 2022 09:13:49 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaCv-000Xew-KN
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 09:13:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z4so12379745ljq.6
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 01:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gliAjBV8bnsreXq2djUFhjyOydbQN9ABEBwf3X/7Jr0=;
        b=hltPiMyhnDQJZY3GehYC/jddwN4dZSJnJFlNOrO/wqi3h5DBKgBVTy05QgKHWAAWxX
         tQBNN6p8XdCEGk5qpVosEErxXAvqau7tFiHW8njfWI3YdrmJR+IEoQlEyDyv93ScY9ka
         anzP4H5mFNmjtHn2zFOTnBaQZqRqK1FKw347Qj8vYmAbHl1uBzAqo6Z+s4CbFgviHQfv
         IziTBM30sAQ2L/3FORM5kAi6Ay8E2RGnZ9TxX2nSUOnNyXcqyv2E337l0lCr0HtnHrLo
         yaN6tnVnXMr+0GW2fq847n+pqMAzlYecEU6iZ6UdP9cnU/t34gnIUJnue/3knjUVlIUQ
         wZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gliAjBV8bnsreXq2djUFhjyOydbQN9ABEBwf3X/7Jr0=;
        b=5NHM4UFTJXFBuGJxdE5xMYv9blcui38P/Q1a7WXCYy5bx8nrSKdpVeUiW9TArYhMBS
         6krnScNBTduyM/QhY1T9B+urYmsw9sGfGXKJgdXRjBHq3izo26TP5FjNmbJ01FyVOpqR
         /Z7ZtWj3ZkX70/ORA9S6iaGxPfzkxiW72zyp90TBj6vvhY94w804KF2SLv1jEJkSYLAQ
         8OF6ph18t/0m28bSrAjUQvcBv1KRRrtkbM+1rPbkjVCAZlZTOwNtKE9FDhFayRrsyW0W
         RtHGXvLi99+x2R7PLyrW5lHigvZISu9zXeP+ykgTWjX7Jo8uz7AieiHM6V3CYfNu3wLg
         cUfg==
X-Gm-Message-State: ANoB5pm/9dC63erXYC213BJKf1xXSBCwLzGHtuE7cwgqX3NX/vJMI4eI
	LcJForWCa+rUDgQ6x1B7MFCBMg==
X-Google-Smtp-Source: AA0mqf6Mhv2CopXIb8xVLTE4wFCsvxWeSckgwU8zPiwOrnVjFJKPYxivHHDIU4GEUev+8998hW1C+Q==
X-Received: by 2002:a05:651c:1070:b0:276:ac05:b821 with SMTP id y16-20020a05651c107000b00276ac05b821mr17367203ljm.84.1669626823756;
        Mon, 28 Nov 2022 01:13:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p12-20020ac24ecc000000b0049a5a59aa68sm1652628lfr.10.2022.11.28.01.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:13:43 -0800 (PST)
Message-ID: <69d35231-0ac0-297c-d669-5566a926aac3@linaro.org>
Date: Mon, 28 Nov 2022 10:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 8/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-9-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128020613.14821-9-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_011345_731134_C72CB033 
X-CRM114-Status: GOOD (  35.57  )
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

On 28/11/2022 03:06, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/mtd/mtk,nand-ecc-engine.yaml     |  60 ++++++
>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>  .../devicetree/bindings/mtd/mtk-nand.yaml     |  92 +++++++++
>  3 files changed, 152 insertions(+), 176 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
> new file mode 100644
> index 000000000000..80321157e928
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml

Wrong vendor prefix. Isn't it mediatek?

> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/mtk,nand-ecc-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek(MTK) SoCs NAND ECC engine
> +
> +maintainers:
> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> +
> +description: |
> +  MTK NAND ECC engine can cowork with MTK raw NAND and SPI NAND controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-ecc
> +      - mediatek,mt2712-ecc
> +      - mediatek,mt7622-ecc
> +
> +  reg:
> +    items:
> +      - description: Base physical address and size of ECC.
> +
> +  interrupts:
> +    items:
> +      - description: ECC interrupt
> +
> +  clocks:
> +    minItems: 1

Drop minItems.

> +    items:
> +      - description: clock used for the controller

Drop items/description - it is obvious, isn't it? Rather maxItems: 1,
Unless controller is not obvious in this context - about which
controller you talk about?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false

Instead: additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;

Mismatched iindentation. 4 spaces for DTS.

> +      #size-cells = <2>;
> +
> +      bch: ecc@1100e000 {
> +          compatible = "mediatek,mt2701-ecc";
> +          reg = <0 0x1100e000 0 0x1000>;
> +          interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
> +          clocks = <&pericfg CLK_PERI_NFI_ECC>;
> +      };
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> deleted file mode 100644
> index 4d3ec5e4ff8a..000000000000
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ /dev/null
> @@ -1,176 +0,0 @@
> -MTK SoCs NAND FLASH controller (NFC) DT binding
> -
> -This file documents the device tree bindings for MTK SoCs NAND controllers.
> -The functional split of the controller requires two drivers to operate:
> -the nand controller interface driver and the ECC engine driver.
> -
> -The hardware description for both devices must be captured as device
> -tree nodes.
> -
> -1) NFC NAND Controller Interface (NFI):
> -=======================================
> -
> -The first part of NFC is NAND Controller Interface (NFI) HW.
> -Required NFI properties:
> -- compatible:			Should be one of
> -				"mediatek,mt2701-nfc",
> -				"mediatek,mt2712-nfc",
> -				"mediatek,mt7622-nfc".
> -- reg:				Base physical address and size of NFI.
> -- interrupts:			Interrupts of NFI.
> -- clocks:			NFI required clocks.
> -- clock-names:			NFI clocks internal name.
> -- ecc-engine:			Required ECC Engine node.
> -- #address-cells:		NAND chip index, should be 1.
> -- #size-cells:			Should be 0.
> -
> -Example:
> -
> -	nandc: nfi@1100d000 {
> -		compatible = "mediatek,mt2701-nfc";
> -		reg = <0 0x1100d000 0 0x1000>;
> -		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&pericfg CLK_PERI_NFI>,
> -			 <&pericfg CLK_PERI_NFI_PAD>;
> -		clock-names = "nfi_clk", "pad_clk";
> -		ecc-engine = <&bch>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -        };
> -
> -Platform related properties, should be set in {platform_name}.dts:
> -- children nodes:	NAND chips.
> -
> -Children nodes properties:
> -- reg:			Chip Select Signal, default 0.
> -			Set as reg = <0>, <1> when need 2 CS.
> -Optional:
> -- nand-on-flash-bbt:	Store BBT on NAND Flash.
> -- nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
> -- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
> -			valid values:
> -			512 and 1024 on mt2701 and mt2712.
> -			512 only on mt7622.
> -			1024 is recommended for large page NANDs.
> -- nand-ecc-strength:	Number of bits to correct per ECC step.
> -			The valid values that each controller supports:
> -			mt2701: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
> -				32, 36, 40, 44, 48, 52, 56, 60.
> -			mt2712: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
> -				32, 36, 40, 44, 48, 52, 56, 60, 68, 72, 80.
> -			mt7622: 4, 6, 8, 10, 12, 14, 16.
> -			The strength should be calculated as follows:
> -			E = (S - F) * 8 / B
> -			S = O / (P / Q)
> -				E :	nand-ecc-strength.
> -				S :	spare size per sector.
> -				F :	FDM size, should be in the range [1,8].
> -					It is used to store free oob data.
> -				O :	oob size.
> -				P :	page size.
> -				Q :	nand-ecc-step-size.
> -				B :	number of parity bits needed to correct
> -					1 bitflip.
> -					According to MTK NAND controller design,
> -					this number depends on max ecc step size
> -					that MTK NAND controller supports.
> -					If max ecc step size supported is 1024,
> -					then it should be always 14. And if max
> -					ecc step size is 512, then it should be
> -					always 13.
> -			If the result does not match any one of the listed
> -			choices above, please select the smaller valid value from
> -			the list.
> -			(otherwise the driver will do the adjustment at runtime)
> -- pinctrl-names:	Default NAND pin GPIO setting name.
> -- pinctrl-0:		GPIO setting node.
> -
> -Example:
> -	&pio {
> -		nand_pins_default: nanddefault {
> -			pins_dat {
> -				pinmux = <MT2701_PIN_111_MSDC0_DAT7__FUNC_NLD7>,
> -					 <MT2701_PIN_112_MSDC0_DAT6__FUNC_NLD6>,
> -					 <MT2701_PIN_114_MSDC0_DAT4__FUNC_NLD4>,
> -					 <MT2701_PIN_118_MSDC0_DAT3__FUNC_NLD3>,
> -					 <MT2701_PIN_121_MSDC0_DAT0__FUNC_NLD0>,
> -					 <MT2701_PIN_120_MSDC0_DAT1__FUNC_NLD1>,
> -					 <MT2701_PIN_113_MSDC0_DAT5__FUNC_NLD5>,
> -					 <MT2701_PIN_115_MSDC0_RSTB__FUNC_NLD8>,
> -					 <MT2701_PIN_119_MSDC0_DAT2__FUNC_NLD2>;
> -				input-enable;
> -				drive-strength = <MTK_DRIVE_8mA>;
> -				bias-pull-up;
> -			};
> -
> -			pins_we {
> -				pinmux = <MT2701_PIN_117_MSDC0_CLK__FUNC_NWEB>;
> -				drive-strength = <MTK_DRIVE_8mA>;
> -				bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> -			};
> -
> -			pins_ale {
> -				pinmux = <MT2701_PIN_116_MSDC0_CMD__FUNC_NALE>;
> -				drive-strength = <MTK_DRIVE_8mA>;
> -				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> -			};
> -		};
> -	};
> -
> -	&nandc {
> -		status = "okay";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&nand_pins_default>;
> -		nand@0 {
> -			reg = <0>;
> -			nand-on-flash-bbt;
> -			nand-ecc-mode = "hw";
> -			nand-ecc-strength = <24>;
> -			nand-ecc-step-size = <1024>;
> -		};
> -	};
> -
> -NAND chip optional subnodes:
> -- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
> -
> -Example:
> -	nand@0 {
> -		partitions {
> -			compatible = "fixed-partitions";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			preloader@0 {
> -				label = "pl";
> -				read-only;
> -				reg = <0x00000000 0x00400000>;
> -			};
> -			android@00400000 {
> -				label = "android";
> -				reg = <0x00400000 0x12c00000>;
> -			};
> -		};
> -	};
> -
> -2) ECC Engine:
> -==============
> -
> -Required BCH properties:
> -- compatible:	Should be one of
> -		"mediatek,mt2701-ecc",
> -		"mediatek,mt2712-ecc",
> -		"mediatek,mt7622-ecc".
> -- reg:		Base physical address and size of ECC.
> -- interrupts:	Interrupts of ECC.
> -- clocks:	ECC required clocks.
> -- clock-names:	ECC clocks internal name.
> -
> -Example:
> -
> -	bch: ecc@1100e000 {
> -		compatible = "mediatek,mt2701-ecc";
> -		reg = <0 0x1100e000 0 0x1000>;
> -		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&pericfg CLK_PERI_NFI_ECC>;
> -		clock-names = "nfiecc_clk";
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.yaml b/Documentation/devicetree/bindings/mtd/mtk-nand.yaml
> new file mode 100644
> index 000000000000..47a1334bcddd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.yaml

Filename more or less matching compatibles, so for example: mediatek,mtk-nfc

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/mtk-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC) device tree bindings

Drop "device tree bindings"

> +
> +maintainers:
> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml#"

Drop quotes.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-nfc
> +      - mediatek,mt2712-nfc
> +      - mediatek,mt7622-nfc
> +
> +  reg:
> +    items:
> +      - description: Base physical address and size of NFI.
> +
> +  interrupts:
> +    items:
> +      - description: NFI interrupt
> +
> +  clocks:
> +    minItems: 2

Drop

> +    items:
> +      - description: clock used for the controller
> +      - description: clock used for the pad
> +
> +  clock-names:
> +    minItems: 2

Drop

> +    items:
> +      - const: nfi_clk
> +      - const: pad_clk
> +
> +  nand-ecc-engine:
> +    description: Required ECC Engine node
> +    $ref: /schemas/types.yaml#/definitions/phandle

This does not look right. This is a property of NAND chip and original
binding was saying this as well... or was it called ecc-engine in
original bindings? But your commit msg did not explain any differences
from pure conversion.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Drop, they come from nand-controller.yaml.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - nand-ecc-engine
> +  - "#address-cells"
> +  - "#size-cells"

Drop cells here as well.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      nandc: nfi@1100d000 {
> +        compatible = "mediatek,mt2701-nfc";

Messed indentation.

> +        reg = <0 0x1100d000 0 0x1000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&pericfg CLK_PERI_NFI>,
> +          <&pericfg CLK_PERI_NFI_PAD>;

Non aligned line.

> +        clock-names = "nfi_clk", "pad_clk";
> +        nand-ecc-engine = <&bch>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;

Incomplete example.

> +      };
> +
> +      bch: ecc@1100e000 {
> +          compatible = "mediatek,mt2701-ecc";
> +          reg = <0 0x1100e000 0 0x1000>;
> +          interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
> +          clocks = <&pericfg CLK_PERI_NFI_ECC>;
> +      };
> +    };

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
