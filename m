Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Xy-0004Jp-6a
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:06:40 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
Date: Wed, 25 Apr 2012 12:06:11 -0700
Message-Id: <1335380771-27805-8-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The drivers _read() method, absent an error, return a non-negative integer
indicating the maximum number of bit errors that were corrected in any one
region comprising an ecc step.  MTD returns -EUCLEAN if this is >=
bitflip_threshold, 0 otherwise.  If bitflip_threshold is zero, the comparison is
not made since these devices lack ECC and always return zero in the non-error
case (thanks Brian) [1].  Note that this is a subtle change to the driver
interface.

This and the preceeding patches in this set were tested with ubi on top of the
nandsim and docg4 devices, running the ubi test io_basic from mtd-utils.

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040468.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

This v2 is actually unchanged from the original set.

 drivers/mtd/devices/docg3.c        |    4 +++-
 drivers/mtd/mtdcore.c              |   14 +++++++++++++-
 drivers/mtd/mtdpart.c              |   12 ++++++------
 drivers/mtd/nand/alauda.c          |    4 ++--
 drivers/mtd/nand/nand_base.c       |   18 ++++++++++++++----
 drivers/mtd/onenand/onenand_base.c |    6 ++++--
 include/linux/mtd/nand.h           |    3 +++
 7 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 3414031..7644d59 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -862,6 +862,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	u8 *buf = ops->datbuf;
 	size_t len, ooblen, nbdata, nboob;
 	u8 hwecc[DOC_ECC_BCH_SIZE], eccconf1;
+	int max_bitflips = 0;
 
 	if (buf)
 		len = ops->len;
@@ -948,7 +949,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 			}
 			if (ret > 0) {
 				mtd->ecc_stats.corrected += ret;
-				ret = -EUCLEAN;
+				max_bitflips = max(max_bitflips, ret);
+				ret = max_bitflips;
 			}
 		}
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6a7cba1..b5bb628 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -800,12 +800,24 @@ EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
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
+	 * any one ecc region (if applicable; zero otherwise).
+	 */
+	ret_code = mtd->_read(mtd, from, len, retlen, buf);
+	if (unlikely(ret_code < 0))
+		return ret_code;
+	if (mtd->bitflip_threshold == 0)
+		return 0;	/* device lacks ecc */
+	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9651c06..d6321f6 100644
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
 
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 4f20e1d..60a0dfd 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -414,7 +414,7 @@ static int alauda_bounce_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 	err = 0;
 	if (corrected)
-		err = -EUCLEAN;
+		err = 1;	/* return max_bitflips per ecc step */
 	if (uncorrected)
 		err = -EBADMSG;
 out:
@@ -446,7 +446,7 @@ static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 	err = 0;
 	if (corrected)
-		err = -EUCLEAN;
+		err = 1;	/* return max_bitflips per ecc step */
 	if (uncorrected)
 		err = -EBADMSG;
 	return err;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 275c43f..9f1b202 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1486,6 +1486,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		mtd->oobavail : mtd->oobsize;
 
 	uint8_t *bufpoi, *oob, *buf;
+	unsigned int max_bitflips = 0;
 
 	stats = mtd->ecc_stats;
 
@@ -1513,7 +1514,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				sndcmd = 0;
 			}
 
-			/* Now read the page into the buffer */
+			/*
+			 * Now read the page into the buffer.  Absent an error,
+			 * the read methods return max bitflips per ecc step.
+			 */
 			if (unlikely(ops->mode == MTD_OPS_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
@@ -1530,15 +1534,19 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				break;
 			}
 
+			max_bitflips = max_t(unsigned int, max_bitflips, ret);
+
 			/* Transfer not aligned data */
 			if (!aligned) {
 				if (!NAND_SUBPAGE_READ(chip) && !oob &&
 				    !(mtd->ecc_stats.failed - stats.failed) &&
-				    (ops->mode != MTD_OPS_RAW))
+				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagebuf = realpage;
-				else
+					chip->pagebuf_bitflips = ret;
+				} else {
 					/* Invalidate page cache */
 					chip->pagebuf = -1;
+				}
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
@@ -1571,6 +1579,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
+			max_bitflips = max_t(unsigned int, max_bitflips,
+					     chip->pagebuf_bitflips);
 		}
 
 		readlen -= bytes;
@@ -1609,7 +1619,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	return max_bitflips;
 }
 
 /**
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b3ce12e..7153e0d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1201,7 +1201,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per ecc step; ONENANDs correct 1 bit only */
+	return mtd->ecc_stats.corrected != stats.corrected ? 1 : 0;
 }
 
 /**
@@ -1333,7 +1334,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per ecc step; ONENANDs correct 1 bit only */
+	return mtd->ecc_stats.corrected != stats.corrected ? 1 : 0;
 }
 
 /**
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 1482340..2829e8b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -459,6 +459,8 @@ struct nand_buffers {
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
  * @pagebuf:		[INTERN] holds the pagenumber which is currently in
  *			data_buf.
+ * @pagebuf_bitflips:	[INTERN] holds the bitflip count for the page which is
+ *			currently in data_buf.
  * @subpagesize:	[INTERN] holds the subpagesize
  * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded),
  *			non 0 if ONFI supported.
@@ -519,6 +521,7 @@ struct nand_chip {
 	uint64_t chipsize;
 	int pagemask;
 	int pagebuf;
+	unsigned int pagebuf_bitflips;
 	int subpagesize;
 	uint8_t cellinfo;
 	int badblockpos;
-- 
1.7.3.4
