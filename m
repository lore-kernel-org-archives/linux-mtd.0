Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A23D44C42
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yUJ2GZmo80StJGI5Vlz98mOKca+xLnC1AcXQKXahtJ8=; b=I8suIJDwXJy5gx
	++UB7lBdwQ5JLvVqE+Yuh177hkmMPLxqnI3RFDc5mAFCdX27j2cHCjwPSbZ7Ljfm+UHog0nQhN3Gk
	pYgwliBwiD7bNY17+/903/hFu67IQ4nAt9GeWr9wT+Mma3FCCx6ceVpfCx+9eQV6Jz1Br8rSZ26ww
	GG1r1uoKjwMVSfMqH3h+hBphIHYBnMMg4mfSr8/nOnF3VvDs0o5KxOubiDfDP8cY0YFasJIkumEDn
	XFEHlv3XxGbCwWtPfsxHPVCX+gPR5Lh7CGZjT0QUhpQ1zjl1BVO8FovAlK6Q5f8ECqZ7dl8bDkEgE
	Qsba6/sPMvkXyUCfauww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuF-0000000CMRx-2mqT;
	Thu, 15 Jan 2026 12:56:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuA-0000000CMQR-2xfL;
	Thu, 15 Jan 2026 12:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481807;
	bh=UH8IuGzbgD8QTBsGnAZykl8j1Pi9KOGqjmoEuyKnReE=;
	h=From:To:Cc:Subject:Date:From;
	b=o3dG3frEXbPd205WYwjNqsYefKsvbeuLxozB5N5zKMKkHAelvLw82tNeMzFO3ae8X
	 dFDkrLNjLwMN3ynhAhQM/S+mSetv9/nyC6K/b+lPdnE5STUAm0gU/xtIYdwrLMaQ19
	 ZtZqIj+viUx8pl2YswGsLPRTYgyBftALG7fPdQMTKb8wixVEDhaJGLHkpII7F3nzKC
	 aXxgyqLP7vv/Yx9zgvEjgZm7L/566Q6v33tuVM7y5Syj/tDiDqFXLEyiyLXdrs5RVb
	 cF/kAjtfHrGqCcyl/RAvLbyyjtDFQPe/Qy34+yYS42x7tGfJDQDWsv4+dab9fMtgSH
	 W2zRbI/yATWMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62C1E17E10F8;
	Thu, 15 Jan 2026 13:56:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	julien.massot@collabora.com,
	eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Date: Thu, 15 Jan 2026 13:56:20 +0100
Message-ID: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045650_895890_4ECA2213 
X-CRM114-Status: UNSURE (   5.97  )
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

This series addresses most of the MediaTek MT8192 dtbs_check warnings
by adding a missing SPI NOR flash compatible string and fixing both
the audsys binding and devicetree node name.

AngeloGioacchino Del Regno (4):
  dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
  ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
  dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
  arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
    audio-controller

 .../arm/mediatek/mediatek,audsys.yaml         |  46 +++--
 .../bindings/mtd/jedec,spi-nor.yaml           |   2 +-
 .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   2 +-
 4 files changed, 197 insertions(+), 29 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
