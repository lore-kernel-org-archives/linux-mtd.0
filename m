Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3wGt-0000LP-Sd
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2012 21:13:44 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: fix partition wrapper functions
Date: Sat,  3 Mar 2012 13:13:06 -0800
Message-Id: <1330809186-3432-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch reverts a change that may have been mistakenly included with the set
of patches that introduced the new mtd api entry functions.  Or perhaps I am
mistaken :)

The problem is in the partition wrapper functions, where the calls to the driver
methods were replaced with calls to the new mtd api functions.  This causes the
api function to be called a second time, further down the call stack.  This is
not only unnecessary and redundant - because the sanity checking code and (more
restrictive) bounds checks for the partition were done in the first call - but
is potentially problematic and confusing.

For example, the call stack for a call to mtd_read() on a partitioned device
currently looks like this:

mtd_read()             gets struct mtd_info for the partition
|
+-> part_read()        via the pointer assigned when the partition was created
    |
    +->mtd_read()      this time gets struct mtd_info for the master
       |
       +->xyz_driver_read()  via the pointer asigned by the driver

It seems that this can cause a variety of problems.  For example, if you want to
add code to the api function that tests a value in mtd_info that is relevant
only to the partition.  Or (in my case) you want the driver to return a value
that may be different from that returned by the mtd api function.

This patch eliminates the second call to the mtd api function.  It was tested on
the docg4 nand driver with a subset of the api functions, but I inspected the
rest and don't see any problems.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/mtdpart.c |   60 +++++++++++++++++++++++++++----------------------
 1 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 33d32c6..226d28a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -65,7 +65,8 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int res;
 
 	stats = part->master->ecc_stats;
-	res = mtd_read(part->master, from + part->offset, len, retlen, buf);
+	res = part->master->_read(part->master, from + part->offset, len,
+				  retlen, buf);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
@@ -80,15 +81,15 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct mtd_part *part = PART(mtd);
 
-	return mtd_point(part->master, from + part->offset, len, retlen,
-			 virt, phys);
+	return part->master->_point(part->master, from + part->offset, len,
+				    retlen, virt, phys);
 }
 
 static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
 
-	return mtd_unpoint(part->master, from + part->offset, len);
+	return part->master->_unpoint(part->master, from + part->offset, len);
 }
 
 static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
@@ -99,7 +100,8 @@ static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
 	struct mtd_part *part = PART(mtd);
 
 	offset += part->offset;
-	return mtd_get_unmapped_area(part->master, len, offset, flags);
+	return part->master->_get_unmapped_area(part->master, len, offset,
+						flags);
 }
 
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
@@ -130,7 +132,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 			return -EINVAL;
 	}
 
-	res = mtd_read_oob(part->master, from + part->offset, ops);
+	res = part->master->_read_oob(part->master, from + part->offset, ops);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected++;
@@ -144,43 +146,46 @@ static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_read_user_prot_reg(part->master, from, len, retlen, buf);
+	return part->master->_read_user_prot_reg(part->master, from, len,
+						 retlen, buf);
 }
 
 static int part_get_user_prot_info(struct mtd_info *mtd,
 		struct otp_info *buf, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_get_user_prot_info(part->master, buf, len);
+	return part->master->_get_user_prot_info(part->master, buf, len);
 }
 
 static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_read_fact_prot_reg(part->master, from, len, retlen, buf);
+	return part->master->_read_fact_prot_reg(part->master, from, len,
+						 retlen, buf);
 }
 
 static int part_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
 		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_get_fact_prot_info(part->master, buf, len);
+	return part->master->_get_fact_prot_info(part->master, buf, len);
 }
 
 static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_write(part->master, to + part->offset, len, retlen, buf);
+	return part->master->_write(part->master, to + part->offset, len,
+				    retlen, buf);
 }
 
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_panic_write(part->master, to + part->offset, len, retlen,
-			       buf);
+	return part->master->_panic_write(part->master, to + part->offset, len,
+					  retlen, buf);
 }
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
@@ -192,29 +197,30 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	if (ops->datbuf && to + ops->len > mtd->size)
 		return -EINVAL;
-	return mtd_write_oob(part->master, to + part->offset, ops);
+	return part->master->_write_oob(part->master, to + part->offset, ops);
 }
 
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_write_user_prot_reg(part->master, from, len, retlen, buf);
+	return part->master->_write_user_prot_reg(part->master, from, len,
+						  retlen, buf);
 }
 
 static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_lock_user_prot_reg(part->master, from, len);
+	return part->master->_lock_user_prot_reg(part->master, from, len);
 }
 
 static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_writev(part->master, vecs, count, to + part->offset,
-			  retlen);
+	return part->master->_writev(part->master, vecs, count,
+				     to + part->offset, retlen);
 }
 
 static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
@@ -223,7 +229,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int ret;
 
 	instr->addr += part->offset;
-	ret = mtd_erase(part->master, instr);
+	ret = part->master->_erase(part->master, instr);
 	if (ret) {
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
@@ -249,44 +255,44 @@ EXPORT_SYMBOL_GPL(mtd_erase_callback);
 static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_lock(part->master, ofs + part->offset, len);
+	return part->master->_lock(part->master, ofs + part->offset, len);
 }
 
 static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_unlock(part->master, ofs + part->offset, len);
+	return part->master->_unlock(part->master, ofs + part->offset, len);
 }
 
 static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_is_locked(part->master, ofs + part->offset, len);
+	return part->master->_is_locked(part->master, ofs + part->offset, len);
 }
 
 static void part_sync(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	mtd_sync(part->master);
+	part->master->_sync(part->master);
 }
 
 static int part_suspend(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	return mtd_suspend(part->master);
+	return part->master->_suspend(part->master);
 }
 
 static void part_resume(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	mtd_resume(part->master);
+	part->master->_resume(part->master);
 }
 
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
 	ofs += part->offset;
-	return mtd_block_isbad(part->master, ofs);
+	return part->master->_block_isbad(part->master, ofs);
 }
 
 static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
@@ -295,7 +301,7 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	int res;
 
 	ofs += part->offset;
-	res = mtd_block_markbad(part->master, ofs);
+	res = part->master->_block_markbad(part->master, ofs);
 	if (!res)
 		mtd->ecc_stats.badblocks++;
 	return res;
-- 
1.7.3.4
