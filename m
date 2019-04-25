Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5445C10F03
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:58:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DD120678
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o72ZbLBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DD120678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X9CDf9We9mzJ0ivCEmf1ttTXy5pB/9cprdxiocpPF4=; b=o72ZbLBWkMP+9G
	D8o/oA/SKmj6HMcu31tukHgfdwVpH4+O94N+vmfRkHMuMpMcSbv8KK+sZxE79FiLaMEqVZfb552nl
	Ty77gVmrXk0GYM/mG0+UBBTTR5iKXAcCmd6JcQlrLNqnswngF6vfc5jUlizMsj68mTWNN1YRzgxum
	unizN/4JHsAvJcJ89hcMs/BT3oEj9KgHFxfIBDRbhTzbhmC8Av6gNGxmvoTtDePnlayrpCx+LVfD+
	LGh3imkRwUuyt1RkCWCUkhhgXMcz+5lk5un146OyMUuAy+tS71zFi7YFTaUEZLurF2w/EaPs4ABJx
	8jj7+frp97zJVpohhjhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJdxi-0008QU-Iy; Thu, 25 Apr 2019 12:58:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJdwA-0006MZ-5R
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 12:57:16 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvk-0002Tg-Ay; Thu, 25 Apr 2019 14:56:48 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvj-0008EP-4Z; Thu, 25 Apr 2019 14:56:47 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/14] mtd: rawnand: gpmi: drop unnecessary flag
Date: Thu, 25 Apr 2019 14:56:40 +0200
Message-Id: <20190425125643.29990-12-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190425_055714_633435_60B8860C 
X-CRM114-Status: GOOD (  12.46  )
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

The DMA_PREP_INTERRUPT flag is no longer needed by the mxs DMA driver,
drop it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 19adc8299490..a6e769afc89a 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -925,8 +925,7 @@ static int gpmi_send_command(struct gpmi_nand_data *this)
 	sg_init_one(sgl, this->cmd_buffer, this->command_length);
 	dma_map_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel,
-				sgl, 1, DMA_MEM_TO_DEV,
-				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+				sgl, 1, DMA_MEM_TO_DEV, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -997,8 +996,7 @@ static int gpmi_send_data(struct gpmi_nand_data *this, const void *buf,
 	/* [2] send DMA request */
 	prepare_data_dma(this, buf, len, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_MEM_TO_DEV,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					1, DMA_MEM_TO_DEV, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -1036,8 +1034,7 @@ static int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	/* [2] : send DMA request */
 	direct = prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_DEV_TO_MEM,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					1, DMA_DEV_TO_MEM, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -1150,7 +1147,7 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
 					ARRAY_SIZE(pio), DMA_TRANS_NONE,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
@@ -1168,8 +1165,7 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
 	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
 	desc = dmaengine_prep_slave_sg(channel,
 				(struct scatterlist *)pio, 3,
-				DMA_TRANS_NONE,
-				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+				DMA_TRANS_NONE, DMA_CTRL_ACK);
 	if (!desc)
 		return -EINVAL;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
