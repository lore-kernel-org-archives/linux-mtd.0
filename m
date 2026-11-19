Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520BF606A33B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vNMstEia;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZnctWx2c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J4DDPFH+Nby/9WZR6v1hq79iMi5W+pstD8cQJDSY9YI=; b=vNMstEiaIQwBCVwQ+Gd9WtoHb6
	Qo5BVKpNL4q4jFxwzQ3PWtbb5O02h/d8zPuhZ/w4qkkfxFtz8rMUv+TbzF6DjhmS+LRB9gDfqhFy0
	oOVqyU1OX1lXSldfUDAV/fj85ez6nQhvGES6XJWlCm2nXtS968YhN3O0Xj5hP4Gk97Ji+MK/Pt4Xg
	4aloc/fJfxFnsFU3aPbnyuGxP27NyxB07gWz0Sv5EiE5kqqy4SxZzEeHABww/PGRmppwie0LmX0mA
	MhSmfF/kJurBfcw2ERXfRmnuxSfza6pcpN2/Jd5iSTbAtY5W8IMKl3MMJipyUMJpAFFcyABG26yEc
	dRknOqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAc6-0000000DZNn-37Gt;
	Thu, 19 Nov 2026 22:28:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAc3-0000000DZLy-3Teb
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:28:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A374AC2F4C7;
	Thu, 19 Nov 2026 22:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37F586035B;
	Thu, 19 Nov 2026 22:28:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2EFF11BC0D8D;
	Thu, 19 Nov 2026 23:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795127289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RBwbTuzG8Tf8ZY+XdUTzmmrIkAT0P/6hihVvntI9HGQ=;
	b=ZnctWx2crOylXJMlJuzjMTRRGJz72eoVfjnlrxcvv/nxwvMiHMHinDUZDO5WX031Avjrof
	GeL1kCBEb4WVnwFnJYjrksGvky0sodKWSc+wfpzvktRXekEbIbzu9F1UgoWZxY6wuiDVQo
	fpd2I7YC7owENHRis2wX/qvYsH69jQsuQFDs1yYs38ZsPEv6JOT7per788YwtXen3lKco3
	mWsbrt4zyqiPRlHX8DP3u4lV6E/7nkmp1P/+ZssDfIKBYfRro1rg4GRdyBn4OwajVpXmqn
	fhScp4H2810eZ6iAJIn3cOTDYfGkTh/os9v2g7n0ElOn7C3zAgEYKoEuju9QDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:27:57 +0100
Subject: [PATCH 2/2] mtd: rawnand: cadence: Switch to
 dmaengine_get_dma_device()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-perso-upstreaming-rawnand-fixes-v1-2-0c95641b550c@bootlin.com>
References: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
In-Reply-To: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_142816_026615_AEA9DB0D 
X-CRM114-Status: GOOD (  10.69  )
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
already done in the remove path).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 42cc62b36457..2ab59ec6e732 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3126,7 +3126,6 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3162,6 +3161,8 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	dma_cap_set(DMA_MEMCPY, mask);
 
 	if (cdns_ctrl->caps1->has_dma) {
+		struct device *dma_dev;
+
 		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
 		if (IS_ERR(cdns_ctrl->dmac)) {
 			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
@@ -3169,12 +3170,12 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
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
@@ -3205,8 +3206,9 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 
 unmap_dma_resource:
 	if (cdns_ctrl->dmac)
-		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
-				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
+		dma_unmap_resource(dmaengine_get_dma_device(cdns_ctrl->dmac),
+				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
+				   DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:
 	if (cdns_ctrl->dmac)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
