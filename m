Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCHsW-0001Q0-1K
	for linux-mtd@lists.infradead.org; Wed, 31 Jan 2007 11:00:10 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0VFuZoe014814
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jan 2007 17:57:57 +0200
Message-ID: <45C0BCA5.40807@nokia.com>
Date: Wed, 31 Jan 2007 17:58:29 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NAND] Correctly validate out-of-band offset and length
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add checks to ensure that out-of-band reads and writes are
not attempted with an invalid offset or length.  Specifically,
the offset must be less than the size of oob for a page
and the length must not go beyond the size of the device.
Additionally the checks must adjust for auto-placement
(MTD_OOB_AUTO) of oob data.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nand_base.c |   46 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dfe56e0..c13d664 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1272,10 +1272,25 @@ static int nand_do_read_oob(struct mtd_i
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_read_oob: from = 0x%08Lx, len = %i\n",
 	      (unsigned long long)from, readlen);
 
-	if (ops->mode == MTD_OOB_RAW)
-		len = mtd->oobsize;
-	else
+	if (ops->mode == MTD_OOB_AUTO)
 		len = chip->ecc.layout->oobavail;
+	else
+		len = mtd->oobsize;
+
+	if (unlikely(ops->ooboffs >= len)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+			"Attempt to start read outside oob\n");
+		return -EINVAL;
+	}
+
+	/* Do not allow reads past end of device */
+	if (unlikely(from >= mtd->size ||
+		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
+					(from >> chip->page_shift)) * len)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+			"Attempt read beyond end of device\n");
+		return -EINVAL;
+	}
 
 	chipnr = (int)(from >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
@@ -1742,19 +1757,40 @@ static int nand_write(struct mtd_info *m
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
-	int chipnr, page, status;
+	int chipnr, page, status, len;
 	struct nand_chip *chip = mtd->priv;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_write_oob: to = 0x%08x, len = %i\n",
 	      (unsigned int)to, (int)ops->ooblen);
 
+	if (ops->mode == MTD_OOB_AUTO)
+		len = chip->ecc.layout->oobavail;
+	else
+		len = mtd->oobsize;
+
 	/* Do not allow write past end of page */
-	if ((ops->ooboffs + ops->ooblen) > mtd->oobsize) {
+	if ((ops->ooboffs + ops->ooblen) > len) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
 		      "Attempt to write past end of page\n");
 		return -EINVAL;
 	}
 
+	if (unlikely(ops->ooboffs >= len)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+			"Attempt to start write outside oob\n");
+		return -EINVAL;
+	}
+
+	/* Do not allow reads past end of device */
+	if (unlikely(to >= mtd->size ||
+		     ops->ooboffs + ops->ooblen >
+			((mtd->size >> chip->page_shift) -
+			 (to >> chip->page_shift)) * len)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+			"Attempt write beyond end of device\n");
+		return -EINVAL;
+	}
+
 	chipnr = (int)(to >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
 
-- 
1.4.3
