Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F66DC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RNN3e07M6LMA5XFUb+vNQuvdJr+enHG86V9YdsHAuU=; b=U10mJDCECO4jbw
	rlE/jh6I/Ra+JWz4xWTFSpq98I9YAFwz4lztQZZtFAaXDlRTQuNxHy68fPXyBRvQ8pajm1WcYDC8I
	e6Y6eJIpZyyfPLF3CjOY5VoGm/tMSjmyJ5CSDR1/jWjfl1Tlw34l5nCVFdhju8oZ3DlDNiRlvvp0S
	ipcxY69bqFWDR6C5rhz71gi9eoSFCYg/oX4YpWsmZB298jRAaO2GJVAyBoQG6rW0NOcveIUmIfMj+
	8DrTTOBfiLIbXKLLHcfjNYbaJfn/BLP77opZNmOHh9zs17YAlyo4ISAmVdKtU2Ry6y+pYv3WUhhlb
	MgaQrStiBlW5tXK93HtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RoY-00ALKQ-2m;
	Tue, 23 May 2023 13:12:34 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RoW-00ALGG-11
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 13:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684847552;
  x=1716383552;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=OfLmz9ckLWnjOPs/nZyBCIbifQUUmP+cRC2xReLIuEM=;
  b=Drw+sgoW3W/d1Yc/SHwqdzrScgMPrVUPUGWJtRZDjieGopdjYAM6yz9+
   jgl+LJ4TiP230wecDiwwPofM1fdAn7fPasgS958JLHfaKgJKclEvJ1Z6N
   JmDiqkhPDg4VVUa0BfJueaFXNPNIuF+wwx/kyRy0YNwU4QOO90DW4wPle
   LAHFTU2ds/mZv1vqkFB7M7yKtk1E/dVonGNWWi/14GbQ9MzsVtrg58A7J
   BQVJJy0StQ6jPGTJ1b1q3zlgmwvTKnZrLEcwd+6WHI2k4Die0bzXWDgXK
   PyNzfxbhNCeJ+W59xKYklsjjCjQuQukNCpUreOwBWKkJhMimOKobfSIpQ
   g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Tue, 23 May 2023 15:12:17 +0200
Subject: [PATCH 2/2] ubi: block: Fix deadlock on remove
MIME-Version: 1.0
Message-ID: <20230523-ubiblock-remove-v1-2-240bed75849b@axis.com>
References: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
In-Reply-To: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_061232_666515_31121732 
X-CRM114-Status: GOOD (  13.27  )
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

Lockdep warns about possible circular locking when the following
commands are run:

 ubiblock --create /dev/ubi0_0
 head -c1 /dev/ubiblock0_0 > /dev/null
 ubiblock --remove /dev/ubi0_0

 ======================================================
 WARNING: possible circular locking dependency detected

 ubiblock/364 is trying to acquire lock:
 (&disk->open_mutex){+.+.}-{3:3}, at: del_gendisk (block/genhd.c:616)

 but task is already holding lock:
 (&dev->dev_mutex){+.+.}-{3:3}, at: ubiblock_remove (drivers/mtd/ubi/block.c:476)

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #1 (&dev->dev_mutex){+.+.}-{3:3}:
   ubiblock_open (drivers/mtd/ubi/block.c:236)
   blkdev_get_whole (block/bdev.c:607)
   blkdev_get_by_dev (block/bdev.c:756)
   blkdev_open (block/fops.c:493)
   ...
   do_sys_openat2 (fs/open.c:1356)

 -> #0 (&disk->open_mutex){+.+.}-{3:3}:
   del_gendisk (block/genhd.c:616)
   ubiblock_remove (drivers/mtd/ubi/block.c:456 drivers/mtd/ubi/block.c:483)
   vol_cdev_ioctl
   ...

 other info that might help us debug this:

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&dev->dev_mutex);
                                lock(&disk->open_mutex);
                                lock(&dev->dev_mutex);
   lock(&disk->open_mutex);

 *** DEADLOCK ***

 Call Trace:
 del_gendisk (block/genhd.c:616)
 ubiblock_remove (drivers/mtd/ubi/block.c:456 drivers/mtd/ubi/block.c:483)
 vol_cdev_ioctl
 ...

The actual deadlock is also easily reproducible by running the above
commands in parallel in a loop.

Fix this by marking the device as going away and releasing the dev mutex
before del_gendisk().  This is similar to other drivers such as
drivers/block/zram/zram_drv.c.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/ubi/block.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 70caec4606cd..fcfea7cfdb6b 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -83,6 +83,8 @@ struct ubiblock {
 	struct mutex dev_mutex;
 	struct list_head list;
 	struct blk_mq_tag_set tag_set;
+
+	bool removing;
 };
 
 /* Linked list of all ubiblock instances */
@@ -233,6 +235,11 @@ static int ubiblock_open(struct block_device *bdev, fmode_t mode)
 	int ret;
 
 	mutex_lock(&dev->dev_mutex);
+	if (dev->removing) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+
 	if (dev->refcnt > 0) {
 		/*
 		 * The volume is already open, just increase the reference
@@ -480,8 +487,15 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 
 	/* Remove from device list */
 	list_del(&dev->list);
-	ubiblock_cleanup(dev);
+
+	/*
+	 * Prevent further opens.  del_gendisk() will ensure that there are no
+	 * parallel openers.
+	 */
+	dev->removing = true;
 	mutex_unlock(&dev->dev_mutex);
+
+	ubiblock_cleanup(dev);
 	mutex_unlock(&devices_mutex);
 
 	kfree(dev);

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
