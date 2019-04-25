Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D94C282E1
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CBB20678
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qDuucSMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7CBB20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+1glzq7GfRr5Rx4PYZ8vv/VtDvsSvpAwgBats13SW8=; b=qDuucSMH18xQ+t
	wt3083dnoCN8eRTsZD6ndKcf/sqGf9je0yN9ikvTCS9uEPSN5X7cch0PV0FTSt8Obwoxla+Fl3rSu
	m891sZCh8dqXJ7grjxjQ6RCLPlMWxlwKYWSPU9nuLab0IkDvCczaC7BPYpeQciCT5g3s6hRdtD3k7
	4Iv2N4y5araSA9UtW27gXuj0o7Kj1eQk4WegkuLRHhI3XbWm7B6maAv9bjFGsphjfqV3eYuuzRYKH
	+B3Lw6RO4ztHGh30hi6ZTBFp33LrDO8o35V24pDJih9vYejIVo7FRfqo+ItKNqQUBtuuiMzYdMi0D
	AjBUsPNtMkL/gxqj3BKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJdwi-000753-7Y; Thu, 25 Apr 2019 12:57:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJdvo-0005ve-6Q
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 12:56:55 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvk-0002Th-Af; Thu, 25 Apr 2019 14:56:48 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvj-0008ES-59; Thu, 25 Apr 2019 14:56:47 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/14] dmaengine: mxs: Add header file to be shared with gpmi
 nand driver
Date: Thu, 25 Apr 2019 14:56:41 +0200
Message-Id: <20190425125643.29990-13-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190425125643.29990-1-s.hauer@pengutronix.de>
References: <20190425125643.29990-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_055652_447408_23547D18 
X-CRM114-Status: GOOD (  18.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mxs dma driver can do PIO transfers. A pointer to the PIO words
to transfer is passed in the struct scatterlist * argument of
dmaengine_prep_slave_sg(). It's quite ugly and non obvious to cast
u32 * to struct scatterlist * each time when calling
dmaengine_prep_slave_sg(), so add a static inline wrapper function
to be called by the user along with a description what is going on.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/mxs-dma.c                      |  1 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 36 +++++++++-------------
 include/linux/dma/mxs-dma.h                | 21 +++++++++++++
 3 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/dma/mxs-dma.h

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index ce92a3626ea4..62ee9328aea1 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -24,6 +24,7 @@
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/list.h>
+#include <linux/dma/mxs-dma.h>
 
 #include <asm/irq.h>
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index a6e769afc89a..cf016ec0b1c6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/dma/mxs-dma.h>
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
 #include "bch-regs.h"
@@ -913,9 +914,8 @@ static int gpmi_send_command(struct gpmi_nand_data *this)
 		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
 		| BF_GPMI_CTRL0_XFER_COUNT(this->command_length);
 	pio[1] = pio[2] = 0;
-	desc = dmaengine_prep_slave_sg(channel,
-					(struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, 0);
 	if (!desc)
 		return -EINVAL;
 
@@ -988,8 +988,8 @@ static int gpmi_send_data(struct gpmi_nand_data *this, const void *buf,
 		| BF_GPMI_CTRL0_ADDRESS(address)
 		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
-	desc = dmaengine_prep_slave_sg(channel, (struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, 0);
 	if (!desc)
 		return -EINVAL;
 
@@ -1025,9 +1025,8 @@ static int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
 		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
-	desc = dmaengine_prep_slave_sg(channel,
-					(struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, 0);
 	if (!desc)
 		return -EINVAL;
 
@@ -1083,10 +1082,8 @@ static int gpmi_send_page(struct gpmi_nand_data *this,  dma_addr_t payload,
 	pio[4] = payload;
 	pio[5] = auxiliary;
 
-	desc = dmaengine_prep_slave_sg(channel,
-					(struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE,
-					DMA_CTRL_ACK);
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -1117,9 +1114,7 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 		| BF_GPMI_CTRL0_ADDRESS(address)
 		| BF_GPMI_CTRL0_XFER_COUNT(0);
 	pio[1] = 0;
-	desc = dmaengine_prep_slave_sg(channel,
-				(struct scatterlist *)pio, 2,
-				DMA_TRANS_NONE, 0);
+	desc = mxs_dmaengine_prep_pio(channel, pio, 2, DMA_TRANS_NONE, 0);
 	if (!desc)
 		return -EINVAL;
 
@@ -1144,10 +1139,8 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 	pio[3] = geo->page_size;
 	pio[4] = payload;
 	pio[5] = auxiliary;
-	desc = dmaengine_prep_slave_sg(channel,
-					(struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE,
-					DMA_CTRL_ACK);
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -1163,9 +1156,8 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 		| BF_GPMI_CTRL0_XFER_COUNT(geo->page_size);
 	pio[1] = 0;
 	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
-	desc = dmaengine_prep_slave_sg(channel,
-				(struct scatterlist *)pio, 3,
-				DMA_TRANS_NONE, DMA_CTRL_ACK);
+	desc = mxs_dmaengine_prep_pio(channel, pio, 3, DMA_TRANS_NONE,
+				      DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
diff --git a/include/linux/dma/mxs-dma.h b/include/linux/dma/mxs-dma.h
new file mode 100644
index 000000000000..092b2a7b92ac
--- /dev/null
+++ b/include/linux/dma/mxs-dma.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _MXS_DMA_H_
+#define _MXS_DMA_H_
+
+#include <linux/dmaengine.h>
+
+/*
+ * The mxs dmaengine can do PIO transfers. We pass a pointer to the PIO words
+ * in the second argument to dmaengine_prep_slave_sg when the direction is
+ * set to DMA_TRANS_NONE. To make this clear and to prevent users from doing
+ * the error prone casting we have this wrapper function
+ */
+static inline struct dma_async_tx_descriptor *mxs_dmaengine_prep_pio(
+        struct dma_chan *chan, u32 *pio, unsigned int npio,
+        enum dma_transfer_direction dir, unsigned long flags)
+{
+	return dmaengine_prep_slave_sg(chan, (struct scatterlist *)pio, npio,
+				       dir, flags);
+}
+
+#endif /* _MXS_DMA_H_ */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
