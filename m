Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OXX-0001W3-O4
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:16:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/14] mtd: utilize `is_ecc_error()' macros
Date: Wed, 7 Sep 2011 13:13:31 -0700
Message-ID: <1315426421-16243-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/inftlcore.c             |    4 ++--
 drivers/mtd/mtdchar.c               |    4 ++--
 drivers/mtd/mtdconcat.c             |    8 ++++----
 drivers/mtd/mtdoops.c               |    2 +-
 drivers/mtd/mtdpart.c               |    8 ++++----
 drivers/mtd/mtdswap.c               |   20 ++++++++++----------
 drivers/mtd/nand/diskonchip.c       |    2 +-
 drivers/mtd/nand/nand_bbt.c         |    4 ++--
 drivers/mtd/nftlcore.c              |    4 ++--
 drivers/mtd/onenand/onenand_base.c  |   11 ++++++-----
 drivers/mtd/sm_ftl.c                |    4 ++--
 drivers/mtd/tests/mtd_pagetest.c    |   28 ++++++++++++++--------------
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    8 ++++----
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    9 +++++----
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/eba.c               |    2 +-
 drivers/mtd/ubi/io.c                |   27 +++++++++++++++------------
 drivers/mtd/ubi/kapi.c              |    3 ++-
 drivers/mtd/ubi/misc.c              |    2 +-
 drivers/mtd/ubi/scan.c              |    4 ++--
 drivers/mtd/ubi/vtbl.c              |    2 +-
 23 files changed, 84 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 652065e..ead9913 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -346,7 +346,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 		ret = mtd->read(mtd, (inftl->EraseSize * BlockMap[block]) +
 				(block * SECTORSIZE), SECTORSIZE, &retlen,
 				movebuf);
-		if (ret < 0 && ret != -EUCLEAN) {
+		if (ret < 0 && !is_corrected_ecc_error(ret)) {
 			ret = mtd->read(mtd,
 					(inftl->EraseSize * BlockMap[block]) +
 					(block * SECTORSIZE), SECTORSIZE,
@@ -917,7 +917,7 @@ foundit:
 		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer);
 
 		/* Handle corrected bit flips gracefully */
-		if (ret < 0 && ret != -EUCLEAN)
+		if (ret < 0 && !is_corrected_ecc_error(ret))
 			return -EIO;
 	}
 	return 0;
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8feb5fd..5960665 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -242,7 +242,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		 * Userspace software which accesses NAND this way
 		 * must be aware of the fact that it deals with NAND
 		 */
-		if (!ret || (ret == -EUCLEAN) || (ret == -EBADMSG)) {
+		if (!ret || is_ecc_error(ret)) {
 			*ppos += retlen;
 			if (copy_to_user(buf, kbuf, retlen)) {
 				kfree(kbuf);
@@ -491,7 +491,7 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 	 * does not calculate ECC for the OOB area, so do not rely on
 	 * this behavior unless you have replaced it with your own.
 	 */
-	if (ret == -EUCLEAN || ret == -EBADMSG)
+	if (is_ecc_error(ret))
 		return 0;
 
 	return ret;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d3fabd1..9a730be 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -95,10 +95,10 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
-			if (err == -EBADMSG) {
+			if (is_uncorrected_ecc_error(err)) {
 				mtd->ecc_stats.failed++;
 				ret = err;
-			} else if (err == -EUCLEAN) {
+			} else if (is_corrected_ecc_error(err)) {
 				mtd->ecc_stats.corrected++;
 				/* Do not overwrite -EBADMSG !! */
 				if (!ret)
@@ -279,10 +279,10 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
-			if (err == -EBADMSG) {
+			if (is_uncorrected_ecc_error(err)) {
 				mtd->ecc_stats.failed++;
 				ret = err;
-			} else if (err == -EUCLEAN) {
+			} else if (is_corrected_ecc_error(err)) {
 				mtd->ecc_stats.corrected++;
 				/* Do not overwrite -EBADMSG !! */
 				if (!ret)
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index e3e40f4..8243720 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -258,7 +258,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
 				&retlen, (u_char *) &count[0]);
 		if (retlen != MTDOOPS_HEADER_SIZE ||
-				(ret < 0 && ret != -EUCLEAN)) {
+				(ret < 0 && !is_corrected_ecc_error(ret))) {
 			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
 			       page * record_size, retlen,
 			       MTDOOPS_HEADER_SIZE, ret);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cd7785a..82fecfa 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -73,9 +73,9 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	res = part->master->read(part->master, from + part->offset,
 				   len, retlen, buf);
 	if (unlikely(res)) {
-		if (res == -EUCLEAN)
+		if (is_corrected_ecc_error(res))
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
-		if (res == -EBADMSG)
+		if (is_uncorrected_ecc_error(res))
 			mtd->ecc_stats.failed += part->master->ecc_stats.failed - stats.failed;
 	}
 	return res;
@@ -142,9 +142,9 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 
 	res = part->master->read_oob(part->master, from + part->offset, ops);
 	if (unlikely(res)) {
-		if (res == -EUCLEAN)
+		if (is_corrected_ecc_error(res))
 			mtd->ecc_stats.corrected++;
-		if (res == -EBADMSG)
+		if (is_uncorrected_ecc_error(res))
 			mtd->ecc_stats.failed++;
 	}
 	return res;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 910309f..e72ff61 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -314,7 +314,7 @@ static int mtdswap_read_oob(struct mtdswap_dev *d, loff_t from,
 {
 	int ret = d->mtd->read_oob(d->mtd, from, ops);
 
-	if (ret == -EUCLEAN)
+	if (is_corrected_ecc_error(ret))
 		return ret;
 
 	if (ret) {
@@ -354,7 +354,7 @@ static int mtdswap_read_markers(struct mtdswap_dev *d, struct swap_eb *eb)
 
 	ret = mtdswap_read_oob(d, offset, &ops);
 
-	if (ret && ret != -EUCLEAN)
+	if (ret && !is_corrected_ecc_error(ret))
 		return ret;
 
 	data = (struct mtdswap_oobdata *)d->oob_buf;
@@ -363,7 +363,7 @@ static int mtdswap_read_markers(struct mtdswap_dev *d, struct swap_eb *eb)
 
 	if (le16_to_cpu(data->magic) == MTDSWAP_MAGIC_CLEAN) {
 		eb->erase_count = le32_to_cpu(data->count);
-		if (ret == -EUCLEAN)
+		if (is_corrected_ecc_error(ret))
 			ret = MTDSWAP_SCANNED_BITFLIP;
 		else {
 			if (le16_to_cpu(data2->magic) == MTDSWAP_MAGIC_DIRTY)
@@ -408,7 +408,7 @@ static int mtdswap_write_marker(struct mtdswap_dev *d, struct swap_eb *eb,
 	if (ret) {
 		dev_warn(d->dev, "Write OOB failed for block at %08llx "
 			"error %d\n", offset, ret);
-		if (ret == -EIO || ret == -EBADMSG)
+		if (ret == -EIO || is_uncorrected_ecc_error(ret))
 			mtdswap_handle_write_error(d, eb);
 		return ret;
 	}
@@ -628,7 +628,7 @@ static int mtdswap_map_free_block(struct mtdswap_dev *d, unsigned int page,
 			TREE_COUNT(d, CLEAN)--;
 
 			ret = mtdswap_write_marker(d, eb, MTDSWAP_TYPE_DIRTY);
-		} while (ret == -EIO || ret == -EBADMSG);
+		} while (ret == -EIO || is_uncorrected_ecc_error(ret));
 
 		if (ret)
 			return ret;
@@ -678,7 +678,7 @@ retry:
 	ret = mtdswap_map_free_block(d, page, bp);
 	eb = d->eb_data + (*bp / d->pages_per_eblk);
 
-	if (ret == -EIO || ret == -EBADMSG) {
+	if (ret == -EIO || is_uncorrected_ecc_error(ret)) {
 		d->curr_write = NULL;
 		eb->active_count--;
 		d->revmap[*bp] = PAGE_UNDEF;
@@ -690,7 +690,7 @@ retry:
 
 	writepos = (loff_t)*bp << PAGE_SHIFT;
 	ret =  mtd->write(mtd, writepos, PAGE_SIZE, &retlen, buf);
-	if (ret == -EIO || ret == -EBADMSG) {
+	if (ret == -EIO || is_uncorrected_ecc_error(ret)) {
 		d->curr_write_pos--;
 		eb->active_count--;
 		d->revmap[*bp] = PAGE_UNDEF;
@@ -738,7 +738,7 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
 retry:
 	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf);
 
-	if (ret < 0 && ret != -EUCLEAN) {
+	if (ret < 0 && !is_corrected_ecc_error(ret)) {
 		oldeb = d->eb_data + oldblock / d->pages_per_eblk;
 		oldeb->flags |= EBLOCK_READERR;
 
@@ -1016,7 +1016,7 @@ static int mtdswap_gc(struct mtdswap_dev *d, unsigned int background)
 
 	if (ret == 0)
 		mtdswap_rb_add(d, eb, MTDSWAP_CLEAN);
-	else if (ret != -EIO && ret != -EBADMSG)
+	else if (ret != -EIO && !is_uncorrected_ecc_error(ret))
 		mtdswap_rb_add(d, eb, MTDSWAP_DIRTY);
 
 	return 0;
@@ -1164,7 +1164,7 @@ retry:
 	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf);
 
 	d->mtd_read_count++;
-	if (ret == -EUCLEAN) {
+	if (is_corrected_ecc_error(ret)) {
 		eb->flags |= EBLOCK_BITFLIP;
 		mtdswap_rb_add(d, eb, MTDSWAP_BITFLIP);
 		ret = 0;
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index de93a98..7e39c10 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1031,7 +1031,7 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
 		WriteDOC(DOC_ECC_DIS, docptr, Mplus_ECCConf);
 	else
 		WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-	if (no_ecc_failures && (ret == -EBADMSG)) {
+	if (no_ecc_failures && is_uncorrected_ecc_error(ret)) {
 		printk(KERN_ERR "suppressing ECC failure\n");
 		ret = 0;
 	}
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index fcfaf06..03d76c5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -400,7 +400,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 
 	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
 	/* Ignore ECC errors when checking for BBM */
-	if (ret && ret != -EUCLEAN && ret != -EBADMSG)
+	if (ret && !is_ecc_error(ret))
 		return ret;
 
 	for (j = 0; j < len; j++, buf += scanlen) {
@@ -430,7 +430,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 		 */
 		ret = mtd->read_oob(mtd, offs, &ops);
 		/* Ignore ECC errors when checking for BBM */
-		if (ret && ret != -EUCLEAN && ret != -EBADMSG)
+		if (ret && !is_ecc_error(ret))
 			return ret;
 
 		if (check_short_pattern(buf, bd))
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 272e3c0..a22be2d 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -425,7 +425,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 
 		ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block]) + (block * 512),
 				512, &retlen, movebuf);
-		if (ret < 0 && ret != -EUCLEAN) {
+		if (ret < 0 && !is_corrected_ecc_error(ret)) {
 			ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block])
 					+ (block * 512), 512, &retlen,
 					movebuf);
@@ -773,7 +773,7 @@ static int nftl_readblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 		size_t retlen;
 		int res = mtd->read(mtd, ptr, 512, &retlen, buffer);
 
-		if (res < 0 && res != -EUCLEAN)
+		if (res < 0 && !is_corrected_ecc_error(res))
 			return -EIO;
 	}
 	return 0;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 65a8e18..0906b63 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1079,7 +1079,8 @@ static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int status)
 		return status;
 
 	/* check if we failed due to uncorrectable error */
-	if (status != -EBADMSG && status != ONENAND_BBT_READ_ECC_ERROR)
+	if (!is_uncorrected_ecc_error(status) &&
+			status != ONENAND_BBT_READ_ECC_ERROR)
 		return status;
 
 	/* check if address lies in MLC region */
@@ -1159,7 +1160,7 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			if (unlikely(ret))
 				ret = onenand_recover_lsb(mtd, from, ret);
 			onenand_update_bufferram(mtd, from, !ret);
-			if (ret == -EBADMSG)
+			if (is_uncorrected_ecc_error(ret))
 				ret = 0;
 			if (ret)
 				break;
@@ -1255,7 +1256,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
  			ret = this->wait(mtd, FL_READING);
  			onenand_update_bufferram(mtd, from, !ret);
-			if (ret == -EBADMSG)
+			if (is_uncorrected_ecc_error(ret))
 				ret = 0;
  		}
  	}
@@ -1315,7 +1316,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  		/* Now wait for load */
  		ret = this->wait(mtd, FL_READING);
  		onenand_update_bufferram(mtd, from, !ret);
-		if (ret == -EBADMSG)
+		if (is_uncorrected_ecc_error(ret))
 			ret = 0;
  	}
 
@@ -1403,7 +1404,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 		if (unlikely(ret))
 			ret = onenand_recover_lsb(mtd, from, ret);
 
-		if (ret && ret != -EBADMSG) {
+		if (ret && !is_uncorrected_ecc_error(ret)) {
 			printk(KERN_ERR "%s: read failed = 0x%x\n",
 				__func__, ret);
 			break;
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index d927641..63d8946 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -281,7 +281,7 @@ again:
 	ret = mtd->read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
 
 	/* Test for unknown errors */
-	if (ret != 0 && ret != -EUCLEAN && ret != -EBADMSG) {
+	if (ret != 0 && !is_ecc_error(ret)) {
 		dbg("read of block %d at zone %d, failed due to error (%d)",
 			block, zone, ret);
 		goto again;
@@ -306,7 +306,7 @@ again:
 	}
 
 	/* Test ECC*/
-	if (ret == -EBADMSG ||
+	if (is_uncorrected_ecc_error(ret) ||
 		(ftl->smallpagenand && sm_correct_sector(buffer, oob))) {
 
 		dbg("read of block %d at zone %d, failed due to ECC error",
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 00b937e..7518dbd 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -128,7 +128,7 @@ static int verify_eraseblock(int ebnum)
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
 		/* Do a read to set the internal dataRAMs to different data */
 		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -136,7 +136,7 @@ static int verify_eraseblock(int ebnum)
 			return err;
 		}
 		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -146,7 +146,7 @@ static int verify_eraseblock(int ebnum)
 		memset(twopages, 0, bufsize);
 		read = 0;
 		err = mtd->read(mtd, addr, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -164,7 +164,7 @@ static int verify_eraseblock(int ebnum)
 		unsigned long oldnext = next;
 		/* Do a read to set the internal dataRAMs to different data */
 		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -172,7 +172,7 @@ static int verify_eraseblock(int ebnum)
 			return err;
 		}
 		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -182,7 +182,7 @@ static int verify_eraseblock(int ebnum)
 		memset(twopages, 0, bufsize);
 		read = 0;
 		err = mtd->read(mtd, addr, bufsize, &read, twopages);
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != bufsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -231,7 +231,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addrn - pgsize - pgsize;
 	err = mtd->read(mtd, addr, pgsize, &read, pp1);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -244,7 +244,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addrn - pgsize - pgsize - pgsize;
 	err = mtd->read(mtd, addr, pgsize, &read, pp1);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -258,7 +258,7 @@ static int crosstest(void)
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd->read(mtd, addr, pgsize, &read, pp2);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -272,7 +272,7 @@ static int crosstest(void)
 	addr = addrn - pgsize;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd->read(mtd, addr, pgsize, &read, pp3);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -286,7 +286,7 @@ static int crosstest(void)
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd->read(mtd, addr, pgsize, &read, pp4);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -345,7 +345,7 @@ static int erasecrosstest(void)
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -383,7 +383,7 @@ static int erasecrosstest(void)
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -439,7 +439,7 @@ static int erasetest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	err = mtd->read(mtd, addr0, pgsize, &read, twopages);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != pgsize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n",
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 587e1e3..60b20ff 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -75,7 +75,7 @@ static int read_eraseblock_by_page(int ebnum)
 			ops.datbuf    = NULL;
 			ops.oobbuf    = oobbuf;
 			ret = mtd->read_oob(mtd, addr, &ops);
-			if ((ret && ret != -EUCLEAN) ||
+			if ((ret && !is_corrected_ecc_error(ret)) ||
 					ops.oobretlen != mtd->oobsize) {
 				printk(PRINT_PREF "error: read oob failed at "
 						  "%#llx\n", (long long)addr);
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 627d4e2..2de2c5f 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -216,7 +216,7 @@ static int read_eraseblock(int ebnum)
 
 	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf);
 	/* Ignore corrected ECC errors */
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (err || read != mtd->erasesize) {
 		printk(PRINT_PREF "error: read failed at %#llx\n", addr);
@@ -237,7 +237,7 @@ static int read_eraseblock_by_page(int ebnum)
 	for (i = 0; i < pgcnt; i++) {
 		err = mtd->read(mtd, addr, pgsize, &read, buf);
 		/* Ignore corrected ECC errors */
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != pgsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -263,7 +263,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 	for (i = 0; i < n; i++) {
 		err = mtd->read(mtd, addr, sz, &read, buf);
 		/* Ignore corrected ECC errors */
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != sz) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
@@ -278,7 +278,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 	if (pgcnt % 2) {
 		err = mtd->read(mtd, addr, pgsize, &read, buf);
 		/* Ignore corrected ECC errors */
-		if (err == -EUCLEAN)
+		if (is_corrected_ecc_error(err))
 			err = 0;
 		if (err || read != pgsize) {
 			printk(PRINT_PREF "error: read failed at %#llx\n",
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 531625f..a2378a1 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -154,7 +154,7 @@ static int do_read(void)
 	}
 	addr = eb * mtd->erasesize + offs;
 	err = mtd->read(mtd, addr, len, &read, readbuf);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		err = 0;
 	if (unlikely(err || read != len)) {
 		printk(PRINT_PREF "error: read failed at 0x%llx\n",
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 334eae5..c36a3a4 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -198,7 +198,7 @@ static int verify_eraseblock(int ebnum)
 	read = 0;
 	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
-		if (err == -EUCLEAN && read == subpgsize) {
+		if (is_corrected_ecc_error(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
 			       (long long)addr);
 			err = 0;
@@ -226,7 +226,7 @@ static int verify_eraseblock(int ebnum)
 	read = 0;
 	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
-		if (err == -EUCLEAN && read == subpgsize) {
+		if (is_corrected_ecc_error(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
 			       (long long)addr);
 			err = 0;
@@ -264,7 +264,8 @@ static int verify_eraseblock2(int ebnum)
 		read = 0;
 		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf);
 		if (unlikely(err || read != subpgsize * k)) {
-			if (err == -EUCLEAN && read == subpgsize * k) {
+			if (is_corrected_ecc_error(err) &&
+					read == subpgsize * k) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
 				       (long long)addr);
 				err = 0;
@@ -298,7 +299,7 @@ static int verify_eraseblock_ff(int ebnum)
 		read = 0;
 		err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
 		if (unlikely(err || read != subpgsize)) {
-			if (err == -EUCLEAN && read == subpgsize) {
+			if (is_corrected_ecc_error(err) && read == subpgsize) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
 				       (long long)addr);
 				err = 0;
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 5c6c3d2..b9fc132 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -138,7 +138,7 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 
 retry:
 	err = mtd->read(mtd, addr, len, &read, check_buf);
-	if (err == -EUCLEAN)
+	if (is_corrected_ecc_error(err))
 		printk(PRINT_PREF "single bit flip occurred at EB %d "
 		       "MTD reported that it was fixed.\n", ebnum);
 	else if (err) {
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 4be6718..93ee028 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -443,7 +443,7 @@ retry:
 		if (err == UBI_IO_BITFLIPS) {
 			scrub = 1;
 			err = 0;
-		} else if (err == -EBADMSG) {
+		} else if (is_uncorrected_ecc_error(err)) {
 			if (vol->vol_type == UBI_DYNAMIC_VOLUME)
 				goto out_unlock;
 			scrub = 1;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 6ba55c2..c01ac06 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -172,9 +172,10 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 retry:
 	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
 	if (err) {
-		const char *errstr = (err == -EBADMSG) ? " (ECC error)" : "";
+		const char *errstr =
+			is_uncorrected_ecc_error(err) ? " (ECC error)" : "";
 
-		if (err == -EUCLEAN) {
+		if (is_corrected_ecc_error(err)) {
 			/*
 			 * -EUCLEAN is reported if there was a bit-flip which
 			 * was corrected, so this is harmless.
@@ -205,7 +206,7 @@ retry:
 		 * all the requested data. But some buggy drivers might do
 		 * this, so we change it to -EIO.
 		 */
-		if (read != len && err == -EBADMSG) {
+		if (read != len && is_uncorrected_ecc_error(err)) {
 			ubi_assert(0);
 			err = -EIO;
 		}
@@ -469,7 +470,7 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 
 out:
 	mutex_unlock(&ubi->buf_mutex);
-	if (err == UBI_IO_BITFLIPS || err == -EBADMSG) {
+	if (err == UBI_IO_BITFLIPS || is_uncorrected_ecc_error(err)) {
 		/*
 		 * If a bit-flip or data integrity error was detected, the test
 		 * has not passed because it happened on a freshly erased
@@ -760,7 +761,8 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 
 	read_err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
 	if (read_err) {
-		if (read_err != UBI_IO_BITFLIPS && read_err != -EBADMSG)
+		if (read_err != UBI_IO_BITFLIPS &&
+				!is_uncorrected_ecc_error(read_err))
 			return read_err;
 
 		/*
@@ -776,7 +778,7 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
-		if (read_err == -EBADMSG)
+		if (is_uncorrected_ecc_error(read_err))
 			return UBI_IO_BAD_HDR_EBADMSG;
 
 		/*
@@ -1032,12 +1034,13 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			  ubi->vid_hdr_alsize);
-	if (read_err && read_err != UBI_IO_BITFLIPS && read_err != -EBADMSG)
+	if (read_err && read_err != UBI_IO_BITFLIPS &&
+			!is_uncorrected_ecc_error(read_err))
 		return read_err;
 
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
-		if (read_err == -EBADMSG)
+		if (is_uncorrected_ecc_error(read_err))
 			return UBI_IO_BAD_HDR_EBADMSG;
 
 		if (ubi_check_pattern(vid_hdr, 0xFF, UBI_VID_HDR_SIZE)) {
@@ -1219,7 +1222,7 @@ static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 		return -ENOMEM;
 
 	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE);
-	if (err && err != UBI_IO_BITFLIPS && err != -EBADMSG)
+	if (err && err != UBI_IO_BITFLIPS && !is_uncorrected_ecc_error(err))
 		goto exit;
 
 	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
@@ -1306,7 +1309,7 @@ static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			  ubi->vid_hdr_alsize);
-	if (err && err != UBI_IO_BITFLIPS && err != -EBADMSG)
+	if (err && err != UBI_IO_BITFLIPS && !is_uncorrected_ecc_error(err))
 		goto exit;
 
 	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
@@ -1358,7 +1361,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 	}
 
 	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1);
-	if (err && err != -EUCLEAN)
+	if (err && !is_corrected_ecc_error(err))
 		goto out_free;
 
 	for (i = 0; i < len; i++) {
@@ -1422,7 +1425,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	}
 
 	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
-	if (err && err != -EUCLEAN) {
+	if (err && !is_corrected_ecc_error(err)) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
 		goto error;
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index d39716e..9df3c83 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -410,7 +410,8 @@ int ubi_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf, int offset,
 		return 0;
 
 	err = ubi_eba_read_leb(ubi, vol, lnum, buf, offset, len, check);
-	if (err && err == -EBADMSG && vol->vol_type == UBI_STATIC_VOLUME) {
+	if (err && is_uncorrected_ecc_error(err)
+			&& vol->vol_type == UBI_STATIC_VOLUME) {
 		ubi_warn("mark volume %d as corrupted", vol_id);
 		vol->corrupted = 1;
 	}
diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index ff2a65c..5ec209a 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -81,7 +81,7 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
 
 		err = ubi_eba_read_leb(ubi, vol, i, buf, 0, size, 1);
 		if (err) {
-			if (err == -EBADMSG)
+			if (is_uncorrected_ecc_error(err))
 				err = 1;
 			break;
 		}
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index a3a198f..20d6820 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -395,7 +395,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 	}
 
 	err = ubi_io_read_data(ubi, buf, pnum, 0, len);
-	if (err && err != UBI_IO_BITFLIPS && err != -EBADMSG)
+	if (err && err != UBI_IO_BITFLIPS && !is_uncorrected_ecc_error(err))
 		goto out_free_buf;
 
 	data_crc = be32_to_cpu(vid_hdr->data_crc);
@@ -793,7 +793,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 
 	err = ubi_io_read(ubi, ubi->peb_buf1, pnum, ubi->leb_start,
 			  ubi->leb_size);
-	if (err == UBI_IO_BITFLIPS || err == -EBADMSG) {
+	if (err == UBI_IO_BITFLIPS || is_uncorrected_ecc_error(err)) {
 		/*
 		 * Bit-flips or integrity errors while reading the data area.
 		 * It is difficult to say for sure what type of corruption is
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 4b50a30..d9a91af 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -423,7 +423,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 
 		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
 				       ubi->vtbl_size);
-		if (err == UBI_IO_BITFLIPS || err == -EBADMSG)
+		if (err == UBI_IO_BITFLIPS || is_uncorrected_ecc_error(err))
 			/*
 			 * Scrub the PEB later. Note, -EBADMSG indicates an
 			 * uncorrectable ECC error, but we have our own CRC and
-- 
1.7.5.4
