Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DC9C87FE4
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vukjqNZ5WctqzA4tmde2zkfMYyIS4aBb0y/eo6G5CXc=; b=NPSSIJ+w1PyuLg
	LhWEHnH9loVDgO7admhuDR6dmg0PeEg8ubi7lFSQdml7JeOgW2VCJ2HcvlR3uoGKHd8XPKMZF6LNR
	sszZHq6X9FNrCggSrm+l3y9Vka6qQtqSP0lrTCIIlvBwIMjr4+QZxrUyF76Jk0vRmiV1uTPmqeRMn
	Cp/teZIKUziY0GtY8tLIiCP9V2627MwjLHqoazn0h0UHUTnWA2rlXREzaMsK9FwNn4pUWa3314zVW
	GPsF1PdHVTX+DWRkh7eaZbDrSXKpBRXAqDynv4jz29Gf8GygZ7UW2iUma8haPUzrWh2F/6naTHef2
	Fd6gM19usolcZHrNMerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjG-009HTc-0U;
	Tue, 23 May 2023 07:46:46 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjA-009HLC-0s;
	Tue, 23 May 2023 07:46:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 22/24] mtd: block2mtd: factor the early block device open logic into a helper
Date: Tue, 23 May 2023 09:45:33 +0200
Message-Id: <20230523074535.249802-23-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
MIME-Version: 1.0
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

Simply add_device a bit by splitting out the cumbersome early boot logic
into a separate helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/devices/block2mtd.c | 53 +++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 4c21e9f13bead5..182eed68c75634 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -215,34 +215,18 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 	kfree(dev);
 }
 
-
-static struct block2mtd_dev *add_device(char *devname, int erase_size,
-		char *label, int timeout)
+static struct block_device *mdtblock_early_get_bdev(const char *devname,
+		fmode_t mode, int timeout, struct block2mtd_dev *dev)
 {
+	struct block_device *bdev = ERR_PTR(-ENODEV);
 #ifndef MODULE
 	int i;
-#endif
-	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
-	struct block_device *bdev;
-	struct block2mtd_dev *dev;
-	char *name;
-
-	if (!devname)
-		return NULL;
-
-	dev = kzalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
-	if (!dev)
-		return NULL;
 
-	/* Get a handle on the device */
-	bdev = blkdev_get_by_path(devname, mode, dev);
-
-#ifndef MODULE
 	/*
 	 * We might not have the root device mounted at this point.
 	 * Try to resolve the device name by other means.
 	 */
-	for (i = 0; IS_ERR(bdev) && i <= timeout; i++) {
+	for (i = 0; i <= timeout; i++) {
 		dev_t devt;
 
 		if (i)
@@ -254,12 +238,35 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 			msleep(1000);
 		wait_for_device_probe();
 
-		if (early_lookup_bdev(devname, &devt))
-			continue;
-		bdev = blkdev_get_by_dev(devt, mode, dev);
+		if (!early_lookup_bdev(devname, &devt)) {
+			bdev = blkdev_get_by_dev(devt, mode, dev);
+			if (!IS_ERR(bdev))
+				break;
+		}
 	}
 #endif
+	return bdev;
+}
+
+static struct block2mtd_dev *add_device(char *devname, int erase_size,
+		char *label, int timeout)
+{
+	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
+	struct block_device *bdev;
+	struct block2mtd_dev *dev;
+	char *name;
 
+	if (!devname)
+		return NULL;
+
+	dev = kzalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
+	if (!dev)
+		return NULL;
+
+	/* Get a handle on the device */
+	bdev = blkdev_get_by_path(devname, mode, dev);
+	if (IS_ERR(bdev))
+		bdev = mdtblock_early_get_bdev(devname, mode, timeout, dev);
 	if (IS_ERR(bdev)) {
 		pr_err("error: cannot open device %s\n", devname);
 		goto err_free_block2mtd;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
