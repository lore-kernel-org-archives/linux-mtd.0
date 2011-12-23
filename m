Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zh-0005HI-Jc
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:47 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/28] mtd: introduce mtd_read interface
Date: Fri, 23 Dec 2011 20:10:59 +0200
Message-Id: <1324663880-22477-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/arm/mach-davinci/board-da850-evm.c   |    2 +-
 arch/cris/arch-v32/drivers/axisflashmap.c |    4 +-
 drivers/mtd/afs.c                         |    4 +-
 drivers/mtd/ar7part.c                     |   15 +++++-----
 drivers/mtd/bcm63xxpart.c                 |   12 ++++----
 drivers/mtd/ftl.c                         |   41 +++++++++++++++--------------
 drivers/mtd/inftlcore.c                   |   19 ++++++++-----
 drivers/mtd/inftlmount.c                  |   10 +++---
 drivers/mtd/mtdblock.c                    |    8 +++---
 drivers/mtd/mtdblock_ro.c                 |    2 +-
 drivers/mtd/mtdchar.c                     |    2 +-
 drivers/mtd/mtdconcat.c                   |    2 +-
 drivers/mtd/mtdoops.c                     |    4 +-
 drivers/mtd/mtdpart.c                     |    3 +-
 drivers/mtd/mtdswap.c                     |    4 +-
 drivers/mtd/nand/diskonchip.c             |    4 +-
 drivers/mtd/nand/nand_bbt.c               |    6 ++--
 drivers/mtd/nftlcore.c                    |   17 ++++++++----
 drivers/mtd/nftlmount.c                   |    6 ++--
 drivers/mtd/redboot.c                     |    4 +-
 drivers/mtd/rfd_ftl.c                     |   24 ++++++++--------
 drivers/mtd/ssfdc.c                       |    6 ++--
 drivers/mtd/tests/mtd_pagetest.c          |   28 ++++++++++----------
 drivers/mtd/tests/mtd_readtest.c          |    2 +-
 drivers/mtd/tests/mtd_speedtest.c         |    8 +++---
 drivers/mtd/tests/mtd_stresstest.c        |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c       |    8 +++---
 drivers/mtd/tests/mtd_torturetest.c       |    2 +-
 drivers/mtd/ubi/debug.c                   |    2 +-
 drivers/mtd/ubi/io.c                      |    6 ++--
 drivers/staging/spectra/lld_mtd.c         |    8 +++--
 fs/jffs2/erase.c                          |    2 +-
 fs/jffs2/wbuf.c                           |    9 +++---
 fs/logfs/dev_mtd.c                        |    2 +-
 include/linux/mtd/mtd.h                   |    9 +++++-
 35 files changed, 152 insertions(+), 135 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 6659a90..8b079f9 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -127,7 +127,7 @@ static void da850_evm_m25p80_notify_add(struct mtd_info *mtd)
 	size_t retlen;
 
 	if (!strcmp(mtd->name, "MAC-Address")) {
-		mtd->read(mtd, 0, ETH_ALEN, &retlen, mac_addr);
+		mtd_read(mtd, 0, ETH_ALEN, &retlen, mac_addr);
 		if (retlen == ETH_ALEN)
 			pr_info("Read MAC addr from SPI Flash: %pM\n",
 				mac_addr);
diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32/drivers/axisflashmap.c
index a2bde37..011bddb 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -413,8 +413,8 @@ static int __init init_axis_flash(void)
 		} while (blockstat && ptable_sector);
 #endif
 		if (ptable_sector) {
-			main_mtd->read(main_mtd, ptable_sector, PAGESIZE,
-				&len, page);
+			mtd_read(main_mtd, ptable_sector, PAGESIZE, &len,
+				 page);
 			ptable_head = &((struct partitiontable *) page)->head;
 		}
 
diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 89a02f6..5a3942b 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -75,7 +75,7 @@ afs_read_footer(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 	size_t sz;
 	int ret;
 
-	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
+	ret = mtd_read(mtd, ptr, sizeof(fs), &sz, (u_char *)&fs);
 	if (ret >= 0 && sz != sizeof(fs))
 		ret = -EINVAL;
 
@@ -132,7 +132,7 @@ afs_read_iis(struct mtd_info *mtd, struct image_info_struct *iis, u_int ptr)
 	int ret, i;
 
 	memset(iis, 0, sizeof(*iis));
-	ret = mtd->read(mtd, ptr, sizeof(*iis), &sz, (u_char *) iis);
+	ret = mtd_read(mtd, ptr, sizeof(*iis), &sz, (u_char *)iis);
 	if (ret < 0)
 		goto failed;
 
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index f40ea45..9453931 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -73,8 +73,8 @@ static int create_mtd_partitions(struct mtd_info *master,
 
 	do { /* Try 10 blocks starting from master->erasesize */
 		offset = pre_size;
-		master->read(master, offset,
-			     sizeof(header), &len, (uint8_t *)&header);
+		mtd_read(master, offset, sizeof(header), &len,
+			 (uint8_t *)&header);
 		if (!strncmp((char *)&header, "TIENV0.8", 8))
 			ar7_parts[1].offset = pre_size;
 		if (header.checksum == LOADER_MAGIC1)
@@ -95,16 +95,16 @@ static int create_mtd_partitions(struct mtd_info *master,
 	case LOADER_MAGIC1:
 		while (header.length) {
 			offset += sizeof(header) + header.length;
-			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+			mtd_read(master, offset, sizeof(header), &len,
+				 (uint8_t *)&header);
 		}
 		root_offset = offset + sizeof(header) + 4;
 		break;
 	case LOADER_MAGIC2:
 		while (header.length) {
 			offset += sizeof(header) + header.length;
-			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+			mtd_read(master, offset, sizeof(header), &len,
+				 (uint8_t *)&header);
 		}
 		root_offset = offset + sizeof(header) + 4 + 0xff;
 		root_offset &= ~(uint32_t)0xff;
@@ -114,8 +114,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 		break;
 	}
 
-	master->read(master, root_offset,
-		sizeof(header), &len, (u8 *)&header);
+	mtd_read(master, root_offset, sizeof(header), &len, (u8 *)&header);
 	if (header.checksum != SQUASHFS_MAGIC) {
 		root_offset += master->erasesize - 1;
 		root_offset &= ~(master->erasesize - 1);
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 0d5fecf..4871c74 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -48,8 +48,8 @@ static int bcm63xx_detect_cfe(struct mtd_info *master)
 	int ret;
 	size_t retlen;
 
-	ret = master->read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
-			   (void *)buf);
+	ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
+		       (void *)buf);
 	buf[retlen] = 0;
 
 	if (ret)
@@ -59,8 +59,8 @@ static int bcm63xx_detect_cfe(struct mtd_info *master)
 		return 0;
 
 	/* very old CFE's do not have the cfe-v string, so check for magic */
-	ret = master->read(master, BCM63XX_CFE_MAGIC_OFFSET, 8, &retlen,
-			   (void *)buf);
+	ret = mtd_read(master, BCM63XX_CFE_MAGIC_OFFSET, 8, &retlen,
+		       (void *)buf);
 	buf[retlen] = 0;
 
 	return strncmp("CFE1CFE1", buf, 8);
@@ -95,8 +95,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		return -ENOMEM;
 
 	/* Get the tag */
-	ret = master->read(master, cfelen, sizeof(struct bcm_tag), &retlen,
-			   (void *)buf);
+	ret = mtd_read(master, cfelen, sizeof(struct bcm_tag), &retlen,
+		       (void *)buf);
 
 	if (retlen != sizeof(struct bcm_tag)) {
 		vfree(buf);
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index a982889..12fd7eb 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -168,8 +168,8 @@ static int scan_header(partition_t *part)
 	 (offset + sizeof(header)) < max_offset;
 	 offset += part->mbd.mtd->erasesize ? : 0x2000) {
 
-	err = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &ret,
-			      (unsigned char *)&header);
+	err = mtd_read(part->mbd.mtd, offset, sizeof(header), &ret,
+                       (unsigned char *)&header);
 
 	if (err)
 	    return err;
@@ -224,8 +224,8 @@ static int build_maps(partition_t *part)
     for (i = 0; i < le16_to_cpu(part->header.NumEraseUnits); i++) {
 	offset = ((i + le16_to_cpu(part->header.FirstPhysicalEUN))
 		      << part->header.EraseUnitSize);
-	ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &retval,
-			      (unsigned char *)&header);
+	ret = mtd_read(part->mbd.mtd, offset, sizeof(header), &retval,
+                       (unsigned char *)&header);
 
 	if (ret)
 	    goto out_XferInfo;
@@ -289,9 +289,9 @@ static int build_maps(partition_t *part)
 	part->EUNInfo[i].Deleted = 0;
 	offset = part->EUNInfo[i].Offset + le32_to_cpu(header.BAMOffset);
 
-	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
-			      part->BlocksPerUnit * sizeof(uint32_t), &retval,
-			      (unsigned char *)part->bam_cache);
+	ret = mtd_read(part->mbd.mtd, offset,
+                       part->BlocksPerUnit * sizeof(uint32_t), &retval,
+                       (unsigned char *)part->bam_cache);
 
 	if (ret)
 		goto out_bam_cache;
@@ -485,9 +485,9 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 
 	offset = eun->Offset + le32_to_cpu(part->header.BAMOffset);
 
-	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
-			      part->BlocksPerUnit * sizeof(uint32_t),
-			      &retlen, (u_char *) (part->bam_cache));
+	ret = mtd_read(part->mbd.mtd, offset,
+                       part->BlocksPerUnit * sizeof(uint32_t), &retlen,
+                       (u_char *)(part->bam_cache));
 
 	/* mark the cache bad, in case we get an error later */
 	part->bam_index = 0xffff;
