Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07B8C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 12:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3EA2084F
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 12:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPMw0bMp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="krl+Ygda"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3EA2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQDgF6R/bSL3+f+f+PKJKCb5ObNhlI/bfpS+3XR15vI=; b=PPMw0bMpLXMfuF
	4Y5iB3EqMt+c2BqM0qVtIZW/8Fx33O1MiGmn1rGnxYTpjGxaR+x9IWEszsTTpoAKmxH69HmdIk0fD
	CM2zsrOvmm8dCFoV0qq2EU3hOO7/Ku+pSAhT+N9D0Vvy/gXwsQ/fB15BGRB2wO9K1kalQ8AfLb0rQ
	dU0kj9+/D0R3Hsf7O6LzE9S/6QUeZGqcRMkRQMANGFjPuv6tTaEVKYEVgFVlWtq2nDitUqMu4vBOd
	RQGC5gjw6HK1fMxK/htrrp61Bik5dYYE3rbzRxDsaD5CyQKQ3XUqZhRhU6GcniRgCbCpjaD++6YxM
	bws7FlsVs/jCn+osNb8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDpuP-0007ic-IA; Tue, 09 Apr 2019 12:31:25 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDpuG-0007GP-Cy
 for linux-mtd@bombadil.infradead.org; Tue, 09 Apr 2019 12:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kTwMMh6hAiHvWoYQAlgpkAbHw4mFffthOk1XvZjllkM=; b=krl+Ygdaa1mpZtPswJGDSXJuWS
 OATCcCxzkcN/XlCC2aLW+pmEqUq7WA90Po+Q6yyrNmvJ6xKhMzc/fyRFrNthzpL/oY35JWoOKdM05
 X6YCWU4W+xOd7J7Rhp5ANREC1aqdz8sQL5CbFHeb+e0cObv+D6V5Cybwjkm5u4l8WFhX684TMWu9r
 opIlwXxLIApNWXhKriJtflozODN+52aOzs1qkZNRPRXGLzvWeHbVuIq+/SPtoBACngbFJU2SkjgeY
 Lwr7FjvQgdoriA5/wsbRdlP5UGXgHUdLTyhOSGfJgMpXY5t4t/1m0caPsLOPA/t6VfGSnZFhb67jm
 +W0TKFkA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp1x-0006r9-13
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:35:10 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OX-N1; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001cE-OY; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/14] dma: mxs: Add header file to be shared with gpmi nand
 driver
Date: Tue,  9 Apr 2019 13:34:19 +0200
Message-Id: <20190409113421.3037-13-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409113421.3037-1-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_073509_347281_0A31049A 
X-CRM114-Status: GOOD (  21.76  )
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
