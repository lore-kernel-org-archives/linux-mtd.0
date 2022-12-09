Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8400C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwKdWnt4V2vVJzfoi/O6CWBiauJ8aeLGTJ0HbToCDBg=; b=xpasDjdEfztLx1
	J87B2rr+79dyrfDQPCiy0KtDULf7YKuY/TULtvrEyoPdZsv/O9kqTTQ20mGWrBalVezHhtGgh5eXT
	JuadojCkAYL8xocE1hdyQAtD76ZzUNODYdcDHdf1YgfCLcd38Gmf9L6yhCR0D7TZPOBkHCqTfllP1
	1Rn+DEgp80eBzOWcRwT1rJLvulhPP7cXSS54kP3QWaCeaT3/nya/DxIm+zGzXKuknRjeAJzVuDGHF
	s6Yu4Zwwqx93nnX145eh4LIzS2+taIDLDX97BUZo7FRFm3SIFVcLWwqmZGFgxYEJTM+bSoEIMwTc4
	yAQxRhv1TqJLVspkvyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3XkV-004xL7-Id; Fri, 09 Dec 2022 07:24:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3XkT-004xJJ-2u; Fri, 09 Dec 2022 07:24:46 +0000
X-UUID: 0c756ef328594466be7fd8ad252fb7db-20221209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FNzZA4Rvah6EiOVCThpkNxdRZy233GREfbroF6vG1AY=;
	b=H6o5tlbNTTPIMPE5ScvLlgx2nP49kr8DAtVH3gqlMXT+GnYGxyc1/vV5yLac8OgKhj6R+og865+1nAW6y8kYryyfpFkpfqIOGZkXETmGE145E+rJ6OlKkOhyjSfBAjoDA/ajGVOB4WUieP1zQo6dRGRZIL2Hs8stPDUO1C71XqA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:10b4d031-804a-4233-8b4f-11c1abc3f2a7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:d796c724-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0c756ef328594466be7fd8ad252fb7db-20221209
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 643261776; Fri, 09 Dec 2022 00:24:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Dec 2022 14:44:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Dec 2022 14:44:00 +0800
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
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 2/9] spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
Date: Fri, 9 Dec 2022 14:43:10 +0800
Message-ID: <20221209064317.2828-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_232445_154443_698451E9 
X-CRM114-Status: GOOD (  12.84  )
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

Add optional nfi_hclk which is needed for MT7986.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mtk-snfi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 719fc6f53ab1..85644308df23 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -297,6 +297,7 @@ struct mtk_snand {
 	struct device *dev;
 	struct clk *nfi_clk;
 	struct clk *pad_clk;
+	struct clk *nfi_hclk;
 	void __iomem *nfi_base;
 	int irq;
 	struct completion op_done;
@@ -1339,7 +1340,16 @@ static int mtk_snand_enable_clk(struct mtk_snand *ms)
 		dev_err(ms->dev, "unable to enable pad clk\n");
 		goto err1;
 	}
+	ret = clk_prepare_enable(ms->nfi_hclk);
+	if (ret) {
+		dev_err(ms->dev, "unable to enable nfi hclk\n");
+		goto err2;
+	}
+
 	return 0;
+
+err2:
+	clk_disable_unprepare(ms->pad_clk);
 err1:
 	clk_disable_unprepare(ms->nfi_clk);
 	return ret;
@@ -1347,6 +1357,7 @@ static int mtk_snand_enable_clk(struct mtk_snand *ms)
 
 static void mtk_snand_disable_clk(struct mtk_snand *ms)
 {
+	clk_disable_unprepare(ms->nfi_hclk);
 	clk_disable_unprepare(ms->pad_clk);
 	clk_disable_unprepare(ms->nfi_clk);
 }
@@ -1401,6 +1412,13 @@ static int mtk_snand_probe(struct platform_device *pdev)
 		goto release_ecc;
 	}
 
+	ms->nfi_hclk = devm_clk_get_optional(&pdev->dev, "nfi_hclk");
+	if (IS_ERR(ms->nfi_hclk)) {
+		ret = PTR_ERR(ms->nfi_hclk);
+		dev_err(&pdev->dev, "unable to get nfi_hclk, err = %d\n", ret);
+		goto release_ecc;
+	}
+
 	ret = mtk_snand_enable_clk(ms);
 	if (ret)
 		goto release_ecc;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