@@ -523,8 +523,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 	    break;
 	case BLOCK_DATA:
 	case BLOCK_REPLACEMENT:
-	    ret = part->mbd.mtd->read(part->mbd.mtd, src, SECTOR_SIZE,
-                        &retlen, (u_char *) buf);
+	    ret = mtd_read(part->mbd.mtd, src, SECTOR_SIZE, &retlen,
+                           (u_char *)buf);
 	    if (ret) {
 		printk(KERN_WARNING "ftl: Error reading old xfer unit in copy_erase_unit\n");
 		return ret;
@@ -747,10 +747,11 @@ static uint32_t find_free(partition_t *part)
 	/* Invalidate cache */
 	part->bam_index = 0xffff;
 
-	ret = part->mbd.mtd->read(part->mbd.mtd,
-		       part->EUNInfo[eun].Offset + le32_to_cpu(part->header.BAMOffset),
-		       part->BlocksPerUnit * sizeof(uint32_t),
-		       &retlen, (u_char *) (part->bam_cache));
+	ret = mtd_read(part->mbd.mtd,
+                       part->EUNInfo[eun].Offset + le32_to_cpu(part->header.BAMOffset),
+                       part->BlocksPerUnit * sizeof(uint32_t),
+                       &retlen,
+                       (u_char *)(part->bam_cache));
 
 	if (ret) {
 	    printk(KERN_WARNING"ftl: Error reading BAM in find_free\n");
@@ -810,8 +811,8 @@ static int ftl_read(partition_t *part, caddr_t buffer,
 	else {
 	    offset = (part->EUNInfo[log_addr / bsize].Offset
 			  + (log_addr % bsize));
-	    ret = part->mbd.mtd->read(part->mbd.mtd, offset, SECTOR_SIZE,
-			   &retlen, (u_char *) buffer);
+	    ret = mtd_read(part->mbd.mtd, offset, SECTOR_SIZE, &retlen,
+                           (u_char *)buffer);
 
 	    if (ret) {
 		printk(KERN_WARNING "Error reading MTD device in ftl_read()\n");
@@ -849,8 +850,8 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
 		  le32_to_cpu(part->header.BAMOffset));
 
 #ifdef PSYCHO_DEBUG
-    ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(uint32_t),
-                        &retlen, (u_char *)&old_addr);
+    ret = mtd_read(part->mbd.mtd, offset, sizeof(uint32_t), &retlen,
+                   (u_char *)&old_addr);
     if (ret) {
 	printk(KERN_WARNING"ftl: Error reading old_addr in set_bam_entry: %d\n",ret);
 	return ret;
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index dd034ef..0b038be 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -343,14 +343,17 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 		if (BlockMap[block] == BLOCK_NIL)
 			continue;
 
-		ret = mtd->read(mtd, (inftl->EraseSize * BlockMap[block]) +
-				(block * SECTORSIZE), SECTORSIZE, &retlen,
-				movebuf);
+		ret = mtd_read(mtd,
+			       (inftl->EraseSize * BlockMap[block]) + (block * SECTORSIZE),
+			       SECTORSIZE,
+			       &retlen,
+			       movebuf);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
-			ret = mtd->read(mtd,
-					(inftl->EraseSize * BlockMap[block]) +
-					(block * SECTORSIZE), SECTORSIZE,
-					&retlen, movebuf);
+			ret = mtd_read(mtd,
+				       (inftl->EraseSize * BlockMap[block]) + (block * SECTORSIZE),
+				       SECTORSIZE,
+				       &retlen,
+				       movebuf);
 			if (ret != -EIO)
 				pr_debug("INFTL: error went away on retry?\n");
 		}
@@ -914,7 +917,7 @@ foundit:
 	} else {
 		size_t retlen;
 		loff_t ptr = (thisEUN * inftl->EraseSize) + blockofs;
-		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer);
+		int ret = mtd_read(mtd, ptr, SECTORSIZE, &retlen, buffer);
 
 		/* Handle corrected bit flips gracefully */
 		if (ret < 0 && !mtd_is_bitflip(ret))
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 0d946f1..9bfbca5 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -73,8 +73,8 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		 * Check for BNAND header first. Then whinge if it's found
 		 * but later checks fail.
 		 */
-		ret = mtd->read(mtd, block * inftl->EraseSize,
-				SECTORSIZE, &retlen, buf);
+		ret = mtd_read(mtd, block * inftl->EraseSize, SECTORSIZE,
+			       &retlen, buf);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -118,8 +118,8 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		memcpy(mh, buf, sizeof(struct INFTLMediaHeader));
 
 		/* Read the spare media header at offset 4096 */
-		mtd->read(mtd, block * inftl->EraseSize + 4096,
-			  SECTORSIZE, &retlen, buf);
+		mtd_read(mtd, block * inftl->EraseSize + 4096, SECTORSIZE,
+			 &retlen, buf);
 		if (retlen != SECTORSIZE) {
 			printk(KERN_WARNING "INFTL: Unable to read spare "
 			       "Media Header\n");
@@ -342,7 +342,7 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	int i;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 9b01cb0..b0644d2 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -184,8 +184,8 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 			    mtdblk->cache_offset != sect_start) {
 				/* fill the cache with the current sector */
 				mtdblk->cache_state = STATE_EMPTY;
-				ret = mtd->read(mtd, sect_start, sect_size,
-						&retlen, mtdblk->cache_data);
+				ret = mtd_read(mtd, sect_start, sect_size,
+					       &retlen, mtdblk->cache_data);
 				if (ret)
 					return ret;
 				if (retlen != sect_size)
@@ -222,7 +222,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 			mtd->name, pos, len);
 
 	if (!sect_size)
-		return mtd->read(mtd, pos, len, &retlen, buf);
+		return mtd_read(mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -241,7 +241,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 		    mtdblk->cache_offset == sect_start) {
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
-			ret = mtd->read(mtd, pos, size, &retlen, buf);
+			ret = mtd_read(mtd, pos, size, &retlen, buf);
 			if (ret)
 				return ret;
 			if (retlen != size)
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 0470a6e..f5737b1 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -30,7 +30,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 {
 	size_t retlen;
 
-	if (dev->mtd->read(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (mtd_read(dev->mtd, (block * 512), 512, &retlen, buf))
 		return 1;
 	return 0;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c51f04a..c7f4846 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -232,7 +232,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 			break;
 		}
 		default:
-			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd_read(mtd, *ppos, len, &retlen, kbuf);
 		}
 		/* Nand returns -EBADMSG on ECC errors, but it returns
 		 * the data. For our userspace tools it is important
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index b3895cf..4546034 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -91,7 +91,7 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 			/* Entire transaction goes into this subdev */
 			size = len;
 
-		err = subdev->read(subdev, from, size, &retsize, buf);
+		err = mtd_read(subdev, from, size, &retsize, buf);
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 9b2d863..23629ad 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -258,8 +258,8 @@ static void find_next_position(struct mtdoops_context *cxt)
 			continue;
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
-				&retlen, (u_char *) &count[0]);
+		ret = mtd_read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
+			       &retlen, (u_char *)&count[0]);
 		if (retlen != MTDOOPS_HEADER_SIZE ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
 			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 55a9cb5..59cd797 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -70,8 +70,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 		len = 0;
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
-	res = part->master->read(part->master, from + part->offset,
-				   len, retlen, buf);
+	res = mtd_read(part->master, from + part->offset, len, retlen, buf);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 4e12875..b3282d2 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -736,7 +736,7 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf);
+	ret = mtd_read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf);
 
 	if (ret < 0 && !mtd_is_bitflip(ret)) {
 		oldeb = d->eb_data + oldblock / d->pages_per_eblk;
@@ -1161,7 +1161,7 @@ static int mtdswap_readsect(struct mtd_blktrans_dev *dev,
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf);
+	ret = mtd_read(mtd, readpos, PAGE_SIZE, &retlen, buf);
 
 	d->mtd_read_count++;
 	if (mtd_is_bitflip(ret)) {
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 5780dba..df921e7 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1072,7 +1072,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	size_t retlen;
 
 	for (offs = 0; offs < mtd->size; offs += mtd->erasesize) {
-		ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+		ret = mtd_read(mtd, offs, mtd->writesize, &retlen, buf);
 		if (retlen != mtd->writesize)
 			continue;
 		if (ret) {
@@ -1097,7 +1097,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	/* Only one mediaheader was found.  We want buf to contain a
 	   mediaheader on return, so we'll have to re-read the one we found. */
 	offs = doc->mh0_page << this->page_shift;
-	ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+	ret = mtd_read(mtd, offs, mtd->writesize, &retlen, buf);
 	if (retlen != mtd->writesize) {
 		/* Insanity.  Give up. */
 		printk(KERN_ERR "Read DiskOnChip Media Header once, but can't reread it???\n");
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 69148ae..1bcd6bc 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -201,7 +201,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 			from += marker_len;
 			marker_len = 0;
 		}
-		res = mtd->read(mtd, from, len, &retlen, buf);
+		res = mtd_read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
 				pr_info("nand_bbt: ECC error in BBT at "
@@ -298,7 +298,7 @@ static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	if (td->options & NAND_BBT_VERSION)
 		len++;
 
-	return mtd->read(mtd, offs, len, &retlen, buf);
+	return mtd_read(mtd, offs, len, &retlen, buf);
 }
 
 /* Scan read raw data from flash */
@@ -756,7 +756,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			/* Make it block aligned */
 			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
 			len = 1 << this->bbt_erase_shift;
-			res = mtd->read(mtd, to, len, &retlen, buf);
+			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
 					pr_info("nand_bbt: error reading block "
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index cda77b5..1a9d9c1 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -423,12 +423,17 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 		if (BlockMap[block] == BLOCK_NIL)
 			continue;
 
-		ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block]) + (block * 512),
-				512, &retlen, movebuf);
+		ret = mtd_read(mtd,
+			       (nftl->EraseSize * BlockMap[block]) + (block * 512),
+			       512,
+			       &retlen,
+			       movebuf);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
-			ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block])
-					+ (block * 512), 512, &retlen,
-					movebuf);
+			ret = mtd_read(mtd,
+				       (nftl->EraseSize * BlockMap[block]) + (block * 512),
+				       512,
+				       &retlen,
+				       movebuf);
 			if (ret != -EIO)
 				printk("Error went away on retry.\n");
 		}
