Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A146AC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:16:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1C520756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DU4v0yv4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hU/6PlVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1C520756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FoSlXyZL+Mz2WkiFUPUFdb6GS91HRtMJ9Rpz97nvEMA=; b=DU4v0yv4sqkklhThaLwq3hj5e
	5qupUHxpeObcciN+uVr7qX58/tGs1VNa5LQQJcRrLHIs1yIt3jt92XjcB8F++3dzmJrEKteQKDT7q
	8+g1Mpz1AolrJLwMekVkTXT69Z5shanAWnYKcelOH7E0zFqsFeVTZZAcPnhHa1nj2+To9fN8TPcFq
	3zPnSY/DVVuJT2kEypZHwjrsTQ9kFVvl0Ol0I2u4MjZE8s7jdRNJfJd5gkQrgogfxbNXEu0GSg276
	Im0KKix22ighIVtCc/UD/11hVS1x++bs6b1eyvFZH2j7UzcDeBRgsKg3/jhT+PHsiR80dbT+eduJU
	1GC1ZwG9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmzD-0004qt-3E; Sat, 31 Oct 2020 09:15:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmzB-0004qd-0t
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Varo6jriPIgUuzbDsXbdYpkIn84a9RY13C55YdYZcpg=; b=hU/6PlVtHDu0bc6LjVRh/YPJZV
 UAeoEt1wg2PmA8HVcqX7SO21uFlwlySHaURvfs34FtbCFuaF0PP8Xzy9ahakZYm6aKg4YVwsraGJj
 f3EhuP+iEXG+RiFiQR3SKMGilTU++hMISyBJ69KNbfCrk75iiIzsT4dRQun2UvIZquXQXFW5db4Ax
 2K4vfXkHstczwZaO6TU+rNSsUKsHftKBuSWQ5Del6cMLxotOABz5EQ7Oc/WupY6y1CienMWHaQfie
 l6Lb6Z8Q7cnfOKikc/qOW1I1L8rTm7UI4Jws/6JPUIv7Jrcs3+t0mC+lVJfTIruRCUU7g2K2JO98Z
 3A9m4u9Q==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmz9-0007u2-I0; Sat, 31 Oct 2020 09:15:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/11] dasd: implement ->set_read_only to hook into BLKROSET
 processing
Date: Sat, 31 Oct 2020 09:58:06 +0100
Message-Id: <20201031085810.450489-8-hch@lst.de>
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
 drivers/s390/block/dasd.c       |  1 +
 drivers/s390/block/dasd_int.h   |  3 ++-
 drivers/s390/block/dasd_ioctl.c | 27 +++++++++------------------
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index eb17fea8075c6f..db24e04ee9781e 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -3394,6 +3394,7 @@ dasd_device_operations = {
 	.ioctl		= dasd_ioctl,
 	.compat_ioctl	= dasd_ioctl,
 	.getgeo		= dasd_getgeo,
+	.set_read_only	= dasd_set_read_only,
 };
 
 /*******************************************************************************
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index fa552f9f166671..c59a0d63b506e6 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -844,7 +844,8 @@ int dasd_scan_partitions(struct dasd_block *);
 void dasd_destroy_partitions(struct dasd_block *);
 
 /* externals in dasd_ioctl.c */
-int  dasd_ioctl(struct block_device *, fmode_t, unsigned int, unsigned long);
+int dasd_ioctl(struct block_device *, fmode_t, unsigned int, unsigned long);
+int dasd_set_read_only(struct block_device *bdev, bool ro);
 
 /* externals in dasd_proc.c */
 int dasd_proc_init(void);
diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
index cb6427fb9f3d16..3359559517bfcf 100644
--- a/drivers/s390/block/dasd_ioctl.c
+++ b/drivers/s390/block/dasd_ioctl.c
@@ -532,28 +532,22 @@ static int dasd_ioctl_information(struct dasd_block *block, void __user *argp,
 /*
  * Set read only
  */
-static int
-dasd_ioctl_set_ro(struct block_device *bdev, void __user *argp)
+int dasd_set_read_only(struct block_device *bdev, bool ro)
 {
 	struct dasd_device *base;
-	int intval, rc;
+	int rc;
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EACCES;
+	/* do not manipulate hardware state for partitions */
 	if (bdev_is_partition(bdev))
-		// ro setting is not allowed for partitions
-		return -EINVAL;
-	if (get_user(intval, (int __user *)argp))
-		return -EFAULT;
+		return 0;
+
 	base = dasd_device_from_gendisk(bdev->bd_disk);
 	if (!base)
 		return -ENODEV;
-	if (!intval && test_bit(DASD_FLAG_DEVICE_RO, &base->flags)) {
-		dasd_put_device(base);
-		return -EROFS;
-	}
-	set_disk_ro(bdev->bd_disk, intval);
-	rc = dasd_set_feature(base->cdev, DASD_FEATURE_READONLY, intval);
+	if (!ro && test_bit(DASD_FLAG_DEVICE_RO, &base->flags))
+		rc = -EROFS;
+	else
+		rc = dasd_set_feature(base->cdev, DASD_FEATURE_READONLY, ro);
 	dasd_put_device(base);
 	return rc;
 }
@@ -633,9 +627,6 @@ int dasd_ioctl(struct block_device *bdev, fmode_t mode,
 	case BIODASDPRRST:
 		rc = dasd_ioctl_reset_profile(block);
 		break;
-	case BLKROSET:
-		rc = dasd_ioctl_set_ro(bdev, argp);
-		break;
 	case DASDAPIVER:
 		rc = dasd_ioctl_api_version(argp);
 		break;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
