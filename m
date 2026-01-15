Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D2D44C43
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAlING0bcC4lQcaTolSVEYsYkeL63HW48egz3sb2oKU=; b=WHERoOoylEm54u
	XEj/k/GrIEdd9xW0T1OnVakRvS/WysJWqdD5Q7F8ruki2a7hiu69iuBNFKmPex/iRzZCZ0Lb3J5Mw
	IoX0s3lfDKtWKlzTUfjLz1Q6VOA++iGBkiVz/zYib4BoH5mYa0OUSTPGgRQpseMaCQYH0te6JJtO/
	gBDpC4jJLYDLZ9W+FiNalc0wIew+4t5uy0SaTgKMQ9B0YG1r5Vaq3rdPb0YF6rAtpCu3FoYLsBwS8
	U7vCajFwD2bIfWTofa+hU0AfGxWlxXzqQQwWMqZGxU/cJpI5UxH2Nte3suYw4U9IG+RwH382TKPJp
	i3g+mxFVyVMhUY42IcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuL-0000000CMaR-3XFT;
	Thu, 15 Jan 2026 12:57:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuE-0000000CMRY-1woz;
	Thu, 15 Jan 2026 12:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481811;
	bh=5c73jSB5V916CT35L36ZsmgrVWA8Vvvy6jaycwwPDQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZhEIDgYj+2dJ+8Z6AaGGwdgiGAncfG9P2Xmzf5svHPgghSEuJPkGFH5elw7IlPsj
	 muU/qnYPTm4Hh9mdj6J5OusJyq+W8ijj5/WNgbfV+CTzzB+fjkO64H9KXrzF5JzTg/
	 fpnGdYyLvrueNp+46fsxBduHSQZkhR1S+hyNJtVJgB5cJRgVNKTrmkA+1ZlsOijZqp
	 nF5am7vlnuY+ILx/dm+m30Aw7bvKHYviokJMaX+yPUHawgBsrMi6ZeALFR9TbzU7Bn
	 BqVjexWJ+YSP6x2TRA+Je5x7CTpjGJgc+FW2PfR5PPGyTnpnQqhR62DVRmPj2iz6TK
	 XPNoA6ClZoR5w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9907A17E1406;
	Thu, 15 Jan 2026 13:56:50 +0100 (CET)
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
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller
Date: Thu, 15 Jan 2026 13:56:24 +0100
Message-ID: <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045654_668954_B2E8732C 
X-CRM114-Status: UNSURE (   9.46  )
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

Device tree nodes should have generic names, and this one doesn't.
Rename the mt8192-afe-pcm subnode of audsys to `audio-controller`.

This commit brings no functional changes, but resolves dtbs_check
warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 47dea10dd3b8..9f8f115edd4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -973,7 +973,7 @@ audsys: syscon@11210000 {
 			reg = <0 0x11210000 0 0x2000>;
 			#clock-cells = <1>;
 
-			afe: mt8192-afe-pcm {
+			afe: audio-controller {
 				compatible = "mediatek,mt8192-audio";
 				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
 				resets = <&watchdog 17>;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