@@ -771,7 +776,7 @@ static int nftl_readblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 	} else {
 		loff_t ptr = (lastgoodEUN * nftl->EraseSize) + blockofs;
 		size_t retlen;
-		int res = mtd->read(mtd, ptr, 512, &retlen, buffer);
+		int res = mtd_read(mtd, ptr, 512, &retlen, buffer);
 
 		if (res < 0 && !mtd_is_bitflip(res))
 			return -EIO;
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 9164a56..b068dc8 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -63,8 +63,8 @@ static int find_boot_record(struct NFTLrecord *nftl)
 
 		/* Check for ANAND header first. Then can whinge if it's found but later
 		   checks fail */
-		ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				&retlen, buf);
+		ret = mtd_read(mtd, block * nftl->EraseSize, SECTORSIZE,
+			       &retlen, buf);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -274,7 +274,7 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 	int i;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index e366b1d..623d9b8 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -104,8 +104,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	printk(KERN_NOTICE "Searching for RedBoot partition table in %s at offset 0x%lx\n",
 	       master->name, offset);
 
-	ret = master->read(master, offset,
-			   master->erasesize, &retlen, (void *)buf);
+	ret = mtd_read(master, offset, master->erasesize, &retlen,
+		       (void *)buf);
 
 	if (ret)
 		goto out;
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 39de872..d9fe2d0 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -200,9 +200,9 @@ static int scan_header(struct partition *part)
 		part->sector_map[i] = -1;
 
 	for (i=0, blocks_found=0; i<part->total_blocks; i++) {
-		rc = part->mbd.mtd->read(part->mbd.mtd,
-				i * part->block_size, part->header_size,
-				&retlen, (u_char*)part->header_cache);
+		rc = mtd_read(part->mbd.mtd, i * part->block_size,
+			      part->header_size, &retlen,
+			      (u_char *)part->header_cache);
 
 		if (!rc && retlen != part->header_size)
 			rc = -EIO;
@@ -250,8 +250,8 @@ static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *b
 
 	addr = part->sector_map[sector];
 	if (addr != -1) {
-		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
-						&retlen, (u_char*)buf);
+		rc = mtd_read(part->mbd.mtd, addr, SECTOR_SIZE, &retlen,
+			      (u_char *)buf);
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
 
@@ -372,9 +372,8 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 	if (!map)
 		goto err2;
 
-	rc = part->mbd.mtd->read(part->mbd.mtd,
-		part->blocks[block_no].offset, part->header_size,
-		&retlen, (u_char*)map);
+	rc = mtd_read(part->mbd.mtd, part->blocks[block_no].offset,
+		      part->header_size, &retlen, (u_char *)map);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
@@ -413,8 +412,8 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 			}
 			continue;
 		}
