Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A505CC10F03
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17B820678
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4ldQ5/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17B820678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/vb4Afh6qyCMzUwYEYxoWzBJx93vs7GTi4D400pjXQ=; b=l4ldQ5/94vvt2K
	D/Wrkvh3rrqkzh/4OdNp/oYDT/5JPTOT41EmZJmh1mVyOw2hokssdFFKhhCvu37DHAQXoQ5R6QrD6
	8YQROEgSilsg0KPRuirUGSiEBTEkHEhIZrI6UjZoL725W5UoVp2T6lByk13yoNF84cuDCA5Pmaqvg
	CxcbEVYVrJgl6ecG8y2r0i7oIkr1YZkbuch57dpqDp2jcZ0CHH8TlQrarp72OEyjxYDVm7RzdSJWF
	TmGidGnEt3vg31Hd/DgnHFw4Bj0j7eP23xTZJbBguJk9by4W0fgd76UZ3WiS/BvvQIKbHcT/2LhoC
	K7kpTd4L20nUQo6w73Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJdxy-0000JH-HH; Thu, 25 Apr 2019 12:59:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJdvu-000608-7p
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 12:57:08 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvk-0002Tf-AN; Thu, 25 Apr 2019 14:56:48 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvj-0008EM-3z; Thu, 25 Apr 2019 14:56:47 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/14] dmaengine: mxs: Drop unnecessary flag
Date: Thu, 25 Apr 2019 14:56:39 +0200
Message-Id: <20190425125643.29990-11-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190425_055659_049231_A3A54E68 
X-CRM114-Status: GOOD (  16.27  )
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

The mxs dma driver insists on having the DMA_PREP_INTERRUPT flag set
on all but the first transfer. There's no need to let the user set this
flag, the driver can do it internally whenever it needs it. Drop
handling of this flag from the driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/mxs-dma.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 22cc7f68ef6e..ce92a3626ea4 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -477,16 +477,16 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
  *            ......
  *            ->device_prep_slave_sg(0);
  *            ......
- *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+ *            ->device_prep_slave_sg(DMA_CTRL_ACK);
  *            ......
  *    [3] If there are more than two DMA commands in the DMA chain, the code
  *        should be:
  *            ......
  *            ->device_prep_slave_sg(0);                                // First
  *            ......
- *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT [| DMA_CTRL_ACK]);
+ *            ->device_prep_slave_sg(DMA_CTRL_ACK]);
  *            ......
- *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT | DMA_CTRL_ACK); // Last
+ *            ->device_prep_slave_sg(DMA_CTRL_ACK); // Last
  *            ......
  */
 static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
@@ -500,13 +500,12 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 	struct scatterlist *sg;
 	u32 i, j;
 	u32 *pio;
-	bool append = flags & DMA_PREP_INTERRUPT;
-	int idx = append ? mxs_chan->desc_count : 0;
+	int idx = 0;
 
-	if (mxs_chan->status == DMA_IN_PROGRESS && !append)
-		return NULL;
+	if (mxs_chan->status == DMA_IN_PROGRESS)
+		idx = mxs_chan->desc_count;
 
-	if (sg_len + (append ? idx : 0) > NUM_CCW) {
+	if (sg_len + idx > NUM_CCW) {
 		dev_err(mxs_dma->dma_device.dev,
 				"maximum number of sg exceeded: %d > %d\n",
 				sg_len, NUM_CCW);
@@ -520,7 +519,7 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 	 * If the sg is prepared with append flag set, the sg
 	 * will be appended to the last prepared sg.
 	 */
-	if (append) {
+	if (idx) {
 		BUG_ON(idx < 1);
 		ccw = &mxs_chan->ccw[idx - 1];
 		ccw->next = mxs_chan->ccw_phys + sizeof(*ccw) * idx;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
