Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C530C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzr7w5XTrEtfsaPYYu+8lZuYc220G0Epr+ovmt1xErs=; b=oHZSkrX3nJgJkN
	qtAnklSg+5qjhnvy4FdAdk6xOWeMPvgnK9sY59m7QQvRoZcL90izlNf79YUcY14iU5eLqH9CqH0mS
	ZKLDkAW+JN3iPrvNT9HBav2wn8ViUmeI723lFMO+tXTgSxUR1ULkxjC1Kn/hFz1NPxdyGD+JsQ2sU
	HSN9TmhWIcXi0V4aGdpzL5T4/+eZPVgQaMKNdrEFmLe04I3ZOUF0w4zBqzpTata2eJ4FelfS2ykqj
	0c6xlKauoIsWfn+Jhc54Zp3fbpHGea1n2dqIDIRE3Ls8e+Y2lT2ovr7yoL7RIEumMTqvDdr2Y0HhU
	UjB3LuRI9kILqOoqXdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51jv-00EanK-Cw; Tue, 13 Dec 2022 09:38:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51jg-00EaHn-3s; Tue, 13 Dec 2022 09:38:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCC856602C2F;
	Tue, 13 Dec 2022 09:38:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670924282;
	bh=+3tNy+PbZTfVFEAnTh4aKWZ5b5VVak/D88xkeyMCNAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqpMqvHyvyupH6c1+skxTj01j8625v01zTgTBytGuvVwgLcyzGx821DfQNC5Ny3WB
	 H+9DwHLlmUt8RPXWuFcd8ja7fESsBfCMFjVED4jD8NKMKT/UXo8QavC1v9Iqz1WWaT
	 c8auD19P8QLxerdBQCNHXv7TSLZk7ku9RKRe59dsYd4tqrDi9RMzDxwjW/9Y2bwnKe
	 6FH+eBqr+BZl7oSa83d+5ww06r+GhLo/2ufBSV3ZI1ZiG+rWLe/zXZKPBOl4EH2CXK
	 DTGgtRMUGQY+Zg6J6KM4qRqgZHqWr34ciV2YD8tyGZiMXjh3Ia2PXnNODdW1W3cXUx
	 3rLeauk6F2Z3g==
Message-ID: <ce3350c4-9c43-9fa6-9aaf-a119b700778b@collabora.com>
Date: Tue, 13 Dec 2022 10:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 4/9] dt-bindings: spi: mtk-snfi: Add compatible for
 MT7986
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
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-5-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221209064317.2828-5-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_013804_318257_9A865EEE 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Il 09/12/22 07:43, Xiangsheng Hou ha scritto:
> Add dt-bindings documentation of SPI NAND controller
> for MediaTek MT7986 SoC platform. And add optional
> nfi_hclk property which is needed for MT7986.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
