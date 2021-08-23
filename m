Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EFFC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25ADF61242
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25ADF61242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MhQwrZIM+i1ULKKOi8dPmrowyBs0n9xJOi52602XBs=; b=xED+mx5LCqeZnq
	L8q3NPrC/Z0Ve8OreFp1EBW08vTtLe6Bx7zE+MKruihzgdyUCxh3kT+Xs28W79LGvJQH36Cie81tx
	rqEGXjsnFibSBwz8p6kruKVHcR41QATK1U48VHTbqYbA6OHZwug59NdDI3SUAWM22txZS2DJzQJXW
	WK7wjTsUAkLaxQBhTvBCn4UQcTmveDlIHnC5j3WvWWf/VfwBrbckiLoLt3iLo5sfPgjYT6H6NONQL
	UXv4jaOOkp4F43zSZfumnHgyXBPXmm/f7M0DDHkK4J1hk/bVZzbGHDZ6tEN8jrntTKF+zd1mrX5oA
	NjQZIAkhcNNmp0YLvMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4X2-00FlGL-90; Mon, 23 Aug 2021 07:38:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4X0-00FlF7-Ag
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yd1fP43x95zGCQR2SB7HQ/+6WrBHniI28nlCdjF+Hh0=; b=p+9hu4m/irFAS2rPiD+rwi1Vlt
 sKT2qkmJ+DEhTCdMWt82BrIypbbfNlFKm+uIM2zAx8KvQc8mQ9U5L9n6cu8FSADZISCgXFtKDCpki
 ei+G1dfrC3iLUsuqy/B1pKrSXMtO0nQ7UpjqM/MaSTH4XiMIRvWpm1ThJalRnF8ir+382964+tRDu
 BtrLdsmV8B+lcW3nOHHpTpAW/o7CqC2knA2IM8ADHs6H6NHTq5F/58hn5+8pLE2g9vok/8OEy04rg
 bgvA1NU1TEHwcJAYtKriPeXf+2Xvw7KaZ0AR/eOVKAgpDYlUwoZm6acP+I+AIZxsysvN4+6SRvr7M
 Ny/J9HdA==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4WT-009Qr2-5D; Mon, 23 Aug 2021 07:37:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 5/8] mtd_blkdevs: simplify blktrans_dev_get
Date: Mon, 23 Aug 2021 09:33:56 +0200
Message-Id: <20210823073359.705281-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

->private_data is set before the disk is added and never cleared, so don't
bother trying to handle a NULL pointer there.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 81f0ce2a0b5a..f5e13b919614 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -39,16 +39,12 @@ static void blktrans_dev_release(struct kref *kref)
 
 static struct mtd_blktrans_dev *blktrans_dev_get(struct gendisk *disk)
 {
-	struct mtd_blktrans_dev *dev;
+	struct mtd_blktrans_dev *dev = disk->private_data;
 
 	mutex_lock(&blktrans_ref_mutex);
-	dev = disk->private_data;
-
-	if (!dev)
-		goto unlock;
 	kref_get(&dev->ref);
-unlock:
 	mutex_unlock(&blktrans_ref_mutex);
+
 	return dev;
 }
 
@@ -204,9 +200,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
 	int ret = 0;
 
-	if (!dev)
-		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
-
 	mutex_lock(&dev->lock);
 
 	if (dev->open)
@@ -250,9 +243,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(disk);
 
-	if (!dev)
-		return;
-
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -276,9 +266,6 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
 	int ret = -ENXIO;
 
-	if (!dev)
-		return ret;
-
 	mutex_lock(&dev->lock);
 
 	if (!dev->mtd)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
