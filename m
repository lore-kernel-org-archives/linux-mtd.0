Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7BD44C42
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlpNhkbJID3Gm3z/p9EWGiyzekB8jlDZwpX+Nya+xZM=; b=Hzr4Ex4skbc8DF
	fTUMcBc6suhS/BdbYdl/1iGeQFkyxk669Rs/ppyacjzt6FLOWgKXTBeM6sAgSVVZ20iSPeB8s0h1e
	tTyCeuu3QAKiL4/lqSV/iIibNN2oIYDToNZkVP5uVkHUMSIHtF0mY3Iurvf+L6MmuL8OGPNF/nxo2
	ImB0gYdDnjTV1UrQ3NZe+ylqYvjZyXdbXgmd7KxVum5B2rfSzsw7xiGND5D0mhPC9fKHOsgBoq8Qx
	Sg8LNEY88ZnqJZcuRsXQHEIgyh5qcKO2fClNaGy100hgDtx62hSD7KX2FxCUuEXxrXYq9c44//FKB
	juSRoARFbD0esiGVCozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuK-0000000CMYi-3tlP;
	Thu, 15 Jan 2026 12:57:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuD-0000000CMQv-0zMS;
	Thu, 15 Jan 2026 12:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481810;
	bh=Q1TWR+L5EJCk8ltk3+o6+5a+NLRELXyTxRSjaigjumg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnEAsli0VXjwyu3dIi44q2cjh+ozeXVJXSovtksTn371xTbIBk8+o3sZXukA9tMNS
	 k98XLQhCWDGvFDhEAJ5VkbC0zAFOA39NkNIX/+01xwH+Tym4ZxneDvqFjOV4byTb1M
	 oac8gQnrepoDrDCiC48Xh6xTfBkF+0RtZ7/7rpwtA8VgibuTUlX3Y96IeZvWWRBZjh
	 CWiVt2g/xKXhkdYaeiQraUaZbJ9b3GAhonCeDtmb/l9Vu6bsgqLEXIPI9bxuYSIunm
	 OT8zDV4C3axJGIMNuLCjbUk5faXkJuSVXtVwwxG+KPswpiYbSzG8A5dhgzz4vNQ8ay
	 OZ5DKMLTiDX/g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 907AB17E13D3;
	Thu, 15 Jan 2026 13:56:49 +0100 (CET)
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
Subject: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
Date: Thu, 15 Jan 2026 13:56:23 +0100
Message-ID: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045653_435295_05FF7339 
X-CRM114-Status: UNSURE (   6.81  )
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

Add support for the mediatek,mt8192-audsys compatible, which uses
a different audio controller (mt8192-afe-pcm) compared to mt8183
and mt2701.

This resolves a dtbs_check warning on all MT8192 devicetrees.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index f3a761cbd0fd..09a6c16e7e82 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -48,19 +48,39 @@ required:
   - compatible
   - '#clock-cells'
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: mediatek,mt8183-audiosys
-then:
-  properties:
-    audio-controller:
-      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
-else:
-  properties:
-    audio-controller:
-      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+allOf:
+ - if:
+     properties:
+       compatible:
+         contains:
+           enum:
+             - mediatek,mt2701-audsys
+             - mediatek,mt7622-audsys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
+ - if:
+     properties:
+       compatible:
+         contains:
+           const: mediatek,mt8183-audiosys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
+
+ - if:
+     properties:
+       compatible:
+         contains:
+           const: mediatek,mt8192-audsys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
+
 
 additionalProperties: false
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
