Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkW3-0000XU-Bk
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:57:34 -0500
Date: Tue, 21 Dec 2004 14:57:05 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221135705.GS22636@wohnheim.fh-wedel.de>
References: <20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221135530.GR22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I see absolutely no reason for complicated erase reagions.  On the
user side, everyone but mtdchar effectively ignores it anyway.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   64 -------------------------------------------------------------
 1 files changed, 1 insertion(+), 63 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_erase_regions	2004-12-20 22:16:31.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:21:50.000000000 +0100
@@ -361,65 +361,6 @@
 }
 
 
-/* For a given size and initial erase size, calculate the number
- * and size of each erase region. Goes round the loop twice,
- * once to find out how many regions, then allocates space,
- * then round the loop again to fill it in.
- */
-static struct mtd_erase_region_info *calc_erase_regions(
-	size_t erase_size, size_t total_size, int *regions)
-{
-	struct mtd_erase_region_info *info = NULL;
-
-	/* Make any user specified erasesize be a power of 2
-	   and at least PAGE_SIZE */
-	if (erase_size) {
-		int es = erase_size;
-		erase_size = 1;
-		while (es != 1) {
-			es >>= 1;
-			erase_size <<= 1;
-		}
-		if (erase_size < PAGE_SIZE)
-			erase_size = PAGE_SIZE;
-	} else {
-		erase_size = CONFIG_MTD_BLKDEV_ERASESIZE;
-	}
-
-	*regions = 0;
-
-	do {
-		int tot_size = total_size;
-		int er_size = erase_size;
-		int count = 0, offset = 0, regcnt = 0;
-
-		while (tot_size) {
-			count = tot_size / er_size;
-			if (count) {
-				tot_size = tot_size % er_size;
-				if (info) {
-					(info + regcnt)->offset = offset;
-					(info + regcnt)->erasesize = er_size;
-					(info + regcnt)->numblocks = count;
-					(*regions)++;
-				}
-				regcnt++;
-				offset += (count * er_size);
-			}
-			while (er_size > tot_size)
-				er_size >>= 1;
-		}
-		if (info == NULL) {
-			info = kmalloc(regcnt * sizeof(struct mtd_erase_region_info), GFP_KERNEL);
-			if (!info)
-				break;
-		}
-	} while (!(*regions));
-
-	return info;
-}
-
-
 extern dev_t __init name_to_dev_t(const char *line);
 
 static struct blkmtd_dev *add_device(char *devname, int erase_size)
@@ -471,11 +412,8 @@
 		goto devinit_err;
 
 	sprintf(dev->mtd_info.name, "blkmtd: %s", devname);
-	dev->mtd_info.eraseregions = calc_erase_regions(erase_size, dev->mtd_info.size, &dev->mtd_info.numeraseregions);
-	if (dev->mtd_info.eraseregions == NULL)
-		goto devinit_err;
 
-	dev->mtd_info.erasesize = dev->mtd_info.eraseregions->erasesize;
+	dev->mtd_info.erasesize = erase_size;
 	dev->mtd_info.type = MTD_RAM;
 	dev->mtd_info.flags = MTD_CAP_RAM;
 	dev->mtd_info.erase = blkmtd_erase;
