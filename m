Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkNW-0000VM-6E
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:48:44 -0500
Date: Tue, 21 Dec 2004 14:48:18 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134818.GM22636@wohnheim.fh-wedel.de>
References: <20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134724.GL22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/22] Lindent
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ran some functions through Lindent.  Mostly mindless stuff, some small
manual changes as well.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |  158 +++++++++++++++++++++++++++++++------------------------------
 1 files changed, 82 insertions(+), 76 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_lindent	2004-12-20 19:03:50.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 19:10:28.000000000 +0100
@@ -79,8 +79,8 @@
 
 void cache_readahead(struct address_space *mapping, int index)
 {
-	filler_t *filler = (filler_t*)(mapping->a_ops->readpage);
-	int i,pagei;
+	filler_t *filler = (void*)mapping->a_ops->readpage;
+	int i, pagei;
 	unsigned ret = 0;
 	unsigned long end_index;
 	struct page *page;
@@ -88,7 +88,7 @@
 	struct inode *inode = mapping->host;
 	loff_t isize = i_size_read(inode);
 
-	if(!isize) {
+	if (!isize) {
 		printk(KERN_INFO "iSize=0 in cache_readahead\n");
 		return;
 	}
@@ -96,25 +96,28 @@
 	end_index = ((isize - 1) >> PAGE_CACHE_SHIFT);
 
 	spin_lock_irq(&mapping->tree_lock);
-	for(i=0;i<PAGE_READAHEAD;i++) {
-		pagei=index+i;
+	for (i = 0; i < PAGE_READAHEAD; i++) {
+		pagei = index + i;
 		if (pagei > end_index) {
 			printk(KERN_INFO "Overrun end of disk in cache readahead\n");
 			break;
 		}
 		page = radix_tree_lookup(&mapping->page_tree, pagei);
-		if(page && (!i)) break;
-		if(page) continue;
+		if (page && (!i))
+			break;
+		if (page)
+			continue;
 		spin_unlock_irq(&mapping->tree_lock);
 		page = page_cache_alloc_cold(mapping);
 		spin_lock_irq(&mapping->tree_lock);
-		if(!page) break;
-		page->index=pagei;
+		if (!page)
+			break;
+		page->index = pagei;
 		list_add(&page->lru, &page_pool);
 		ret++;
 	}
 	spin_unlock_irq(&mapping->tree_lock);
-	if(ret) {
+	if (ret) {
 		read_cache_pages(mapping, &page_pool, filler, NULL);
 		//printk(KERN_INFO "Readahead [%d/%d] pages from [%d]\n",ret,PAGE_READAHEAD,index);
 	}
@@ -256,28 +259,26 @@
 	len = instr->len;
 
 	/* check erase region has valid start and length */
-	while(numregions) {
-		if(from >= einfo->offset
-		   && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
-			if(len == einfo->erasesize
-			   && ( (from - einfo->offset) % einfo->erasesize == 0))
+	while (numregions) {
+		if (from >= einfo->offset && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
+			if (len == einfo->erasesize && ((from - einfo->offset) % einfo->erasesize == 0))
 				break;
 		}
 		numregions--;
 		einfo++;
 	}
 
-	if(!numregions) {
+	if (!numregions) {
 		/* Not a valid erase block */
 		err("erase: invalid erase request 0x%lX @ 0x%08zX", len, from);
 		instr->state = MTD_ERASE_FAILED;
 		err = -EIO;
 	}
 
-	if(instr->state != MTD_ERASE_FAILED) {
+	if (instr->state != MTD_ERASE_FAILED) {
 		/* do the erase */
 		err = write_pages(dev, NULL, from, len, &retlen);
-		if(err || retlen != len) {
+		if (err || retlen != len) {
 			err("erase failed err = %d", err);
 			instr->state = MTD_ERASE_FAILED;
 		} else {
@@ -294,35 +295,41 @@
 	struct blkmtd_dev *dev = mtd->priv;
 	struct page *page;
 	//
-	int index	= from >> PAGE_SHIFT;
-	int offset	= from - (index << PAGE_SHIFT);
+	int index = from >> PAGE_SHIFT;
+	int offset = from - (index << PAGE_SHIFT);
 	int cpylen;
 
-	if(from > mtd->size) return -EINVAL;
-	if(from + len > mtd->size) len = mtd->size - from;
+	if (from > mtd->size)
+		return -EINVAL;
+	if (from + len > mtd->size)
+		len = mtd->size - from;
 
-	if(retlen) *retlen = 0;
+	if (retlen)
+		*retlen = 0;
 
-	while(len) {
-		if((offset+len) > PAGE_SIZE) 
+	while (len) {
+		if ((offset + len) > PAGE_SIZE)
 			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else	cpylen = len;			// this page
+		else
+			cpylen = len;	// this page
 		len = len - cpylen;
-		//
-		//	Get page
-		//
-		page = page_readahead(dev->blkdev->bd_inode->i_mapping,index);
-		if(!page) return -ENOMEM;
-		if(IS_ERR(page)) return -EIO;
-		//
+
+		//      Get page
+		page = page_readahead(dev->blkdev->bd_inode->i_mapping, index);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return -EIO;
+
 		memcpy(buf, page_address(page) + offset, cpylen);
 		page_cache_release(page);
-		//
-		if(retlen) *retlen += cpylen;
-		buf+=cpylen;
+
+		if (retlen)
+			*retlen += cpylen;
+		buf += cpylen;
 		offset = 0;
 		index++;
-		//
+
 	}
 	return 0;
 }
@@ -335,12 +342,16 @@
 	struct blkmtd_dev *dev = mtd->priv;
 	int err;
 
-	if(!len) return 0;
-	if(to >= mtd->size) return -ENOSPC;
-	if(to + len > mtd->size) len = mtd->size - to;
+	if (!len)
+		return 0;
+	if (to >= mtd->size)
+		return -ENOSPC;
+	if (to + len > mtd->size)
+		len = mtd->size - to;
 
 	err = write_pages(dev, buf, to, len, retlen);
-	if(err > 0) err = 0;
+	if (err > 0)
+		err = 0;
 	return err;
 }
 
@@ -354,13 +365,13 @@
 
 static void free_device(struct blkmtd_dev *dev)
 {
-	if(dev) {
-		if(dev->mtd_info.eraseregions)
+	if (dev) {
+		if (dev->mtd_info.eraseregions)
 			kfree(dev->mtd_info.eraseregions);
-		if(dev->mtd_info.name)
+		if (dev->mtd_info.name)
 			kfree(dev->mtd_info.name);
 
-		if(dev->blkdev) {
+		if (dev->blkdev) {
 			invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
 			close_bdev_excl(dev->blkdev);
 		}
@@ -381,14 +392,14 @@
 
 	/* Make any user specified erasesize be a power of 2
 	   and at least PAGE_SIZE */
-	if(erase_size) {
+	if (erase_size) {
 		int es = erase_size;
 		erase_size = 1;
-		while(es != 1) {
+		while (es != 1) {
 			es >>= 1;
 			erase_size <<= 1;
 		}
-		if(erase_size < PAGE_SIZE)
+		if (erase_size < PAGE_SIZE)
 			erase_size = PAGE_SIZE;
 	} else {
 		erase_size = CONFIG_MTD_BLKDEV_ERASESIZE;
@@ -401,28 +412,28 @@
 		int er_size = erase_size;
 		int count = 0, offset = 0, regcnt = 0;
 
-		while(tot_size) {
+		while (tot_size) {
 			count = tot_size / er_size;
-			if(count) {
+			if (count) {
 				tot_size = tot_size % er_size;
-				if(info) {
-					(info+regcnt)->offset = offset;
-					(info+regcnt)->erasesize = er_size;
-					(info+regcnt)->numblocks = count;
+				if (info) {
+					(info + regcnt)->offset = offset;
+					(info + regcnt)->erasesize = er_size;
+					(info + regcnt)->numblocks = count;
 					(*regions)++;
 				}
 				regcnt++;
 				offset += (count * er_size);
 			}
-			while(er_size > tot_size)
+			while (er_size > tot_size)
 				er_size >>= 1;
 		}
-		if(info == NULL) {
+		if (info == NULL) {
 			info = kmalloc(regcnt * sizeof(struct mtd_erase_region_info), GFP_KERNEL);
-			if(!info)
+			if (!info)
 				break;
 		}
-	} while(!(*regions));
+	} while (!(*regions));
 
 	return info;
 }
@@ -436,12 +447,11 @@
 	int mode;
 	struct blkmtd_dev *dev;
 
-	if(!devname)
+	if (!devname)
 		return NULL;
 
 	/* Get a handle on the device */
 
-
 #ifdef MODULE
 	mode = O_RDWR;
 	bdev = open_bdev_excl(devname, mode, NULL);
@@ -449,19 +459,19 @@
 	mode = FMODE_WRITE;
 	bdev = open_by_devnum(name_to_dev_t(devname), mode);
 #endif
-	if(IS_ERR(bdev)) {
+	if (IS_ERR(bdev)) {
 		err("error: cannot open device %s", devname);
 		return NULL;
 	}
 
-	if(MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
+	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
 		err("attempting to use an MTD device as a block device");
 		blkdev_put(bdev);
 		return NULL;
 	}
 
 	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
-	if(dev == NULL) {
+	if (dev == NULL) {
 		blkdev_put(bdev);
 		return NULL;
 	}
@@ -476,13 +486,12 @@
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
 	dev->mtd_info.name = kmalloc(sizeof("blkmtd: ") + strlen(devname), GFP_KERNEL);
-	if(dev->mtd_info.name == NULL)
+	if (dev->mtd_info.name == NULL)
 		goto devinit_err;
 
 	sprintf(dev->mtd_info.name, "blkmtd: %s", devname);
-	dev->mtd_info.eraseregions = calc_erase_regions(erase_size, dev->mtd_info.size,
-							&dev->mtd_info.numeraseregions);
-	if(dev->mtd_info.eraseregions == NULL)
+	dev->mtd_info.eraseregions = calc_erase_regions(erase_size, dev->mtd_info.size, &dev->mtd_info.numeraseregions);
+	if (dev->mtd_info.eraseregions == NULL)
 		goto devinit_err;
 
 	dev->mtd_info.erasesize = dev->mtd_info.eraseregions->erasesize;
@@ -503,14 +512,11 @@
 		list_del(&dev->list);
 		goto devinit_err;
 	} else {
-		info("mtd%d: [%s] erase_size = %dKiB [%ld]",
-		     dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "),
-		     dev->mtd_info.erasesize >> 10,
-		     PAGE_SIZE);
+		info("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "), dev->mtd_info.erasesize >> 10, PAGE_SIZE);
 	}
 	return dev;
 
- devinit_err:
+devinit_err:
 	free_device(dev);
 	return NULL;
 }
@@ -524,7 +530,7 @@
 {
 	int i;
 
-	for(i = 0; i < MAX_DEVICES; i++) {
+	for (i = 0; i < MAX_DEVICES; i++) {
 		device[i] = str;
 		strsep(&str, ",");
 	}
@@ -535,9 +541,9 @@
 static int __init param_blkmtd_erasesz(char *str)
 {
 	int i;
-	for(i = 0; i < MAX_DEVICES; i++) {
+	for (i = 0; i < MAX_DEVICES; i++) {
 		char *val = strsep(&str, ",");
-		if(val)
+		if (val)
 			erasesz[i] = simple_strtoul(val, NULL, 0);
 	}
 
@@ -547,7 +553,7 @@
 
 static int __init param_blkmtd_sync(char *str)
 {
-	if(str[0] == '1')
+	if (str[0] == '1')
 		sync = 1;
 	return 1;
 }
