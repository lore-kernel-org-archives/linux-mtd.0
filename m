Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B36606A332
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TO42ByFf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=umRo2654
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=358y0sXRLfM/MQP5CvG4VIZq3PFmGqdcwO5sKn8bJvs=; b=TO42ByFfi294ZUm21S6crrcIV8
	wDWZ2L2SnXbtROOnN9T1DID09Q75jdUlvnzpLtaxiQn9xZqVUbFa3H32x6+5ZTksQSg+IKb1AvKLy
	7ZmMtREWeYmXZjTaoitrO0ug4gOM7SWiD/8Hb1+nzy9r5Gk96mT2QHKd56ZeBkGZP8CW1NuMc/FXQ
	50R9cSOB0FwoJ4J529FZ/7wHQj2GRgd/0xk9WCF+F5DfcFCpsGJTh/MjzUr2DSbTmsFNvzjTKbSU4
	ysf/aaFCRF6P+AYPtQ8D+lSSXMws3eE0KpvzCxyBwAr76WoKKRHiYDuc51fBoRMrgYkuUfZlqS6NE
	sRF8xgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmla-000000063Hp-05JP;
	Tue, 24 Nov 2026 09:24:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlR-000000063DR-0ERq
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 09:24:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 885FA4E4175C;
	Tue, 24 Nov 2026 09:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59475601E1;
	Tue, 24 Nov 2026 09:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E19511E68A4D;
	Tue, 24 Nov 2026 10:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795512274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d0DarnFgFzWuuXMjS2pFabQsuPpoJoPiwUJ6AhTmMdw=;
	b=umRo2654NV/3X19URObCEfxEdOrbOR1rFIGR9fnAm/jg61vaw00un9Z//61kpae6/c4TO7
	IhAIqUFJxEvJiV3MBKhyIrDGn6z2bWkPnuUeuqOajWk+iy+KBr9DoCcTNAWeD5y8xYicfy
	EpP0niMgQtrg6LiEr2DPqCDh3LuvHZRDsz92Aiqxe+I3ctfXSmw/QJj5W1jQ47mvWN5bb6
	tqn924srQ/0iY+GVjksQ9zA6AozI3ESjXhRE72JSw+yRC4spO2ZDH6aplZQb8skpiUrgmP
	ZHbqUJ5e1xtGcmQ388mICSZod+s9Kyg8MNH7MO0/cRQbWh3nUL9PMoe6CGjLDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 10:24:24 +0100
Subject: [PATCH v2 3/3] mtd: rawnand: cadence: Switch to
 dmaengine_get_dma_device()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-perso-upstreaming-rawnand-fixes-v2-3-69db17ad07bd@bootlin.com>
References: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
In-Reply-To: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012437_242301_BDDF739D 
X-CRM114-Status: GOOD (  13.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the dmaengine consumer accessor instead of open-coding it (as
already done in the remove path). Do it as well for the buffer mapping
done in cadence_nand_slave_dma_transfer() so that both ends of the
transfer are mapped against the same device, which matters for DMA
engines exposing a per-channel DMA device.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 912148f90ece..6f990469b8e5 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1873,16 +1873,16 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 {
 	DECLARE_COMPLETION_ONSTACK(finished);
 	struct dma_chan *chan;
-	struct dma_device *dma_dev;
 	dma_addr_t src_dma, dst_dma, buf_dma;
 	struct dma_async_tx_descriptor *tx;
+	struct device *dma_dev;
 	dma_cookie_t cookie;
 
 	chan = cdns_ctrl->dmac;
-	dma_dev = chan->device;
+	dma_dev = dmaengine_get_dma_device(chan);
 
-	buf_dma = dma_map_single(dma_dev->dev, buf, len, dir);
-	if (dma_mapping_error(dma_dev->dev, buf_dma)) {
+	buf_dma = dma_map_single(dma_dev, buf, len, dir);
+	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(cdns_ctrl->dev, "Failed to map DMA buffer\n");
 		goto err;
 	}
@@ -1914,12 +1914,12 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 	dma_async_issue_pending(cdns_ctrl->dmac);
 	wait_for_completion(&finished);
 
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return 0;
 
 err_unmap:
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 err:
 	dev_dbg(cdns_ctrl->dev, "Fall back to CPU I/O\n");
@@ -3134,8 +3134,8 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
+	struct device *dma_dev;
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,12 +3181,12 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 			goto disable_irq;
 		}
 
-		dma_dev = cdns_ctrl->dmac->device;
-		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
+		dma_dev = dmaengine_get_dma_device(cdns_ctrl->dmac);
+		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev, cdns_ctrl->io.dma,
 							  cdns_ctrl->io.size,
 							  DMA_BIDIRECTIONAL, 0);
 
-		ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
+		ret = dma_mapping_error(dma_dev, cdns_ctrl->io.iova_dma);
 		if (ret) {
 			dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
 			goto dma_release_chnl;
@@ -3210,7 +3210,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 
 unmap_dma_resource:
 	if (cdns_ctrl->dmac)
-		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
+		dma_unmap_resource(dma_dev, cdns_ctrl->io.iova_dma,
 				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
