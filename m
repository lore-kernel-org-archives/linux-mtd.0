Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF9ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WadBbSzo6ZJKAonJi7lzwOI6nfj8ZhqHgtnyOPvFveg=; b=QPvy2AQYchAdsi
	S0npfjB4VyKBdMuFpTCZ1gjpyh75wJ5PPFsJFtVLwJ4DcN2oRyjYFEVs49m1fU1KZynoAZDxidEtm
	2ql0IRlSsi0YiqxKZRuKMkPr9aYBjgHmOoAW85ssaxlNHBXA7Ad35DHTf6xSJ8Ev3nABu+BxgAY3i
	+UaYC0lohVMSpe5d39RqcsgbidIuRFBfWwGT+N0DPzi2DMmMc4xM1sEyewCrpQLfxuRZ+r6V+9zy6
	8WopmZv7pLbGDXzWRTTxn20QdtEul/gDBNWQi6nsQkhd9QNVAMsabcIhnzQjjw3vNMun55efM6MaF
	s65j4A3R1pBC22BnW4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7BX-00EBdD-7q; Mon, 05 Sep 2022 08:10:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6Qr-00DCIR-PP
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2022 07:22:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e20so10033668wri.13
        for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2022 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=0Zlv2noXrggmLQ5O5f0vmSBw3PaAlyCeKLqu2TrFOSI=;
        b=gbjY3IwFu+AGJ8HI6f3xIw+YnlYzWWjlNzSJ2xpCv3g1YWG03AC3D0FrZib6OKWJll
         ylTGHZwR7RIU0BomwiviKRNNqwmjGFwO5CQKD+AmPnsUQHPe6jUYC4oWlcNS9yDh3RRA
         luxlXRbMCb1JDMWFEWD8lTZ7CROpBDFuCot/rNnBEpZkYiIiev3sZEbp8WLUWLSx0yhA
         SoB+y87LW0OmFCY2JH3q/bhzlR898s2BKQQvo1/efzIVQUJvj1WK9RsBFEF54rWHsV7g
         xq1EGCw03kG2DlugfYgKOCOxIusttwVKoj/EQGK3sek5Y2EY3izF0A8aDN7nnmkyeW14
         tg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=0Zlv2noXrggmLQ5O5f0vmSBw3PaAlyCeKLqu2TrFOSI=;
        b=uQQgTJfcSJBvgyKZntpZ+ExxFovQUina0gt7BVGm/2BR8dsxn8FG02rJXbzACYxgBW
         zAKM3RYN0QLC2O5JQ4ojp7iEPumkejxfr5JqZX7xn8C8I8i7cR/SdV3cZbkfW8hXGPcn
         Hh86MOjeOTpszcsQC6nsol0MXqi9c3NVqMfoK7HdHZr3y+6tjhyV41ybCw0CH+V59U7d
         SXB0AAZrdezVNNqdy+bnDLhwOpLU5OlWfRAzFz0iNdsuXx4wvUc0JUezX7SN+ryL8nXl
         koU4Oqf+HVmq4H/5VruIriVQg6XRXaeFVfWLqRq5xV9ymzp6jq3UosmYtg/LbD8p4DHg
         +SrA==
X-Gm-Message-State: ACgBeo0hSX9mTZtfJjgf32svQEl51WUMEO29mafuGqntttvk5hf2EhEd
	Pf+ekHjO0az4ArgpP//+YmqiMw==
X-Google-Smtp-Source: AA6agR4To6jQmPD+FVrLSDWzA4HTSJc+DW9e5B3mD20LG4LnNacMcgXLafLQtWGZ/qRMNWiVa5DpOw==
X-Received: by 2002:a5d:6daa:0:b0:228:6323:3bca with SMTP id u10-20020a5d6daa000000b0022863233bcamr3778885wrs.544.1662362528052;
        Mon, 05 Sep 2022 00:22:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id co4-20020a0560000a0400b0021eed2414c9sm8224965wrb.40.2022.09.05.00.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 00:22:07 -0700 (PDT)
Message-ID: <0ad6a792-74c2-9957-ee56-f183dcd75c58@baylibre.com>
Date: Mon, 5 Sep 2022 09:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND v8 4/5] dt-bindings: nand: meson: convert txt to
 yaml
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220822091838.18528-1-liang.yang@amlogic.com>
 <20220822091838.18528-5-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220822091838.18528-5-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_002209_882062_FD30889C 
X-CRM114-Status: GOOD (  22.74  )
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

+CC [devicetree@vger.kernel.org]

Please Add this ML to CC if you resend, it's the last patch of the serie that haven't got a proper review.

On 22/08/2022 11:18, Liang Yang wrote:
> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   .../bindings/mtd/amlogic,meson-nand.txt       | 55 ------------
>   .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
>   2 files changed, 88 insertions(+), 55 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>   create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
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
> +
> +maintainers:
> +  - liang.yang@amlogic.com
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "amlogic,meson-gxl-nfc"
> +      - "amlogic,meson-axg-nfc"
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

Thanks,
Neil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
