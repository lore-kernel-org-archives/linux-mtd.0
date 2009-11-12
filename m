Received: from fmmailgate02.web.de ([217.72.192.227])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8WuI-0002C9-SD
	for linux-mtd@lists.infradead.org; Thu, 12 Nov 2009 10:28:07 +0000
Date: Thu, 12 Nov 2009 11:28:01 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: mxc nand i.mx35: no OOB with HW_ECC
Message-ID: <20091112102801.GX30179@pengutronix.de>
References: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
Sender: saschahauer@web.de
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


For the reference, here is what I used to test the driver with jffs2 on
i.MX27 (smallpage/2k page) and on i.MX35 (2k page). Apart from what I
was saying I had another change in my tree in parsing the
NAND_CMD_SEQIN.

Sascha

commit ce388af8574a8af2e0b46e8b9b4bc8f358896a90
Author: Sascha Hauer <s.hauer@pengutronix.de>
Date:   Thu Nov 12 11:25:23 2009 +0100

    mxc-nand: use mxc_do_addr_cycle from v2 driver
    
    Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d5445cd..a80f900 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -501,44 +501,24 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 	struct nand_chip *nand_chip = mtd->priv;
 	struct mxc_nand_host *host = nand_chip->priv;
 
-	/* Write out column address, if necessary */
+	u32 page_mask = nand_chip->pagemask;
+
 	if (column != -1) {
-		/*
-		 * MXC NANDFC can only perform full page+spare or
-		 * spare-only read/write.  When the upper layers
-		 * layers perform a read/write buf operation,
-		 * we will used the saved column adress to index into
-		 * the full page.
-		 */
-		send_addr(host, 0, page_addr == -1);
-		if (mtd->writesize > 512)
+		send_addr(host, column & 0xFF, 0);
+		if (mtd->writesize == 2048) {
 			/* another col addr cycle for 2k page */
-			send_addr(host, 0, false);
+			send_addr(host, (column >> 8) & 0xF, 0);
+		} else if (mtd->writesize == 4096) {
+			/* another col addr cycle for 4k page */
+			send_addr(host, (column >> 8) & 0x1F, 0);
+		}
 	}
-
-	/* Write out page address, if necessary */
 	if (page_addr != -1) {
-		/* paddr_0 - p_addr_7 */
-		send_addr(host, (page_addr & 0xff), false);
-
-		if (mtd->writesize > 512) {
-			if (mtd->size >= 0x10000000) {
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, false);
-				send_addr(host, (page_addr >> 16) & 0xff, true);
-			} else
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, true);
-		} else {
-			/* One more address cycle for higher density devices */
-			if (mtd->size >= 0x4000000) {
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, false);
-				send_addr(host, (page_addr >> 16) & 0xff, true);
-			} else
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, true);
-		}
+		do {
+			send_addr(host, (page_addr & 0xff), 0);
+			page_mask >>= 8;
+			page_addr >>= 8;
+		} while (page_mask != 0);
 	}
 }
 
@@ -591,31 +571,21 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		break;
 
 	case NAND_CMD_SEQIN:
-		if (column >= mtd->writesize) {
-			/*
-			 * FIXME: before send SEQIN command for write OOB,
-			 * We must read one page out.
-			 * For K9F1GXX has no READ1 command to set current HW
-			 * pointer to spare area, we must write the whole page
-			 * including OOB together.
-			 */
-			if (mtd->writesize > 512)
-				/* call ourself to read a page */
-				mxc_nand_command(mtd, NAND_CMD_READ0, 0,
-						page_addr);
-
-			host->buf_start = column;
+		/* Before send SEQIN command for
+		 * partial write, we need to read one page out.
+		 * FSL NFC does not support partial write.
+		 * It always sends out 512 + ecc + 512 + ecc ...
+		 * for large page nand flash. But for small
+		 * page nand flash, it did support SPARE
+		 * ONLY operation. But to make driver
+		 * simple. We take the same as large page, read
+		 * whole page out and update.
+		 */
 
-			/* Set program pointer to spare region */
-			if (mtd->writesize == 512)
-				send_cmd(host, NAND_CMD_READOOB, false);
-		} else {
-			host->buf_start = column;
+		if (column)
+			mxc_nand_command(mtd, NAND_CMD_READ0, 0, page_addr);
 
-			/* Set program pointer to page start */
-			if (mtd->writesize == 512)
-				send_cmd(host, NAND_CMD_READ0, false);
-		}
+		host->buf_start = column;
 
 		send_cmd(host, command, false);
 		mxc_do_addr_cycle(mtd, column, page_addr);
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
