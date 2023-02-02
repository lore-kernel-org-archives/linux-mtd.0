Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA37C05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRUrTRVrB//XrOX12AwHkQ5VvVlw6lG2D+a/GJlKfY0=; b=EWL46hdP9jQ2pK
	uUIwc7M5e/vnxFqe3QvH0SEFBHxUhMuZu1zH+MvcZf87aeUHHDsuv+b/iYFpDddaC17rGoxzwMJ4W
	YmuaUfzyXlQSPARHJfo6gsQRjUWbjY25ouJhJYTUNpx/6boFFQwvdrd3rAUVrLBRPdXQxOpv1OKUL
	xP0m5ioLeLewL6Ng9dH6igmtVKaIW7szNMB8r1h1f/TmRsKezh1briKSJPcV7rZxOGhEisSwHBfqF
	Dl7TiuIydDH3EybTrWet+QKG+F/WGUa4fOtBPVWuS0Qb+3y9UZ+7QHoutvUbTfiIZTTq9Z3Qh9XIU
	zriQi1wXk58945xj16Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYSw-00Fi4k-Gm; Thu, 02 Feb 2023 12:13:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYSp-00Fi2Q-Tw; Thu, 02 Feb 2023 12:13:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1248366wmq.0;
        Thu, 02 Feb 2023 04:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaBK2gOP9VnPxAmCYXpgUSfZykqxTRkLrfI4y3qj9N8=;
        b=jTAx61SYlxZsQ6Nk2B9Y7Hcv3Cxv5gUh1nyzMz56+eVNc6/QrUxORNmgHLaUy/HHrC
         MTNnG1Sf+6k78VtBUjdWdJs7DBSWjuUYx4Lpl7P0IYguoW+VxS0i05ugVqJNEfvTl71W
         rzWr4e02xWPWjz4n0Qs1MgZp05OebBOza9SM0pERQiU+m6z+KcWr7AD0wPlUbVY+phDD
         CcPGOgfIsXwKyxfo9KBKziOcCNEOxaXWiZg/BSqlQi8U3+XQRnFwrB5CqJof48WGt7qU
         jzBTLgQoVdd6pQPz6e4QejJMa2KnvCUFBtM9Eu835wZsVsYXC8BfA4S3fe0Q1e7HMeSN
         Gcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaBK2gOP9VnPxAmCYXpgUSfZykqxTRkLrfI4y3qj9N8=;
        b=hBEbre0ktW3aJa7ky62iAT9vmFx+V17D+2OUR2qYQp0iW6ObeblI8dU0LowWv6ZbW0
         hwwq/U2HpjgIqEgzzJAkJVTkxdd/btlKpWNceI6xaKVOFi2RX2tlvTu6CpKqajrrqcC+
         biyzlawVXpM8lO0I2/S9+Nadi++VsK8bLpozhj34G/AOloOFwQyUtwdgxQT9lr8KUMkq
         JhKYt6gRf5AU7XDz7aMqcfA4uWWvbg++9gTQAyyqBqXKk+EpgIIhFow+fpzOEmR/0iOs
         qdsgntIlAf+ePsxaPXhI/UHh0jlrAsXvFkDeORPmfNfXcQvWpaZr5qDxoFwj/h5Xj4v9
         kJKw==
X-Gm-Message-State: AO0yUKVS8yTF9/ZNOu9mG0gq2Zr1EQ81KZ0L6nLXJF0FMH18FTs/xoSq
	iwpPlp/10UcZh/JwCaLV5Ds=
X-Google-Smtp-Source: AK7set/K5mj4/wx7pJ8+9P/uHlj+hV029sdbYt8ULlEf6QKGQmw01oKjkNMwb1PqVH9W+ma85Fgu/w==
X-Received: by 2002:a05:600c:4f41:b0:3d7:889:7496 with SMTP id m1-20020a05600c4f4100b003d708897496mr5473887wmq.17.1675339993794;
        Thu, 02 Feb 2023 04:13:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003dc34edacf8sm4502198wmc.31.2023.02.02.04.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:13:13 -0800 (PST)
Message-ID: <64d05d48-8e12-602d-7f64-4f29b56011b7@gmail.com>
Date: Thu, 2 Feb 2023 13:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 3/5] arm: dts: mediatek: Fix existing NAND controller
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
 <20230201021500.26769-4-xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201021500.26769-4-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_041315_995750_00F8CF45 
X-CRM114-Status: GOOD (  15.14  )
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
>   arch/arm/boot/dts/mt2701.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index 0a0fe8c5a405..ce6a4015fed5 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -359,7 +359,7 @@ thermal: thermal@1100b000 {
>   		mediatek,apmixedsys = <&apmixedsys>;
>   	};
>   
> -	nandc: nfi@1100d000 {
> +	nandc: nand-controller@1100d000 {
>   		compatible = "mediatek,mt2701-nfc";
>   		reg = <0 0x1100d000 0 0x1000>;
>   		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
