Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EE7C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+4OvjIYOT1m+0da9kzUF2uCe5c9H4T7vX/PGfljloQ=; b=pUyFMHNE6AJ339
	Ec5HSw6JtrtcwcRlB3p7Svwow60rhih0Hx3EcxyAowdKtMuBIKxaZWZHlb+sHwKZqzaoefRSPv6is
	Ds+4/T1PS2lu1uuF9LTAVqUgyuLEPlwT77KRMZSu/QCUrIDdD46nr7sEHAeAq5Sir3Ca2TQKN2ARl
	l6rDdS0LegPHD5NkX/V5wvH+rXnHaGuHDppNdrbQzZ5N7hcwrHL4ml++pq4rZSm3JEiOnZTD8vOKo
	zrA6KTImCNc1lHkEWiAeMN+iZcG50iHXvL0NCKtSOvEW1uWpbySfKEv+MzU1joobmslsn8r/pRp2x
	bSVwR2bscDazUDD/HRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51oi-00Ejqy-TB; Tue, 13 Dec 2022 09:43:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51oT-00EjTW-SZ; Tue, 13 Dec 2022 09:43:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FFB86602C2F;
	Tue, 13 Dec 2022 09:42:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670924580;
	bh=VMAoG4F0h5+2Tw6EEa082N1EiJ7bqvGUQOspWsbMvtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nO4q0ZGLrpF68McW2i5tJS/hRxHNV+JxWpcNEhyfiA323dsriZkn42C8iP3aO69Ox
	 r2f+QiWQSlr8v6Xh1FPeIr5/9z5q8viZj+JTmXGzgwIUJGbYMr8dB//IOKgXuCRfQY
	 QJwdo6J0VUvr8YlqNfo4vTy7rJhz5NRGW/XMoKAz6dUKn20sFtpk97udrFlaTeEBri
	 /g2nCMeyqRdjq6AZp/tlM9TFqQ+iPi3ImBIgyKJAvWMg3IOhAbO1UMwApvnnZCPbok
	 E0c6JiYYGUX50g3Yp7Vr9DAZdi3zCgfVEdkkJIgZeGB8H6Pj2pRcbnlBu7KOujeTX1
	 VPEQXTHev9JLg==
Message-ID: <3729df62-8d39-db47-0b57-2bef37cc5830@collabora.com>
Date: Tue, 13 Dec 2022 10:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 8/9] arm/arm64: dts: mediatek: Fix existing NAND
 controller node name
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
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-9-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221209064317.2828-9-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_014302_114065_26DDD1D6 
X-CRM114-Status: GOOD (  11.51  )
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
> Change the existing node name in order to match NAND controller DT
> bindings.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>   arch/arm/boot/dts/mt2701.dtsi             | 2 +-
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

Splitting this in two commits, one for ARM and one for ARM64 would probably
be better, but since I don't have strong opinions on that...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
