Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052BDC4BA2D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B749C24695
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ug79aJGa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v1GWo8JB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B749C24695
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEao5exCBpq02pGC5j3Vyf5NiLbUSgo7Xtzcsy+CoSY=; b=ug79aJGacOqSC7
	trgY/lsRQ4MFP+cfoaeoO8uPQYzvBoaABXY9+d4iU+eOuoR0XLyzBFVr2vi1sQ++A54QerFj+dhXF
	DEth9SSewxI8eyo3qtI03J4CxAtggLBn0WEMq7ulAFaWZDfP6gUVZjY4QsLjbXHpv3mwgPvSrDcIA
	8N/pMQ84v2GT/qgyVLhuA/Ib9/dMmTNHQ2DtCmufQdwGffnRwH20297n7ZIf05K6s4IAoi/0YibtS
	U8lsw9KlSChD2kwT+gI5VwxvqLG6WFfsFNPFsmUgSZAuhfiFgdnFYmS/LMdfo4ZHoENrZZTvURBB2
	bUz7napfkdbc7FrTR/1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7IU2-0006AF-UH; Thu, 27 Feb 2020 12:41:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7IQj-0001se-9S; Thu, 27 Feb 2020 12:38:18 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RCcBZN060763;
 Thu, 27 Feb 2020 06:38:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582807091;
 bh=gB00BvfmUubTYpAbr6oIRKU7s9SAe7mdFdoDfZXeBKs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=v1GWo8JBT9+cLiKgmF0y2MebVaCu4T5uXNoQJivXViAofTc3748o05dz42Pgi3ks2
 VKxVYuLN96eSqKV0WvRuQuTklI+kzjlU8McBrZrUIf+xCt/TJgvP7K1DwUUcFck1xO
 QXAna0Lr2IwC2Y7CmU8Ks1qR52OEK0EIpJOy+1Ps=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RCcBrg117456
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Feb 2020 06:38:11 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 06:38:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 06:38:11 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbnvT100207;
 Thu, 27 Feb 2020 06:38:08 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <han.xu@nxp.com>,
 <richard@nod.at>, <mripard@kernel.org>, <wens@csie.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Subject: [PATCH 6/7] mtd: rawnand: qcom: Use dma_request_chan() instead
 dma_request_slave_channel()
Date: Thu, 27 Feb 2020 14:37:48 +0200
Message-ID: <20200227123749.24064-7-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227123749.24064-1-peter.ujfalusi@ti.com>
References: <20200227123749.24064-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_043817_434932_7B6E2FF1 
X-CRM114-Status: GOOD (  13.20  )
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

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

Use using dma_request_chan() directly to return the real error code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 50 ++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index ca21cb3836dc..5b11c7061497 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2696,24 +2696,36 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 			return -EIO;
 		}
 
-		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
-		if (!nandc->tx_chan) {
-			dev_err(nandc->dev, "failed to request tx channel\n");
-			ret = -ENODEV;
+		nandc->tx_chan = dma_request_chan(nandc->dev, "tx");
+		if (IS_ERR(nandc->tx_chan)) {
+			ret = PTR_ERR(nandc->tx_chan);
+			nandc->tx_chan = NULL;
+			if (ret != -EPROBE_DEFER)
+				dev_err(nandc->dev,
+					"tx DMA channel request failed: %d\n",
+					ret);
 			goto unalloc;
 		}
 
-		nandc->rx_chan = dma_request_slave_channel(nandc->dev, "rx");
-		if (!nandc->rx_chan) {
-			dev_err(nandc->dev, "failed to request rx channel\n");
-			ret = -ENODEV;
+		nandc->rx_chan = dma_request_chan(nandc->dev, "rx");
+		if (IS_ERR(nandc->rx_chan)) {
+			ret = PTR_ERR(nandc->rx_chan);
+			nandc->rx_chan = NULL;
+			if (ret != -EPROBE_DEFER)
+				dev_err(nandc->dev,
+					"rx DMA channel request failed: %d\n",
+					ret);
 			goto unalloc;
 		}
 
-		nandc->cmd_chan = dma_request_slave_channel(nandc->dev, "cmd");
-		if (!nandc->cmd_chan) {
-			dev_err(nandc->dev, "failed to request cmd channel\n");
-			ret = -ENODEV;
+		nandc->cmd_chan = dma_request_chan(nandc->dev, "cmd");
+		if (IS_ERR(nandc->cmd_chan)) {
+			ret = PTR_ERR(nandc->cmd_chan);
+			nandc->cmd_chan = NULL;
+			if (ret != -EPROBE_DEFER)
+				dev_err(nandc->dev,
+					"cmd DMA channel request failed: %d\n",
+					ret);
 			goto unalloc;
 		}
 
@@ -2732,11 +2744,15 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 			goto unalloc;
 		}
 	} else {
-		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
-		if (!nandc->chan) {
-			dev_err(nandc->dev,
-				"failed to request slave channel\n");
-			return -ENODEV;
+		nandc->chan = dma_request_chan(nandc->dev, "rxtx");
+		if (IS_ERR(nandc->chan)) {
+			ret = PTR_ERR(nandc->chan);
+			nandc->chan = NULL;
+			if (ret != -EPROBE_DEFER)
+				dev_err(nandc->dev,
+					"rxtx DMA channel request failed: %d\n",
+					ret);
+			return ret;
 		}
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
