Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0mYH-0005aj-CZ
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 00:28:46 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KAA000JIRZLUK@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 09:28:33 +0900 (KST)
Received: from spapp01.rdscm.com ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KAA00LRZRZJHW@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 09:28:31 +0900 (KST)
Date: Fri, 14 Nov 2008 09:28:30 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH][OneNAND] Write-while-program support
To: linux-mtd@lists.infradead.org
Message-id: <20081114002830.GA25979@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: ext-adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is from Adrian hunter and modified for write_ops operation.

It's similar with load-while-read method.
but it's write side performance improvement.

Here's brief performance results.
Note: Measured from OMAP3 with async OneNAND mode. (not sync mode)

=================================================================
speedtest: dev = 3
speedtest: Size=16777216  EB size=131072  Write size=2048  EB count=128
		Pages per EB=64  Page size=2048
speedtest: scanning for bad blocks
speedtest: scanned 0
speedtest: scanned 128, found 0 bad
speedtest: erasing
speedtest: erased 0
speedtest: erased 128
speedtest: Testing eraseblock write speed
eraseblock write speed is 2424 KiB/s
speedtest: Testing eraseblock read speed
eraseblock read speed is 11985 KiB/s
speedtest: Testing page write speed
page write speed is 2493 KiB/s
speedtest: Testing page read speed
page read speed is 11586 KiB/s
speedtest: Testing 2 page write speed
2 page write speed is 2681 KiB/s
speedtest: Testing 2 page read speed
2 page read speed is 10922 KiB/s
speedtest: Testing erase speed
erase speed is 192752 KiB/s
speedtest: speedtest finished
=================================================================

Also it's passed all nand-tests.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index aaf3504..bc9b420 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1455,7 +1455,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
-	int written = 0, column, thislen, subpage;
+	int written = 0, column, thislen = 0, subpage = 0;
+	int prev = 0, prevlen = 0, prev_subpage = 0, first = 1;
 	int oobwritten = 0, oobcolumn, thisooblen, oobsize;
 	size_t len = ops->len;
 	size_t ooblen = ops->ooblen;
@@ -1492,76 +1493,90 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	column = to & (mtd->writesize - 1);
 
 	/* Loop until all data write */
-	while (written < len) {
-		u_char *wbuf = (u_char *) buf;
+	while (1) {
+		if (written < len) {
+			u_char *wbuf = (u_char *) buf;
 
-		thislen = min_t(int, mtd->writesize - column, len - written);
-		thisooblen = min_t(int, oobsize - oobcolumn, ooblen - oobwritten);
+			thislen = min_t(int, mtd->writesize - column, len - written);
+			thisooblen = min_t(int, oobsize - oobcolumn, ooblen - oobwritten);
 
-		cond_resched();
+			cond_resched();
 
-		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
+			this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
 
-		/* Partial page write */
-		subpage = thislen < mtd->writesize;
-		if (subpage) {
-			memset(this->page_buf, 0xff, mtd->writesize);
-			memcpy(this->page_buf + column, buf, thislen);
-			wbuf = this->page_buf;
-		}
+			/* Partial page write */
+			subpage = thislen < mtd->writesize;
+			if (subpage) {
+				memset(this->page_buf, 0xff, mtd->writesize);
+				memcpy(this->page_buf + column, buf, thislen);
+				wbuf = this->page_buf;
+			}
 
-		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
+			this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
 
-		if (oob) {
-			oobbuf = this->oob_buf;
+			if (oob) {
+				oobbuf = this->oob_buf;
 
-			/* We send data to spare ram with oobsize
-			 * to prevent byte access */
-			memset(oobbuf, 0xff, mtd->oobsize);
-			if (ops->mode == MTD_OOB_AUTO)
-				onenand_fill_auto_oob(mtd, oobbuf, oob, oobcolumn, thisooblen);
-			else
-				memcpy(oobbuf + oobcolumn, oob, thisooblen);
+				/* We send data to spare ram with oobsize
+				 * to prevent byte access */
+				memset(oobbuf, 0xff, mtd->oobsize);
+				if (ops->mode == MTD_OOB_AUTO)
+					onenand_fill_auto_oob(mtd, oobbuf, oob, oobcolumn, thisooblen);
+				else
+					memcpy(oobbuf + oobcolumn, oob, thisooblen);
 
-			oobwritten += thisooblen;
-			oob += thisooblen;
-			oobcolumn = 0;
+				oobwritten += thisooblen;
+				oob += thisooblen;
+				oobcolumn = 0;
+			} else
+				oobbuf = (u_char *) ffchars;
+
+			this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
 		} else
-			oobbuf = (u_char *) ffchars;
+			ONENAND_SET_NEXT_BUFFERRAM(this);
 
-		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
+		if (!first) {
+			ONENAND_SET_PREV_BUFFERRAM(this);
 
-		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
+			ret = this->wait(mtd, FL_WRITING);
 
-		ret = this->wait(mtd, FL_WRITING);
+			/* In partial page write we don't update bufferram */
+			onenand_update_bufferram(mtd, prev, !ret && !prev_subpage);
+			if (ONENAND_IS_2PLANE(this)) {
+				ONENAND_SET_BUFFERRAM1(this);
+				onenand_update_bufferram(mtd, prev + this->writesize, !ret && !prev_subpage);
+			}
 
-		/* In partial page write we don't update bufferram */
-		onenand_update_bufferram(mtd, to, !ret && !subpage);
-		if (ONENAND_IS_2PLANE(this)) {
-			ONENAND_SET_BUFFERRAM1(this);
-			onenand_update_bufferram(mtd, to + this->writesize, !ret && !subpage);
-		}
+			if (ret) {
+				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
+				break;
+			}
 
-		if (ret) {
-			printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
-			break;
-		}
+			if (written == len) {
+				/* Only check verify write turn on */
+				ret = onenand_verify(mtd, buf - len, to - len, len);
+				if (ret) {
+					printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
+					break;
+				}
+			}
+			ONENAND_SET_NEXT_BUFFERRAM(this);
 
-		/* Only check verify write turn on */
-		ret = onenand_verify(mtd, buf, to, thislen);
-		if (ret) {
-			printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
-			break;
+			if (written == len)
+				break;
 		}
 
-		written += thislen;
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
 
-		if (written == len)
-			break;
+		written += thislen;
 
 		column = 0;
+		prev_subpage = subpage;
+		prev = to;
+		prevlen = thislen;
 		to += thislen;
 		buf += thislen;
+		first = 0;
 	}
 
 	ops->retlen = written;
