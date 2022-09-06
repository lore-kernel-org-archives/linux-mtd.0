Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C92ECAAD5
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km7+lMpfCYOGEG6EbPq7ZlbrCEJBF90GnTAn1Ap1Res=; b=UB0NJlnMtSrEvs
	Vh2h2Y6kXGdcl2WlswCE8EZ1C5gzIuKBVrH7c6qvgtjhSBVogzPXJmegt2ecl1f0l3mPSeMQVOm+2
	FrskocgK0Bw0Iy4m9smZf7G7MakuBMl2a1SYmxfsKoLt+uL010B1cEhqokx+15ARb4PYkWDaokj5W
	tKITAkVWHuBNvGkprv8FuUeXEGN9dTQO5QprP1cpL1rLkPxflLQvps+PHB4h/Av52tKPidyCM93Wa
	AWIn1KlFJ4sJofop3AKlvX2HLwJoDMsBQfElwdtnqWA4D3xHvLyUQhCRi3D2VIK71nGzee0WeiBdO
	OcEWPwvsYuuqhlr2Lsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaO7-00EikY-CT; Tue, 06 Sep 2022 15:21:19 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZas-00EJt1-Pv; Tue, 06 Sep 2022 14:30:28 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1274ec87ad5so13681940fac.0;
        Tue, 06 Sep 2022 07:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Kvz3JZaluvKrbLtBoEI5XWsSUd5pzncK9jiRn5usyvY=;
        b=YST9NxmyayMngJJ33e9cXG7zXNHfLQ9lfTt7B1cEe9Cl6KeDIp4p81W2eKxDRs/lC3
         GtzaYMM/kTIeNlzUnzw5IdzjUZH3rKel3/qe1ZMud8176RkN1Oqwlb3W0CjzYw4YLCqP
         hpagLGj2LgJgTXdOJUSvAXR6IdRGaWklsNGOoyphzfAXYhgJIHOGYrDTHtXoOUXePsN7
         AZsrC7HSavxfos54o5u3gHpu/YUZ1o8TPrLrbWXWF/AQI6JMg1zFhFnttcKyQYS/5qaC
         62FENb/UkqV77bQuEpEZm1hhqPVXh9XHEDxeabYbg6nZPvNuD8ZNDCSzDuW43VoEzJ5z
         2tFw==
X-Gm-Message-State: ACgBeo1u3rdg6azD82yLAnrJFYd1jcxXEQmYsiSUzF/W47XFvOkniIAf
	bifRdHzpggaTFp41A158dQ==
X-Google-Smtp-Source: AA6agR43AUBcRTnH2EnVkNSTDxBoJmwXP6jICsOo+4xmljoEm6BkouioCzUZ8nvJiOcT3vVuNYoAzQ==
X-Received: by 2002:a05:6870:c386:b0:102:fcb:86cd with SMTP id g6-20020a056870c38600b001020fcb86cdmr11886020oao.296.1662474623287;
        Tue, 06 Sep 2022 07:30:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a9d5e87000000b00638cea5947esm6011078otl.25.2022.09.06.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:30:22 -0700 (PDT)
Received: (nullmailer pid 444558 invoked by uid 1000);
	Tue, 06 Sep 2022 14:30:21 -0000
Date: Tue, 6 Sep 2022 09:30:21 -0500
From: Rob Herring <robh@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v8 4/5] dt-bindings: nand: meson: convert txt to
 yaml
Message-ID: <20220906143021.GA439874-robh@kernel.org>
References: <20220906060034.2528-1-liang.yang@amlogic.com>
 <20220906060034.2528-5-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906060034.2528-5-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_073027_000681_242896C5 
X-CRM114-Status: GOOD (  21.92  )
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

On Tue, Sep 06, 2022 at 02:00:32PM +0800, Liang Yang wrote:
> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt       | 55 ------------
>  .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> deleted file mode 100644
> index 5d5cdfef417f..000000000000
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
> -
> -This file documents the properties in addition to those available in
> -the MTD NAND bindings.
> -
> -Required properties:
> -- compatible : contains one of:
> -  - "amlogic,meson-gxl-nfc"
> -  - "amlogic,meson-axg-nfc"
> -
> -- reg        : Offset and length of the register set
> -
> -- reg-names  : "nfc" is the register set for NFC controller and "emmc"
> -		is the register set for MCI controller.
> -
> -- clocks     :
> -	A list of phandle + clock-specifier pairs for the clocks listed
> -	in clock-names.
> -
> -- clock-names: Should contain the following:
> -	"core" - NFC module gate clock
> -	"device" - parent clock for internal NFC
> -
> -Optional children nodes:
> -Children nodes represent the available nand chips.
> -
> -Other properties:
> -see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
> -
> -Example demonstrate on AXG SoC:
> -
> -	nand-controller@7800 {
> -		compatible = "amlogic,meson-axg-nfc";
> -		reg = <0x0 0x7800 0x0 0x100>,
> -		      <0x0 0x7000 0x0 0x800>;
> -		reg-names = "nfc", "emmc";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> -
> -		clocks = <&clkc CLKID_SD_EMMC_C>,
> -			 <&clkc CLKID_FCLK_DIV2>;
> -		clock-names = "core", "device";
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&nand_pins>;
> -
> -		nand@0 {
> -			reg = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			nand-on-flash-bbt;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> new file mode 100644
> index 000000000000..42634e9c0d3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/amlogic,meson-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"

Don't need quotes

> +
> +maintainers:
> +  - liang.yang@amlogic.com
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "amlogic,meson-gxl-nfc"
> +      - "amlogic,meson-axg-nfc"

Don't need quotes

> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: device
> +
> +patternProperties:
> +  "^nand@[0-7]$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1
> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [8, 16, 24, 30, 40, 50, 60]
> +        description: |
> +          The ECC configurations that can be supported are as follows.
> +            meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
> +            meson-axg-nfc 8
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
> +    #include <dt-bindings/clock/axg-clkc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    nand-controller@ffe07800 {
> +      compatible = "amlogic,meson-axg-nfc";
> +      reg = <0xffe07800 0x100>, <0xffe07000 0x800>;
> +      reg-names = "nfc", "emmc";
> +      interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkc CLKID_SD_EMMC_C>,  <&clkc CLKID_FCLK_DIV2>;
> +      clock-names = "core", "device";
> +
> +      pinctrl-0 = <&nand_pins>;
> +      pinctrl-names = "default";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      nand@0 {
> +        reg = <0>;
> +      };
> +    };
> +
> +...
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
