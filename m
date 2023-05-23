Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6609FC7EE32
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmsZ+WA9JNys+YhjkrKr/mG0WHwhXeV/hldnLWMJwEQ=; b=d6qvf+2LnmwjfY
	XVmoXHLOCDY++bwop+7ipBg6HF78xdxMiJ0jUlHLehw8HNSzURisqWfcxIt7lm0nM2NyVz3LMwQcn
	AaPGOYflbmR2aoFi44qFVz78KvHF+LiErdb+MJdLW2ErKswQ2qy8gq+qV86SzQTLvdUMhVqXCdd7h
	jqE/1T6QuXTtLipvOQPF2T++c8xJcLj0Xm84/J9AqFL8un3EnZ85st1rN/X55Pm0oeXnxOdW8kqVX
	w9y3ulkDcyY5Vi42hh75NgneRtG9Dtt0OGuM3aaG02t5l7R+T21nxhY/Ty+VUinBrtqLR8eA2jPdb
	Ha0LIFMa12PNMdbVrvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjN-009Hfa-2D;
	Tue, 23 May 2023 07:46:53 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjF-009HS4-3A;
	Tue, 23 May 2023 07:46:46 +0000
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
Subject: [PATCH 24/24] block: mark early_lookup_bdev as __init
Date: Tue, 23 May 2023 09:45:35 +0200
Message-Id: <20230523074535.249802-25-hch@lst.de>
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

early_lookup_bdev is now only used during the early boot code as it
should, so mark it __init to not waste run time memory on it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/early-lookup.c   | 19 +++++++++----------
 include/linux/blkdev.h |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/block/early-lookup.c b/block/early-lookup.c
index 6016e781b6a0e2..3ff0d2e4dcbfb8 100644
--- a/block/early-lookup.c
+++ b/block/early-lookup.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Code for looking up block devices in the early boot code before mounting the
- * root file system.  Unfortunately currently also abused in a few other places.
+ * root file system.
  */
 #include <linux/blkdev.h>
 #include <linux/ctype.h>
@@ -18,7 +18,7 @@ struct uuidcmp {
  *
  * Returns 1 if the device matches, and 0 otherwise.
  */
-static int match_dev_by_uuid(struct device *dev, const void *data)
+static int __init match_dev_by_uuid(struct device *dev, const void *data)
 {
 	struct block_device *bdev = dev_to_bdev(dev);
 	const struct uuidcmp *cmp = data;
@@ -42,7 +42,7 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
  *
  * Returns the matching dev_t on success or 0 on failure.
  */
-static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
+static int __init devt_from_partuuid(const char *uuid_str, dev_t *devt)
 {
 	struct uuidcmp cmp;
 	struct device *dev = NULL;
@@ -98,7 +98,7 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
  *
  * Returns 1 if the device matches, and 0 otherwise.
  */
-static int match_dev_by_label(struct device *dev, const void *data)
+static int __init match_dev_by_label(struct device *dev, const void *data)
 {
 	struct block_device *bdev = dev_to_bdev(dev);
 	const char *label = data;
@@ -108,7 +108,7 @@ static int match_dev_by_label(struct device *dev, const void *data)
 	return 1;
 }
 
-static int devt_from_partlabel(const char *label, dev_t *devt)
+static int __init devt_from_partlabel(const char *label, dev_t *devt)
 {
 	struct device *dev;
 
@@ -120,7 +120,7 @@ static int devt_from_partlabel(const char *label, dev_t *devt)
 	return 0;
 }
 
-static dev_t blk_lookup_devt(const char *name, int partno)
+static dev_t __init blk_lookup_devt(const char *name, int partno)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct class_dev_iter iter;
@@ -149,7 +149,7 @@ static dev_t blk_lookup_devt(const char *name, int partno)
 	return devt;
 }
 
-static int devt_from_devname(const char *name, dev_t *devt)
+static int __init devt_from_devname(const char *name, dev_t *devt)
 {
 	int part;
 	char s[32];
@@ -193,7 +193,7 @@ static int devt_from_devname(const char *name, dev_t *devt)
 	return -EINVAL;
 }
 
-static int devt_from_devnum(const char *name, dev_t *devt)
+static int __init devt_from_devnum(const char *name, dev_t *devt)
 {
 	unsigned maj, min, offset;
 	char *p, dummy;
@@ -240,7 +240,7 @@ static int devt_from_devnum(const char *name, dev_t *devt)
  *	name contains slashes, the device name has them replaced with
  *	bangs.
  */
-int early_lookup_bdev(const char *name, dev_t *devt)
+int __init early_lookup_bdev(const char *name, dev_t *devt)
 {
 	if (strncmp(name, "PARTUUID=", 9) == 0)
 		return devt_from_partuuid(name + 9, devt);
@@ -250,7 +250,6 @@ int early_lookup_bdev(const char *name, dev_t *devt)
 		return devt_from_devname(name + 5, devt);
 	return devt_from_devnum(name, devt);
 }
-EXPORT_SYMBOL_GPL(early_lookup_bdev);
 
 static char __init *bdevt_str(dev_t devt, char *buf)
 {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 361341aea82ce5..a07776e5b27940 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1493,7 +1493,7 @@ int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
 void printk_all_partitions(void);
-int early_lookup_bdev(const char *pathname, dev_t *dev);
+int __init early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
 {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
