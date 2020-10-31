Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74233C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:03:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A8520756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlvWxXt0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IXCjpCSb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A8520756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cqiSidX1lhTyn9HGZgOaTpiqWTtZ0igxunRnVXPtOAs=; b=RlvWxXt0IFt7TipRmoYsW1ucd
	IhefNR1hi69l3VIWNb5yhwcyOaeyVaHatM3Gxx4pCePYJZnyR58R1GMomy+WzGNo3C+nn19x4EaDG
	0iCSu/Jt1ZhIp7MpFzZRLbzifO0Pd2AwUgfFldd3B6xPG4bsO1xiOFYERvoEvy8QSlwkBq1MfQz1h
	46TSJNvRizuzCWrKQgIS+v/2A/yPDnGjbEIokM+QoP5LBI6U5kYbJZDl1BZIV3AV4QXu8YnqpHVRJ
	dqK5Qq4w7TpjD9N4+A1v0uK8DvnM6zkeTf+DunGbbabObs9rTqUjfwQLX9pGrsosPPVV7Htqx9UdN
	GoDBB6ESA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmmT-0002y7-8A; Sat, 31 Oct 2020 09:02:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmmR-0002xv-4x
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=hHOl61qo6rBfBiBYCMvJ6RFdITg0MzJ2jIHmO3/tMTY=; b=IXCjpCSbArfkkVwV/sbws2MJLR
 1KEv2An+Ui8D2gZSuwsJm5zTmBx5/Jdg0oLouZz2dmaigA2EXqzLpcGbkyaCGTasjmBVMX8Bzmz8b
 HMJEZti/1o2EDvlpPXIvAVUGIqZovHUdWXmkaOdmxGZIridagqgR+n/GKNMSFlCyUjq/wJN+ZB5Qr
 PlCvm7jXxyYhw2CDp2mAzDgYwwqO2w/NCBqafjG0ke4C7Q1oVH7Kb1+bzlLF6mBeUsU0ht7XH7Mla
 q/zVw/CxLXFMwD9QR0d9GvnEeO9wXKIDplPh+2MKT7BAL8eG8psTAhle2YGupi5iCFIFlyxf+/D5l
 D83PKzNg==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmmO-0006zD-Vo; Sat, 31 Oct 2020 09:02:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/11] mtd_blkdevs: don't override BLKFLSBUF
Date: Sat, 31 Oct 2020 09:58:00 +0100
Message-Id: <20201031085810.450489-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031085810.450489-1-hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

BLKFLSBUF does not actually send a flush command to the device, but
teard down buffer cache structures.  Remove the mtd_blkdevs
implementation and just use the default semantics instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 0c05f77f9b216e..fb8e12d590a13a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -298,38 +298,10 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return ret;
 }
 
-static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
-			      unsigned int cmd, unsigned long arg)
-{
-	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
-	int ret = -ENXIO;
-
-	if (!dev)
-		return ret;
-
-	mutex_lock(&dev->lock);
-
-	if (!dev->mtd)
-		goto unlock;
-
-	switch (cmd) {
-	case BLKFLSBUF:
-		ret = dev->tr->flush ? dev->tr->flush(dev) : 0;
-		break;
-	default:
-		ret = -ENOTTY;
-	}
-unlock:
-	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
-	return ret;
-}
-
 static const struct block_device_operations mtd_block_ops = {
 	.owner		= THIS_MODULE,
 	.open		= blktrans_open,
 	.release	= blktrans_release,
-	.ioctl		= blktrans_ioctl,
 	.getgeo		= blktrans_getgeo,
 };
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
