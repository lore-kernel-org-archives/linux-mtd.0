Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkUQ-0000XG-VQ
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:55:52 -0500
Date: Tue, 21 Dec 2004 14:55:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221135530.GR22636@wohnheim.fh-wedel.de>
References: <20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221135405.GQ22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/22] change blockmtd_sync
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hate casts.  This adds a line, but is much simpler to read.  Also
renames the function.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_sync2	2004-12-20 22:14:47.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:16:31.000000000 +0100
@@ -336,12 +336,14 @@
 
 
 /* sync the device - wait until the write queue is empty */
-static void blkmtd_sync(struct mtd_info *mtd)
+static void blockmtd_sync(struct mtd_info *mtd)
 {
-	sync_blockdev(((struct blkmtd_dev*)mtd->priv)->blkdev);
+	struct blkmtd_dev *dev = mtd->priv;
+	sync_blockdev(dev->blkdev);
 	return;
 }
 
+
 static void blockmtd_free_device(struct blkmtd_dev *dev)
 {
 	if (!dev)
@@ -479,7 +481,7 @@
 	dev->mtd_info.erase = blkmtd_erase;
 	dev->mtd_info.write = blkmtd_write;
 	dev->mtd_info.writev = default_mtd_writev;
-	dev->mtd_info.sync = blkmtd_sync;
+	dev->mtd_info.sync = blockmtd_sync;
 	dev->mtd_info.read = blkmtd_read;
 	dev->mtd_info.readv = default_mtd_readv;
 	dev->mtd_info.priv = dev;
@@ -624,7 +626,7 @@
 	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
 		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
 						    list);
-		blkmtd_sync(&dev->mtd_info);
+		blockmtd_sync(&dev->mtd_info);
 		del_mtd_device(&dev->mtd_info);
 		INFO("mtd%d: [%s] removed", dev->mtd_info.index,
 				dev->mtd_info.name + strlen("blkmtd: "));
