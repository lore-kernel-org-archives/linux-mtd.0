Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571FAC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZR21DMCkQx49GoHSP86FOy8wI+yTFheJrW+MCGHyUsw=; b=NwcOukgehU/DzD
	8fQP4WVRohcX9QujrjB4M8ellur/TFpSGTrAnnVCuI0mpXC1VCINglcHC5UlmQT3fj/itlRQTEqrf
	aZOsYq57L2u+nBC07suEhYqvo+YrzoL1s5eVYlsyzLp6e+l+/XtR1uxmb33a4DsrN9F/gzzJjkfLk
	Ocr98NwM4qihLlDP7SCQ2mLscb8niZkzT6iQFge+fuW4FpBPnDpDLbFUg8ztcMCKA39tMLzwJcjh9
	wUxLdEab6EBYdc1cRogdiiJPjHcfvFHumB1XXNceCUckJUn364Q/9F7PVDVZaFogE5N7XDCWcXxl4
	M7hvF2G/LPtbp94hJ2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLg-0040E6-6X; Mon, 05 Dec 2022 14:21:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLU-0040BW-MA; Mon, 05 Dec 2022 14:21:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA8066015ED;
	Mon,  5 Dec 2022 14:21:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250083;
	bh=nFlpekzLsks1mmWRutgqee7+5JHLJAzQnABl84xpqSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtJ478lmW5v4x7/kWAcQ3tDjWsxYKc+rpiXwQRd5RqAtazd62rQ1z7Db4xQu98E22
	 KBR28Q6vsSIWm6bxFMXGF0HJ0KEZrtMROhptjDcsEp93em05AenIN5dIyXrqm63/Pd
	 BK2UUoNiVUqFf52BXN4ZoG+n97IlJmZa4QWbR6oheLbr3wIDekAhxAjiSDWqaphTQR
	 SpWyO9G7R76y/cTcQydcXTXm+KlFM0i1iQtSJn2BZBUmzvbtXrcSr9W2QZ1uFaGyg6
	 SlFuOjrBDMHqdWJPSXO1fRFbG96k1p97WCJbNh76WmPDT/5DrE+/6ptTVf/geFgfTA
	 dYPnJ4suwweng==
Message-ID: <49870a0c-495b-c159-b5e0-2c47a92a906e@collabora.com>
Date: Mon, 5 Dec 2022 15:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 6/9] spi: mtk-snfi: Add snfi sample delay and read
 latency adjustment
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
 <20221205065756.26875-7-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-7-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062124_909631_95CC5D9E 
X-CRM114-Status: UNSURE (   7.07  )
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

Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
> Add snfi sample delay and read latency adjustment which can get
> from dts property.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
