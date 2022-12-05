Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CDAC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySIzclE6dQS0oIBtlnJOD+xtzLkM4R+PRi5zY8Q/Kbw=; b=VXzdcnwboRbxN4
	OdkpFeGRtKfdy4aAaL3gaHzEvXlKekN6OvxnpHsWAbZpfCqPsJdNVfCcjhvBryN1KXdkVUCWq+YD2
	o+5W1awMlKkUnM1wjnSvzCbtVfIVNLPrPkJSaiHj6e/2exnOzMU8g9l+3fKvw8pAxLdARKdSYsbpx
	Lxv7g0+jyInnw4eq2GXeGdj8mmnxafjonlmoZouk2tu8giZ1jeIsYD6wfniAa4B331Y6f/vlBKAvA
	jR7fROxQbkWvguTgkx8FaUDcITc6mmB3M9wwf9Mr68t+D88ImeI7ygolvRp6bqe9duJ/UTwB4cH7s
	qMNpZKVKcTexzIGBOEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CM6-0040SI-M4; Mon, 05 Dec 2022 14:22:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLd-0040Cv-8l; Mon, 05 Dec 2022 14:21:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E50B66015ED;
	Mon,  5 Dec 2022 14:21:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250092;
	bh=mnxLu/tXcx277n6UaG7yuqLm+MmpmXrgJBPdScyuDDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RDw8dpdr+DNEFZWeFbg6PD8YW7pwIN5uwEgicztcHkAGwzUjMkT3zC7iUi2PXcaJM
	 FsVV5/rzI82+ugszSL8ttpuznBBGC8poRQFdIx4PLrxSV8Ac7H9f2MMoRnFnzYMBUt
	 WS14pk25hOh81aNHgn4FBvAP1ErGQ0DnUZO4cyMVXpyCynzJWp5W3wAY767zuq89wj
	 15gs30LW3co2cxOZdafHVL2Tj1k+qae9zOgkRr3jhA1hFqXOulKGdS98RzcxnFqGgV
	 6KudDZN0KjTvbe1a12U0jZrersbh/FEenrTuVtxgHh0/q7tjSFpo7RORa8ISO2rki1
	 IT8+X1EH7tZdw==
Message-ID: <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
Date: Mon, 5 Dec 2022 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062133_473959_1724132F 
X-CRM114-Status: GOOD (  13.78  )
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

Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
> Add mediatek,rx-latch-latency property which adjust read delay in the
> unit of clock cycle.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml     | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> index bab23f1b11fd..6e6ff8d73fcd 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -45,6 +45,13 @@ properties:
>       description: device-tree node of the accompanying ECC engine.
>       $ref: /schemas/types.yaml#/definitions/phandle
>   
> +  mediatek,rx-latch-latency:
> +    description: Rx delay to sample data with this value, the value
> +                 unit is clock cycle.

Can't we use nanoseconds or microseconds as a unit here, instead of clock cycles?

Regards,
Angelo




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
