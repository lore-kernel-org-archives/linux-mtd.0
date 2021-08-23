Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0323C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7426121E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C7426121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ixx+B1NplU6zOMkKhSp76Z6CorJpNpDiih0lckO2Lk=; b=kVARO2w1lkJrk6
	Q8xJH97Wsb7c4TME6pLJCYGB3QP8jypkiKfP0EPE5KXh06tS/0GBZrl12vHuCmJINGx4AMbhdkM6c
	EMkHBFAbTYXZfXtmyqTB0PNV8tydnt9K6btfex0nxa9PXRsGM4IzFb5HjcWIyuZXcAgBieXxXFsQ2
	rqw4swVlJuRijRj3tEid5U1Zx5d08c2jTSDpVhAcanC8aD4x3PtGvP9I+nqQA6Hm4nwOTsuu9Lpmq
	8GlECpvpBDjOIt5BsjxGrr1z79XKb17Z9Wu+IVC8rD7oltzN94oKdBOZf+3cyEtCvA4AStmHoQo/T
	BOrUJXuVxJYAD/Mtd0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4Ye-00Flsj-2k; Mon, 23 Aug 2021 07:39:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Ya-00Flr3-Kd
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TQvwYGDey7Tixxdk2ARcuyF6ump6jRrEEFzPTGwcYTI=; b=jJiTrbwJnRsaDZUS8K7f13JXht
 R1VYiaS3de/jJDmlOWt5XJcTTcDcohEdat5Cjtw9a23Yb/H2ovduTqZl8qKHvTklNiOEJz8s9Wg9O
 YXrkCMo0kJ21Yhzwhwla1MN7V9yvwzRphdSJekBvzSnrADQ34hVbO+3vBUAwllkLPbtEOb2QDlrAH
 QyXcoOJ+UiL9O99Ist5MINOy3FKZm8lABAh+7XSi1yzlfdMTPOCeJVQih7v39mExbQpHcLxxquimD
 +ouaR4ektXNdZG4vB/+1j/+hTAFvWdWf4/FBxp5DZvr1FSCxfZBLCGyIwcR31xttN9yLKaNwbqs1S
 7AthodOA==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Xw-009QuJ-Sl; Mon, 23 Aug 2021 07:39:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 7/8] mtd_blkdevs: simplify blktrans_getgeo
Date: Mon, 23 Aug 2021 09:33:58 +0200
Message-Id: <20210823073359.705281-8-hch@lst.de>
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

No need to grab a mtd_blktrans_dev given that ->open already holds one
and ->getgeo can only be called on an open disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 6f226b7cbb5c..012c0966010a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -257,7 +257,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 
 static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 {
-	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
+	struct mtd_blktrans_dev *dev = bdev->bd_disk->private_data;
 	int ret = -ENXIO;
 
 	mutex_lock(&dev->lock);
@@ -268,7 +268,6 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENOTTY;
 unlock:
 	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
 	return ret;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
