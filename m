Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F1CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1DzUwOD/OmMDdhlP7ttFihGWd3lRWVKIfageRgVFLs=; b=Vblg0aC8eZSzYZ
	6VHpKg27RcIsKzvCmDvdXBmsExPOp3svzUxY/RwTBlYhzHTItmptVDX3V5oYSEYdF8KPrrQYGRlJZ
	Dd/2iuqWfXLP02ikSkTTJMKF68GAo35UUjZ6vP+aba3f2bJOHYGn5IwpW2rWoWViy3ndh2XfUZ2F2
	xm3m0eT0vlximtDfU4oCsQTZmbXb1dL1gunJPMff/EBUhQoXk+OkGNOTEJ0+OQ4bvjB5B8SVgnT+g
	v543nQPcDiz/4LL77v0tFiCB/FjBoCw6J15Ohkh7QZJbkIoZAenhdzOSUSJo8Zn0F45/kwb1ZtVG0
	mNHsf7lZYvOc0DaPbCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZU-00EobX-P7; Mon, 28 Nov 2022 02:08:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZR-00EoXK-8q; Mon, 28 Nov 2022 02:08:36 +0000
X-UUID: 7948868615f04ce496ab05be8b3e5025-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=479YBqB7D3YUT4aLc4suZrRCmV+3rhzglGjA8sFA9To=;
	b=mWKzeOWCbpOBmBlP7ZQUkcXdrAr6DfZrpQZGY0lWOJ9bnnpDd7JoKUbtjhvcyh8Ym/Ti1o63RFywQLEiZOpem4EZ/jj4E7KhvXHFeJ/AlojPVeEAWrXRH0VbRatvKrcZ2MKiFKs/fPPvLgJvayw/bqBETZDT1v3bjt5Ypwgnkow=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:ccc7f7d5-6ac0-4263-ad00-b411dae56474,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:7f1cf72f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7948868615f04ce496ab05be8b3e5025-20221127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1726154957; Sun, 27 Nov 2022 19:08:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 10:07:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:45 +0800
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
Subject: [PATCH 4/9] mtd: nand: ecc-mtk: add ecc support fot mt7986 IC
Date: Mon, 28 Nov 2022 10:06:08 +0800
Message-ID: <20221128020613.14821-5-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_180833_345529_0B391DBE 
X-CRM114-Status: GOOD (  10.24  )
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

add ecc support fot mt7986 IC

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/ecc-mtk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 9f9b201fe706..c2f6cfa76a04 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -79,6 +79,10 @@ static const u8 ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12
 };
 
+static const u8 ecc_strength_mt7986[] = {
+	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -483,6 +487,17 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
 	.pg_irq_sel = 0,
 };
 
+static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
+	.err_mask = 0x1f,
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
@@ -493,6 +508,9 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
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
