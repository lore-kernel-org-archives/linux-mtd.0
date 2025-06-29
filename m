Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35030C7EE39
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW3JUDfftS3EeTrbRtEC0veM8qzRI/+Ffic9zM6lLgk=; b=zOvP75XEhg5Lxk
	2xKZjJyirl9AR7UjnDRvrYFCHCS0XK7j2NgRIwtYjmmlOam/9kvvp/2qKvCmAK1uIGaW8aCLwqKvu
	lis7U+VIKz7TfzuxY2xDEMjNi/S4FQ9ITiOHNLuaD5JwHFY3LFRv0qhTfK/UYxH2JCieroypL5ykE
	JxaBvGvXLkm+s3O7e0yI5xsur6bz0cUkOoYI21zPhjeEVlkWFe+RIfBe9Cru0s8intdat8jDkNS/H
	sNtAGwIvQFDX8f8vIYXSFMHaLxzxPdRptmcKHujAW2Suw3CAWYqW8nh/oXvSbq/MHn/pqELt6/Fq2
	7O9cnhPZVG36GdHSSYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnXR-000000002n4-1iSc;
	Sun, 29 Jun 2025 08:37:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnXO-000000002mY-37Ty;
	Sun, 29 Jun 2025 08:37:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-749068b9b63so2688505b3a.0;
        Sun, 29 Jun 2025 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751186242; x=1751791042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+BcgPGnRt3iJg519EPQI5YMO+fb+KS53JEcTm8aE2s=;
        b=jK7R8GEeFSJpVAyok02h9WzAU3OiHURJL1kP+FjM/XXnJ9lxHjPmiPrBttquRAToHJ
         xEelnZQ1uFUQV9CKlZoTlPPdVHLw5T0FYFSCvQv1kJ/RUdrl5dd+hMmSJIAIJNz0zMxm
         6JNSn48u1btzNgelngrDFGWj1fmC1qMYpbqtcPwQcnRhgCVPibkDy5TyKoqh9XvLZBok
         8BdEylUuLAGnzgd8SRA64WwtN8QGsCjcShvoxdjDYxmsv8uphlpobjUbSN1/1hvlcXOa
         D0Y85Vi4W2HGYd2wzakTumTSd7GHpU8gwIvEUTqWMW/KIYy7nlYHhb8+XQYjlEP8E1pN
         Y/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751186242; x=1751791042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+BcgPGnRt3iJg519EPQI5YMO+fb+KS53JEcTm8aE2s=;
        b=NpZntetFhS2DzUxnE+tMb66dyGxZoCDVqMaxvDHjof50DdmmJMJSwpJL9ITE59FLVl
         OeCbBufVPVFmlWBxaddkLrsrvklE9WjSLqUa6TUw+q4fkLa1h4z5Q/2zSUeBkAbkQ7Rt
         cR5bz84ITNUhzwQ6yidxjJzzQhcrMo0GmvlMDIFTgQaGVhe8ceMoQ+FVoIE7ptQ2lScG
         kGJR6682kpsSdweW0fkL8YxuEZjwa2UnXhXE5G2stcA/6jNHMofouck34Q4VbY3b2EV4
         Mxv+Hakc6rjBZsVIi73HZWt7FxaggZmYnIrfbNUXEbyv5z3o5NbIsHL1n36X0RjzdcM4
         3wvw==
X-Forwarded-Encrypted: i=1; AJvYcCViAJ4aQRUvhSfP8uL++WVmon3Fniw9UHxJduz2ZX31Kwu55pCMNMda6dnnQx2Gv45XlD10l1OjSOEoDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfKGha6IlPGXOxbMOGHdjsC+kR+yzlDyRC+/tiwQwf4tN+iDt
	seZY66gm+fQRto0i4GHk9HszzKaQGSadeI7ZwalvDkb5KkMeb753sn22
X-Gm-Gg: ASbGnct3iykv8Z68bpCWWQU9WemeCFSAvIDww4OVXELpLM74+DbH5CuKdhBb1TBHhxt
	N7RaG4m1B28f9PODB52jJBeT4NYE5Mst1o4P023Vyy9AutPVuVXjNxbnvv0ck/Ugop+IiahuLKo
	wpr9Pn9sa4h5EKefTjoNpPGXfhcRR4z3VYcPM0+ZJdsASPDMzzgVLtNbF3XeoWArns6c0ZrI78I
	EoB7/XVM1CO6ewZzRGdpQrF3iK4vAeYW/oVA2nVrFklstmqlqFdHRiu2nwyz+pi4WorCxUKzXj6
	Qwzr4yPj57Gm0zsD6RYvHmA0izWwloRGFzQtbICOuchcaXVmibf/KEXMRz4me+oUbV0=
X-Google-Smtp-Source: AGHT+IF5QdK7zE4cTr0041AFjTqMIeuBxsDXV4WV5f+rw5vGOtEvUzEIvjAK9unWEGYVymasc3U0vA==
X-Received: by 2002:a05:6a00:4b11:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-74af6fcd15cmr10632012b3a.21.1751186241526;
        Sun, 29 Jun 2025 01:37:21 -0700 (PDT)
Received: from localhost ([101.76.241.248])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af557b3a2sm6117064b3a.104.2025.06.29.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:37:21 -0700 (PDT)
Date: Sun, 29 Jun 2025 16:37:18 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Message-ID: <aGD7Pvua1OCdqfb3@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_013722_784223_8E1409BD 
X-CRM114-Status: GOOD (  15.34  )
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

On Sun, Jun 29, 2025 at 04:23:13PM +0800, Zixian Zeng wrote:
> Add SPI-NOR controller and flash nodes to device tree for SG2042.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -138,6 +138,30 @@ &sd {
>  	status = "okay";
>  };
>  
> +&spifmc0 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&spifmc1 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-0 = <&uart0_cfg>;
>  	pinctrl-names = "default";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 85636d1798f11804546ed8606595ace1b4cb2a2f..0e1fcb54480af71147d0e71178a8eb08a31b75c3 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -48,6 +48,30 @@ soc: soc {
>  		interrupt-parent = <&intc>;
>  		ranges;
>  
> +		spifmc0: spi@7000180000 {
> +			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";

Sorry, This should be compatible = "sophgo,sg2042-spifmc-nor", binding
is changed in this patch series. My git branches are a bit messy, sorry
for taking your time for this issue.
> +			reg = <0x70 0x00180000 0x0 0x1000000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_AHB_SF>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_SF0>;
> +			status = "disabled";
> +		};
> +
> +		spifmc1: spi@7002180000 {
> +			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";

Same as above, sincerely

Best regards,
Zixian
> +			reg = <0x70 0x02180000 0x0 0x1000000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_AHB_SF>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_SF1>;
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@7030005000 {
>  			compatible = "snps,designware-i2c";
>  			reg = <0x70 0x30005000 0x0 0x1000>;
> 
> -- 
> 2.49.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
