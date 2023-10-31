Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D2BC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyQ2r1WWIYxVXBP7K7otaBuoURDxEmpRcfBnxeKm9P0=; b=dSKv98AExQJQ2m
	HhLQ8/glFAetEJE/0J5iLviZ9c/iEZn2XQmpc/fMFGANUE5I4FdvJ7BDhZopIvgx8GbNxs35XIch0
	t58rUsYUBlVmQCMFmRKGTgyzRJc7blIGHEpV5MmpXlaEqerUA7njd38ZD1Z4CQHirzohX0KiDq0pL
	994DQ1LMdP1FPiMppvvAaSB6Z1b5z145gbZgZOJnQ0bShfn/IkDJmVktoP2oPlo/3rlvcas8XpSkR
	L/svqBEVjeNOWsS4C3uvpEKixTIIgWXfPZ2QzigfPwU7MNqMxEd+D2XxmyfR16lG2POA10sYketMu
	xHyfeHZFnlZ0Z+2s54CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqeI-005Wih-0t;
	Tue, 31 Oct 2023 15:27:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqeF-005WiK-16
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 15:27:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507ad511315so8405106e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 31 Oct 2023 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698766037; x=1699370837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mh5G9tVVf1JRV0Miwwbk1Eyiy5gIebT90d4LTmK9Wrk=;
        b=csA8xcmx3I1ZKvyR2BhnA2mBq/bMI74taOClW6/ARizi2rGPUs9F43lOFzg+j2D7j3
         nqY4KRMA7BuhtbkA6sJy4J6nvRbMIRF9xEDjBuzP8hrUtHDudxVzHPy7Odul/sSRXXIe
         vEyqJX7K7JHMmf8UfdOmyjfQv7DiaWoJuur1rqrowtdDJ31sePwn7o4heKl2t6E1MK+J
         2ztB7o6tV+4nfbR4pqf+UK6OUs8V1y4PjPY/2NGEoweNwbMW6EILtdUgkcE7HjavpEeD
         xBPe7yhMSKpE5ekXcUxgvLCMRtcyZeVF32Oxzd6WvGAN7paWO7Aowe03bd5Z2daFIYuX
         2l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766037; x=1699370837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh5G9tVVf1JRV0Miwwbk1Eyiy5gIebT90d4LTmK9Wrk=;
        b=p1mTnagTgNCOIK4i8RotMCQOXU63s71x2sRHVvUpqrn681H01isIbhv/VOjcXbYhFn
         fB1xYDxMN4h3OyK9Gr2mlOGBBIoWAWCYYNPw9m40TabXTf7+HWpxtosf/+fLW2xb74TD
         b/EhAO5My1fKBG6XYbcogGj+16ftN4hmpjCIWTY9nVgW+ZywNHMdpiMTl0AZK5JQoq3e
         +37QOz1hZUFrlIZCIqwtxV8YSw/XGNkT1kTDbT9+0XjVnh7qKhoiI3a2bB+A4QdjkhBj
         G0RI8ffFsPXTQvZ6Z8zmZI6jeiSc3P2v7Ge0mAOxY5UHArcOiwl3LY9gFnHKce7rnSha
         F+Bw==
X-Gm-Message-State: AOJu0YyS7RFZ55UY+Nu+N/SUOfy58XRpQunFvMMYBHDnjtUUIcY1vdbj
	fM4N7hLA2S2Q5yv2/s+BccbpHg==
X-Google-Smtp-Source: AGHT+IE4pC3t7FwqoQD0BIaIDI2MyHaowR4Ik+vtDtozLojI3EFuqYMFMD/+gJ/POw2/NQahzE9vSQ==
X-Received: by 2002:a05:6512:1110:b0:507:9608:4a87 with SMTP id l16-20020a056512111000b0050796084a87mr10317659lfg.56.1698766036843;
        Tue, 31 Oct 2023 08:27:16 -0700 (PDT)
Received: from [192.168.143.96] (178235177091.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25110000000b005057fe45833sm236371lfb.227.2023.10.31.08.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 08:27:16 -0700 (PDT)
Message-ID: <8be3b4f4-f3d1-41c8-bd4a-90adf1a02ea6@linaro.org>
Date: Tue, 31 Oct 2023 16:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] arm64: dts: qcom: ipq9574: Add support for SPI
 nand
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, quic_srichara@quicinc.com, qpic_varada@quicinc.com
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-6-quic_mdalam@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231031120307.1600689-6-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_082719_389217_B0D086BA 
X-CRM114-Status: GOOD (  16.73  )
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

