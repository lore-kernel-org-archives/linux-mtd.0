Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C181C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7C120756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MReFe007";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OAKSzvXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7C120756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fthodkOMJqFOuR1UMCQ+LcuOotuWyZd6IEXiEuxmzFw=; b=MReFe007K9hZ0Nr38QLMTFEKR
	Q29BSlbcjE1kqnZ+N2CtVqH5ozSLgupbX+5uYiw3Nt1gAL3pJVZKCXT/p46/3Bb74lhHnU+OvRTv1
	98PF1q5V8ysyjhm3VFf2ES6x9qP/nPdjne+NLMZ5qKHLVXzMRPzifcGyfWxRI5Dz9vvlQvnCltywr
	sky+WDUsFwlwyoW+MF6aRbATewIjCNHiw4SZpSoQi8Wi7WQuIemu16IpaWb81ztL6AtO2JaYs/Cjq
	/pZrS5qqFLMMkYuG8K5t/dSh1BESnJmXyNNTP+2x7vGYtrmnjhtQQizmDFZX7bf6pZXb9HeV2S6G9
	i0LzvC08A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmx5-0004YI-CA; Sat, 31 Oct 2020 09:13:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmx3-0004Xi-42
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=T4/2E4hHl2bV3QYU66vd1sTpw1p+o0kbPKiW51leCy0=; b=OAKSzvXDWNnbRc37WQsJtXnRKX
 QPDujXztENAqD26VipEGJrxLb013rE4wrMVMRy6YnZCgzLiKGIJmLa3aI2dSA7Am1oMbVxEwlu71p
 Ro1x80eO77sHvmQ0AWTuJRYuSzwdvHGuAXFnUOqVUfMZTtBEbVp4fQY5Df8cfUI5BJ4RgeApMXPuS
 cKpPDkiudLYwtWPx4aNcV6/fuawRpcXRy895P5CNeKToAfdjvHqyCNFF/KrsWKbVtgYHVMXFrrNR2
 KkmqVJsKSEhdBGQAkeIgCvX3afYRhce8CNmnQBrdHKps+PWfArXz91tj8OQd2NjVGUMkhqostEBGT
 PVZIWxRA==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmx0-0007k0-Gm; Sat, 31 Oct 2020 09:13:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/11] md: implement ->set_read_only to hook into BLKROSET
 processing
Date: Sat, 31 Oct 2020 09:58:05 +0100
Message-Id: <20201031085810.450489-7-hch@lst.de>
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
 drivers/md/md.c | 62 ++++++++++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 98bac4f304ae26..8c027b81b78c0d 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7480,7 +7480,6 @@ static inline bool md_ioctl_valid(unsigned int cmd)
 {
 	switch (cmd) {
 	case ADD_NEW_DISK:
-	case BLKROSET:
 	case GET_ARRAY_INFO:
 	case GET_BITMAP_FILE:
 	case GET_DISK_INFO:
@@ -7507,7 +7506,6 @@ static int md_ioctl(struct block_device *bdev, fmode_t mode,
 	int err = 0;
 	void __user *argp = (void __user *)arg;
 	struct mddev *mddev = NULL;
-	int ro;
 	bool did_set_md_closing = false;
 
 	if (!md_ioctl_valid(cmd))
@@ -7687,35 +7685,6 @@ static int md_ioctl(struct block_device *bdev, fmode_t mode,
 			goto unlock;
 		}
 		break;
-
-	case BLKROSET:
-		if (get_user(ro, (int __user *)(arg))) {
-			err = -EFAULT;
-			goto unlock;
-		}
-		err = -EINVAL;
-
-		/* if the bdev is going readonly the value of mddev->ro
-		 * does not matter, no writes are coming
-		 */
-		if (ro)
-			goto unlock;
-
-		/* are we are already prepared for writes? */
-		if (mddev->ro != 1)
-			goto unlock;
-
-		/* transitioning to readauto need only happen for
-		 * arrays that call md_write_start
-		 */
-		if (mddev->pers) {
-			err = restart_array(mddev);
-			if (err == 0) {
-				mddev->ro = 2;
-				set_disk_ro(mddev->gendisk, 0);
-			}
-		}
-		goto unlock;
 	}
 
 	/*
@@ -7809,6 +7778,36 @@ static int md_compat_ioctl(struct block_device *bdev, fmode_t mode,
 }
 #endif /* CONFIG_COMPAT */
 
+static int md_set_read_only(struct block_device *bdev, bool ro)
+{
+	struct mddev *mddev = bdev->bd_disk->private_data;
+	int err;
+
+	err = mddev_lock(mddev);
+	if (err)
+		return err;
+
+	if (!mddev->raid_disks && !mddev->external) {
+		err = -ENODEV;
+		goto out_unlock;
+	}
+
+	/*
+	 * Transitioning to readauto need only happen for arrays that call
+	 * md_write_start and which are not ready for writes yet.
+	 */
+	if (!ro && mddev->ro == 1 && mddev->pers) {
+		err = restart_array(mddev);
+		if (err)
+			goto out_unlock;
+		mddev->ro = 2;
+	}
+
+out_unlock:
+	mddev_unlock(mddev);
+	return err;
+}
+
 static int md_open(struct block_device *bdev, fmode_t mode)
 {
 	/*
@@ -7886,6 +7885,7 @@ const struct block_device_operations md_fops =
 #endif
 	.getgeo		= md_getgeo,
 	.check_events	= md_check_events,
+	.set_read_only	= md_set_read_only,
 };
 
 static int md_thread(void *arg)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
