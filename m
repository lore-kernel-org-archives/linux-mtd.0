Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745B0C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE442187F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SSzaN9dw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE442187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4hPld0NOAc2KOCk5Af9TgEI5ajimCej9t+XYLp6wOVs=; b=SSzaN9dwLBoR5iMeit0Cj67wWO
	R5xF2ZaQXuAteKvCl3fT4bIvDEY5ucnUQ3E7XOCAS+y89QNjQqqGtnBQjRQWh+EOTzgEEuKuWioui
	navtJBwNSljF3melvZgUqzBlVsyrhgDEtL6B/1iyIxlg1iGP/yodW3Pdw7pk17zD6f4lsubq3BMj3
	1EjW5L8YYjRWcJMFXTM0HgJhM4FShpEklkGpCnuFavGXhykRq46YTD8ba0MNS9VjC1GA6qXVXTt+5
	TAf1UaArH21Cs2YgrOc8NcTQFkO4r+kLJk+OCPZgojanxgrBnxaQgLL4jUqaUUohIkljLeM2dvMGq
	NRovUCkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irU5Y-0007pm-0I; Tue, 14 Jan 2020 21:51:04 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irU30-0004Jd-Cn; Tue, 14 Jan 2020 21:48:28 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F3BF2004FB;
 Tue, 14 Jan 2020 22:48:25 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D50102004FC;
 Tue, 14 Jan 2020 22:48:18 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5EB87402C7;
 Wed, 15 Jan 2020 05:48:11 +0800 (SGT)
From: Han Xu <han.xu@nxp.com>
To: vkoul@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 esben@geanix.com, boris.brezillon@collabora.com
Subject: [PATCH 4/6] dmaengine: mxs: switch from dma_coherent to dma_pool
Date: Wed, 15 Jan 2020 05:44:01 +0800
Message-Id: <1579038243-28550-5-git-send-email-han.xu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
References: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_134826_712869_E927AAC4 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-imx@nxp.com, dmaengine@vger.kernel.org, han.xu@nxp.com,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

create one dma_pool dedicate for mxs-dma to avoid the
"alloc_contig_range: [xxx, xxx) PFNs busy" warning message during
frequently alloc/free resource ops in runtime pm.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/dma/mxs-dma.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 251492c5ea58..dfee41ae1981 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -26,6 +26,7 @@
 #include <linux/list.h>
 #include <linux/dma/mxs-dma.h>
 #include <linux/pm_runtime.h>
+#include <linux/dmapool.h>
 
 #include <asm/irq.h>
 
@@ -121,6 +122,7 @@ struct mxs_dma_chan {
 	enum dma_status			status;
 	unsigned int			flags;
 	bool				reset;
+	struct dma_pool			*ccw_pool;
 #define MXS_DMA_SG_LOOP			(1 << 0)
 #define MXS_DMA_USE_SEMAPHORE		(1 << 1)
 };
@@ -422,9 +424,10 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
 	struct device *dev = &mxs_dma->pdev->dev;
 	int ret;
 
-	mxs_chan->ccw = dma_alloc_coherent(mxs_dma->dma_device.dev,
-					   CCW_BLOCK_SIZE,
-					   &mxs_chan->ccw_phys, GFP_KERNEL);
+	mxs_chan->ccw = dma_pool_zalloc(mxs_chan->ccw_pool,
+					GFP_ATOMIC,
+					&mxs_chan->ccw_phys);
+
 	if (!mxs_chan->ccw) {
 		ret = -ENOMEM;
 		goto err_alloc;
@@ -454,8 +457,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
 err_clk:
 	free_irq(mxs_chan->chan_irq, mxs_dma);
 err_irq:
-	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
-			mxs_chan->ccw, mxs_chan->ccw_phys);
+	dma_pool_free(mxs_chan->ccw_pool, mxs_chan->ccw,
+		      mxs_chan->ccw_phys);
 err_alloc:
 	return ret;
 }
@@ -470,8 +473,8 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
 
 	free_irq(mxs_chan->chan_irq, mxs_dma);
 
-	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
-			mxs_chan->ccw, mxs_chan->ccw_phys);
+	dma_pool_free(mxs_chan->ccw_pool, mxs_chan->ccw,
+		      mxs_chan->ccw_phys);
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
@@ -796,6 +799,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 	const struct mxs_dma_type *dma_type;
 	struct mxs_dma_engine *mxs_dma;
 	struct resource *iores;
+	struct dma_pool *ccw_pool;
 	int ret, i;
 
 	mxs_dma = devm_kzalloc(&pdev->dev, sizeof(*mxs_dma), GFP_KERNEL);
@@ -843,7 +847,6 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		tasklet_init(&mxs_chan->tasklet, mxs_dma_tasklet,
 			     (unsigned long) mxs_chan);
 
-
 		/* Add the channel to mxs_chan list */
 		list_add_tail(&mxs_chan->chan.device_node,
 			&mxs_dma->dma_device.channels);
@@ -858,6 +861,17 @@ static int mxs_dma_probe(struct platform_device *pdev)
 
 	mxs_dma->dma_device.dev = &pdev->dev;
 
+	/* create the dma pool */
+	ccw_pool = dma_pool_create("ccw_pool",
+				   mxs_dma->dma_device.dev,
+				   CCW_BLOCK_SIZE, 32, 0);
+
+	for (i = 0; i < MXS_DMA_CHANNELS; i++) {
+		struct mxs_dma_chan *mxs_chan = &mxs_dma->mxs_chans[i];
+
+		mxs_chan->ccw_pool = ccw_pool;
+	}
+
 	/* mxs_dma gets 65535 bytes maximum sg size */
 	mxs_dma->dma_device.dev->dma_parms = &mxs_dma->dma_parms;
 	dma_set_max_seg_size(mxs_dma->dma_device.dev, MAX_XFER_BYTES);
@@ -899,11 +913,13 @@ static int mxs_dma_remove(struct platform_device *pdev)
 	int i;
 
 	dma_async_device_unregister(&mxs_dma->dma_device);
+	dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
 
 	for (i = 0; i < MXS_DMA_CHANNELS; i++) {
 		struct mxs_dma_chan *mxs_chan = &mxs_dma->mxs_chans[i];
 
 		tasklet_kill(&mxs_chan->tasklet);
+		mxs_chan->ccw_pool = NULL;
 	}
 
 	return 0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
