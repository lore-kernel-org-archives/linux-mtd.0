Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGokZ-0004wy-0D
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:34 +0000
Received: by mail-wr0-x242.google.com with SMTP id 6so1583510wrb.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:44:10 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 3/5] mtd: block2mtd: Fallback to read-only mode
Date: Fri,  2 Jun 2017 17:43:40 +0200
Message-Id: <1496418222-23483-4-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes block device is readonly (e.g. loopbacks). This patch allows
block2mtd to fallback and create read-only MTD_ROM device instead of
fatal failure.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/mtd/devices/block2mtd.c |   39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 5ba5fad..ad96937 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -38,6 +38,7 @@ struct block2mtd_dev {
 	struct block_device *blkdev;
 	struct mtd_info mtd;
 	struct mutex write_mutex;
+	bool ro_mode;
 };
 
 
@@ -212,7 +213,10 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 	if (dev->blkdev) {
 		invalidate_mapping_pages(dev->blkdev->bd_inode->i_mapping,
 					0, -1);
-		blkdev_put(dev->blkdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
+		if (dev->ro_mode)
+			blkdev_put(dev->blkdev, FMODE_READ);
+		else
+			blkdev_put(dev->blkdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
 	}
 
 	kfree(dev);
@@ -240,6 +244,13 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
 	/* Get a handle on the device */
 	bdev = blkdev_get_by_path(devname, mode, dev);
 
+	/* Try fallback to read only mode */
+	if (IS_ERR(bdev)) {
+		bdev = blkdev_get_by_path(devname, FMODE_READ, dev);
+		if (!IS_ERR(bdev))
+			dev->ro_mode = true;
+	}
+
 #ifndef MODULE
 	/*
 	 * We might not have the root device mounted at this point.
@@ -261,6 +272,13 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
 		if (!devt)
 			continue;
 		bdev = blkdev_get_by_dev(devt, mode, dev);
+
+		/* Try fallback to read only mode */
+		if (IS_ERR(bdev)) {
+			bdev = blkdev_get_by_path(devname, FMODE_READ, dev);
+			if (!IS_ERR(bdev))
+				dev->ro_mode = true;
+		}
 	}
 #endif
 
@@ -295,16 +313,22 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
 
 	dev->mtd.name = name;
 
+	if (dev->ro_mode) {
+		dev->mtd.type = MTD_ROM;
+		dev->mtd.flags = MTD_CAP_ROM;
+	} else {
+		dev->mtd.type = MTD_RAM;
+		dev->mtd.flags = MTD_CAP_RAM;
+		dev->mtd._erase = block2mtd_erase;
+		dev->mtd._write = block2mtd_write;
+		dev->mtd._sync = block2mtd_sync;
+	}
+
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = write_size;
 	dev->mtd.subpage_sft = subpage_sft;
 	dev->mtd.writebufsize = PAGE_SIZE;
-	dev->mtd.type = MTD_RAM;
-	dev->mtd.flags = MTD_CAP_RAM;
-	dev->mtd._erase = block2mtd_erase;
-	dev->mtd._write = block2mtd_write;
-	dev->mtd._sync = block2mtd_sync;
 	dev->mtd._read = block2mtd_read;
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
@@ -315,9 +339,10 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
 	}
 
 	list_add(&dev->list, &blkmtd_device_list);
-	pr_info("mtd%d: [%s] erase_size = %dKiB [%d], write_size = %dKiB [%d], subpage_sft = %d\n",
+	pr_info("mtd%d: [%s] mode = %s, erase_size = %dKiB [%d], write_size = %dKiB [%d], subpage_sft = %d\n",
 		dev->mtd.index,
 		dev->mtd.name + strlen("block2mtd: "),
+		(dev->ro_mode ? "RO" : "R/W"),
 		dev->mtd.erasesize >> 10, dev->mtd.erasesize,
 		dev->mtd.writesize >> 10, dev->mtd.writesize,
 		dev->mtd.subpage_sft);
-- 
1.7.9.5
