Received: from mx33.mail.ru ([194.67.23.194])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HrkC4-000423-TT
	for linux-mtd@lists.infradead.org; Fri, 25 May 2007 20:31:44 -0400
Received: from [89.113.85.104] (port=57549 helo=localhost)
	by mx33.mail.ru with esmtp id 1HrkC3-000EOR-00
	for linux-mtd@lists.infradead.org; Sat, 26 May 2007 04:31:39 +0400
Date: Sat, 26 May 2007 04:28:43 +0400
From: Anton Vorontsov <cbou@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd_info: name is const most of the time
Message-ID: <20070526002843.GA801@zarina>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is only one special case - block2mtd, which fills name
via sprintf. So use casting there, we know it's safe.

Signed-off-by: Anton Vorontsov <cbou@mail.ru>
---
 drivers/mtd/cmdlinepart.c       |    2 +-
 drivers/mtd/devices/block2mtd.c |    2 +-
 drivers/mtd/mtdconcat.c         |    2 +-
 include/linux/mtd/concat.h      |    2 +-
 include/linux/mtd/mtd.h         |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 23fab14..cbb324b 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -299,7 +299,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	unsigned long offset;
 	int i;
 	struct cmdline_mtd_partition *part;
-	char *mtd_id = master->name;
+	const char *mtd_id = master->name;
 
 	if(!cmdline)
 		return -EINVAL;
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index be4b994..2e7e754 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -284,7 +284,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	if (!dev->mtd.name)
 		goto devinit_err;
 
-	sprintf(dev->mtd.name, "block2mtd: %s", devname);
+	sprintf((char *)dev->mtd.name, "block2mtd: %s", devname);
 
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 41844ea..360a974 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -693,7 +693,7 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
  */
 struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to concatenate */
 				   int num_devs,	/* number of subdevices      */
-				   char *name)
+				   const char *name)
 {				/* name for the new device   */
 	int i;
 	size_t size;
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index ed8dc67..0273cb1 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -15,7 +15,7 @@
 struct mtd_info *mtd_concat_create(
     struct mtd_info *subdev[],  /* subdevices to concatenate */
     int num_devs,               /* number of subdevices      */
-    char *name);                /* name for the new device   */
+    const char *name);          /* name for the new device   */
 
 void mtd_concat_destroy(struct mtd_info *mtd);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index fd64ccf..513020a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -121,7 +121,7 @@ struct mtd_info {
 	u_int32_t oobavail;  // Available OOB bytes per block
 
 	// Kernel-only stuff starts here.
-	char *name;
+	const char *name;
 	int index;
 
 	/* ecc layout structure pointer - read only ! */
-- 
1.5.1.1-dirty
