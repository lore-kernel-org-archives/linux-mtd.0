Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkTJ-0000Wx-Ay
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:54:44 -0500
Date: Tue, 21 Dec 2004 14:54:05 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221135405.GQ22636@wohnheim.fh-wedel.de>
References: <20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221135312.GP22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/22] kfree simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kfree(NULL) works just fine, which allows for much simpler code.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_kfree	2004-12-20 22:12:07.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:14:47.000000000 +0100
@@ -342,20 +342,20 @@
 	return;
 }
 
-static void free_device(struct blkmtd_dev *dev)
+static void blockmtd_free_device(struct blkmtd_dev *dev)
 {
-	if (dev) {
-		if (dev->mtd_info.eraseregions)
-			kfree(dev->mtd_info.eraseregions);
-		if (dev->mtd_info.name)
-			kfree(dev->mtd_info.name);
+	if (!dev)
+		return;
 
-		if (dev->blkdev) {
-			invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
-			close_bdev_excl(dev->blkdev);
-		}
-		kfree(dev);
+	kfree(dev->mtd_info.eraseregions);
+	kfree(dev->mtd_info.name);
+
+	if (dev->blkdev) {
+		invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
+		close_bdev_excl(dev->blkdev);
 	}
+
+	kfree(dev);
 }
 
 
@@ -496,7 +496,7 @@
 	return dev;
 
 devinit_err:
-	free_device(dev);
+	blockmtd_free_device(dev);
 	return NULL;
 }
 
@@ -629,7 +629,7 @@
 		INFO("mtd%d: [%s] removed", dev->mtd_info.index,
 				dev->mtd_info.name + strlen("blkmtd: "));
 		list_del(&dev->list);
-		free_device(dev);
+		blockmtd_free_device(dev);
 	}
 }
 
