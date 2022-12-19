Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3807C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 02:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wFdPIvT7wBXx+h7cJ6gYnJARfrFO8oiMfy5/Lg62Co=; b=WEXW7FU+fFzLgg
	FM/BKPtMowY1tguYuDco5qJI88NJMQ8RVM/ymXdhu+uwz1hRjj/SoC7qhN75w6tvfOV0B/L0JNqVh
	5MOg3asLYHbwPniwetJA+mfdzqm8z/JIl5J32VVtPKNMemy6cTJ5spl337Z1ANp5EcOBfzMrygjpQ
	W79GjnrDNg21qMxXt1xFX44A8vmov9OoNOB4dQyJI6haRxMpSBkg5yAibMWQCSRYTsXFkPkadaN2H
	U/Hf8C0k3hvf0z4h8D73VHVU4EzXfJOETrue5+uxZ3Rowf0MyNL2J3AzXY7nQC5btaoSPiWbBIPo6
	hZkEuXVgi/Sg50bEHMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p76KI-0073H9-No; Mon, 19 Dec 2022 02:56:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p76JR-0072qv-Nu; Mon, 19 Dec 2022 02:55:35 +0000
X-UUID: 41f4396fdd0f46cb9271e19c084fbba5-20221218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AljLcemnKAdfrmjxC/s2CRMhH5DsQc4QT4V+1YYAYTU=;
	b=NRnI3JJ/m5Uc3jzTWnY5CvGPt01PG7yGJm5eQb4F7wtn9xWPHob6t8HYKb2DqwzzDNEPDZD1g2P1BzWaSo8dfPmQ4aHYgX7a17uJqyfzJGslK6ouTGN/cy0lRbWtrMeOv0hpO6IuYCdX+wfbAqMkTSDO9uep9w5dmZISmRv43C4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d567b7bc-2d59-4ffa-a9f4-ad4ab10549c1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:26381a52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 41f4396fdd0f46cb9271e19c084fbba5-20221218
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 538093097; Sun, 18 Dec 2022 19:52:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 19 Dec 2022 10:40:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Dec 2022 10:40:42 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
	<gch981213@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 03/10] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Date: Mon, 19 Dec 2022 10:40:12 +0800
Message-ID: <20221219024019.31974-4-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
References: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_185533_972872_98451FB7 
X-CRM114-Status: GOOD (  12.01  )
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

Add ECC support fot MT7986 IC, and change err_mask value with
GENMASK macro.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mtd/nand/ecc-mtk.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 9f9b201fe706..c75bb8b80cc1 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -40,6 +40,10 @@
 #define ECC_IDLE_REG(op)	((op) == ECC_ENCODE ? ECC_ENCIDLE : ECC_DECIDLE)
 #define ECC_CTL_REG(op)		((op) == ECC_ENCODE ? ECC_ENCCON : ECC_DECCON)
 
+#define ECC_ERRMASK_MT7622	GENMASK(4, 0)
+#define ECC_ERRMASK_MT2701	GENMASK(5, 0)
+#define ECC_ERRMASK_MT2712	GENMASK(6, 0)
+
 struct mtk_ecc_caps {
 	u32 err_mask;
 	u32 err_shift;
@@ -79,6 +83,10 @@ static const u8 ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12
 };
 
+static const u8 ecc_strength_mt7986[] = {
+	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -451,7 +459,7 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
-	.err_mask = 0x3f,
+	.err_mask = ECC_ERRMASK_MT2701,
 	.err_shift = 8,
 	.ecc_strength = ecc_strength_mt2701,
 	.ecc_regs = mt2701_ecc_regs,
@@ -462,7 +470,7 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 };
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
-	.err_mask = 0x7f,
+	.err_mask = ECC_ERRMASK_MT2712,
 	.err_shift = 8,
 	.ecc_strength = ecc_strength_mt2712,
 	.ecc_regs = mt2712_ecc_regs,
@@ -473,7 +481,7 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
 };
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
-	.err_mask = 0x1f,
+	.err_mask = ECC_ERRMASK_MT7622,
 	.err_shift = 5,
 	.ecc_strength = ecc_strength_mt7622,
 	.ecc_regs = mt7622_ecc_regs,
@@ -483,6 +491,17 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
 	.pg_irq_sel = 0,
 };
 
+static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
+	.err_mask = ECC_ERRMASK_MT7622,
+	.err_shift = 8,
+	.ecc_strength = ecc_strength_mt7986,
+	.ecc_regs = mt2712_ecc_regs,
+	.num_ecc_strength = 11,
+	.ecc_mode_shift = 5,
+	.parity_bits = 14,
+	.pg_irq_sel = 1,
+};
+
 static const struct of_device_id mtk_ecc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt2701-ecc",
@@ -493,6 +512,9 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
 	}, {
 		.compatible = "mediatek,mt7622-ecc",
 		.data = &mtk_ecc_caps_mt7622,
+	}, {
+		.compatible = "mediatek,mt7986-ecc",
+		.data = &mtk_ecc_caps_mt7986,
 	},
 	{},
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
