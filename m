Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3845C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfAARcPuc581AHh9RfA4x1er0E+RF/U7uYRYY9dAJRI=; b=ibU409k6lwbkJv
	kjqhK+By88HPUnRTHm7vgLBVS189k6HxaZ1BR85QlawZ/izJUL0HM8fN4B984g2HOTcF2kR3Ftq/q
	LAkOeOiVA8zzEOCi96D431mmNNIK8jroTE9OF25T8po63itKsrnDszeCQ9IiXpF4gADcVJ0mpPX3L
	PlIIiMaBNnGlnm8zYdg8mrdcTJUQRUxAHZZIn7vKcKdk65fLMGMbpFEpz/Aiu9EfY6371EKlB6PsG
	pDTJAwzn1HD5k67JztXqGy5apPwnP4tAD8D85uWl+pbrsz/WM3fTmICA2oZ/myBMhbpvEI3Zb7ojY
	MJ2CBbNQQJ5CyBpy6xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZt-00Eoin-09; Mon, 28 Nov 2022 02:09:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZR-00EoWf-8K; Mon, 28 Nov 2022 02:08:36 +0000
X-UUID: 9eab75704ecd4acd994ea4c1f5fe5f04-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7G/kY4Z4RzGLCu0pIWPbVRiL871EYMi+z76vihOlYOg=;
	b=roFZtU+DZ/6IpsXATm51WxO6KWnpLc2k1xCLapGCU9JkJ6OUUupzqVsR0b0eBHn5+0huKc4t/vIwz9crgU+LDIeeVakL0TAQjpL/zebC3dU5UGVocIryV9yT6sKRPMXitjIdMNAXsM5A2CYsIm3VGEYy3FV9PEFc7cI08Zmifp4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:bfcfe70e-8b5f-46ce-a9bf-296a02860099,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:22a4721e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9eab75704ecd4acd994ea4c1f5fe5f04-20221127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770886313; Sun, 27 Nov 2022 19:08:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 28 Nov 2022 10:07:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:37 +0800
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
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH 1/9] spi: mtk-snfi: add snfi support for mt7986 IC
Date: Mon, 28 Nov 2022 10:06:05 +0800
Message-ID: <20221128020613.14821-2-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_180833_342009_5D4D95D6 
X-CRM114-Status: GOOD (  14.22  )
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

add snfi support for mt7986 IC

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/spi/spi-mtk-snfi.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index d66bf9762557..fa8412ba20e2 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -126,7 +126,8 @@
 #define STR_DATA BIT(0)
 
 #define NFI_STA 0x060
-#define NFI_NAND_FSM GENMASK(28, 24)
+#define NFI_NAND_FSM_7622 GENMASK(28, 24)
+#define NFI_NAND_FSM_7986 GENMASK(29, 23)
 #define NFI_FSM GENMASK(19, 16)
 #define READ_EMPTY BIT(12)
 
@@ -158,6 +159,7 @@
 #define MAS_WR GENMASK(5, 3)
 #define MAS_RDDLY GENMASK(2, 0)
 #define NFI_MASTERSTA_MASK_7622 (MAS_ADDR | MAS_RD | MAS_WR | MAS_RDDLY)
+#define NFI_MASTERSTA_MASK_7986 3
 
 // SNFI registers
 #define SNF_MAC_CTL 0x500
@@ -220,6 +222,11 @@
 
 static const u8 mt7622_spare_sizes[] = { 16, 26, 27, 28 };
 
+static const u8 mt7986_spare_sizes[] = {
+	16, 26, 27, 28, 32, 36, 40, 44, 48, 49, 50, 51, 52, 62, 61, 63, 64, 67,
+	74
+};
+
 struct mtk_snand_caps {
 	u16 sector_size;
 	u16 max_sectors;
@@ -230,6 +237,7 @@ struct mtk_snand_caps {
 	bool bbm_swap;
 	bool empty_page_check;
 	u32 mastersta_mask;
+	u32 nandfsm_mask;
 
 	const u8 *spare_sizes;
 	u32 num_spare_size;
@@ -244,6 +252,7 @@ static const struct mtk_snand_caps mt7622_snand_caps = {
 	.bbm_swap = false,
 	.empty_page_check = false,
 	.mastersta_mask = NFI_MASTERSTA_MASK_7622,
+	.nandfsm_mask = NFI_NAND_FSM_7622,
 	.spare_sizes = mt7622_spare_sizes,
 	.num_spare_size = ARRAY_SIZE(mt7622_spare_sizes)
 };
@@ -257,10 +266,25 @@ static const struct mtk_snand_caps mt7629_snand_caps = {
 	.bbm_swap = true,
 	.empty_page_check = false,
 	.mastersta_mask = NFI_MASTERSTA_MASK_7622,
+	.nandfsm_mask = NFI_NAND_FSM_7622,
 	.spare_sizes = mt7622_spare_sizes,
 	.num_spare_size = ARRAY_SIZE(mt7622_spare_sizes)
 };
 
+static const struct mtk_snand_caps mt7986_snand_caps = {
+	.sector_size = 1024,
+	.max_sectors = 8,
+	.fdm_size = 8,
+	.fdm_ecc_size = 1,
+	.fifo_size = 64,
+	.bbm_swap = true,
+	.empty_page_check = true,
+	.mastersta_mask = NFI_MASTERSTA_MASK_7986,
+	.nandfsm_mask = NFI_NAND_FSM_7986,
+	.spare_sizes = mt7986_spare_sizes,
+	.num_spare_size = ARRAY_SIZE(mt7986_spare_sizes)
+};
+
 struct mtk_snand_conf {
 	size_t page_size;
 	size_t oob_size;
@@ -360,7 +384,7 @@ static int mtk_nfi_reset(struct mtk_snand *snf)
 	}
 
 	ret = readl_poll_timeout(snf->nfi_base + NFI_STA, val,
-				 !(val & (NFI_FSM | NFI_NAND_FSM)), 0,
+				 !(val & (NFI_FSM | snf->caps->nandfsm_mask)), 0,
 				 SNFI_POLL_INTERVAL);
 	if (ret) {
 		dev_err(snf->dev, "Failed to reset NFI\n");
@@ -1295,6 +1319,7 @@ static irqreturn_t mtk_snand_irq(int irq, void *id)
 static const struct of_device_id mtk_snand_ids[] = {
 	{ .compatible = "mediatek,mt7622-snand", .data = &mt7622_snand_caps },
 	{ .compatible = "mediatek,mt7629-snand", .data = &mt7629_snand_caps },
+	{ .compatible = "mediatek,mt7986-snand", .data = &mt7986_snand_caps },
 	{},
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
