Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CEDC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3588521850
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tg9IBBqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3588521850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G606Akpm/XDjuAMX/HCWp6+qYm7fCiCwFE87ybbV2cw=; b=Tg9IBBqEEqH9e8
	QYTaoQF16GCgf5tClHgIdH1yEOmwkG9uCNIP1cFAO3Z8WqgqNhYFzSeJV8t387ie1laxyRJNyEfkD
	eV5e9IKkwrTVosZ3PUiHbbZZeYywKfzdaHI1vawBQ78+5Ic1riPFpWabsE5lzQ6Aqjwxq4UhNJioK
	MLifUQLdXkQ++Ex4T/qGfow5cSYjJmPr/UYCJETPwY+ovcPT0l+hj7jMtvVSN2cptG+noJZLmikyS
	bzVwjLuKy9cKsftA7/m3LUSj9upUTyYbhgUOxhzO/rOQ8pvXcalyE2bDPfqv41O0K4o8LfrgV6oS4
	E8i1JcBlrW727X2cdSMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLlN-0000zx-9K; Fri, 05 Apr 2019 10:07:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlD-0000qA-Q6
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:07:49 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RN-TO; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008Iy-J0; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/10] mtd: rawnand: gpmi: Remove unnecessary variables
Date: Fri,  5 Apr 2019 12:07:35 +0200
Message-Id: <20190405100740.5074-6-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405100740.5074-1-s.hauer@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_030748_005619_CECBB9E6 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

this->page_buffer_virt and this->payload_virt are always set to the same
value, so drop the former and just use the latter. Same for
this->page_buffer_virt and this->payload_virt.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 15 ++++++---------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  2 --
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 86927f02d234..8c6aa8112923 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1637,10 +1637,10 @@ static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
 {
 	struct device *dev = this->dev;
 
-	if (this->page_buffer_virt && virt_addr_valid(this->page_buffer_virt))
+	if (this->payload_virt && virt_addr_valid(this->payload_virt))
 		dma_free_coherent(dev, this->page_buffer_size,
-					this->page_buffer_virt,
-					this->page_buffer_phys);
+					this->payload_virt,
+					this->payload_phys);
 	kfree(this->cmd_buffer);
 	kfree(this->data_buffer_dma);
 	kfree(this->raw_buffer);
@@ -1648,7 +1648,6 @@ static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
 	this->cmd_buffer	= NULL;
 	this->data_buffer_dma	= NULL;
 	this->raw_buffer	= NULL;
-	this->page_buffer_virt	= NULL;
 	this->page_buffer_size	=  0;
 }
 
@@ -1686,9 +1685,9 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	 * auxiliary buffer will appear on a 32-bit boundary.
 	 */
 	this->page_buffer_size = geo->payload_size + geo->auxiliary_size;
-	this->page_buffer_virt = dma_alloc_coherent(dev, this->page_buffer_size,
-					&this->page_buffer_phys, GFP_DMA);
-	if (!this->page_buffer_virt)
+	this->payload_virt = dma_alloc_coherent(dev, this->page_buffer_size,
+					&this->payload_phys, GFP_DMA);
+	if (!this->payload_virt)
 		goto error_alloc;
 
 	this->raw_buffer = kzalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
@@ -1696,8 +1695,6 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 		goto error_alloc;
 
 	/* Slice up the page buffer. */
-	this->payload_virt = this->page_buffer_virt;
-	this->payload_phys = this->page_buffer_phys;
 	this->auxiliary_virt = this->payload_virt + geo->payload_size;
 	this->auxiliary_phys = this->payload_phys + geo->payload_size;
 	return 0;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 5cd54c3a65dc..6f702ab4601f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -138,8 +138,6 @@ struct gpmi_nand_data {
 	struct scatterlist	data_sgl;
 	char			*data_buffer_dma;
 
-	void			*page_buffer_virt;
-	dma_addr_t		page_buffer_phys;
 	unsigned int		page_buffer_size;
 
 	void			*payload_virt;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