-		rc = part->mbd.mtd->read(part->mbd.mtd, addr,
-			SECTOR_SIZE, &retlen, sector_data);
+		rc = mtd_read(part->mbd.mtd, addr, SECTOR_SIZE, &retlen,
+			      sector_data);
 
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
@@ -563,8 +562,9 @@ static int find_writable_block(struct partition *part, u_long *old_sector)
 		}
 	}
 
-	rc = part->mbd.mtd->read(part->mbd.mtd, part->blocks[block].offset,
-		part->header_size, &retlen, (u_char*)part->header_cache);
+	rc = mtd_read(part->mbd.mtd, part->blocks[block].offset,
+		      part->header_size, &retlen,
+		      (u_char *)part->header_cache);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 976e3d2..293e22a 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -123,8 +123,8 @@ static int get_valid_cis_sector(struct mtd_info *mtd)
 	 */
 	for (k = 0, offset = 0; k < 4; k++, offset += mtd->erasesize) {
 		if (!mtd->block_isbad(mtd, offset)) {
-			ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen,
-				sect_buf);
+			ret = mtd_read(mtd, offset, SECTOR_SIZE, &retlen,
+				       sect_buf);
 
 			/* CIS pattern match on the sector buffer */
 			if (ret < 0 || retlen != SECTOR_SIZE) {
@@ -156,7 +156,7 @@ static int read_physical_sector(struct mtd_info *mtd, uint8_t *sect_buf,
 	size_t retlen;
 	loff_t offset = (loff_t)sect_no << SECTOR_SHIFT;
 
-	ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
+	ret = mtd_read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
 	if (ret < 0 || retlen != SECTOR_SIZE)
 		return -1;
 
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 271819f..6d62e24 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -127,7 +127,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, mtd->erasesize);
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd_read(mtd, addr0, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -135,7 +135,7 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd_read(mtd, addrn - bufsize, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -145,7 +145,7 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd_read(mtd, addr, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -163,7 +163,7 @@ static int verify_eraseblock(int ebnum)
 	if (addr <= addrn - pgsize - pgsize && !bbt[ebnum + 1]) {
 		unsigned long oldnext = next;
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd_read(mtd, addr0, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -171,7 +171,7 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd_read(mtd, addrn - bufsize, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -181,7 +181,7 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd_read(mtd, addr, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -230,7 +230,7 @@ static int crosstest(void)
 	/* Read 2nd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd_read(mtd, addr, pgsize, &read, pp1);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -243,7 +243,7 @@ static int crosstest(void)
 	/* Read 3rd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd_read(mtd, addr, pgsize, &read, pp1);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -257,7 +257,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp2);
+	err = mtd_read(mtd, addr, pgsize, &read, pp2);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -271,7 +271,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addrn - pgsize;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp3);
+	err = mtd_read(mtd, addr, pgsize, &read, pp3);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -285,7 +285,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp4);
+	err = mtd_read(mtd, addr, pgsize, &read, pp4);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -344,7 +344,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -382,7 +382,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -438,7 +438,7 @@ static int erasetest(void)
 		return err;
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
-	err = mtd->read(mtd, addr0, pgsize, &read, twopages);
+	err = mtd_read(mtd, addr0, pgsize, &read, twopages);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 550fe51..0c58d29 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -52,7 +52,7 @@ static int read_eraseblock_by_page(int ebnum)
 
 	for (i = 0; i < pgcnt; i++) {
 		memset(buf, 0 , pgcnt);
-		ret = mtd->read(mtd, addr, pgsize, &read, buf);
+		ret = mtd_read(mtd, addr, pgsize, &read, buf);
 		if (ret == -EUCLEAN)
 			ret = 0;
 		if (ret || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index f67a65e..3c9529b 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -214,7 +214,7 @@ static int read_eraseblock(int ebnum)
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf);
+	err = mtd_read(mtd, addr, mtd->erasesize, &read, iobuf);
 	/* Ignore corrected ECC errors */
 	if (mtd_is_bitflip(err))
 		err = 0;
@@ -235,7 +235,7 @@ static int read_eraseblock_by_page(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		err = mtd_read(mtd, addr, pgsize, &read, buf);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -261,7 +261,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
-		err = mtd->read(mtd, addr, sz, &read, buf);
+		err = mtd_read(mtd, addr, sz, &read, buf);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -276,7 +276,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		err = mtd_read(mtd, addr, pgsize, &read, buf);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index a204a9f..83a8437 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -153,7 +153,7 @@ static int do_read(void)
 			len = mtd->erasesize - offs;
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd->read(mtd, addr, len, &read, readbuf);
+	err = mtd_read(mtd, addr, len, &read, readbuf);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (unlikely(err || read != len)) {
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 16d0c05..d81f89a 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -196,7 +196,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -224,7 +224,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -262,7 +262,7 @@ static int verify_eraseblock2(int ebnum)
 		set_random_data(writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf);
+		err = mtd_read(mtd, addr, subpgsize * k, &read, readbuf);
 		if (unlikely(err || read != subpgsize * k)) {
 			if (mtd_is_bitflip(err) && read == subpgsize * k) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -296,7 +296,7 @@ static int verify_eraseblock_ff(int ebnum)
 	for (j = 0; j < mtd->erasesize / subpgsize; ++j) {
 		clear_data(readbuf, subpgsize);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+		err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 		if (unlikely(err || read != subpgsize)) {
 			if (mtd_is_bitflip(err) && read == subpgsize) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 102c79b..ecc68bf 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -137,7 +137,7 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 	}
 
 retry:
-	err = mtd->read(mtd, addr, len, &read, check_buf);
+	err = mtd_read(mtd, addr, len, &read, check_buf);
 	if (mtd_is_bitflip(err))
 		printk(PRINT_PREF "single bit flip occurred at EB %d "
 		       "MTD reported that it was fixed.\n", ebnum);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index ab80c0d..e2cdebf 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -216,7 +216,7 @@ void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len)
 	buf = vmalloc(len);
 	if (!buf)
 		return;
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err && err != -EUCLEAN) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b6c8959..4333829 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -170,7 +170,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -1357,7 +1357,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1);
+	err = mtd_read(ubi->mtd, addr, len, &read, buf1);
 	if (err && !mtd_is_bitflip(err))
 		goto out_free;
 
@@ -1421,7 +1421,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err && !mtd_is_bitflip(err)) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index d638faf..eccd08d 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -283,9 +283,11 @@ u16 mtd_Read_Page_Main(u8 *read_data, u32 Block,
 
 
 	while (PageCount) {
-		ret = spectra_mtd->read(spectra_mtd,
-					(Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
-					DeviceInfo.wPageDataSize, &retlen, read_data);
+		ret = mtd_read(spectra_mtd,
+			       (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
+			       DeviceInfo.wPageDataSize,
+			       &retlen,
+			       read_data);
 		if (ret) {
 			printk(KERN_ERR "%s failed %d\n", __func__, ret);
 			return FAIL;
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index ffdf4fc..c59d642 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -381,7 +381,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 
 		*bad_offset = ofs;
 
-		ret = c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
+		ret = mtd_read(c->mtd, ofs, readlen, &retlen, ebuf);
 		if (ret) {
 			printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. Putting on bad_list\n", ofs, ret);
 			ret = -EIO;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index b09e51d..a24d3d2 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -228,7 +228,7 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 	size_t retlen;
 	char *eccstr;
 
-	ret = c->mtd->read(c->mtd, ofs, c->wbuf_pagesize, &retlen, c->wbuf_verify);
+	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, c->wbuf_verify);
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		printk(KERN_WARNING "jffs2_verify_write(): Read back of page at %08x failed: %d\n", c->wbuf_ofs, ret);
 		return ret;
@@ -337,7 +337,8 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 		}
 
 		/* Do the read... */
-		ret = c->mtd->read(c->mtd, start, c->wbuf_ofs - start, &retlen, buf);
+		ret = mtd_read(c->mtd, start, c->wbuf_ofs - start, &retlen,
+			       buf);
 
 		/* ECC recovered ? */
 		if ((ret == -EUCLEAN || ret == -EBADMSG) &&
@@ -948,11 +949,11 @@ int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *re
 	int	ret;
 
 	if (!jffs2_is_writebuffered(c))
-		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
+		return mtd_read(c->mtd, ofs, len, retlen, buf);
 
 	/* Read flash */
 	down_read(&c->wbuf_sem);
-	ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
+	ret = mtd_read(c->mtd, ofs, len, retlen, buf);
 
 	if ( (ret == -EBADMSG || ret == -EUCLEAN) && (*retlen == len) ) {
 		if (ret == -EBADMSG)
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 0463628..3ee6435 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -20,7 +20,7 @@ static int logfs_mtd_read(struct super_block *sb, loff_t ofs, size_t len,
 	size_t retlen;
 	int ret;
 
-	ret = mtd->read(mtd, ofs, len, &retlen, buf);
+	ret = mtd_read(mtd, ofs, len, &retlen, buf);
 	BUG_ON(ret == -EINVAL);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f38e827..56478eb 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -182,6 +182,8 @@ struct mtd_info {
 					    unsigned long len,
 					    unsigned long offset,
 					    unsigned long flags);
+	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
+		     size_t *retlen, u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -189,7 +191,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 
-	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
 	/* In blackbox flight recorder like scenarios we want to make successful
@@ -301,6 +302,12 @@ static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
 	return mtd->get_unmapped_area(mtd, len, offset, flags);
 }
 
+static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf)
+{
+	return mtd->read(mtd, from, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
