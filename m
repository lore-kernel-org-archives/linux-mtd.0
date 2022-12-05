Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F23AC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoYP0wabtPZ/Tf3NYB5rbAKHRK+7cAQnS/iRZU2RrRM=; b=vUzxfXXA7XawXb
	q7/kDwM8eWmcp6+4zhXD25sg2fzmriqQBL8cNP5KxPk54sjj9xjKmxhfi3e9sopfPQnj7tQ8fRdK5
	1DBDf/3JeHNhE9OLXXIVwWQrm3S2jfj96gOTrr5FWbqhSqVDBbBGo7whOIjLEsYE3jmPKdTLQqJgw
	vWWPCqiVcWyS7Ak0626h0GMVxNr2X3IZBOYGic8pJ5uKAR8LxJZHXqmYBhBISRMbS/YgnEL/4UD/z
	C+N5zPSF9z/hlm/WOcq4dHSelLy4GMthO+LydFeJz+o5tWy02H4ZK4G7asHLIOk3ni7G1bsDrzeQt
	5yKlJ/R2dTV9tluzigkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25Rf-00FE2T-WF; Mon, 05 Dec 2022 06:59:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25RJ-00FDLv-Ax; Mon, 05 Dec 2022 06:58:58 +0000
X-UUID: b8222b871cc44ba5beeba9dec277f1e0-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VBL576pkrtXP6/de0wvgMxEdL4WcGZ/83O47rZMO8Rk=;
	b=oHSTZvt03VVSvF2A3DUmwDUbRvY+Z1uj+rHD6rqDXWUiUun/clqHAzUjNFuwTybfKJq+cTod32mdLEpJDNbrruxmROXanSIU3hVp9m39Zyj4/qYinIp72DjYi7QcvP9eVqKyUbFLLQpbt6Gu54wlsze978Cj2FPgwXwF3Tyi2Dw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:28fbce8a-dccb-431d-9ef2-8a457bc36eea,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:f63fae30-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b8222b871cc44ba5beeba9dec277f1e0-20221204
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1600320050; Sun, 04 Dec 2022 23:58:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Dec 2022 14:58:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Dec 2022 14:58:13 +0800
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
Subject: [PATCH v2 6/9] spi: mtk-snfi: Add snfi sample delay and read latency adjustment
Date: Mon, 5 Dec 2022 14:57:53 +0800
Message-ID: <20221205065756.26875-7-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_225857_405732_9AE479D5 
X-CRM114-Status: GOOD (  10.25  )
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

Add snfi sample delay and read latency adjustment which can get
from dts property.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/spi/spi-mtk-snfi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 85644308df23..32a9a817869c 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -195,6 +195,8 @@
 #define DATA_READ_MODE_X4 2
 #define DATA_READ_MODE_DUAL 5
 #define DATA_READ_MODE_QUAD 6
+#define DATA_READ_LATCH_LAT GENMASK(9, 8)
+#define DATA_READ_LATCH_LAT_S 8
 #define PG_LOAD_CUSTOM_EN BIT(7)
 #define DATARD_CUSTOM_EN BIT(6)
 #define CS_DESELECT_CYC_S 0
@@ -205,6 +207,9 @@
 
 #define SNF_DLY_CTL3 0x548
 #define SFCK_SAM_DLY_S 0
+#define SFCK_SAM_DLY GENMASK(5, 0)
+#define SFCK_SAM_DLY_TOTAL 9
+#define SFCK_SAM_DLY_RANGE 47
 
 #define SNF_STA_CTL1 0x550
 #define CUS_PG_DONE BIT(28)
@@ -1368,6 +1373,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	const struct of_device_id *dev_id;
 	struct spi_controller *ctlr;
 	struct mtk_snand *ms;
+	u32 val = 0;
 	int ret;
 
 	dev_id = of_match_node(mtk_snand_ids, np);
@@ -1446,6 +1452,16 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	// switch to SNFI mode
 	nfi_write32(ms, SNF_CFG, SPI_MODE);
 
+	ret = of_property_read_u32(np, "rx-sample-delay-ns", &val);
+	if (!ret)
+		nfi_rmw32(ms, SNF_DLY_CTL3, SFCK_SAM_DLY,
+			  val * SFCK_SAM_DLY_RANGE / SFCK_SAM_DLY_TOTAL);
+
+	ret = of_property_read_u32(np, "mediatek,rx-latch-latency", &val);
+	if (!ret)
+		nfi_rmw32(ms, SNF_MISC_CTL, DATA_READ_LATCH_LAT,
+			  val << DATA_READ_LATCH_LAT_S);
+
 	// setup an initial page format for ops matching page_cache_op template
 	// before ECC is called.
 	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
