Return-Path: <SRS0=i2dy=LC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7541AC4743D
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 18:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D93961582
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 18:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D93961582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QPP3aqNI9+foORrHw537zpA17+SMeOpTfpqp/taaahQ=; b=cV3cipDFBJfO9k89na5aO0F0m9
	7xIl8E37sf4qofJhrqEybyCWMFnUxR9ctzKARW9qTmCaZvXP4pZQvqiibmXekLGYs4EObbYGBD8xk
	4CJGghS3uBE/gSqsDbecooQpXBN+V/Dc/3YdmXRd7lDHXGWUoWWeNXaj8aHLWH4CTwXn5+TiAOpzo
	CaM3axUUgXzLlhhq+piWJFQ8OYucnFM/2LlZTGFobvYjjj7/Irq/F9WMSwCz18Ug9G++NuUNonp1C
	rnKtV7gD+Q/7Oxe31sxKQfo3LUNpmzki85+aFnfaH1o9EtlV6I3JP5zv5Hg1Rj3NWMpKEswj8SIBN
	YtWUqh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqgeZ-00A3AN-Rh; Tue, 08 Jun 2021 18:40:43 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqgeL-00A37l-Gu; Tue, 08 Jun 2021 18:40:30 +0000
Received: by mail-ed1-f41.google.com with SMTP id ba2so23966994edb.2;
 Tue, 08 Jun 2021 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W/V7ksUiiZB58zMxMRkULUFDegQBYCL2IF/rhUEMXHc=;
 b=IJbqV6FUUfi7qCArMillGRxl4VycBJhs5gYs1Lf0mMvJYu5kw345uaLWVcikHjOxiy
 TFJQhy70+KtzUmpSPBAGITjsAaU9yHpuRah8PWUPx3giAgGmLDxqxAxGFPEvIjWZjadh
 /XjD+XNLZrd1n4PDsyvZtPLrlI1pJCUtfwVXSCJ8CiAXMFZFYxladyIDH8tGjl30wMkf
 vtr/ZiqQVcAVouktL/hMNvpZFd06DgNsv1ovNfmfLhFR4HIfRNfViVNesEUjSkCN7EZV
 pNso+09KKYl9bWgGxOaRKlV2AfV7pPF7LZelGToKFJmpdo8SJ2CMdKHVVOa5ZFr1TDSi
 +4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W/V7ksUiiZB58zMxMRkULUFDegQBYCL2IF/rhUEMXHc=;
 b=M6V4qEv+RlwkkmobnNub72XqOX+SNQ+wa/zUXjC5W+Tgqlri8teFjODcmwdGhrxSfm
 lMps/3zUZEdT8IBKf2l92m/N+2fpEoA25CdARrJlpHwSUh5rbgyAhZXkl+6QSWwTIgvS
 e5LKDI2fg62eXPmBB2U81dEiNlFh9oWlBbe1EH8DumuEH/y+nQ6GGO5YP6V5P9Yrk6rw
 vSlf6wHDt5M1rbzRV9CF0ou/aCnbFDrWmTWM8co7tCFVHfbV3+GDMocZs3dp6VdJzRRx
 ZSOwXm6CogDwqKetfXwQ31OqR5M19mNn8Wg1xJpU5rAYCRB6muFlmH41ZL3kRUcbv15l
 XDVA==
X-Gm-Message-State: AOAM533tyEBXr9DoAaOdCYd7yf1/1duvR02FKJNDzxIXJHyPEv09edPw
 samMhvGgJEmRPF0CRBjmSA8=
X-Google-Smtp-Source: ABdhPJxi/SXwX8f6NHTk5beJ5dr9fZw0669BTAJnkBXZ5K/oYpH7fAlpLbYQC+bUjrsGqeChFLoUQw==
X-Received: by 2002:a50:8dc6:: with SMTP id s6mr27186109edh.50.1623177566310; 
 Tue, 08 Jun 2021 11:39:26 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 z7sm174358ejm.122.2021.06.08.11.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:39:25 -0700 (PDT)
Subject: Re: [PATCH v6 5/8] arm: dts: rockchip: Add SFC to RK3036
To: Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20210608022644.21074-1-jon.lin@rock-chips.com>
 <20210608023305.25371-1-jon.lin@rock-chips.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <b5f29e1c-f4ec-7a08-a97c-8a516ba6649a@gmail.com>
Date: Tue, 8 Jun 2021 20:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608023305.25371-1-jon.lin@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_114029_603087_A6F781FD 
X-CRM114-Status: GOOD (  17.67  )
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



On 6/8/21 4:33 AM, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a devicetree entry for the Rockchip SFC for the RK3036 SOC.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> Changes in v1: None
> 
>  arch/arm/boot/dts/rk3036.dtsi | 42 +++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
> index e24230d50a78..e7faf815ca74 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -206,6 +206,17 @@
>  		status = "disabled";
>  	};
>  
> +	sfc: spi@10208000 {
> +		compatible = "rockchip,rk3036-sfc";
> +		reg = <0x10208000 0x4000>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
> +		clock-names = "hclk_sfc", "clk_sfc";
> +		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
> +		pinctrl-names = "default";
> +		status = "disabled";
> +	};
> +
>  	sdmmc: mmc@10214000 {
>  		compatible = "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-mshc";
>  		reg = <0x10214000 0x4000>;
> @@ -684,6 +695,37 @@
>  			};
>  		};
>  

> +		serial_flash {

sfc {

Nodes are sort alphabetically.
Sort other patches with sfc nodes in this serie as well.
Maybe rename nodename consistent with sfc label?
Similar to nfc nodes?

> +			sfc_bus4: sfc-bus4 {
> +				rockchip,pins =

> +					<1 RK_PD0 3 &pcfg_pull_none>,
> +					<1 RK_PD1 3 &pcfg_pull_none>,
> +					<1 RK_PD2 3 &pcfg_pull_none>,
> +					<1 RK_PD3 3 &pcfg_pull_none>;

Keep align with the rest in the pinctrl node.
Check that in other sfc patches as well.

> +			};
> +
> +			sfc_bus2: sfc-bus2 {
> +				rockchip,pins =

> +					<1 RK_PD0 3 &pcfg_pull_none>,
> +					<1 RK_PD1 3 &pcfg_pull_none>;

dito

> +			};
> +
> +			sfc_cs0: sfc-cs0 {
> +				rockchip,pins =

> +					<2 RK_PA2 3 &pcfg_pull_none>;

dito

> +			};
> +
> +			sfc_cs1: sfc-cs1 {
> +				rockchip,pins =

> +					<2 RK_PA3 3 &pcfg_pull_none>;

dito

> +			};
> +
> +			sfc_clk: sfc-clk {
> +				rockchip,pins =

> +					<2 RK_PA4 3 &pcfg_pull_none>;

dito

> +			};
> +		};
> +
>  		emac {
>  			emac_xfer: emac-xfer {
>  				rockchip,pins = <2 RK_PB2 1 &pcfg_pull_default>, /* crs_dvalid */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
