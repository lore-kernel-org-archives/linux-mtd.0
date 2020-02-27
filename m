Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D4CC4BA3B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D07324695
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlIr6lj4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oZL24vsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D07324695
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wM3wkurduheikAX09NiO4dw1k8PPvr3dz1HgxCeUyYs=; b=DlIr6lj4f2WQWO
	H9hNzSI1ikzfMwkBWCxnF09BK/xjTZGk4+sphmh1LtFb5WEto9X25RS+FKFPS3iJk1mooOLoDFHJI
	F6S18Wj6u1A1DbkJA8+zOrzAhOIMXi/uw/oE+Ts3zwAP45FmtWrQXCQdAV2LzBlYR4M+LaU40gvbj
	YSoi3gPwPH78V0hYC5zjeDCmMwj57NTzducRjl9wOmA3upcXtqcqy9RJyel4y5h3Ivc6JECzEMlBU
	RBHQw5CWV8TPw4GmBt2eV9a47s/+rWQF3k7ztUw6oK8QRqdeZfaw9a5rut9/dxG+eiow15JKSoawA
	pYljpTWKwsMue7q+6EdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ITZ-0005de-8G; Thu, 27 Feb 2020 12:41:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7IQh-0001qx-HD; Thu, 27 Feb 2020 12:38:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RCc9Mk060757;
 Thu, 27 Feb 2020 06:38:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582807089;
 bh=lxEo+tSFG1DiFTuGLCWGl5deytcPL1kaEzXneacjjbw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oZL24vsxHovF8nXugumq/4kpyAKXXeqTUY1t/66zkkyPctslE5OdkMcqtTXVKVyJz
 gFtEaLxo2iAGhT5//6BCRr55eklI8bxV43JVe4jd5zPDsKkZMyvhH94lmNsEtNXtZP
 SZdG/ErlPRw6mnYtezQpHzM5bxrzKwImdFxpwkL4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RCc8L5128189
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Feb 2020 06:38:09 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 06:38:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 06:38:08 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbnvS100207;
 Thu, 27 Feb 2020 06:38:05 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <han.xu@nxp.com>,
 <richard@nod.at>, <mripard@kernel.org>, <wens@csie.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Subject: [PATCH 5/7] mtd: rawnand: qcom: Release resources on failure within
 qcom_nandc_alloc()
Date: Thu, 27 Feb 2020 14:37:47 +0200
Message-ID: <20200227123749.24064-6-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227123749.24064-1-peter.ujfalusi@ti.com>
References: <20200227123749.24064-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_043816_029159_07A7CE82 
X-CRM114-Status: GOOD (  12.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vkoul@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case when DMA channel request or alloc_bam_transaction() fails,
dma_unmap_single() and any channels already requested should be released.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 61 +++++++++++++++++--------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 7bb9a7e8e1e7..ca21cb3836dc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2628,6 +2628,29 @@ static const struct nand_controller_ops qcom_nandc_ops = {
 	.attach_chip = qcom_nand_attach_chip,
 };
 
+static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
+{
+	if (nandc->props->is_bam) {
+		if (!dma_mapping_error(nandc->dev, nandc->reg_read_dma))
+			dma_unmap_single(nandc->dev, nandc->reg_read_dma,
+					 MAX_REG_RD *
+					 sizeof(*nandc->reg_read_buf),
+					 DMA_FROM_DEVICE);
+
+		if (nandc->tx_chan)
+			dma_release_channel(nandc->tx_chan);
+
+		if (nandc->rx_chan)
+			dma_release_channel(nandc->rx_chan);
+
+		if (nandc->cmd_chan)
+			dma_release_channel(nandc->cmd_chan);
+	} else {
+		if (nandc->chan)
+			dma_release_channel(nandc->chan);
+	}
+}
+
 static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 {
 	int ret;
@@ -2676,19 +2699,22 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
 		if (!nandc->tx_chan) {
 			dev_err(nandc->dev, "failed to request tx channel\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto unalloc;
 		}
 
 		nandc->rx_chan = dma_request_slave_channel(nandc->dev, "rx");
 		if (!nandc->rx_chan) {
 			dev_err(nandc->dev, "failed to request rx channel\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto unalloc;
 		}
 
 		nandc->cmd_chan = dma_request_slave_channel(nandc->dev, "cmd");
 		if (!nandc->cmd_chan) {
 			dev_err(nandc->dev, "failed to request cmd channel\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto unalloc;
 		}
 
 		/*
@@ -2702,7 +2728,8 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		if (!nandc->bam_txn) {
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto unalloc;
 		}
 	} else {
 		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
@@ -2720,29 +2747,9 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	return 0;
-}
-
-static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
-{
-	if (nandc->props->is_bam) {
-		if (!dma_mapping_error(nandc->dev, nandc->reg_read_dma))
-			dma_unmap_single(nandc->dev, nandc->reg_read_dma,
-					 MAX_REG_RD *
-					 sizeof(*nandc->reg_read_buf),
-					 DMA_FROM_DEVICE);
-
-		if (nandc->tx_chan)
-			dma_release_channel(nandc->tx_chan);
-
-		if (nandc->rx_chan)
-			dma_release_channel(nandc->rx_chan);
-
-		if (nandc->cmd_chan)
-			dma_release_channel(nandc->cmd_chan);
-	} else {
-		if (nandc->chan)
-			dma_release_channel(nandc->chan);
-	}
+unalloc:
+	qcom_nandc_unalloc(nandc);
+	return ret;
 }
 
 /* one time setup of a few nand controller registers */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
