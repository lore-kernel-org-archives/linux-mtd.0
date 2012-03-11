Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6rAK-0005W1-Ki
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 22:23:01 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
Date: Sun, 11 Mar 2012 14:21:13 -0700
Message-Id: <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The drivers' read methods, absent an error, return a non-negative integer
indicating the maximum number of bit errors that were corrected in any one
writesize region.  MTD returns -EUCLEAN if this is >= euclean_threshold, 0
otherwise.  Note that this is a subtle change to the driver interface.

This and the preceeding patches in this set were tested ubi on top of the
nandsim and docg4 devices, running the ubi test io_basic from mtd-utils.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

We may want to also change the name of the macro mtd_is_bitflip(), since this is
not really correctly named anymore.

 drivers/mtd/devices/docg3.c        |    4 +++-
 drivers/mtd/mtdcore.c              |   35 ++++++++++++++++++++++++++++++++++-
 drivers/mtd/mtdpart.c              |   25 +++++++++++++------------
 drivers/mtd/nand/alauda.c          |    4 ++--
 drivers/mtd/nand/nand_base.c       |   14 ++++++++++++--
 drivers/mtd/onenand/onenand_base.c |    6 ++++--
 include/linux/mtd/mtd.h            |   10 +---------
 7 files changed, 69 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 886ca0f..95ea33e 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -854,6 +854,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	u8 *buf = ops->datbuf;
 	size_t len, ooblen, nbdata, nboob;
 	u8 hwecc[DOC_ECC_BCH_SIZE], eccconf1;
+	int max_bitflips = 0;
 
 	if (buf)
 		len = ops->len;
@@ -938,7 +939,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 			}
 			if (ret > 0) {
 				mtd->ecc_stats.corrected += ret;
-				ret = -EUCLEAN;
+				max_bitflips = max(max_bitflips, ret);
+				ret = max_bitflips;
 			}
 		}
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5bbd717..6871658 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -789,12 +789,24 @@ EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
 int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	     u_char *buf)
 {
+	int ret_code;
 	*retlen = 0;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_read(mtd, from, len, retlen, buf);
+
+	/*
+	 * In the absence of an error, drivers return a non-negative integer
+	 * representing the maximum number of bitflips that were corrected on
+	 * any one writesize region (typically a NAND page).
+	 */
+	ret_code = mtd->_read(mtd, from, len, retlen, buf);
+
+	if (unlikely(ret_code < 0))
+		return ret_code;
+
+	return ret_code >= mtd->euclean_threshold ? -EUCLEAN : 0;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
 
@@ -835,6 +847,27 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
 
+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
+{
+	int ret_code;
+	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->_read_oob)
+		return -EOPNOTSUPP;
+
+	/*
+	 * In the absence of an error, drivers return a non-negative integer
+	 * representing the maximum number of bitflips that were corrected on
+	 * any one writesize region (typically a NAND page).
+	 */
+	ret_code = mtd->_read_oob(mtd, from, ops);
+
+	if (unlikely(ret_code < 0))
+		return ret_code;
+
+	return ret_code >= mtd->euclean_threshold ? -EUCLEAN : 0;
+}
+EXPORT_SYMBOL_GPL(mtd_read_oob);
+
 /*
  * Method to access the protection register area, present in some flash
  * devices. The user data is one time programmable but the factory data is read
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9651c06..24022ce 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -67,12 +67,12 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	stats = part->master->ecc_stats;
 	res = part->master->_read(part->master, from + part->offset, len,
 				  retlen, buf);
-	if (unlikely(res)) {
-		if (mtd_is_bitflip(res))
-			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
-		if (mtd_is_eccerr(res))
-			mtd->ecc_stats.failed += part->master->ecc_stats.failed - stats.failed;
-	}
+	if (unlikely(mtd_is_eccerr(res)))
+		mtd->ecc_stats.failed +=
+			part->master->ecc_stats.failed - stats.failed;
+	else
+		mtd->ecc_stats.corrected +=
+			part->master->ecc_stats.corrected - stats.corrected;
 	return res;
 }
 
@@ -108,6 +108,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
 	struct mtd_part *part = PART(mtd);
+	struct mtd_ecc_stats stats = part->master->ecc_stats;
 	int res;
 
 	if (from >= mtd->size)
@@ -133,12 +134,12 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 	}
 
 	res = part->master->_read_oob(part->master, from + part->offset, ops);
-	if (unlikely(res)) {
-		if (mtd_is_bitflip(res))
-			mtd->ecc_stats.corrected++;
-		if (mtd_is_eccerr(res))
-			mtd->ecc_stats.failed++;
-	}
+	if (unlikely(mtd_is_eccerr(res)))
+		mtd->ecc_stats.failed +=
+			part->master->ecc_stats.failed - stats.failed;
+	else
+		mtd->ecc_stats.corrected +=
+			part->master->ecc_stats.corrected - stats.corrected;
 	return res;
 }
 
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 4f20e1d..7e59e83 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -414,7 +414,7 @@ static int alauda_bounce_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 	err = 0;
 	if (corrected)
-		err = -EUCLEAN;
+		err = 1;	/* return max bitflips per page */
 	if (uncorrected)
 		err = -EBADMSG;
 out:
