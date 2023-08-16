Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A129C001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOynfgNsJu97qlmchpFywP3K5i3pPtJSr1jkgrZ8/oY=; b=N8bbwLOVz/8KG0
	xUlZ3Hm3PFm/+kwWhTQW+HPS+eimyB6LLoma9zd6ndc2PmrqdgZ3PZdgwGYf6lL8AqLqPhPsnO346
	kU/fCq51JPdys44aP3TIvnFpWm6IdemYkr9m3uLdDMmfJWcjO+tlNQfOwJ7VsStbu5VMdZoyoV4YW
	XsA4NHBH+0tNXnbT0w6DvjCOePMA3n6/wMWrO7fZ9oUWw1Aq51UzViL8CNWZUW3+FLBEdIVs/o/cV
	nc5y2aZIBRG00ZE+RZIHeZ+klHeD4rWrswNeGr4Zf6Ejz84AxmiJObBvbYpbqfEhcK2oL7KdY+t9d
	0dmXm8fo3oF03gaCpmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWEXB-003wqh-1E;
	Wed, 16 Aug 2023 11:17:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWEX7-003wpJ-0b;
	Wed, 16 Aug 2023 11:17:50 +0000
Received: from [172.20.10.4] (unknown [109.166.130.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A185266071DF;
	Wed, 16 Aug 2023 12:17:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692184666;
	bh=NRfGcuwBsM/mHuY7Ji1D+ZyvpHFkv2T1TUJuvYW9S8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PFIZutdjY21qgCq+Fen+1uRJQm2bFCoKxnTEdJNR+2F2XExnx3YhK7pu/5zitiD6l
	 si1KCI+8IUBSh80pm+71APW+xEA+oFvcTm3cGUbyHsWWG0HkYVvCN3Kv/2oJD/G1yG
	 re9iW6ziV/1VYbjsJ5tukB5QU9YKfVxmUPlawSx3EQSSqt5XnA6uNPmjYQCtwmbt21
	 IQNcpOplkz5mI6j9sLPaehiyI2x2UAI4EeyDU6cot6HIc7t3vv4pOQ2P4DKQ4vY7KO
	 0RmD4z12PkGtrlDTbC6oYIa9z5w1pAusaVzblEFcLq/nor/8QqnL3625TPF76pKrQ6
	 2o+ese6i4w87Q==
Message-ID: <699d7552-cb9b-041a-467c-597e5a209857@collabora.com>
Date: Wed, 16 Aug 2023 14:17:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8183: disable quad mode for
 spi nor
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
 <20230815154412.713846-4-hsinyi@chromium.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230815154412.713846-4-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_041749_429559_A5C836A8 
X-CRM114-Status: GOOD (  15.73  )
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

On 8/15/23 18:31, Hsin-Yi Wang wrote:
> Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
> default enables quad mode, which results in the write protect pin set to
> IO pin. In mt8183 kukui, we won't use quad enable for all SKUs, so apply
> the property to disable spi nor's quad mode.

Hi Hsin-Yi,

To me this property, and the way you 'apply' it, makes me think that you 
are using the devicetree as a configuration and not a description of the 
hardware itself.
I think the driver should decide whether to use quad or not depending on 
the situation or the pinout of the device (as in your case quad mode 
overlaps with the WP pin)

Eugen

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 6ce16a265e053..8e4761e2b8ff4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -877,6 +877,7 @@ w25q64dw: flash@0 {
>   		compatible = "winbond,w25q64dw", "jedec,spi-nor";
>   		reg = <0>;
>   		spi-max-frequency = <25000000>;
> +		disable-quad-mode;
>   	};
>   };
>   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
