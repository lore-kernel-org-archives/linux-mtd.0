Received: from list.admingilde.org ([2001:780:0:13::80]
	helo=mail.admingilde.org)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FXkM4-0000Hb-UG
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 15:34:55 -0400
Received: from martin by mail.admingilde.org with local  (Exim 4.50 #1)
	id 1FXkLv-0003hU-5i
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 21:34:39 +0200
Date: Sun, 23 Apr 2006 21:34:39 +0200
From: Martin Waitz <tali@admingilde.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060423193438.GF29948@admingilde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: "Martin Waitz, Lachnerstrasse 65, +49 179 8230 463, +49 9131 6878391,
	91058 Erlangen" <martin@mail.admingilde.org>
Subject: [PATCH] MTD: make mtd->name const
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd->name is never used read-write and often holds a pointer to constant data.

Signed-off-by: Martin Waitz <tali@admingilde.org>

---

 drivers/mtd/cmdlinepart.c       |    2 +-
 drivers/mtd/devices/block2mtd.c |   10 +++++-----
 include/linux/mtd/mtd.h         |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

94152d03bf8d7a28519a8e7f6bf1b53c30664f8d
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index a7a7bfe..615ae4d 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -300,7 +300,7 @@ static int parse_cmdline_partitions(stru
 	unsigned long offset;
 	int i;
 	struct cmdline_mtd_partition *part;
-	char *mtd_id = master->name;
+	const char *mtd_id = master->name;
 
 	if(!cmdline)
 		return -EINVAL;
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 4160b83..adb0ae8 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -289,6 +289,7 @@ static struct block2mtd_dev *add_device(
 {
 	struct block_device *bdev;
 	struct block2mtd_dev *dev;
+	char * name;
 
 	if (!devname)
 		return NULL;
@@ -315,13 +316,12 @@ static struct block2mtd_dev *add_device(
 
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
-	dev->mtd.name = kmalloc(sizeof("block2mtd: ") + strlen(devname),
-			GFP_KERNEL);
-	if (!dev->mtd.name)
+	name = kmalloc(sizeof("block2mtd: ") + strlen(devname), GFP_KERNEL);
+	if (!name)
 		goto devinit_err;
 
-	sprintf(dev->mtd.name, "block2mtd: %s", devname);
-
+	sprintf(name, "block2mtd: %s", devname);
+	dev->mtd.name = name;
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.type = MTD_RAM;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b6f2fda..886f481 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -84,7 +84,7 @@ #define MTD_PROGREGION_CTRLMODE_VALID(mt
 #define MTD_PROGREGION_CTRLMODE_INVALID(mtd)  (mtd)->ecctype
 
 	// Kernel-only stuff starts here.
-	char *name;
+	const char *name;
 	int index;
 
 	// oobinfo is a nand_oobinfo structure, which can be set by iotcl (MEMSETOOBINFO)
-- 
1.3.0.gc5417

-- 
Martin Waitz
