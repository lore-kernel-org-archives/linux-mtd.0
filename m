Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF408C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:41:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E1561242
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73E1561242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJ8S2slNw5nY4NoejkxoGHlPdfm3USgrNrwHTXkAqck=; b=YGHorrOLoJT9Ho
	6Xw8OsJ4H/zPnGKjNeeIALwxla6fJFM3sfSUIwno29PCoCChffxOIXNWZd4i7npOuG1jtKE46ID73
	B+vI42dcNlVFUsF4YGmSRw48ujkQXeH77zihxZ0P39rSOgPuPI09gPaKi9sMZEUhTRa7H7/SIAsnR
	S2RQSqNgiFUjbv2EVjWcFNBlcTSfyTKV+uhZBGFQrvG4TAiymfB6AozwZNQ5FKKQC5t1WyHD8RDzN
	27quzydpVr/tOtOFSJDH7yhwEp76NUZzwd9OdiSfOildbUAeKk8k3yKIaCJUdab5YeYGq/FunQDIl
	x0rTRevqaZRGhCmBfzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4ZI-00Fm7O-0T; Mon, 23 Aug 2021 07:40:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Z7-00Fm3K-Dh
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bW8lM6GBoFl8xsy9TFOTRkQUOIEc4wbj1euLF2HzbwU=; b=S6hjwLRu6s6HuqHxbvrvRxEqyz
 vU6s59azQUnian0aQdPRVSjAAI+wkXN2X1DudRM2rOnGDnQXaeb9QgAfL8waOYAR76vhcpq3K/BE1
 eSrQCKRa2y7h7DTMmW7qDLwTpu60KA1F0XgLaFcpq4OXFr5CBO7qAwjD0lpzj6e5gUTdYU8palMdB
 dwcCzQRW5THkY6xWYHX4JHIYQydOanF14n26nhz+l3a465W3ra/f6DXee/W8lDHFJAPcQAmM4rQPo
 RpkudU2zBGLU7vcczt2bnuYAXtrOYDz3JqVJIZskY9wFfNsKrq6FBI8uefSHPefhPknMbfvIHeXhW
 5NZ7/okA==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Ya-009QvE-CJ; Mon, 23 Aug 2021 07:39:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] mtd_blkdevs: simplify the refcounting in blktrans_{open,
 release}
Date: Mon, 23 Aug 2021 09:33:59 +0200
Message-Id: <20210823073359.705281-9-hch@lst.de>
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

Always grab a reference to the mtd_blktrans_dev in ->open instead of
just on the first open, and do away with the additional temporary
references in ->open and ->release.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 012c0966010a..b8ae1ec14e17 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -36,14 +36,6 @@ static void blktrans_dev_release(struct kref *kref)
 	kfree(dev);
 }
 
-static struct mtd_blktrans_dev *blktrans_dev_get(struct gendisk *disk)
-{
-	struct mtd_blktrans_dev *dev = disk->private_data;
-
-	kref_get(&dev->ref);
-	return dev;
-}
-
 static void blktrans_dev_put(struct mtd_blktrans_dev *dev)
 {
 	kref_put(&dev->ref, blktrans_dev_release);
@@ -191,15 +183,16 @@ static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
 
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
 {
-	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
+	struct mtd_blktrans_dev *dev = bdev->bd_disk->private_data;
 	int ret = 0;
 
+	kref_get(&dev->ref);
+
 	mutex_lock(&dev->lock);
 
 	if (dev->open)
 		goto unlock;
 
-	kref_get(&dev->ref);
 	__module_get(dev->tr->owner);
 
 	if (!dev->mtd)
@@ -219,7 +212,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 unlock:
 	dev->open++;
 	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
 	return ret;
 
 error_release:
@@ -227,7 +219,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		dev->tr->release(dev);
 error_put:
 	module_put(dev->tr->owner);
-	kref_put(&dev->ref, blktrans_dev_release);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
@@ -235,14 +226,13 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 
 static void blktrans_release(struct gendisk *disk, fmode_t mode)
 {
-	struct mtd_blktrans_dev *dev = blktrans_dev_get(disk);
+	struct mtd_blktrans_dev *dev = disk->private_data;
 
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
 		goto unlock;
 
-	kref_put(&dev->ref, blktrans_dev_release);
 	module_put(dev->tr->owner);
 
 	if (dev->mtd) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
