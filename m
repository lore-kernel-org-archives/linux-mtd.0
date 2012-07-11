Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sp1Ky-0003gK-Py
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 18:08:39 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand/docg4: fix oob reads
Date: Wed, 11 Jul 2012 11:08:19 -0700
Message-Id: <1342030099-3326-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch does two closely related things:

(1) Currently the ecc.read_page() method does not fill the nand->oob_poi buffer
with the oob data, but instead reads oob into a local buffer.  Fix this by
filling the oob_poi buffer instead of a local buffer.  The 'oob_required'
argument is quietly ignored; the device must always read oob after the page
data, and it is presumed that there's no harm in filling oob_poi, even when not
explicitly requested.

(2) Always read oob from the device in ecc.read_oob(), instead of copying it
from a local buffer under some circumstances.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |   33 ++++++---------------------------
 1 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 0f2ffd7..793921e 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -378,9 +378,9 @@ static int correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		 * bit flips(s) are not reported in stats.
 		 */
 
-		if (doc->oob_buf[15]) {
+		if (nand->oob_poi[15]) {
 			int bit, numsetbits = 0;
-			unsigned long written_flag = doc->oob_buf[15];
+			unsigned long written_flag = nand->oob_poi[15];
 			for_each_set_bit(bit, &written_flag, 8)
 				numsetbits++;
 			if (numsetbits > 4) { /* assume blank */
@@ -428,7 +428,7 @@ static int correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		/* if error within oob area preceeding ecc bytes... */
 		if (errpos[i] > DOCG4_PAGE_SIZE * 8)
 			change_bit(errpos[i] - DOCG4_PAGE_SIZE * 8,
-				   (unsigned long *)doc->oob_buf);
+				   (unsigned long *)nand->oob_poi);
 
 		else    /* error in page data */
 			change_bit(errpos[i], (unsigned long *)buf);
@@ -748,18 +748,12 @@ static int read_page(struct mtd_info *mtd, struct nand_chip *nand,
 
 	docg4_read_buf(mtd, buf, DOCG4_PAGE_SIZE); /* read the page data */
 
-	/*
-	 * Diskonchips read oob immediately after a page read.  Mtd
-	 * infrastructure issues a separate command for reading oob after the
-	 * page is read.  So we save the oob bytes in a local buffer and just
-	 * copy it if the next command reads oob from the same page.
-	 */
-
+	/* this device always reads oob after page data */
 	/* first 14 oob bytes read from I/O reg */
-	docg4_read_buf(mtd, doc->oob_buf, 14);
+	docg4_read_buf(mtd, nand->oob_poi, 14);
 
 	/* last 2 read from another reg */
-	buf16 = (uint16_t *)(doc->oob_buf + 14);
+	buf16 = (uint16_t *)(nand->oob_poi + 14);
 	*buf16 = readw(docptr + DOCG4_MYSTERY_REG);
 
 	write_nop(docptr);
@@ -807,21 +801,6 @@ static int docg4_read_oob(struct mtd_info *mtd, struct nand_chip *nand,
 
 	dev_dbg(doc->dev, "%s: page %x\n", __func__, page);
 
-	/*
-	 * Oob bytes are read as part of a normal page read.  If the previous
-	 * nand command was a read of the page whose oob is now being read, just
-	 * copy the oob bytes that we saved in a local buffer and avoid a
-	 * separate oob read.
-	 */
-	if (doc->last_command.command == NAND_CMD_READ0 &&
-	    doc->last_command.page == page) {
-		memcpy(nand->oob_poi, doc->oob_buf, 16);
-		return 0;
-	}
-
-	/*
-	 * Separate read of oob data only.
-	 */
 	docg4_command(mtd, NAND_CMD_READ0, nand->ecc.size, page);
 
 	writew(DOC_ECCCONF0_READ_MODE | DOCG4_OOB_SIZE, docptr + DOC_ECCCONF0);
-- 
1.7.3.4
