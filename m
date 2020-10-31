Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFEAC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B3E20756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="frZ2vouM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Rd+3N5Ia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B3E20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JnQcdNa/ngXz0GneHo16eYpmuQWo+7nm9M/D5j4oPHc=; b=frZ2vouMsEyGu7mX1pOHsOX80
	H8CKstFRdzLpN5tyGSWSHDwdW6SaOX5QKqH3M0CAKwQ3jXEoVtz/4yV30t6ZHoKdQ/z3H2ofeLsSn
	cJcOuNfbdlN0PawMWifyWZuEJV/Fs53EeyhckZZ0bY3GVOFVNSVWDnUrrupurGFkJYHD6fvEX5m2L
	zM4jQArSvKXFcOuJYJKyGdMnI+3JCv2XqARrDnMIr/quWphSgQcVacUIe0A+gakdLvmlnLQHf5L6/
	5wgxooczmeBaqMAA2WvR5dl/ERkMTTho5X6lm+wjlYf5akkORZZ1HOKNg1vFpLS7YDJYvLUYhSDG/
	SBdZ88juw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmuw-0004F4-TT; Sat, 31 Oct 2020 09:11:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmuv-0004Ep-AS
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=n1Z/lCiMsMQonGTFUuLcLTiErEQJ8QO2u+DEA+xXbLc=; b=Rd+3N5Ia8cdaE5pJ1veh23n0Mj
 xGNz6FMvQIzVDVWVB0bgSHv01IzL6zqRuyd7LyP1NudmAjSRELdvQ9W2Coqw5m3iuaRNoaqMqVHdj
 PZI0qCss7IadOd7SrvFXb44aelC7GEQxFC7kW+xvcyrcZBae1Y5jqohvyeaJlZ3LBs+FPo7pnpCdJ
 hCo2i54Lz4KedxpuBglK2UYock/fx8MuOY+zlYjmsYm4EOcXu8wTP9IZ3MTzxli0qSB9gjSU2QvnJ
 kW7XA+jOFwLpbN30OU9GCrHAM8EXwHWIgKMfxQDmqOSUSBbKiIeF+HHyBHHHsT0myxZKLOoaPobx5
 qulNQhlA==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmut-0007ca-BA; Sat, 31 Oct 2020 09:11:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/11] rbd: implement ->set_read_only to hook into BLKROSET
 processing
Date: Sat, 31 Oct 2020 09:58:04 +0100
Message-Id: <20201031085810.450489-6-hch@lst.de>
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

Implement the ->set_read_only method instead of parsing the actual
ioctl command.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 41 ++++-------------------------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index f84128abade319..37f8fc28004acb 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -692,12 +692,9 @@ static void rbd_release(struct gendisk *disk, fmode_t mode)
 	put_device(&rbd_dev->dev);
 }
 
-static int rbd_ioctl_set_ro(struct rbd_device *rbd_dev, unsigned long arg)
+static int rbd_set_read_only(struct block_device *bdev, bool ro)
 {
-	int ro;
-
-	if (get_user(ro, (int __user *)arg))
-		return -EFAULT;
+	struct rbd_device *rbd_dev = bdev->bd_disk->private_data;
 
 	/*
 	 * Both images mapped read-only and snapshots can't be marked
@@ -706,47 +703,17 @@ static int rbd_ioctl_set_ro(struct rbd_device *rbd_dev, unsigned long arg)
 	if (!ro) {
 		if (rbd_is_ro(rbd_dev))
 			return -EROFS;
-
 		rbd_assert(!rbd_is_snap(rbd_dev));
 	}
 
-	/* Let blkdev_roset() handle it */
-	return -ENOTTY;
-}
-
-static int rbd_ioctl(struct block_device *bdev, fmode_t mode,
-			unsigned int cmd, unsigned long arg)
-{
-	struct rbd_device *rbd_dev = bdev->bd_disk->private_data;
-	int ret;
-
-	switch (cmd) {
-	case BLKROSET:
-		ret = rbd_ioctl_set_ro(rbd_dev, arg);
-		break;
-	default:
-		ret = -ENOTTY;
-	}
-
-	return ret;
-}
-
-#ifdef CONFIG_COMPAT
-static int rbd_compat_ioctl(struct block_device *bdev, fmode_t mode,
-				unsigned int cmd, unsigned long arg)
-{
-	return rbd_ioctl(bdev, mode, cmd, arg);
+	return 0;
 }
-#endif /* CONFIG_COMPAT */
 
 static const struct block_device_operations rbd_bd_ops = {
 	.owner			= THIS_MODULE,
 	.open			= rbd_open,
 	.release		= rbd_release,
-	.ioctl			= rbd_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl		= rbd_compat_ioctl,
-#endif
+	.set_read_only		= rbd_set_read_only,
 };
 
 /*
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
