Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfGOL-0003cb-Mh
 for linux-mtd@lists.infradead.org; Mon, 26 Dec 2011 19:39:26 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: drivers return bitlip info to mtd on read
Date: Mon, 26 Dec 2011 11:38:13 -0800
Message-Id: <1324928293-17905-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Dunn <mikedunn@newsguy.com>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Joern Engel <joern@logfs.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch changes the meaning of the value returned by the read() and
read_oob() mtd driver methods.  Previously, absent a hard error, these functions
returned either -EUCLEAN (one or more bitflips were corrected) or 0 (no
bitflips).  Drivers now return, absent a hard error, the maximum number of
bitflips that were corrected on any one page.  

This change is made possible by the fact that all calls to the driver methods
now go through mtd wrapper functions.  The values returned by those wrapper
functions have not changed, nor have their meaning.  Only the values returned to
the mtd wrappers by the driver have changed.

Tested with nandsim and onenand_sim.  The two drivers that were modified were
compile-tested only.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

I'm working on follow-up patches which change the meaning of the -EUCLEAN return
code (as has been discussed at length), but I wanted to get this patch in right
away due to the merge window.

 drivers/mtd/devices/docg3.c        |    5 ++++-
 drivers/mtd/nand/alauda.c          |    4 ++--
 drivers/mtd/nand/nand_base.c       |   10 ++++++++--
 drivers/mtd/onenand/onenand_base.c |    6 ++++--
 include/linux/mtd/mtd.h            |   22 ++++++++++++++++++++--
 5 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 22d5099..73c7574 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -854,6 +854,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	u8 *buf = ops->datbuf;
 	size_t len, ooblen, nbdata, nboob;
 	u8 hwecc[DOC_ECC_BCH_SIZE], eccconf1;
+	unsigned int max_bitflips = 0;
 
 	if (buf)
 		len = ops->len;
@@ -938,7 +939,9 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 			}
 			if (ret > 0) {
 				mtd->ecc_stats.corrected += ret;
-				ret = -EUCLEAN;
+				max_bitflips = max(max_bitflips,
+						   (unsigned int)ret);
+				ret = max_bitflips;
 			}
 		}
 
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index eb40ea8..60db9f2 100644
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
index 28b49b6..b7ab765 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1441,7 +1441,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint32_t oobreadlen = ops->ooblen;
 	uint32_t max_oobsize = ops->mode == MTD_OPS_AUTO_OOB ?
 		mtd->oobavail : mtd->oobsize;
-
+	unsigned int max_bitflips = 0;
 	uint8_t *bufpoi, *oob, *buf;
 
 	stats = mtd->ecc_stats;
@@ -1463,6 +1463,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 		/* Is the current page in the buffer? */
 		if (realpage != chip->pagebuf || oob) {
+			unsigned int prev_corrected = mtd->ecc_stats.corrected;
+
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
 			if (likely(sndcmd)) {
@@ -1525,6 +1527,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				else
 					nand_wait_ready(mtd);
 			}
+			max_bitflips = max(max_bitflips,
+					   mtd->ecc_stats.corrected -
+					   prev_corrected);
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1566,7 +1571,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max number of corrected bitflips on any one page */
+	return max_bitflips;
 }
 
 /**
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index dd278a2..3dd8bdb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1201,7 +1201,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max number of corrected bitflips on any one page */
+	return mtd->ecc_stats.corrected - stats.corrected ? 1 : 0;
 }
 
 /**
@@ -1333,7 +1334,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max number of corrected bitflips on any one page */
+	return mtd->ecc_stats.corrected - stats.corrected ? 1 : 0;
 }
 
 /**
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index e8c4409..be286ab 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -279,7 +279,16 @@ static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
 static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, u_char *buf)
 {
-	return mtd->read(mtd, from, len, retlen, buf);
+	/*
+	 * Absent an error, drivers return max_bitflips.
+	 * MTD returns -EUCLEAN (bitflips corrected) or 0 (no bitflips).
+	 * max_bitflips is maximum number of bitflips corrected on any one page.
+	 */
+	int ret = mtd->read(mtd, from, len, retlen, buf);
+	if (ret > 0)
+		return -EUCLEAN;
+	else
+		return ret;
 }
 
 static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -304,7 +313,16 @@ static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 			       struct mtd_oob_ops *ops)
 {
-	return mtd->read_oob(mtd, from, ops);
+	/*
+	 * Absent an error, drivers return max_bitflips.
+	 * MTD returns -EUCLEAN (bitflips corrected) or 0 (no bitflips).
+	 * max_bitflips is maximum number of bitflips corrected on any one page.
+	 */
+	int ret = mtd->read_oob(mtd, from, ops);
+	if (ret > 0)
+		return -EUCLEAN;
+	else
+		return ret;
 }
 
 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
-- 
1.7.3.4
