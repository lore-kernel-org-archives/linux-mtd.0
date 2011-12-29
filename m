Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFA-0004RG-Lp
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:00 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 08/27] mtd: introduce mtd_write interface
Date: Thu, 29 Dec 2011 11:27:12 +0200
Message-Id: <1325150851-2805-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
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
 drivers/mtd/chips/cfi_cmdset_0020.c |    8 +++++---
 drivers/mtd/ftl.c                   |   35 ++++++++++++++++++-----------------
 drivers/mtd/mtdblock.c              |    4 ++--
 drivers/mtd/mtdblock_ro.c           |    2 +-
 drivers/mtd/mtdconcat.c             |    2 +-
 drivers/mtd/mtdcore.c               |    3 ++-
 drivers/mtd/mtdoops.c               |    4 ++--
 drivers/mtd/mtdpart.c               |    3 +--
 drivers/mtd/mtdswap.c               |    2 +-
 drivers/mtd/rfd_ftl.c               |   17 ++++++++---------
 drivers/mtd/tests/mtd_pagetest.c    |    8 ++++----
 drivers/mtd/tests/mtd_speedtest.c   |    8 ++++----
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    6 +++---
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/io.c                |    7 +++----
 drivers/staging/spectra/lld_mtd.c   |    8 +++++---
 fs/jffs2/wbuf.c                     |   18 +++++++++---------
 fs/jffs2/writev.c                   |    5 +++--
 fs/logfs/dev_mtd.c                  |    2 +-
 include/linux/mtd/mtd.h             |    9 ++++++++-
 21 files changed, 83 insertions(+), 72 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 666c52f..85e8018 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -699,7 +699,8 @@ cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 				continue;
 			}
 			memcpy(buffer+buflen, elem_base, ECCBUF_SIZE-buflen);
-			ret = mtd->write(mtd, to, ECCBUF_SIZE, &thislen, buffer);
+			ret = mtd_write(mtd, to, ECCBUF_SIZE, &thislen,
+					buffer);
 			totlen += thislen;
 			if (ret || thislen != ECCBUF_SIZE)
 				goto write_error;
