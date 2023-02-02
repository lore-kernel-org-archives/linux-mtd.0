Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67332C05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nr1HvjxDcjOWkejBuXtWkK7fcbpPJlMOGjjEZl2VwE=; b=uGpIy2GE+XkOR/
	duuvwPwm9Zfnp0i59LuV/NJC8oQKZff2tu5z8f8Rd7MapnS/L3k6NGMkxL3OxejsmYRiCFnUGJMXh
	FgIByVOGznV/SdlkXHYJUX0/p1Zg3f2MV3U0+wwpkRegkBrZLFSHRTbPoCUgDFE8mS9F7XhU6ifOh
	JiKeY5QxYy57MV5WiPjlZSfOgkt7VSuLYjML/+FvJVJFs3Bx5/StBhdfD6grxu6SM1pClj7D68qEL
	EiwYhhuvxR6SU0Zj7XSqfnmrubXHYXNR6SkuYqR722K0rMtbuZy9CeJoNYrqbepQpPCGRQpRqcxbC
	REdQGt0kImsMkdXdGTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYSm-00Fi1p-Ll; Thu, 02 Feb 2023 12:13:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYSj-00Fi1A-UR; Thu, 02 Feb 2023 12:13:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r2so1505297wrv.7;
        Thu, 02 Feb 2023 04:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JFY/1NaFcQJxriJ5Nglyu5euCxsa3XuMh1hTRdAMO8=;
        b=Gb6wv+fems3L4HhTw7k9YzFTd1lY070awJ4ifr/28qS7RWw6W6s5FTPBGe7IyzrJzS
         MMLvZCfq2xIu87rzSPKdtyCVh5lC950V5hPtEvTRgalo6dzUqnxYPyhxgRdk3nxgXuza
         kdcoOsbB9oOERE1H6DIomSCMRl2fuP/Zltdc0HtIkCF8IP2NLmP6oFA7xcAbGCeTb386
         Ar4YryeVON/rFJIbzt8fwbb8hO16bVOuiZBIHEpc+ee2j9sjODNrnJNPVMuxCE8Rsg+y
         WaZL/MW1hT0Ho+NpOhVQh1J3ygBVm8zVQOhfaeHjOyOjDF92EOs/JvMrXuqRTzen/nJs
         sIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JFY/1NaFcQJxriJ5Nglyu5euCxsa3XuMh1hTRdAMO8=;
        b=r/EOkmjpPknI0+PAyv/TkjBDL6HAesEEns/q0t2w9pVjmjuCyOn8DoXP04qY6BUxHu
         yIaTBAjuZWDDgartbEpZmBlspqzgfB3nZXw7Qu7U50giMiUjFCrW8jilU0zAunXNvXnQ
         0RtDFCXXJeDVO1xQ0D9rWgyOykj6v24Gumz7sDW4C6IwnHkKpBsCrbaT/sTQrz5rJiGY
         IYV0prAkN52GNLvKdUWr4fsRIS2wvC3Weyoptbh5dMv4JcV6JrEeWsl1HQ4vekBiohsV
         o/nh8jIT7OBTXwO3+jAB9ZS9Dq+Bs2HqlKoC6NLUOdsxsXdqYMaHciu+vvWAZuoQFpvh
         LXyg==
X-Gm-Message-State: AO0yUKVm/HqPZc1x5QY92B/+If67d6Ya/zs1b41vUQEwIOLVPYbTKldz
	YxmqQOsP/5S4qmnmIecTQhg=
X-Google-Smtp-Source: AK7set9tRKVVWu4q2LyASgx0E1BBc2t6l0gIfR1ti+UZFp/4PhRDKlvvVgTj8Rk4DWgGoBILlDqjHA==
X-Received: by 2002:a5d:604c:0:b0:2bf:c31b:1922 with SMTP id j12-20020a5d604c000000b002bfc31b1922mr5102901wrt.3.1675339987722;
        Thu, 02 Feb 2023 04:13:07 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d64c7000000b002bdfe3aca17sm21470152wri.51.2023.02.02.04.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:13:07 -0800 (PST)
Message-ID: <eea6f2f1-9f07-0bb8-50af-c1daf5131357@gmail.com>
Date: Thu, 2 Feb 2023 13:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 2/5] arm64: dts: mediatek: Fix existing NAND controller
 node name
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, benliang.zhao@mediatek.com,
 bin.zhang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230201021500.26769-1-xiangsheng.hou@mediatek.com>
 <20230201021500.26769-3-xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201021500.26769-3-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_041310_009505_EC252BF2 
X-CRM114-Status: GOOD (  15.16  )
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



On 01/02/2023 03:14, Xiangsheng Hou wrote:
> Change the existing node name in order to match NAND controller DT
> bindings.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Queued for the next merge window, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index 879dff24dcd3..ed1a9d319415 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -559,7 +559,7 @@ spi0: spi@1100a000 {
>   		status = "disabled";
>   	};
>   
> -	nandc: nfi@1100e000 {
> +	nandc: nand-controller@1100e000 {
>   		compatible = "mediatek,mt2712-nfc";
>   		reg = <0 0x1100e000 0 0x1000>;
>   		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 62487a3c4db1..eb4e4638b548 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -538,7 +538,7 @@ bluetooth {
>   		};
>   	};
>   
> -	nandc: nfi@1100d000 {
> +	nandc: nand-controller@1100d000 {
>   		compatible = "mediatek,mt7622-nfc";
>   		reg = <0 0x1100D000 0 0x1000>;
>   		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
