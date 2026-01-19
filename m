Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F70CCF2E7
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O5gbSGlw3sEatZ/IIsgPV6yRqERwDjVptkXpxPGuac=; b=SQW2uEBWAfLO1F
	TWEGILsRvAY5RWHgnLOs9uugG7ahw1N548cIYLiJsHtmIRUxm+xZCv1CWuUDphU0E+vrxDQZ/YZDL
	DgJFnaIBXL+p2k6jmq1WOfn0uKI0/Q5wIFSF703PFZzHYtBSihlgJf3uFMh1g0775WR7/Kz+KbE/h
	JSOrGmxj7yj4a5nRhKCXwjRoCOua2wo0qsa6o5QMcLuBoaXszXY8mO63vPR7S4pAZvXAYAEf8n+pO
	nK2mxWL+pEQqfWl/HYJhSEGZT09D5W5h6FETO52UlI1OUlTCJaxU4NJqEoo2z9ERFU4nuNK5xLJS6
	CFp8Mmg5xNNOJFR33gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnOi-00000001tMP-4C0W;
	Mon, 19 Jan 2026 11:26:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnOf-00000001tKm-0vev;
	Mon, 19 Jan 2026 11:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768821969;
	bh=9xXr2PPFCbMYAU/BCfJhTb7zo31zXr8jOcsm9o5sKxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b68qylH5vYrHcYmu7kZWSePqZ4NRlzquFL65A1+lZ1jhUxXyiFEB6n4X/L15R7W6U
	 GGB6Rxn0iF6qitYrxB2ZROwW4n/OK6/4xRXgK4ed/iqEIy8GgKLbp2FDjbCOvH+WVc
	 B313y6B4FaM83UAlEd1EG10pnHev4fPaeeecvtyQnRFc2rJY7p+HlGT5eGfgaeEbie
	 u/eGzD//9iUidd9lbN68WNVPa9i8sbGzc8tC1p+hHNVFD2pcGpKU8W3o8zKhTjD4SO
	 +G/7u0SxygvY9scLKSUbLBpBfQObGc2HxflceTr7o8HFeFLwd3jQxLWCtMkX8Y4lBG
	 NmsiIF2cqs2pw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE2BB17E1013;
	Mon, 19 Jan 2026 12:26:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org, 
 matthias.bgg@gmail.com, julien.massot@collabora.com, 
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Message-Id: <176882196871.27177.1302852396696042530.b4-ty@collabora.com>
Date: Mon, 19 Jan 2026 12:26:08 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032614_052550_E728EB10 
X-CRM114-Status: UNSURE (   5.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 15 Jan 2026 13:56:20 +0100, AngeloGioacchino Del Regno wrote:
> This series addresses most of the MediaTek MT8192 dtbs_check warnings
> by adding a missing SPI NOR flash compatible string and fixing both
> the audsys binding and devicetree node name.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
>   arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
>     audio-controller
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[3/4] dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
      commit: a8e3d66ff5c0c37e7c10b3e486d2c5047bf9cf2b
[4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller
      commit: 25556c12f4d3edc2f614f752f204c3941697b30a

Cheers,
Angelo



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
