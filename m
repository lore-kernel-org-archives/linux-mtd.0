Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkN2-0000V4-9D
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:48:14 -0500
Date: Tue, 21 Dec 2004 14:47:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134724.GL22636@wohnheim.fh-wedel.de>
References: <1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134511.GK22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/22] Remove debug macros
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove debug output.  I have absolutely no love for those things.  If
you need them for debugging, add them, find the problem, fix the
problem, keep the fix and drop the debugging mess.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   24 +-----------------------
 1 files changed, 1 insertion(+), 23 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_debug	2004-12-20 19:00:27.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 19:03:50.000000000 +0100
@@ -184,7 +184,6 @@
 				}
 
 			if(format) {
-				//DEBUG(3, "write_pages: erasing\n");
 				lock_page(page);
 				memset(page_address(page), 0xff, PAGE_SIZE);
 				set_page_dirty(page);
@@ -257,10 +256,7 @@
 	len = instr->len;
 
 	/* check erase region has valid start and length */
-	//DEBUG(2, "blkmtd: erase: dev = `%s' from = 0x%zx len = 0x%lx\n", mtd->name+9, from, len);
 	while(numregions) {
-		DEBUG(3, "blkmtd: checking erase region = 0x%08X size = 0x%X num = 0x%x\n",
-		      einfo->offset, einfo->erasesize, einfo->numblocks);
 		if(from >= einfo->offset
 		   && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
 			if(len == einfo->erasesize
@@ -280,7 +276,6 @@
 
 	if(instr->state != MTD_ERASE_FAILED) {
 		/* do the erase */
-		DEBUG(3, "Doing erase from = %zd len = %ld\n", from, len);
 		err = write_pages(dev, NULL, from, len, &retlen);
 		if(err || retlen != len) {
 			err("erase failed err = %d", err);
@@ -290,9 +285,7 @@
 		}
 	}
 
-	DEBUG(3, "blkmtd: erase: checking callback\n");
 	mtd_erase_callback(instr);
-	DEBUG(2, "blkmtd: erase: finished (err = %d)\n", err);
 	return err;
 }
 
@@ -361,7 +354,6 @@
 
 static void free_device(struct blkmtd_dev *dev)
 {
-	DEBUG(2, "blkmtd: free_device() dev = %p\n", dev);
 	if(dev) {
 		if(dev->mtd_info.eraseregions)
 			kfree(dev->mtd_info.eraseregions);
@@ -387,8 +379,6 @@
 {
 	struct mtd_erase_region_info *info = NULL;
 
-	DEBUG(2, "calc_erase_regions, es = %zd size = %zd regions = %d\n",
-	      erase_size, total_size, *regions);
 	/* Make any user specified erasesize be a power of 2
 	   and at least PAGE_SIZE */
 	if(erase_size) {
@@ -416,8 +406,6 @@
 			if(count) {
 				tot_size = tot_size % er_size;
 				if(info) {
-					DEBUG(2, "adding to erase info off=%d er=%d cnt=%d\n",
-					      offset, er_size, count);
 					(info+regcnt)->offset = offset;
 					(info+regcnt)->erasesize = er_size;
 					(info+regcnt)->numblocks = count;
@@ -435,8 +423,7 @@
 				break;
 		}
 	} while(!(*regions));
-	DEBUG(2, "calc_erase_regions done, es = %zd size = %zd regions = %d\n",
-	      erase_size, total_size, *regions);
+
 	return info;
 }
 
@@ -464,13 +451,9 @@
 #endif
 	if(IS_ERR(bdev)) {
 		err("error: cannot open device %s", devname);
-		DEBUG(2, "blkmtd: opening bdev returned %ld\n", PTR_ERR(bdev));
 		return NULL;
 	}
 
-	DEBUG(1, "blkmtd: found a block device major = %d, minor = %d\n",
-	      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
-
 	if(MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
 		err("attempting to use an MTD device as a block device");
 		blkdev_put(bdev);
@@ -503,9 +486,6 @@
 		goto devinit_err;
 
 	dev->mtd_info.erasesize = dev->mtd_info.eraseregions->erasesize;
-	DEBUG(1, "blkmtd: init: found %d erase regions\n",
-	      dev->mtd_info.numeraseregions);
-
 	dev->mtd_info.type = MTD_RAM;
 	dev->mtd_info.flags = MTD_CAP_RAM;
 	dev->mtd_info.erase = blkmtd_erase;
@@ -546,7 +526,6 @@
 
 	for(i = 0; i < MAX_DEVICES; i++) {
 		device[i] = str;
-		DEBUG(2, "blkmtd: device setup: %d = %s\n", i, device[i]);
 		strsep(&str, ",");
 	}
 	return 1;
@@ -560,7 +539,6 @@
 		char *val = strsep(&str, ",");
 		if(val)
 			erasesz[i] = simple_strtoul(val, NULL, 0);
-		DEBUG(2, "blkmtd: erasesz setup: %d = %d\n", i, erasesz[i]);
 	}
 
 	return 1;
