Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgkk6-0000jd-Ui
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:12:04 -0500
Date: Tue, 21 Dec 2004 15:11:46 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221141146.GA22636@wohnheim.fh-wedel.de>
References: <20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
	<20041221140446.GW22636@wohnheim.fh-wedel.de>
	<20041221140617.GX22636@wohnheim.fh-wedel.de>
	<20041221140923.GY22636@wohnheim.fh-wedel.de>
	<20041221141042.GZ22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221141042.GZ22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 21/22] Default erase size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For block devices, an erase size of 0 makes little sense.  PAGE_SIZE
should be a sane default.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |    4 +---
 1 files changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_erasesize	2004-12-21 02:19:58.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 02:23:25.000000000 +0100
@@ -38,7 +38,6 @@
 
 
 /* Default erase size in K, always make it a multiple of PAGE_SIZE */
-#define CONFIG_MTD_BLKDEV_ERASESIZE (128 << 10)	/* 128KiB */
 #define VERSION "$Revision: 1.23 $"
 
 /* Info for the block device */
@@ -290,7 +289,6 @@
 	if (!dev)
 		return;
 
-	kfree(dev->mtd.eraseregions);
 	kfree(dev->mtd.name);
 
 	if (dev->blkdev) {
@@ -432,7 +430,7 @@
 	char buf[80+12], *str=buf; /* 80 for device, 12 for erase size */
 	char *token[2];
 	char *name;
-	size_t erase_size = 0;
+	size_t erase_size = PAGE_SIZE;
 	int i, ret;
 
 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
