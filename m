Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EC8C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eLI7Gp5hNAe3zqeJc0HCsaJi+N5HJjCO4ShkkPluNg=; b=gCPzoGAD0Pk+jL
	zfbzO9VFQ+BC45zNWUjkSpsoT6Oei3nxZrJaU+1L6Dpje2R533n2hBoxl9QPhqP/QZhQrtHVNDKIx
	77zHFV1dH1LOhMpDHZLdjjTZQ+Eg75iKx3Hzm/BrdWHyCXJchKACnOM0Pd6wWL/+hwUt82AxgQ9tL
	Hkxx68KBQ0ZyOvITGlIgs10N/oSe4ONDQiMmFTMjFPw2Kea8PsiIg5kYSfSKF3bPGoDkjWOdheB0R
	Q3bu67UZ9rJoMFyqIz2A8faxzEaDY8XUV/ubXOtqqe/3Pny2pWlNqL3SjB4K1RbZPC8ByGXD43jBo
	A9RyE1KFcY11thBFjXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkRHN-00BUcl-KB; Fri, 29 Apr 2022 14:07:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkRHC-00BUa8-5w; Fri, 29 Apr 2022 14:07:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r11-20020a05600c35cb00b0039409c1111bso3870498wmq.3; 
 Fri, 29 Apr 2022 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F6U0EkqCPsQHAJyvN7uVwZZ/NZlhtUREfzw+eDMOBxU=;
 b=FgBhORL/bHYdqcOTfAOYXjVyqsNMi4ftyxMRwi5DSgY5L0D2OPSFQXG5eXFPAM1evK
 Re0fEJ45kGwAkXIw36ceyZt1hGE8GbtTvD9B3pC2EwbY9M5aya0oybJf6AP31aGHr5np
 CH2OOSQzsSUQIpWT/mV/3CYU1Rwu2yzlrV5GmzNc61ajON2A4+yo5dT1srOb5eUHbns7
 0IbUZRn613u1SrHKDoAkYd9Y+hGvKxafwv8pOsUavd4YSlxMiCXAMgztJz/1RqYtuCS4
 kMmX01NwGxziPRVDnPZN7k5Hn4HKUqj3pFmKrsoADJJoZpJHbCkYpxwEBX1yubDzNzf+
 4C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F6U0EkqCPsQHAJyvN7uVwZZ/NZlhtUREfzw+eDMOBxU=;
 b=nZkxt2i7pvxSmpYRu8zY4gBsmGTHn6JiSc8oXpHyv9Oj6W5PuNdj3iD3BeOHnLSltc
 xoc2iouulqrH5LnzcVY4GEUKG0f39T3HmRbqKignsgZ15fbVgWxuFCqSrzOFlWQwe28A
 JzQqiaAg4YhhyHFCnd1Aipkc575MN/UesP0hdekVTcEo1IudLpC5k8Ws62gm2P+tATSR
 gXRDqg6Qef6bOf0568arqX0hqoBcBqrr2Mr87cwOKKOUvYEgXTFWoH2kBItlPaM2AY3B
 NkzEtvcKgjW+Jgt3JdMRVPU7kFI5Amhs+7s7w9m4/ryAhTk6pJM0vT3k7tDefRsUTr2o
 k4nQ==
X-Gm-Message-State: AOAM532u+SDnVC0CgX33/AcpP7iUPkDgkCU8zcnwC2aD6MxCP83MzYEf
 Yeld+Qybjb/X9B+A/A+H9H0=
X-Google-Smtp-Source: ABdhPJxgo3nsWAeqRx16WilGR5Kx+5rmyDRvK20doz+vPEmTvwA8MNy6ugVxIjkZs01TFSvmOlipLQ==
X-Received: by 2002:a1c:f606:0:b0:394:1a21:f68c with SMTP id
 w6-20020a1cf606000000b003941a21f68cmr3380937wmc.131.1651241236731; 
 Fri, 29 Apr 2022 07:07:16 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce36esm3230764wrc.1.2022.04.29.07.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 07:07:16 -0700 (PDT)
Message-ID: <6aa03759-9027-4841-9ad1-84cbc19fcb00@gmail.com>
Date: Fri, 29 Apr 2022 16:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220424032527.673605-6-gch981213@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220424032527.673605-6-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_070718_273476_93F50811 
X-CRM114-Status: GOOD (  16.22  )
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



On 24/04/2022 05:25, Chuanhong Guo wrote:
> This patch adds a device-tree node for the MTK SPI-NAND Flash Interface
> for MT7622 device tree.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied, thanks!

> ---
> Changes since v1:
>    1. use the newly introduced nand-ecc-engine instead
>    2. reword commit message
> Change in v2-v6: none
> 
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index f232f8baf4e8..8c2563a3919a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -545,6 +545,18 @@ nandc: nfi@1100d000 {
>   		status = "disabled";
>   	};
>   
> +	snfi: spi@1100d000 {
> +		compatible = "mediatek,mt7622-snand";
> +		reg = <0 0x1100d000 0 0x1000>;
> +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_NFI_PD>, <&pericfg CLK_PERI_SNFI_PD>;
> +		clock-names = "nfi_clk", "pad_clk";
> +		nand-ecc-engine = <&bch>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
>   	bch: ecc@1100e000 {
>   		compatible = "mediatek,mt7622-ecc";
>   		reg = <0 0x1100e000 0 0x1000>;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
