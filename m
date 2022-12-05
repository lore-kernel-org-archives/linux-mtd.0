Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56CFC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCUKEIRVoiLH9oqHn7piokzElnRz6aapAEe9VvoeJro=; b=ekTHhGtpzxbV1w
	3+L01LvynMd1qgN+VmltYCApnPhykz2yazCjFrVYFvZZnujqJVhDWDsu5SdLGbP16AnxddKzwHW8y
	3vkmkRlehSaPw+puM8FX9ecNxQtmQxETr85+1+nitB3+gblvuGyn5kPPV9TzeLu014uHoyUIamrqD
	W2ok8LqXr1Iz6RQpIVTaWXJvOkGubMbnMcUd/24GZNHR7xOx6EXAtGKcSJlKcWy/g+/fAjf3S6Dtv
	xYr2akJDSYrGAaAuUAP5BYfXX2frx0UXcuqTz2Y3shM8tIKc7bHlS+JPxeMBAXoei1uaAqlUNrpyY
	BHsbw4XhpMQ9c//ItK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CMX-0040wg-SF; Mon, 05 Dec 2022 14:22:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLk-0040Fg-0h; Mon, 05 Dec 2022 14:21:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09C776601E6A;
	Mon,  5 Dec 2022 14:21:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250098;
	bh=B08ZCRyfqEVr3DGfEAF/s62Wj4pjhb1yJOJfzrepg1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e7rhKO6e5PFiyGRzo6fSbBaBtA3fm2JhrwJinvIXyWf9cWlN4yHb0QgGu4g378x2W
	 8zV0CuFaDK7CBJy4/Zp+/SaqaCSjV+xjMUZKnJsEtawXO0mZMd1Rslq5gCvaQhzefM
	 ZD3o8IaUSJpBxgBnkyPlm1Ui/KJb1j2aemCXDMohmIKgIPNr7s8Dn5JKk/qBwxfmvt
	 u1iux4lYT49LkDDcW9UAoAoEgC2UTWUFeC2jqZK0YM0+4coAj5lpPO9JqFRs/ZNbyM
	 t6L29oTY9nPufD30SClr8+W8ncNc3suY5mpN+mzzMmKp7RDSRY0aAcK0jEOvftP2Wm
	 6JZY14hXXQ2Ww==
Message-ID: <ef2e6859-56e1-bbf0-dbde-44ea3d7d2f3f@collabora.com>
Date: Mon, 5 Dec 2022 15:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/9] spi: mtk-snfi: Add optional nfi_hclk which needed
 for MT7986
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
 <20221205065756.26875-4-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-4-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062140_226679_500A797F 
X-CRM114-Status: GOOD (  10.53  )
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
> Add optional nfi_hclk which needed for MT7986.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Is there any operation for which you need NFI_HCLK enabled, but at the same time
PAD_CLK and/or NFI_CLK can be disabled?

If NFI_HCLK and NFI_CLK must always be ON at the same time, adding this clock to
spi-mtk-snfi.c is *not* an optimal way of doing things: you can, at this point,
set NFI_HCLK as parent of NFI_CLK in the MT7986 clock driver instead, without
making any addition to this driver at all.

Regards,
Angelo



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
