Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1384DC10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20A720883
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLXFbXJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C20A720883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joedONd6vOdMhFWWzvO5PSmLdwwEHO7h0TRYlAPXHJo=; b=PLXFbXJJARDWk7
	Atm2aNjUHonqiw1MshW8JdHHqumgSnMD0lTIo6BsygC09g+eilAplBHgattJiz3ls17mvrb/o/9gN
	IPymxF9Q0JzC/uR4xjSYYVNbR78DxTSU6CHZGBN6scpviN6NFKMmE+JohkYtEFqb81zJA7PV++mLW
	PEIf5nlp6ShcBbiChituZhvo31habQVqwy+pzDtx/EZjbsdm7ZJ/GXoXEWDfPNA7vpO+iDWniZ7E4
	Uy9RCJW3WCLm1Nm+X+bDbNEvG78QGo9glHcs6saf2wYNfZRAkSAxY4gkCcJzD187mSzD3M4LIH/pZ
	/lphKzhKGx9gW9/HY91g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDp1k-0008WH-8l; Tue, 09 Apr 2019 11:34:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp1N-0007xR-LB
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:34:38 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OY-NG; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001cH-PT; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/14] dma: mxs: rename custom flag
Date: Tue,  9 Apr 2019 13:34:20 +0200
Message-Id: <20190409113421.3037-14-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190409_043434_488228_396D7B6D 
X-CRM114-Status: GOOD (  15.86  )
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

The mxs dma driver uses the flags parameter in dmaengine_prep_slave_sg() for
custom flags, but still uses the dmaengine specific names of the flags.
Do a little bit better and at least give the flag a custom name.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/dma/mxs-dma.c                      |  4 ++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++------
 include/linux/dma/mxs-dma.h                |  2 ++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 62ee9328aea1..c622bee7eb12 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -541,7 +541,7 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 		ccw->bits = 0;
 		ccw->bits |= CCW_IRQ;
 		ccw->bits |= CCW_DEC_SEM;
-		if (flags & DMA_CTRL_ACK)
+		if (flags & MXS_DMA_CTRL_WAIT4END)
 			ccw->bits |= CCW_WAIT4END;
 		ccw->bits |= CCW_HALT_ON_TERM;
 		ccw->bits |= CCW_TERM_FLUSH;
@@ -573,7 +573,7 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 				ccw->bits &= ~CCW_CHAIN;
 				ccw->bits |= CCW_IRQ;
 				ccw->bits |= CCW_DEC_SEM;
-				if (flags & DMA_CTRL_ACK)
+				if (flags & MXS_DMA_CTRL_WAIT4END)
 					ccw->bits |= CCW_WAIT4END;
 			}
 		}
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index cf016ec0b1c6..9f648b40197e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -925,7 +925,8 @@ static int gpmi_send_command(struct gpmi_nand_data *this)
 	sg_init_one(sgl, this->cmd_buffer, this->command_length);
 	dma_map_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel,
-				sgl, 1, DMA_MEM_TO_DEV, DMA_CTRL_ACK);
+				sgl, 1, DMA_MEM_TO_DEV,
+				MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
@@ -996,7 +997,8 @@ static int gpmi_send_data(struct gpmi_nand_data *this, const void *buf,
 	/* [2] send DMA request */
 	prepare_data_dma(this, buf, len, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_MEM_TO_DEV, DMA_CTRL_ACK);
+					1, DMA_MEM_TO_DEV,
+					MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
@@ -1033,7 +1035,8 @@ static int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	/* [2] : send DMA request */
 	direct = prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_DEV_TO_MEM, DMA_CTRL_ACK);
+					1, DMA_DEV_TO_MEM,
+					MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
@@ -1083,7 +1086,8 @@ static int gpmi_send_page(struct gpmi_nand_data *this,  dma_addr_t payload,
 	pio[5] = auxiliary;
 
 	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE, DMA_CTRL_ACK);
+				      DMA_TRANS_NONE,
+				      MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
@@ -1140,7 +1144,8 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 	pio[4] = payload;
 	pio[5] = auxiliary;
 	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE, DMA_CTRL_ACK);
+				      DMA_TRANS_NONE,
+				      MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
@@ -1157,7 +1162,7 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 	pio[1] = 0;
 	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
 	desc = mxs_dmaengine_prep_pio(channel, pio, 3, DMA_TRANS_NONE,
-				      DMA_CTRL_ACK);
+				      MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		return -EINVAL;
 
diff --git a/include/linux/dma/mxs-dma.h b/include/linux/dma/mxs-dma.h
index 092b2a7b92ac..4a33f2c8a682 100644
--- a/include/linux/dma/mxs-dma.h
+++ b/include/linux/dma/mxs-dma.h
@@ -4,6 +4,8 @@
 
 #include <linux/dmaengine.h>
 
+#define MXS_DMA_CTRL_WAIT4END	BIT(31)
+
 /*
  * The mxs dmaengine can do PIO transfers. We pass a pointer to the PIO words
  * in the second argument to dmaengine_prep_slave_sg when the direction is
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
