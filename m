Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181qCL-0001KL-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 16:35:01 +0100
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E499@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Bugfix in nand_write_page
Date: Wed, 16 Oct 2002 11:34:57 -0400
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This patch fixes a bug with verifying a NAND write with
CONFIG_MTD_NAND_VERIFY_WRITE enabled. It needs to verify
using the proper data buffer.

Dave Ellis

Index: nand.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand.c,v
retrieving revision 1.32
diff -u -p -r1.32 nand.c
--- nand.c	13 Sep 2002 14:27:37 -0000	1.32
+++ nand.c	16 Oct 2002 15:26:37 -0000
@@ -481,7 +481,7 @@ static int nand_write_page (struct mtd_i
 	this->cmdfunc (mtd, NAND_CMD_READ0, col, page);
 	/* Loop through and verify the data */
 	for (i = col; i < last; i++) {
-		if (this->data_buf[i] != readb (this->IO_ADDR_R)) {
+		if (this->data_poi[i] != readb (this->IO_ADDR_R)) {
 			DEBUG (MTD_DEBUG_LEVEL0, "nand_write_ecc: " "Failed
write verify, page 0x%08x ", page);
 			return -EIO;
 		}
