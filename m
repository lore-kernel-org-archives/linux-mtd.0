Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rd4gO-0001PH-CU
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 18:45:01 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] MTD: read(), read_oob() driver methods return num bitflips
Date: Tue, 20 Dec 2011 10:42:16 -0800
Message-Id: <1324406536-18250-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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
bitflips that were corrected on any single page.  

Note that all calls to thr driver methods now go through the mtd partitioning
wrappers, and the values returned by those wrapper functions have not changed,
nor have their meaning.  Only the values returned to the mtd wrappers by the
driver have changed.

Tested with nandsim, onenand_sim, and the diskonchip g4 nand driver (currently
out-of-tree).  The two drivers that were modified were compile-tested only.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/devices/docg3.c        |    5 ++++-
 drivers/mtd/mtdpart.c              |   29 +++++++++++++++++++++++------
 drivers/mtd/nand/alauda.c          |    4 ++--
 drivers/mtd/nand/nand_base.c       |   10 ++++++++--
 drivers/mtd/onenand/onenand_base.c |    6 ++++--
 5 files changed, 41 insertions(+), 13 deletions(-)

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
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 81975a5..9dfb2ad 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -73,9 +73,15 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	res = part->master->read(part->master, from + part->offset,
 				   len, retlen, buf);
 	if (unlikely(res)) {
-		if (mtd_is_bitflip(res))
+
+		/*
+		 * In the absence of errors, drivers return max_bitflips.
+		 * We return -EUCLEAN (bitflips corrected) or 0 (no bitflips).
+		 */
+		if (res > 0) {
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
-		if (mtd_is_eccerr(res))
+			res = -EUCLEAN;
+		} else if (mtd_is_eccerr(res))
 			mtd->ecc_stats.failed += part->master->ecc_stats.failed - stats.failed;
 	}
 	return res;
@@ -116,6 +122,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
 	struct mtd_part *part = PART(mtd);
+	struct mtd_ecc_stats stats = part->master->ecc_stats;
 	int res;
 
 	if (from >= mtd->size)
@@ -142,10 +149,20 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 
 	res = part->master->read_oob(part->master, from + part->offset, ops);
 	if (unlikely(res)) {
-		if (mtd_is_bitflip(res))
-			mtd->ecc_stats.corrected++;
-		if (mtd_is_eccerr(res))
-			mtd->ecc_stats.failed++;
+
+		/*
+		 * In the absence of errors, drivers return max_bitflips.
+		 * We return -EUCLEAN (bitflips corrected) or 0 (no bitflips).
+		 */
+		if (res > 0) {
+			mtd->ecc_stats.corrected +=
+				part->master->ecc_stats.corrected -
+				stats.corrected;
+			res = -EUCLEAN;
+		} else if (mtd_is_eccerr(res))
+			mtd->ecc_stats.failed +=
+				part->master->ecc_stats.failed -
+				stats.failed;
 	}
 	return res;
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
index 35b4565..5709af8 100644
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
+	/* return max bitflips per page to mtd partition wrappers */
+	return max_bitflips;
 }
 
 /**
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a839473..2bc35d4 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1201,7 +1201,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per page to mtd partition wrappers */
+	return mtd->ecc_stats.corrected - stats.corrected ? 1 : 0;
 }
 
 /**
@@ -1333,7 +1334,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	/* return max bitflips per page to mtd partition wrappers */
+	return mtd->ecc_stats.corrected - stats.corrected ? 1 : 0;
 }
 
 /**
-- 
1.7.3.4
