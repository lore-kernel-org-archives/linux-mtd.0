Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkdV-0000dd-Ee
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:05:15 -0500
Date: Tue, 21 Dec 2004 15:04:46 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140446.GW22636@wohnheim.fh-wedel.de>
References: <20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140322.GV22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/22] Rename central struct
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s/blkmtd_dev/blockmtd_dev/

Maybe "struct blockmtd" without the "_dev" would be even nicer.
Later.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_structname	2004-12-20 22:53:00.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 01:07:33.000000000 +0100
@@ -42,7 +42,7 @@
 #define VERSION "$Revision: 1.23 $"
 
 /* Info for the block device */
-struct blkmtd_dev {
+struct blockmtd_dev {
 	struct list_head list;
 	struct block_device *blkdev;
 	struct mtd_info mtd;
@@ -122,7 +122,7 @@
  * out.
  */
 
-static int write_pages(struct blkmtd_dev *dev, const u_char *buf, loff_t to, size_t len, size_t *retlen)
+static int write_pages(struct blockmtd_dev *dev, const u_char *buf, loff_t to, size_t len, size_t *retlen)
 {
 	struct	page *page;
 	struct	address_space *mapping = dev->blkdev->bd_inode->i_mapping;
@@ -225,7 +225,7 @@
 /* erase a specified part of the device */
 static int blkmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct blkmtd_dev *dev = mtd->priv;
+	struct blockmtd_dev *dev = mtd->priv;
 	struct mtd_erase_region_info *einfo = mtd->eraseregions;
 	int numregions = mtd->numeraseregions;
 	size_t from;
@@ -271,7 +271,7 @@
 
 static int blkmtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	struct blkmtd_dev *dev = mtd->priv;
+	struct blockmtd_dev *dev = mtd->priv;
 	struct page *page;
 	//
 	int index = from >> PAGE_SHIFT;
@@ -318,7 +318,7 @@
 static int blkmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
-	struct blkmtd_dev *dev = mtd->priv;
+	struct blockmtd_dev *dev = mtd->priv;
 	int err;
 
 	if (!len)
@@ -338,13 +338,13 @@
 /* sync the device - wait until the write queue is empty */
 static void blockmtd_sync(struct mtd_info *mtd)
 {
-	struct blkmtd_dev *dev = mtd->priv;
+	struct blockmtd_dev *dev = mtd->priv;
 	sync_blockdev(dev->blkdev);
 	return;
 }
 
 
-static void blockmtd_free_device(struct blkmtd_dev *dev)
+static void blockmtd_free_device(struct blockmtd_dev *dev)
 {
 	if (!dev)
 		return;
@@ -361,15 +361,15 @@
 }
 
 
-static struct blkmtd_dev *add_device(char *devname, int erase_size)
+static struct blockmtd_dev *add_device(char *devname, int erase_size)
 {
 	struct block_device *bdev;
-	struct blkmtd_dev *dev;
+	struct blockmtd_dev *dev;
 
 	if (!devname)
 		return NULL;
 
-	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
+	dev = kmalloc(sizeof(struct blockmtd_dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 	memset(dev, 0, sizeof(*dev));
@@ -549,7 +549,7 @@
 
 	/* Remove the MTD devices */
 	list_for_each_safe(pos, next, &blkmtd_device_list) {
-		struct blkmtd_dev *dev = list_entry(pos, typeof(*dev), list);
+		struct blockmtd_dev *dev = list_entry(pos, typeof(*dev), list);
 		blockmtd_sync(&dev->mtd);
 		del_mtd_device(&dev->mtd);
 		INFO("mtd%d: [%s] removed", dev->mtd.index,
