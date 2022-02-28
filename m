Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FCC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJGPHzgWy85xnlT3UZ0mu89sx8VlRk6W3J4KwoJ796Q=; b=Dc4dq57pdpPBE7
	BL9UYCux56ka+Gw657QtsrMLXPyubzRh8T8sYfDtwoqt4gjzEcwLNeiMGwTG7mxX7cQdNaQI6SW4z
	m9npuZ1pRiGkn5hOBGFm20kXREdFmQ2OjWhJeFwWxUa7/qZ7OtvQ2wDv0wucdWyyBRoAKh2xf8Y32
	t0XjaNBJWVVsyQO5+xM1kDLk4k+GU03dmZT7mJzCEmOVQqj7u4tgSL4ZJDLMnALJdxVdzc33DqmUD
	pcBnA84ROCnMvNMLO5IbsJIEN+QyHmL6aYwGg5w3afyISR+WExxu/3grH+iUCV2I9kQHZTtksMBce
	1cr/P/TWsXsdhp26Fyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOf0z-00C9CK-D8; Mon, 28 Feb 2022 12:20:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOeMp-00Bw5D-Rj
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:39:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so571876wms.4
 for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2022 03:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=cDBGScHfkVSTv36VXkfG5X5AthUAMH7efzJ/5wfVXyk=;
 b=G19khUKoVFopgICadeMBa+MJ/QxUS1CYLQM10sGrMuv4xiIf33Axd54WyOPvKfIO3Y
 L7UkSenO9jqNGoD4EfqXVUKiXmaD1slGcuu30Kg6qIpu9HT/C4JmQKbcoBdJxlo6JJYY
 DtLAgxgVdnSpHGyMEk7kzzPQX793n9H3lTi3h6Ty+Lx1r0Bt6V16IX8QG2D84erqJYdw
 BFouAKSguSLyVVpUqukrJSBESoyRCx2owYdqFzEIg8LthZIjAWyr2xofBcIFLl+rmMWa
 fmjOmhLEaQ2uKiawrWl8tUKZ70lpDjhNQBfQ0fZ2CPaVCfdczeBu6dxaiNB+iA90vu2i
 bhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=cDBGScHfkVSTv36VXkfG5X5AthUAMH7efzJ/5wfVXyk=;
 b=i594+T0FFyAmi3DVjUtS97IjRjllEO0z1TOk/AOJKHyCeqm0uKIPUOfpXK1M37qlDq
 3RbTV4PP04ihR+AdfqEubyAwa2H3DL6qMxadxZWfYm689Ii2xY8IqqaC4HT91Xu16/bL
 1/cRcqswZZ2H7TG0kmF08e9JSEfpAPHs4h8WBTe0+Lbe+HRBGvX6032b9+PV5FPO0EiI
 7DGI4fU4eBJo2yyoVS52OZPyqTL1EqASd7j75Ik1uGzy0GOGqL70xnYOjGSS549LSLyl
 FPjq225nXMNxBvPPEPlNLrZhqgVV/LkKe8UU/bQPwDzfuUp1DIGKmKJWY2oqMvNdkDVb
 /g5A==
X-Gm-Message-State: AOAM533ngfjhosCQ+SKNqG+pKXjQy/94p/lr3cvUyGMSAhJ/acpZBZUi
 PhP27bE2jfGehm48rNHQOr7Abg==
X-Google-Smtp-Source: ABdhPJyQvLDg5tgx3z4pz1Ltnv/7yUVwwyIUa7+ilIX3vUU4XiuriGiFjBw7ZvViVN8Ear/bk8xMzQ==
X-Received: by 2002:a7b:c24e:0:b0:380:e16c:a040 with SMTP id
 b14-20020a7bc24e000000b00380e16ca040mr12751486wmj.186.1646048341137; 
 Mon, 28 Feb 2022 03:39:01 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm10275935wro.26.2022.02.28.03.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:39:00 -0800 (PST)
References: <20220217063346.21691-1-liang.yang@amlogic.com>
 <20220217063346.21691-3-liang.yang@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/2] dt-bindings: nand: meson: refine Amlogic
 NAND controller driver
Date: Mon, 28 Feb 2022 12:36:32 +0100
In-reply-to: <20220217063346.21691-3-liang.yang@amlogic.com>
Message-ID: <1jv8wzw78r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_033903_927775_6A6C01E0 
X-CRM114-Status: GOOD (  20.54  )
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


On Thu 17 Feb 2022 at 14:33, Liang Yang <liang.yang@amlogic.com> wrote:

> convert txt to yaml and refine the meson NFC clock document.
>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt       | 60 ----------------
>  .../bindings/mtd/amlogic,meson-nand.yaml      | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
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
> index 000000000000..671f0a8fdc7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -0,0 +1,70 @@
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
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
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
> +	      <0x0 0x7000 0x0 0x1>;

Please name the register ressources instead of relying on the order

Also, use the actual size of region, not the size you are using in the
driver. AFAIK, the size of the 2nd region is not 0x1

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
> \ No newline at end of file


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
