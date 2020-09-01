Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F315C433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAE4206FA
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PU5fB90m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXk3liog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAE4206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5LF/1QUCAvJifC5/A3QY6lBc8UqN4IxWVoFPAM+mwE=; b=PU5fB90mqXBm81Rj0j8raZvvGh
	E83vnYGwHLlPePOtSFioQZshmEUMhjZvnrFmlbSaHOvH+kYc+R6HWKmkg3BZ5t4cx2MbQz5rWugm5
	hHwXdqnMtkfr2L70J6sDmTfWprrxQkBxhSHvhxZlzVgy84yEtgs2fnWeL7KBQkr4pyhy6y4mM8PN4
	p/EBF5DM8hKOCPhdGS9z4zBUqyBgWTXQ04+ISWPfue9GJ7SYPhSa46NSc+F1Fwan8KsqekMPTMeMM
	bz4Us7r1ONZp6HHamsSmvU6+OT1MgXMiWFf487jNxnKO1XaZNWoTBz0Frf347XcY6CHvGDGJaQw4W
	kJiil2Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8Be-0000wX-8r; Tue, 01 Sep 2020 15:27:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8As-0000Wd-NR; Tue, 01 Sep 2020 15:26:19 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D5002151B;
 Tue,  1 Sep 2020 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973978;
 bh=pqqc4i70zurQCjFY04KGJlNOtStPEkL0SfWqdT9iNNw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bXk3liogyOzR6hy4xq+6tcYuqi1Pp4DPggmTuH4tB07OTDyvcGZSh5s95yZbJhUEd
 QlH6B/F9HJn/6dRx3g7UX/pWQiMHNQ6vpAfzesJekg77ezj8TbzROX6rmc4vFGaBAJ
 mO/IElkrXG55wVB14GuCWndO3NK9I9u01mUhcGs0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] mtd: rawnand: qcom: Simplify with dev_err_probe()
Date: Tue,  1 Sep 2020 16:25:35 +0200
Message-Id: <20200901142535.12819-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901142535.12819-1-krzk@kernel.org>
References: <20200901142535.12819-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112618_873252_DD1FF7D4 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index bd7a7251429b..31d6b9682e3d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2702,10 +2702,8 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		if (IS_ERR(nandc->tx_chan)) {
 			ret = PTR_ERR(nandc->tx_chan);
 			nandc->tx_chan = NULL;
-			if (ret != -EPROBE_DEFER)
-				dev_err(nandc->dev,
-					"tx DMA channel request failed: %d\n",
-					ret);
+			dev_err_probe(nandc->dev, ret,
+				      "tx DMA channel request failed\n");
 			goto unalloc;
 		}
 
@@ -2713,10 +2711,8 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		if (IS_ERR(nandc->rx_chan)) {
 			ret = PTR_ERR(nandc->rx_chan);
 			nandc->rx_chan = NULL;
-			if (ret != -EPROBE_DEFER)
-				dev_err(nandc->dev,
-					"rx DMA channel request failed: %d\n",
-					ret);
+			dev_err_probe(nandc->dev, ret,
+				      "rx DMA channel request failed\n");
 			goto unalloc;
 		}
 
@@ -2724,10 +2720,8 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		if (IS_ERR(nandc->cmd_chan)) {
 			ret = PTR_ERR(nandc->cmd_chan);
 			nandc->cmd_chan = NULL;
-			if (ret != -EPROBE_DEFER)
-				dev_err(nandc->dev,
-					"cmd DMA channel request failed: %d\n",
-					ret);
+			dev_err_probe(nandc->dev, ret,
+				      "cmd DMA channel request failed\n");
 			goto unalloc;
 		}
 
@@ -2750,10 +2744,8 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		if (IS_ERR(nandc->chan)) {
 			ret = PTR_ERR(nandc->chan);
 			nandc->chan = NULL;
-			if (ret != -EPROBE_DEFER)
-				dev_err(nandc->dev,
-					"rxtx DMA channel request failed: %d\n",
-					ret);
+			dev_err_probe(nandc->dev, ret,
+				      "rxtx DMA channel request failed\n");
 			return ret;
 		}
 	}
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
