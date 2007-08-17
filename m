Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1ILs0y-0006hV-1x
	for linux-mtd@lists.infradead.org; Thu, 16 Aug 2007 22:56:44 -0400
From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [OneNAND] Use mtd_oob_ops at oob functions
Date: Fri, 17 Aug 2007 11:56:40 +0900
Message-ID: <003401c7e07a$3e2a73f0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 43dacd92d650618f22c297a2905216857dc5c18f Mon Sep 17 00:00:00 2001
From: Kyungmin Park <kyungmin.park@samsung.com>
Date: Fri, 17 Aug 2007 11:52:05 +0900
Subject: [PATCH] [MTD] [OneNAND] Use mtd_oob_ops at oob functions

To enable the main read/write at oob ops

Next time we will commit the datbuf read/write support for yaffs2

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |   51
+++++++++++++++++++++++++----------
 1 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 7d194cf..45bc143 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -921,17 +921,22 @@ static int onenand_transfer_auto_oob(struct mtd_info
*mtd, uint8_t *buf, int col
  *
  * OneNAND read out-of-band data from the spare area
  */
-static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t
len,
-			size_t *retlen, u_char *buf, mtd_oob_mode_t mode)
+static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from,
+			struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
 	int read = 0, thislen, column, oobsize;
+	size_t len = ops->ooblen;
+	mtd_oob_mode_t mode = ops->mode;
+	u_char *buf = ops->oobbuf;
 	int ret = 0;
 
+	from += ops->ooboffs;
+
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob: from = 0x%08x, len =
%i\n", (unsigned int) from, (int) len);
 
 	/* Initialize return length value */
-	*retlen = 0;
+	ops->oobretlen = 0;
 
 	if (mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -997,7 +1002,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd,
loff_t from, size_t len,
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
 
-	*retlen = read;
+	ops->oobretlen = read;
 	return ret;
 }
 
@@ -1019,8 +1024,7 @@ static int onenand_read_oob(struct mtd_info *mtd,
loff_t from,
 	default:
 		return -EINVAL;
 	}
-	return onenand_do_read_oob(mtd, from + ops->ooboffs, ops->ooblen,
-				   &ops->oobretlen, ops->oobbuf, ops->mode);
+	return onenand_do_read_oob(mtd, from, ops);
 }
 
 /**
@@ -1370,18 +1374,23 @@ static int onenand_fill_auto_oob(struct mtd_info
*mtd, u_char *oob_buf,
  *
  * OneNAND write out-of-band
  */
-static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to, size_t
len,
-				size_t *retlen, const u_char *buf,
mtd_oob_mode_t mode)
+static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
 	int column, ret = 0, oobsize;
 	int written = 0;
 	u_char *oobbuf;
+	size_t len = ops->ooblen;
+	const u_char *buf = ops->oobbuf;
+	mtd_oob_mode_t mode = ops->mode;
+
+	to += ops->ooboffs;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to = 0x%08x, len =
%i\n", (unsigned int) to, (int) len);
 
 	/* Initialize retlen, in case of early exit */
-	*retlen = 0;
+	ops->oobretlen = 0;
 
 	if (mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -1464,7 +1473,7 @@ static int onenand_do_write_oob(struct mtd_info *mtd,
loff_t to, size_t len,
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
 
-	*retlen = written;
+	ops->oobretlen = written;
 
 	return ret;
 }
@@ -1487,8 +1496,7 @@ static int onenand_write_oob(struct mtd_info *mtd,
loff_t to,
 	default:
 		return -EINVAL;
 	}
-	return onenand_do_write_oob(mtd, to + ops->ooboffs, ops->ooblen,
-				    &ops->oobretlen, ops->oobbuf,
ops->mode);
+	return onenand_do_write_oob(mtd, to, ops);
 }
 
 /**
@@ -1646,7 +1654,12 @@ static int onenand_default_block_markbad(struct
mtd_info *mtd, loff_t ofs)
 	struct onenand_chip *this = mtd->priv;
 	struct bbm_info *bbm = this->bbm;
 	u_char buf[2] = {0, 0};
-	size_t retlen;
+	struct mtd_oob_ops ops = {
+		.mode = MTD_OOB_PLACE,
+		.ooblen = 2,
+		.oobbuf = buf,
+		.ooboffs = 0,
+	};
 	int block;
 
 	/* Get block number */
@@ -1656,7 +1669,7 @@ static int onenand_default_block_markbad(struct
mtd_info *mtd, loff_t ofs)
 
         /* We write two bytes, so we dont have to mess with 16 bit access
*/
         ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
-        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf,
MTD_OOB_PLACE);
+        return onenand_do_write_oob(mtd, ofs, &ops);
 }
 
 /**
@@ -1945,13 +1958,21 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t
from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this = mtd->priv;
+	struct mtd_oob_ops ops = {
+		.mode = MTD_OOB_PLACE,
+		.ooblen = len,
+		.oobbuf = buf,
+		.ooboffs = 0,
+	};
 	int ret;
 
 	/* Enter OTP access mode */
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = onenand_do_write_oob(mtd, from, len, retlen, buf,
MTD_OOB_PLACE);
+	ret = onenand_do_write_oob(mtd, from, &ops);
+
+	*retlen = ops.oobretlen;
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-- 
1.5.0.6
