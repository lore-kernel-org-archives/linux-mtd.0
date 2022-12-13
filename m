Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A86C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+3prK1EZF7tLq9CI82KnLT297kexUOUk7pwvm4Z+kE=; b=spT2X6c6ezpJcZ
	OhM6aV8wrJtPJudySxeSaSZ2M4X8btNdGitBICBGZPQXE5w0U3LUxYVBSPJJAXzQp+kL7OFO7rQ4G
	dg7vQJiZcNFiUmg7/XiQC6AQ+PTrV6pe52QHziFPOpimcNXVN1dbETCpm3TyfmT7ZG+83rNONkTLa
	2i0UxatfJwWzd3TAEUa6WHhcDayyVCus4oMdYo3mItMp/jhaTgva1k/Tg5zsJo3tfDZGwggsxB5rK
	3M1wjwEghu/XlEwKurz+RmtbT19seaTiEK2TJdjGwZjjm6hZzDRLzzJ0S4zmU4vE/Z7IM4VK08v+N
	mFXG0OeHwS4A5BfzVGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51kp-00Ec4R-CI; Tue, 13 Dec 2022 09:39:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51kZ-00EbbR-2n; Tue, 13 Dec 2022 09:39:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B1E96602C2F;
	Tue, 13 Dec 2022 09:38:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670924336;
	bh=3uzuGrt4ZRlBHhLo37SMRYN1aSa87pzUD4T5GH1gEeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4nvPBhVtQa3qTAmMlFdtQDm4YgpFyUwJTLjvAVgtowg90/zpPevyLE6/ys2uMYbj
	 LjMjyHtuTrh6I3a01HaFF/ofTEt0XsVb3iVPPeKEyDv+Vv1zdueihQd1lhdyQZobZ9
	 lvydKYdnnpll6YUHti4YDvjHTJJflnCBKKgQT1XQf8WWoEJmL8mVrB92oE6c+unlNL
	 68sXp/w1L/Ex07mLvNr3V4DVkFUppT3NyEZwonQR+AWABiOLvF3aGB36E3i+SveqjU
	 Gw21zQqtMpyI15/pL51Y85SminbIfCc+ZHXx4d4tveJAFx6UA+JwUS1QXNF5Kgh4zm
	 pgkGImauB/JOQ==
Message-ID: <fc668f1e-3d04-29db-a761-73b9d7830381@collabora.com>
Date: Tue, 13 Dec 2022 10:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 6/9] dt-bindings: spi: mtk-snfi: Add read latch latency
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
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-7-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221209064317.2828-7-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_013859_289143_1C25C687 
X-CRM114-Status: UNSURE (   7.11  )
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
> Add mediatek,rx-latch-latency-ns property which adjust data read
> latch latency in the unit of nanoseconds.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
