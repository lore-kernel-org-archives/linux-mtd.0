Message-Id: <200812012223.mB1MNcNZ014525@imap1.linux-foundation.org>
Subject: [patch 2/6] mtd: remove excess kernel-doc notation
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:23:38 -0800
Cc: randy.dunlap@oracle.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Delete extra kernel-doc notation for struct fields and function
parameters that don't exist:

Warning(include/linux/mtd/nand.h:428): Excess struct/union/enum/typedef member 'wq' description in 'nand_chip'
Warning(include/linux/mtd/nand.h:428): Excess struct/union/enum/typedef member 'datbuf' description in 'nand_chip'
Warning(include/linux/mtd/nand.h:428): Excess struct/union/enum/typedef member 'oobbuf' description in 'nand_chip'
Warning(include/linux/mtd/nand.h:428): Excess struct/union/enum/typedef member 'oobdirty' description in 'nand_chip'
Warning(include/linux/mtd/nand.h:428): Excess struct/union/enum/typedef member 'data_poi' description in 'nand_chip'
Warning(drivers/mtd/nand/nand_base.c:2527): Excess function parameter 'maxchips' description in 'nand_scan_tail'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nand_base.c |    1 -
 include/linux/mtd/nand.h     |    5 -----
 2 files changed, 6 deletions(-)

diff -puN drivers/mtd/nand/nand_base.c~mtd-remove-excess-kernel-doc-notation drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c~mtd-remove-excess-kernel-doc-notation
+++ a/drivers/mtd/nand/nand_base.c
@@ -2517,7 +2517,6 @@ int nand_scan_ident(struct mtd_info *mtd
 /**
  * nand_scan_tail - [NAND Interface] Scan for the NAND device
  * @mtd:	    MTD device structure
- * @maxchips:	    Number of chips to scan for
  *
  * This is the second phase of the normal nand_scan() function. It
  * fills out all the uninitialized function pointers with the defaults
diff -puN include/linux/mtd/nand.h~mtd-remove-excess-kernel-doc-notation include/linux/mtd/nand.h
--- a/include/linux/mtd/nand.h~mtd-remove-excess-kernel-doc-notation
+++ a/include/linux/mtd/nand.h
@@ -335,17 +335,12 @@ struct nand_buffers {
  * @erase_cmd:		[INTERN] erase command write function, selectable due to AND support
  * @scan_bbt:		[REPLACEABLE] function to scan bad block table
  * @chip_delay:		[BOARDSPECIFIC] chip dependent delay for transfering data from array to read regs (tR)
- * @wq:			[INTERN] wait queue to sleep on if a NAND operation is in progress
  * @state:		[INTERN] the current state of the NAND device
  * @oob_poi:		poison value buffer
  * @page_shift:		[INTERN] number of address bits in a page (column address bits)
  * @phys_erase_shift:	[INTERN] number of address bits in a physical eraseblock
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
  * @chip_shift:		[INTERN] number of address bits in one chip
- * @datbuf:		[INTERN] internal buffer for one page + oob
- * @oobbuf:		[INTERN] oob buffer for one eraseblock
- * @oobdirty:		[INTERN] indicates that oob_buf must be reinitialized
- * @data_poi:		[INTERN] pointer to a data buffer
  * @options:		[BOARDSPECIFIC] various chip options. They can partly be set to inform nand_scan about
  *			special functionality. See the defines for further explanation
  * @badblockpos:	[INTERN] position of the bad block marker in the oob area
_
