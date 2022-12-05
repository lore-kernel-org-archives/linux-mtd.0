Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D27C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoMUX5mLc7iLtfxrWyubXm68AFYFzQ/ZC3L5zUpgUFw=; b=E6b19lRy6wCSgl
	FVjKdHyO+4i3JpeK/HIw/FFEhTc3IXazvY2gGRqy5pxfQQeuZa4FYt9UARIShWL/9sCkSUpGUPjwW
	JyIIf3yACLW6xek5spsYuDHRMRPEpey7rxPpsOEcixfBU/FPCZU+e+cR2TquxkPniLG82ogog6Z5+
	4lbG4YmfmpoN4PxmR4WlTd38N6nxw16CTxkljbX5i6iar/BcUCG4smmBY8lhV4P12AwCAlJmImdCQ
	caeY1qert21g9kbDYtdiAiZUUnfcIMmAFLNuDHJgGDIHWow3PJ2SElhS/0ndrxJBDxuMVJwTJaQDk
	sJ4aP52CPa3BeLC+c49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CNJ-0041lY-98; Mon, 05 Dec 2022 14:23:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLo-0040HO-2V; Mon, 05 Dec 2022 14:21:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E305A66015ED;
	Mon,  5 Dec 2022 14:21:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250102;
	bh=CwHD0VEBE8fR5lRlAcCaCZCWDstk5+5AzD84VuvkyY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YmlutJOBO9n6hN5JadWlPiPB6phZpkLtc4C5xle2IbfSQFZ8ukE3EKGfI3zmk8f/m
	 YYbXfLlnHe6L85P433USLdluCdw8aouJaYNprmvA3lDaIAwa57Uj4Nkj4d5ixcB0x4
	 +rVTqa5YWBo6M/86Egl9AZw6+wsHbwuy0o0zBPUZaPugpXkMdfeAkS6t4mqCnh/9CT
	 l/DdldDQDo66XTLZGqVZOh1jJyY+OIqZDSNjfpEidyRVshJvHdnUFuh9ta7myh09Ot
	 uAg3vyd+wqElJSL/PcCFTvcgzKCvfvpCfJJCyAdVZWWz8NuKg0cgRCCI6ngIemAyq8
	 Gc2hnTidkB2LA==
Message-ID: <8544ba11-7a87-665b-e0d1-5ed52559f083@collabora.com>
Date: Mon, 5 Dec 2022 15:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/9] spi: mtk-snfi: Add snfi support for MT7986 IC
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
 <20221205065756.26875-2-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-2-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062144_276846_D0072A91 
X-CRM114-Status: UNSURE (   7.30  )
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
> Add snfi support for MT7986 IC.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
