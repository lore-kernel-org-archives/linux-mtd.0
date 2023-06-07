Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2522FC7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQ1kHYocJYKvTwMeBbFPdTwtyFcsQZ+cvpmAmBcs+Gc=; b=MX0WW393u2Flw8
	ZcYgeq8k583M6hrACY+SDGE50ybSL8/JZg6CYwcFjDMcDtj4roW18N2ZWDSbWRwLKVj9Uv+57KKRR
	MGVXA7BMWvsBEaN83H+u7TR+6BO2u6OeByrAUEyPimLxtXBpcUHOs6qSBaWp42ZzoCTKPtXj0ZsSU
	UI0yFu+F1rrVrDsvkXd3FuDEW2YBXwAqXhCp4GVZURcaH2Wi5y5FrmM9ZSNq7A4ey4BMuZokvLRQa
	q0QV662+ch0NJzv23q9dbgUUd68zItLzz4iqF376OwoAgY1mj69nqYbU4Q5eg0YouAh3p7VKOsDqq
	cowOWmp+Qh0Dj6qzsgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pQ2-005EU5-0L;
	Wed, 07 Jun 2023 09:25:30 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pPy-005EQS-30
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 09:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686129927;
  x=1717665927;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=+hz7OrzMbUMcAoXtMSvTQCl5KtJyw3Bih09dQpX7TTs=;
  b=KIemTgpJFVeI6Xq7xhPviiBo/MuV5tDw6Hv9dlspiXzizFh/HHpcZ6Hx
   9L6hBUqfiI8vyOyyuvLyRuhHEQnUs/MpO0bBnJJEnW0hHWmdJZPftrtcM
   yAVhsNJlPAGP0iJg0fOnjcIXNkomM/DmiIgKSNspWHm1qa3IUgcTxikb0
   rCGHt1Rn2chXaMAydOxGHIQb8DGMqiz+4I+fONQfi5p82kFexwyeHJc0c
   Bjc2zByUmX9xrzDafgJvfsbckoOSyjn/tGa37M1j8uGvjMM1zEbQvNqh1
   LwRJgY1ow8sQiIm9xAdbzqP+xfB4s5WFCQCoCleAuWRBLKlxrbZewNykt
   Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Wed, 7 Jun 2023 11:25:06 +0200
Subject: [PATCH v2] ubi: block: Fix cleanup handling
MIME-Version: 1.0
Message-ID: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
X-B4-Tracking: v=1; b=H4sIAPFMgGQC/3WNyw6CMBBFf4V0bU0pD9GV/2FYdMpUJkrHtNpgC
 P9uYe/y3JuTs4iIgTCKS7GIgIkisc+gD4Wwo/F3lDRkFlrpSjW6kh8geLJ9yIATJ5RooC2ta7v
 KKZEtMBElBOPtuHmOGUzQ2/MK6GjeW7c+80jxzeG7p1O5rf8rqZRK6loBDqemq89wNTPFo+VJ9
 Ou6/gBYruakxwAAAA==
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <hch@infradead.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>, Vincent Whitchurch
	<vincent.whitchurch@axis.com>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_022527_444355_FD6934BE 
X-CRM114-Status: GOOD (  11.23  )
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

ubiblock's remove handling has a couple of problems:

 - It uses the gendisk after put_disk(), resulting in a use-after-free.

 - There is a circular locking dependency between disk->open_mutex (used
   from del_gendisk() and blkdev_open()) and dev->dev_mutex (used from
   ubiblock_open() and ubiblock_remove()).

Fix these by implementing ->free_disk() and moving the final cleanup
there.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
Changes in v2:
- Combine and rework patches to implement and use ->free_disk().
- Link to v1: https://lore.kernel.org/r/20230523-ubiblock-remove-v1-0-240bed75849b@axis.com
---
 drivers/mtd/ubi/block.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 3711d7f74600..570e660673ad 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -293,11 +293,23 @@ static int ubiblock_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return 0;
 }
 
+static void ubiblock_free_disk(struct gendisk *disk)
+{
+	struct ubiblock *dev = disk->private_data;
+
+	mutex_lock(&devices_mutex);
+	idr_remove(&ubiblock_minor_idr, disk->first_minor);
+	mutex_unlock(&devices_mutex);
+
+	kfree(dev);
+}
+
 static const struct block_device_operations ubiblock_ops = {
 	.owner = THIS_MODULE,
 	.open = ubiblock_open,
 	.release = ubiblock_release,
 	.getgeo	= ubiblock_getgeo,
+	.free_disk = ubiblock_free_disk,
 };
 
 static blk_status_t ubiblock_queue_rq(struct blk_mq_hw_ctx *hctx,
@@ -452,9 +464,8 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	del_gendisk(dev->gd);
 	/* Finally destroy the blk queue */
 	dev_info(disk_to_dev(dev->gd), "released");
-	put_disk(dev->gd);
 	blk_mq_free_tag_set(&dev->tag_set);
-	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
+	put_disk(dev->gd);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)
@@ -478,11 +489,11 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 
 	/* Remove from device list */
 	list_del(&dev->list);
-	ubiblock_cleanup(dev);
 	mutex_unlock(&dev->dev_mutex);
 	mutex_unlock(&devices_mutex);
 
-	kfree(dev);
+	ubiblock_cleanup(dev);
+
 	return 0;
 
 out_unlock_dev:
@@ -623,17 +634,19 @@ static void ubiblock_remove_all(void)
 {
 	struct ubiblock *next;
 	struct ubiblock *dev;
+	LIST_HEAD(list);
 
 	mutex_lock(&devices_mutex);
-	list_for_each_entry_safe(dev, next, &ubiblock_devices, list) {
+	list_splice_init(&ubiblock_devices, &list);
+	mutex_unlock(&devices_mutex);
+
+	list_for_each_entry_safe(dev, next, &list, list) {
 		/* The module is being forcefully removed */
 		WARN_ON(dev->desc);
 		/* Remove from device list */
 		list_del(&dev->list);
 		ubiblock_cleanup(dev);
-		kfree(dev);
 	}
-	mutex_unlock(&devices_mutex);
 }
 
 int __init ubiblock_init(void)

---
base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
change-id: 20230523-ubiblock-remove-eab61cf683f0

Best regards,
-- 
Vincent Whitchurch <vincent.whitchurch@axis.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
