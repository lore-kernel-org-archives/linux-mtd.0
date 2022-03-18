Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/GojgCHJJ4o6CF9w8a2nXhRBus9ow44Db1whEPXI0g=; b=zdPuXAEsK8b8oJ
	ehMdFVMblSzRE3N64o+tK4cqVjjyX3nAUFa8QIYSBi8c5cWaB8HXwHhj0YYkg+JqnpOB2219SBuhW
	/Ih1WzFLln1WFGG7aCTP04PpAnGnqzaZfdxLRiECjmGCuTltE+86ElimLO5L1BlgzhVpxda+o9Kib
	gDMLYVHw3AnB85+7MGZWcW6Zhngv08Z+j+zl7vTEnqRX6d2GDVeU85UNSt6HXjhPm+K8iu9n2Yrvd
	UoIqy7GpC4keq18fec4nX2Z47H6YTwmaGtjDxGM8+q0TqXbC7YQ2ZtJr1W8IYlme6tooFop5WaWbt
	OrFUtahILnpIuaEj+VWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVD8g-001nkH-F1; Fri, 18 Mar 2022 13:59:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVD8a-001nis-0P
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 13:59:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c4fc700b0038c87edc21eso946749wmq.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2022 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ogHnGGfhi1fcZKMMElkxQ/5rub6U97iyaUhzrHWOyys=;
 b=QTYoNw0JJzHKOlIm/fF/5jmID6xRRwM5hSl5oAZ/1WduaW//xSWvxlqs6D7wrc4Ecr
 +iNZ+TfCoyAIxYBswF2A+siArIFrITuKN2M4kWbd3Uc99T5U2n+729wtt/cT8u3ZA64q
 TJX64giUWy+dzyBEaF5xVsB/qoxCmd72/dqK8rBjV7i+ib22hFwgLWKfR3/wmfU4MKZU
 XduWJqoMvitOQrRLQC8BfcQ2jHGQ9B/TaOutLlSY7UyDvpz11QcB5jWG1CEAWdqOxLwU
 5VT70JopfPrAekKA5aHrwhb42/DmgI6zKWdUmcYbc02dtahVy+QmJ90ivFtA6PP5rQvd
 j/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ogHnGGfhi1fcZKMMElkxQ/5rub6U97iyaUhzrHWOyys=;
 b=UVtlNFW0Bh2koXV0IhcRLbkBzOtgkTANbe72DlE7hoh5ilLYGh1px13CU2Hr9d72pi
 oXZYfYabTjNeElUV+5kGxMRrn57r4d/IMzrOCMfvejdCvpvNQ0I0Zefsp/uYUtC/zwTW
 orAt7OqZnjYPWO3LsVo2hKs9r4odxPQtSh9uxVJ4nYTU4Zir3aQQG9+JNp5jUZvKlb7W
 VpWTY2Rrmo1vLq6vYXsEkmjADvPbEm0GbgnJ21TN9VF/sX02hRy9wRIB5qVZdI1uaXig
 qFfPufoLchZWwhBOu5Z9BmXK/zGcSFUaWma/OsgFmJIl1UFUTOB2cQB/wErEij6fiBBF
 apZA==
X-Gm-Message-State: AOAM532nPX1ZAUj7rN+N3Xl/77x+C0zl46N+wDt3Sg0ACW7VoJRihRXj
 plh0Psva/NfL5fA3492Z8P9UwQ==
X-Google-Smtp-Source: ABdhPJxGf457WOptsZ0h44spLE63BITfdwRP7Nj7ap1ftMgM1BF40eRcmCNECryD8/akC48m6o3TLg==
X-Received: by 2002:a05:600c:2f8f:b0:38c:889b:b211 with SMTP id
 t15-20020a05600c2f8f00b0038c889bb211mr3026527wmn.151.1647611966479; 
 Fri, 18 Mar 2022 06:59:26 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c3b8700b00389a6241669sm11067093wms.33.2022.03.18.06.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:59:26 -0700 (PDT)
Message-ID: <0813d4a1-8430-f089-65ea-4e305cfda545@baylibre.com>
Date: Fri, 18 Mar 2022 14:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] dt-bindings: nand: meson: refine Amlogic NAND
 controller driver
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
References: <20220318124121.26117-1-liang.yang@amlogic.com>
 <20220318124121.26117-3-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220318124121.26117-3-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_065928_139558_7E01F2C8 
X-CRM114-Status: GOOD (  21.73  )
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

Hi,

On 18/03/2022 13:41, Liang Yang wrote:
> convert txt to yaml and refine the meson NFC clock document.
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   .../bindings/mtd/amlogic,meson-nand.txt       | 60 ----------------
>   .../bindings/mtd/amlogic,meson-nand.yaml      | 71 +++++++++++++++++++
>   2 files changed, 71 insertions(+), 60 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>   create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> deleted file mode 100644
> index 5794ab1147c1..000000000000
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
> -
> -This file documents the properties in addition to those available in
> -the MTD NAND bindings.
> -
> -Required properties:
> -- compatible : contains one of:
> -  - "amlogic,meson-gxl-nfc"
> -  - "amlogic,meson-axg-nfc"
> -- clocks     :
> -	A list of phandle + clock-specifier pairs for the clocks listed
> -	in clock-names.
> -
> -- clock-names: Should contain the following:
> -	"core" - NFC module gate clock
> -	"device" - device clock from eMMC sub clock controller
> -	"rx" - rx clock phase
> -	"tx" - tx clock phase
> -
> -- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
> -				controller port C
> -
> -Optional children nodes:
> -Children nodes represent the available nand chips.
> -
> -Other properties:
> -see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
> -
> -Example demonstrate on AXG SoC:
> -
> -	sd_emmc_c_clkc: mmc@7000 {
> -		compatible = "amlogic,meson-axg-mmc-clkc", "syscon";
> -		reg = <0x0 0x7000 0x0 0x800>;
> -	};
> -
> -	nand-controller@7800 {
> -		compatible = "amlogic,meson-axg-nfc";
> -		reg = <0x0 0x7800 0x0 0x100>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> -
> -		clocks = <&clkc CLKID_SD_EMMC_C>,
> -			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
> -		clock-names = "core", "device", "rx", "tx";
> -		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
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
> index 000000000000..4de4962a40b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
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

   reg-names:
     items:
       - const: nfc
       - const: mmc

Is missing to conform to the example

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: "core", "device"

This should be:
   clock-names:
     items:
       - const: core
       - const: device

> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg

+ reg-names

> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@7800 {
> +	compatible = "amlogic,meson-axg-nfc";
> +	reg = <0x0 0x7800 0x0 0x100>,
> +	      <0x0 0x7000 0x0 0x800>;
> +        reg-names = "nfc", "emmc";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> +
> +	clocks = <&clkc CLKID_SD_EMMC_C>,
> +		<&clkc CLKID_FCLK_DIV2>;
> +	clock-names = "core", "device";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&nand_pins>;
> +
> +	nand@0 {
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		nand-on-flash-bbt;
> +	};
> +     };
> +
> +...

Don't forgot to run :
make ARCH=-arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

after installing the DT schema validator:
pip3 install git+https://github.com/devicetree-org/dt-schema.git@master

as documented at https://www.kernel.org/doc/html/v5.9/devicetree/writing-schema.html

Thanks !
Neil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
