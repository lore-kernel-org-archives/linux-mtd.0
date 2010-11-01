Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PD2Fc-0006VM-Ur
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2010 21:49:17 +0000
Date: Mon, 1 Nov 2010 14:47:29 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: fix nand kernel-doc warnings
Message-Id: <20101101144729.e0c58fec.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Warning(include/linux/mtd/nand.h:543): No description found for parameter 'badblockbits'
Warning(drivers/mtd/nand/nand_bbt.c:1101): No description found for parameter 'mtd'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/nand/nand_bbt.c |    3 ++-
 include/linux/mtd/nand.h    |    2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

--- linux-2.6.36-git17.orig/include/linux/mtd/nand.h
+++ linux-2.6.36-git17/include/linux/mtd/nand.h
@@ -448,6 +448,8 @@ struct nand_buffers {
  *			See the defines for further explanation.
  * @badblockpos:	[INTERN] position of the bad block marker in the oob
  *			area.
+ * @badblockbits:	[INTERN] number of bits to left-shift the bad block
+ *			number
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
--- linux-2.6.36-git17.orig/drivers/mtd/nand/nand_bbt.c
+++ linux-2.6.36-git17/drivers/mtd/nand/nand_bbt.c
@@ -1092,7 +1092,8 @@ static void mark_bbt_region(struct mtd_i
 
 /**
  * verify_bbt_descr - verify the bad block description
- * @bd:			the table to verify
+ * @mtd:	MTD device structure
+ * @bd:		the table to verify
  *
  * This functions performs a few sanity checks on the bad block description
  * table.