On 31.10.2023 13:03, Md Sadre Alam wrote:
> Add support for QPIC SPI NAND for IPQ9574
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 56 ++++++++++-----------
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi       | 30 ++++++++++-
>  2 files changed, 57 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 1bb8d96c9a82..5e4200edb873 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -15,48 +15,48 @@ / {
>  	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
>  };
>  
> -&sdhc_1 {
> -	pinctrl-0 = <&sdc_default_state>;
> -	pinctrl-names = "default";
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	mmc-hs400-1_8v;
> -	mmc-hs400-enhanced-strobe;
> -	max-frequency = <384000000>;
> -	bus-width = <8>;
> -	status = "okay";
> -};
How is removing SDHCI related to adding support for SPI NAND flash?
You must explain your changes in the commit message.

> -
>  &tlmm {
> -	sdc_default_state: sdc-default-state {
> -		clk-pins {
> +	qspi_nand_pins: qspi_nand_pins {
node names (between : and {) must not include underscores, use
hyphens instead

> +		spi_clock {
>  			pins = "gpio5";
> -			function = "sdc_clk";
> +			function = "qspi_clk";
>  			drive-strength = <8>;
>  			bias-disable;
>  		};
>  
> -		cmd-pins {
> +		qspi_cs {
>  			pins = "gpio4";
> -			function = "sdc_cmd";
> +			function = "qspi_cs";
>  			drive-strength = <8>;
>  			bias-pull-up;
>  		};
>  
> -		data-pins {
> -			pins = "gpio0", "gpio1", "gpio2",
> -			       "gpio3", "gpio6", "gpio7",
> -			       "gpio8", "gpio9";
> -			function = "sdc_data";
> +		qspi_data {
> +			pins = "gpio0", "gpio1", "gpio2";
> +			function = "qspi_data";
>  			drive-strength = <8>;
>  			bias-pull-up;
>  		};
>  
> -		rclk-pins {
> -			pins = "gpio10";
> -			function = "sdc_rclk";
> -			drive-strength = <8>;
> -			bias-pull-down;
> -		};
> +	};
> +};
> +
> +&qpic_bam {
> +	status = "okay";
> +};
> +
> +&qpic_nand {
> +	status = "okay";
status should come last
> +	pinctrl-0 = <&qspi_nand_pins>;
> +	pinctrl-names = "default";
> +	spi_nand: spi_nand@0 {
no underscores in node names
missing newline between properties and subnodes

> +		compatible = "spi-nand";
> +		nand-ecc-engine = <&qpic_nand>;
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +		spi-max-frequency = <8000000>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index b44acb1fac74..f9c21373f5e6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -336,10 +336,38 @@ sdhc_1: mmc@7804000 {
>  			status = "disabled";
>  		};
>  
> +		qpic_bam: dma@7984000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x7984000 0x1c000>;
> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			status = "disabled";
> +		};
You're modifying the SoC and board devicetrees in one go, this won't fly

> +
> +		qpic_nand: spi@79b0000 {
> +			compatible = "qcom,ipq9574-nand";
> +			reg = <0x79b0000 0x10000>;

> +			#address-cells = <1>;
> +			#size-cells = <0>;
these two properties usually go below status, at the end

> +			clocks = <&gcc GCC_QPIC_CLK>,
> +			<&gcc GCC_QPIC_AHB_CLK>,
> +			<&gcc GCC_QPIC_IO_MACRO_CLK>;
Indentation here is messy

> +			clock-names = "core", "aon", "io_macro";
one per line, please

> +			dmas = <&qpic_bam 0>,
> +				<&qpic_bam 1>,
> +				<&qpic_bam 2>;
ditto

> +			dma-names = "tx", "rx", "cmd";
ditto

> +			nand-ecc-engine = <&bch>;
> +			status = "disabled";
> +		};
> +
>  		bch: qpic_ecc {
>  			compatible = "qcom,ipq9574-ecc";
>  			status = "ok";
> -		}
> +		};
This means the previous dt patch would not compile

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