@@ -446,7 +446,7 @@ static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 	err = 0;
 	if (corrected)
-		err = -EUCLEAN;
+		err = 1;	/* return max bitflips per page */
 	if (uncorrected)
 		err = -EBADMSG;
 	return err;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8008853..e2bf003 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1469,6 +1469,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint32_t oobreadlen = ops->ooblen;
 	uint32_t max_oobsize = ops->mode == MTD_OPS_AUTO_OOB ?
 		mtd->oobavail : mtd->oobsize;
+	unsigned int max_bitflips = 0;
 
 	uint8_t *bufpoi, *oob, *buf;
 
@@ -1491,6 +1492,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 		/* Is the current page in the buffer? */
 		if (realpage != chip->pagebuf || oob) {
+			unsigned int prev_corrected = mtd->ecc_stats.corrected;
+
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
 			if (likely(sndcmd)) {
@@ -1553,6 +1556,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				else
 					nand_wait_ready(mtd);
 			}
+			max_bitflips = max(max_bitflips,
+					   mtd->ecc_stats.corrected -
+					   prev_corrected);
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1594,7 +1600,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	return max_bitflips;
 }
 
 /**
@@ -1782,6 +1788,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	int readlen = ops->ooblen;
 	int len;
 	uint8_t *buf = ops->oobbuf;
+	unsigned int max_bitflips = 0;
 
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
@@ -1816,6 +1823,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
+		unsigned int prev_corrected = mtd->ecc_stats.corrected;
 		if (ops->mode == MTD_OPS_RAW)
 			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
 		else
@@ -1836,6 +1844,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			else
 				nand_wait_ready(mtd);
 		}
+		max_bitflips = max(max_bitflips,
+				   mtd->ecc_stats.corrected - prev_corrected);
 
 		readlen -= len;
 		if (!readlen)
@@ -1865,7 +1875,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	return  max_bitflips;
 }
 
 /**
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 3d781b8..177b0a5 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1201,7 +1201,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per page; ONENANDs correct 1 bit only */
+	return mtd->ecc_stats.corrected != stats.corrected ? 1 : 0;
 }
 
 /**
@@ -1333,7 +1334,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per page; ONENANDs correct 1 bit only */
+	return mtd->ecc_stats.corrected != stats.corrected ? 1 : 0;
 }
 
 /**
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 20b5c40..b0c78f4 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -262,15 +262,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf);
 int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		    const u_char *buf);
-
-static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
-			       struct mtd_oob_ops *ops)
-{
-	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_read_oob)
-		return -EOPNOTSUPP;
-	return mtd->_read_oob(mtd, from, ops);
-}
+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
 
 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
-- 
1.7.3.4