@@ -708,7 +709,8 @@ cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 			to += ECCBUF_SIZE;
 		}
 		if (ECCBUF_DIV(elem_len)) { /* write clean aligned data */
-			ret = mtd->write(mtd, to, ECCBUF_DIV(elem_len), &thislen, elem_base);
+			ret = mtd_write(mtd, to, ECCBUF_DIV(elem_len),
+					&thislen, elem_base);
 			totlen += thislen;
 			if (ret || thislen != ECCBUF_DIV(elem_len))
 				goto write_error;
@@ -722,7 +724,7 @@ cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	}
 	if (buflen) { /* flush last page, even if not full */
 		/* This is sometimes intended behaviour, really */
-		ret = mtd->write(mtd, to, buflen, &thislen, buffer);
+		ret = mtd_write(mtd, to, buflen, &thislen, buffer);
 		totlen += thislen;
 		if (ret || thislen != ECCBUF_SIZE)
 			goto write_error;
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 12fd7eb..d591b1d 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -422,8 +422,8 @@ static int prepare_xfer(partition_t *part, int i)
     header.LogicalEUN = cpu_to_le16(0xffff);
     header.EraseCount = cpu_to_le32(xfer->EraseCount);
 
-    ret = part->mbd.mtd->write(part->mbd.mtd, xfer->Offset, sizeof(header),
-			   &retlen, (u_char *)&header);
+    ret = mtd_write(part->mbd.mtd, xfer->Offset, sizeof(header), &retlen,
+                    (u_char *)&header);
 
     if (ret) {
 	return ret;
@@ -438,8 +438,8 @@ static int prepare_xfer(partition_t *part, int i)
 
     for (i = 0; i < nbam; i++, offset += sizeof(uint32_t)) {
 
-	ret = part->mbd.mtd->write(part->mbd.mtd, offset, sizeof(uint32_t),
-			       &retlen, (u_char *)&ctl);
+	ret = mtd_write(part->mbd.mtd, offset, sizeof(uint32_t), &retlen,
+                        (u_char *)&ctl);
 
 	if (ret)
 	    return ret;
@@ -503,8 +503,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
     offset = xfer->Offset + 20; /* Bad! */
     unit = cpu_to_le16(0x7fff);
 
-    ret = part->mbd.mtd->write(part->mbd.mtd, offset, sizeof(uint16_t),
-			   &retlen, (u_char *) &unit);
+    ret = mtd_write(part->mbd.mtd, offset, sizeof(uint16_t), &retlen,
+                    (u_char *)&unit);
 
     if (ret) {
 	printk( KERN_WARNING "ftl: Failed to write back to BAM cache in copy_erase_unit()!\n");
@@ -531,8 +531,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
             }
 
 
-	    ret = part->mbd.mtd->write(part->mbd.mtd, dest, SECTOR_SIZE,
-                        &retlen, (u_char *) buf);
+	    ret = mtd_write(part->mbd.mtd, dest, SECTOR_SIZE, &retlen,
+                            (u_char *)buf);
 	    if (ret)  {
 		printk(KERN_WARNING "ftl: Error writing new xfer unit in copy_erase_unit\n");
 		return ret;
@@ -550,9 +550,11 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
     }
 
     /* Write the BAM to the transfer unit */
-    ret = part->mbd.mtd->write(part->mbd.mtd, xfer->Offset + le32_to_cpu(part->header.BAMOffset),
-                    part->BlocksPerUnit * sizeof(int32_t), &retlen,
-		    (u_char *)part->bam_cache);
+    ret = mtd_write(part->mbd.mtd,
+                    xfer->Offset + le32_to_cpu(part->header.BAMOffset),
+                    part->BlocksPerUnit * sizeof(int32_t),
+                    &retlen,
+                    (u_char *)part->bam_cache);
     if (ret) {
 	printk( KERN_WARNING "ftl: Error writing BAM in copy_erase_unit\n");
 	return ret;
@@ -560,8 +562,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 
 
     /* All clear? Then update the LogicalEUN again */
-    ret = part->mbd.mtd->write(part->mbd.mtd, xfer->Offset + 20, sizeof(uint16_t),
-			   &retlen, (u_char *)&srcunitswap);
+    ret = mtd_write(part->mbd.mtd, xfer->Offset + 20, sizeof(uint16_t),
+                    &retlen, (u_char *)&srcunitswap);
 
     if (ret) {
 	printk(KERN_WARNING "ftl: Error writing new LogicalEUN in copy_erase_unit\n");
@@ -887,8 +889,8 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
 #endif
 	part->bam_cache[blk] = le_virt_addr;
     }
-    ret = part->mbd.mtd->write(part->mbd.mtd, offset, sizeof(uint32_t),
-                            &retlen, (u_char *)&le_virt_addr);
+    ret = mtd_write(part->mbd.mtd, offset, sizeof(uint32_t), &retlen,
+                    (u_char *)&le_virt_addr);
 
     if (ret) {
 	printk(KERN_NOTICE "ftl_cs: set_bam_entry() failed!\n");
@@ -947,8 +949,7 @@ static int ftl_write(partition_t *part, caddr_t buffer,
 	part->EUNInfo[part->bam_index].Deleted++;
 	offset = (part->EUNInfo[part->bam_index].Offset +
 		      blk * SECTOR_SIZE);
-	ret = part->mbd.mtd->write(part->mbd.mtd, offset, SECTOR_SIZE, &retlen,
-                                     buffer);
+	ret = mtd_write(part->mbd.mtd, offset, SECTOR_SIZE, &retlen, buffer);
 
 	if (ret) {
 	    printk(KERN_NOTICE "ftl_cs: block write failed!\n");
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index b0644d2..ac7f1f1 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -102,7 +102,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	 * Next, write the data to flash.
 	 */
 
-	ret = mtd->write(mtd, pos, len, &retlen, buf);
+	ret = mtd_write(mtd, pos, len, &retlen, buf);
 	if (ret)
 		return ret;
 	if (retlen != len)
@@ -152,7 +152,7 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 		mtd->name, pos, len);
 
 	if (!sect_size)
-		return mtd->write(mtd, pos, len, &retlen, buf);
+		return mtd_write(mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index f5737b1..92759a9 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -40,7 +40,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 {
 	size_t retlen;
 
-	if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (mtd_write(dev->mtd, (block * 512), 512, &retlen, buf))
 		return 1;
 	return 0;
 }
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 4546034..4521550 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -148,7 +148,7 @@ concat_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (!(subdev->flags & MTD_WRITEABLE))
 			err = -EROFS;
 		else
-			err = subdev->write(subdev, to, size, &retsize, buf);
+			err = mtd_write(subdev, to, size, &retsize, buf);
 
 		if (err)
 			break;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b01993e..e36191a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -699,7 +699,8 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		for (i=0; i<count; i++) {
 			if (!vecs[i].iov_len)
 				continue;
-			ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+			ret = mtd_write(mtd, to, vecs[i].iov_len, &thislen,
+					vecs[i].iov_base);
 			totlen += thislen;
 			if (ret || thislen != vecs[i].iov_len)
 				break;
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 23629ad..9c9d586 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -225,8 +225,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		ret = mtd->panic_write(mtd, cxt->nextpage * record_size,
 					record_size, &retlen, cxt->oops_buf);
 	else
-		ret = mtd->write(mtd, cxt->nextpage * record_size,
-					record_size, &retlen, cxt->oops_buf);
+		ret = mtd_write(mtd, cxt->nextpage * record_size,
+				record_size, &retlen, cxt->oops_buf);
 
 	if (retlen != record_size || ret < 0)
 		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), error %d\n",
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 59cd797..96574a0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -188,8 +188,7 @@ static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->write(part->master, to + part->offset,
-				    len, retlen, buf);
+	return mtd_write(part->master, to + part->offset, len, retlen, buf);
 }
 
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index b3282d2..6ff823e 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -689,7 +689,7 @@ retry:
 		return ret;
 
 	writepos = (loff_t)*bp << PAGE_SHIFT;
-	ret =  mtd->write(mtd, writepos, PAGE_SIZE, &retlen, buf);
+	ret =  mtd_write(mtd, writepos, PAGE_SIZE, &retlen, buf);
 	if (ret == -EIO || mtd_is_eccerr(ret)) {
 		d->curr_write_pos--;
 		eb->active_count--;
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index d9fe2d0..c594bb7 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -304,9 +304,8 @@ static void erase_callback(struct erase_info *erase)
 	part->blocks[i].used_sectors = 0;
 	part->blocks[i].erases++;
 
-	rc = part->mbd.mtd->write(part->mbd.mtd,
-		part->blocks[i].offset, sizeof(magic), &retlen,
-		(u_char*)&magic);
+	rc = mtd_write(part->mbd.mtd, part->blocks[i].offset, sizeof(magic),
+		       &retlen, (u_char *)&magic);
 
 	if (!rc && retlen != sizeof(magic))
 		rc = -EIO;
@@ -595,8 +594,8 @@ static int mark_sector_deleted(struct partition *part, u_long old_addr)
 
 	addr = part->blocks[block].offset +
 			(HEADER_MAP_OFFSET + offset) * sizeof(u16);
-	rc = part->mbd.mtd->write(part->mbd.mtd, addr,
-		sizeof(del), &retlen, (u_char*)&del);
+	rc = mtd_write(part->mbd.mtd, addr, sizeof(del), &retlen,
+		       (u_char *)&del);
 
 	if (!rc && retlen != sizeof(del))
 		rc = -EIO;
@@ -668,8 +667,8 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 
 	addr = (i + part->header_sectors_per_block) * SECTOR_SIZE +
 		block->offset;
-	rc = part->mbd.mtd->write(part->mbd.mtd,
-		addr, SECTOR_SIZE, &retlen, (u_char*)buf);
+	rc = mtd_write(part->mbd.mtd, addr, SECTOR_SIZE, &retlen,
+		       (u_char *)buf);
 
 	if (!rc && retlen != SECTOR_SIZE)
 		rc = -EIO;
@@ -688,8 +687,8 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	part->header_cache[i + HEADER_MAP_OFFSET] = entry;
 
 	addr = block->offset + (HEADER_MAP_OFFSET + i) * sizeof(u16);
-	rc = part->mbd.mtd->write(part->mbd.mtd, addr,
-			sizeof(entry), &retlen, (u_char*)&entry);
+	rc = mtd_write(part->mbd.mtd, addr, sizeof(entry), &retlen,
+		       (u_char *)&entry);
 
 	if (!rc && retlen != sizeof(entry))
 		rc = -EIO;
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 6d62e24..83da97e 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -100,7 +100,7 @@ static int write_eraseblock(int ebnum)
 
 	set_random_data(writebuf, mtd->erasesize);
 	cond_resched();
-	err = mtd->write(mtd, addr, mtd->erasesize, &written, writebuf);
+	err = mtd_write(mtd, addr, mtd->erasesize, &written, writebuf);
 	if (err || written != mtd->erasesize)
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr);
@@ -335,7 +335,7 @@ static int erasecrosstest(void)
 	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
-	err = mtd->write(mtd, addr0, pgsize, &written, writebuf);
+	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr0);
@@ -368,7 +368,7 @@ static int erasecrosstest(void)
 	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
-	err = mtd->write(mtd, addr0, pgsize, &written, writebuf);
+	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr0);
@@ -425,7 +425,7 @@ static int erasetest(void)
 
 	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
-	err = mtd->write(mtd, addr0, pgsize, &written, writebuf);
+	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr0);
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 3c9529b..c7b18e1 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -143,7 +143,7 @@ static int write_eraseblock(int ebnum)
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtd->write(mtd, addr, mtd->erasesize, &written, iobuf);
+	err = mtd_write(mtd, addr, mtd->erasesize, &written, iobuf);
 	if (err || written != mtd->erasesize) {
 		printk(PRINT_PREF "error: write failed at %#llx\n", addr);
 		if (!err)
@@ -161,7 +161,7 @@ static int write_eraseblock_by_page(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd->write(mtd, addr, pgsize, &written, buf);
+		err = mtd_write(mtd, addr, pgsize, &written, buf);
 		if (err || written != pgsize) {
 			printk(PRINT_PREF "error: write failed at %#llx\n",
 			       addr);
@@ -184,7 +184,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
-		err = mtd->write(mtd, addr, sz, &written, buf);
+		err = mtd_write(mtd, addr, sz, &written, buf);
 		if (err || written != sz) {
 			printk(PRINT_PREF "error: write failed at %#llx\n",
 			       addr);
@@ -196,7 +196,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd->write(mtd, addr, pgsize, &written, buf);
+		err = mtd_write(mtd, addr, pgsize, &written, buf);
 		if (err || written != pgsize) {
 			printk(PRINT_PREF "error: write failed at %#llx\n",
 			       addr);
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 83a8437..f8aac4b 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -192,7 +192,7 @@ static int do_write(void)
 		}
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd->write(mtd, addr, len, &written, writebuf);
+	err = mtd_write(mtd, addr, len, &written, writebuf);
 	if (unlikely(err || written != len)) {
 		printk(PRINT_PREF "error: write failed at 0x%llx\n",
 		       (long long)addr);
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index d81f89a..b90c010 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -120,7 +120,7 @@ static int write_eraseblock(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 
 	set_random_data(writebuf, subpgsize);
-	err = mtd->write(mtd, addr, subpgsize, &written, writebuf);
+	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr);
@@ -134,7 +134,7 @@ static int write_eraseblock(int ebnum)
 	addr += subpgsize;
 
 	set_random_data(writebuf, subpgsize);
-	err = mtd->write(mtd, addr, subpgsize, &written, writebuf);
+	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
 		       (long long)addr);
@@ -158,7 +158,7 @@ static int write_eraseblock2(int ebnum)
 		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
 			break;
 		set_random_data(writebuf, subpgsize * k);
-		err = mtd->write(mtd, addr, subpgsize * k, &written, writebuf);
+		err = mtd_write(mtd, addr, subpgsize * k, &written, writebuf);
 		if (unlikely(err || written != subpgsize * k)) {
 			printk(PRINT_PREF "error: write failed at %#llx\n",
 			       (long long)addr);
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index ecc68bf..dd34a51 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -189,7 +189,7 @@ static inline int write_pattern(int ebnum, void *buf)
 		addr = (ebnum + 1) * mtd->erasesize - pgcnt * pgsize;
 		len = pgcnt * pgsize;
 	}
-	err = mtd->write(mtd, addr, len, &written, buf);
+	err = mtd_write(mtd, addr, len, &written, buf);
 	if (err) {
 		printk(PRINT_PREF "error %d while writing EB %d, written %zd"
 		      " bytes\n", err, ebnum, written);
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 4333829..8d832fc 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -289,7 +289,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
-	err = ubi->mtd->write(ubi->mtd, addr, len, &written, buf);
+	err = mtd_write(ubi->mtd, addr, len, &written, buf);
 	if (err) {
 		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
 			"%zd bytes", err, len, pnum, offset, written);
@@ -525,11 +525,10 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * the header comment in scan.c for more information).
 	 */
 	addr = (loff_t)pnum * ubi->peb_size;
-	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
+	err = mtd_write(ubi->mtd, addr, 4, &written, (void *)&data);
 	if (!err) {
 		addr += ubi->vid_hdr_aloffset;
-		err = ubi->mtd->write(ubi->mtd, addr, 4, &written,
-				      (void *)&data);
+		err = mtd_write(ubi->mtd, addr, 4, &written, (void *)&data);
 		if (!err)
 			return 0;
 	}
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index eccd08d..2eb0321 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -233,9 +233,11 @@ u16 mtd_Write_Page_Main(u8 *write_data, u32 Block,
 
 
 	while (PageCount) {
-		ret = spectra_mtd->write(spectra_mtd,
-					 (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
-					 DeviceInfo.wPageDataSize, &retlen, write_data);
+		ret = mtd_write(spectra_mtd,
+				(Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
+				DeviceInfo.wPageDataSize,
+				&retlen,
+				write_data);
 		if (ret) {
 			printk(KERN_ERR "%s failed %d\n", __func__, ret);
 			return FAIL;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index a24d3d2..3ea2f8d 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -414,13 +414,12 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 		if (breakme++ == 20) {
 			printk(KERN_NOTICE "Faking write error at 0x%08x\n", ofs);
 			breakme = 0;
-			c->mtd->write(c->mtd, ofs, towrite, &retlen,
-				      brokenbuf);
+			mtd_write(c->mtd, ofs, towrite, &retlen, brokenbuf);
 			ret = -EIO;
 		} else
 #endif
-			ret = c->mtd->write(c->mtd, ofs, towrite, &retlen,
-					    rewrite_buf);
+			ret = mtd_write(c->mtd, ofs, towrite, &retlen,
+					rewrite_buf);
 
 		if (ret || retlen != towrite || jffs2_verify_write(c, rewrite_buf, ofs)) {
 			/* Argh. We tried. Really we did. */
@@ -620,13 +619,14 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
 	if (breakme++ == 20) {
 		printk(KERN_NOTICE "Faking write error at 0x%08x\n", c->wbuf_ofs);
 		breakme = 0;
-		c->mtd->write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen,
-			      brokenbuf);
+		mtd_write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen,
+			  brokenbuf);
 		ret = -EIO;
 	} else
 #endif
 
-		ret = c->mtd->write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen, c->wbuf);
+		ret = mtd_write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize,
+				&retlen, c->wbuf);
 
 	if (ret) {
 		printk(KERN_WARNING "jffs2_flush_wbuf(): Write failed with %d\n", ret);
@@ -862,8 +862,8 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
 		v += wbuf_retlen;
 
 		if (vlen >= c->wbuf_pagesize) {
-			ret = c->mtd->write(c->mtd, outvec_to, PAGE_DIV(vlen),
-					    &wbuf_retlen, v);
+			ret = mtd_write(c->mtd, outvec_to, PAGE_DIV(vlen),
+					&wbuf_retlen, v);
 			if (ret < 0 || wbuf_retlen != PAGE_DIV(vlen))
 				goto outfile;
 
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index b9276b1..b05710f 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -26,7 +26,8 @@ static inline int mtd_fake_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	for (i=0; i<count; i++) {
 		if (!vecs[i].iov_len)
 			continue;
-		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+		ret = mtd_write(mtd, to, vecs[i].iov_len, &thislen,
+				vecs[i].iov_base);
 		totlen += thislen;
 		if (ret || thislen != vecs[i].iov_len)
 			break;
@@ -61,7 +62,7 @@ int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	int ret;
-	ret = c->mtd->write(c->mtd, ofs, len, retlen, buf);
+	ret = mtd_write(c->mtd, ofs, len, retlen, buf);
 
 	if (jffs2_sum_active()) {
 		struct kvec vecs[1];
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 3ee6435..1842440 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -49,7 +49,7 @@ static int loffs_mtd_write(struct super_block *sb, loff_t ofs, size_t len,
 	BUG_ON(len > PAGE_CACHE_SIZE);
 	page_start = ofs & PAGE_CACHE_MASK;
 	page_end = PAGE_CACHE_ALIGN(ofs + len) - 1;
-	ret = mtd->write(mtd, ofs, len, &retlen, buf);
+	ret = mtd_write(mtd, ofs, len, &retlen, buf);
 	if (ret || (retlen != len))
 		return -EIO;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 56478eb..1da7f4a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -184,6 +184,8 @@ struct mtd_info {
 					    unsigned long flags);
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, u_char *buf);
+	int (*write) (struct mtd_info *mtd, loff_t to, size_t len,
+		      size_t *retlen, const u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -191,7 +193,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 
-	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
 	/* In blackbox flight recorder like scenarios we want to make successful
 	   writes in interrupt context. panic_write() is only intended to be
@@ -308,6 +309,12 @@ static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return mtd->read(mtd, from, len, retlen, buf);
 }
 
+static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, const u_char *buf)
+{
+	return mtd->write(mtd, to, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
