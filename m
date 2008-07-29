Date: Tue, 29 Jul 2008 13:54:11 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, dedekind@infradead.org
Subject: [PATCH] Bugfix subpage read for small page NAND.
Message-ID: <alpine.LFD.1.10.0807291325580.23930@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Current implementation of subpage read feature for NAND has issues with
small page devices. Small page NAND do not support RNDOUT command.
So subpage feature is not applicable for them. 

This patch disables support of subpage for small page NAND. 
The code is verified on nandsim(SP NAND simulation) and on LP NAND
devices. 

Thanks a lot to Artem for finding this issue.  

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
-----------
diff -Naurp 1/include/linux/mtd/nand.h 2/include/linux/mtd/nand.h
--- 1/include/linux/mtd/nand.h	2008-07-29 16:05:17.000000000 +0400
+++ 2/include/linux/mtd/nand.h	2008-07-29 15:38:34.000000000 +0400
@@ -177,7 +177,9 @@ typedef enum {
 #define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
 #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
-#define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT))
+/* Large page NAND with SOFT_ECC should support subpage reads */
+#define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
+					&& (chip->page_shift > 9))
 
 /* Mask to zero out the chip options, which come from the id table */
 #define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
-----------

Thanks,
Alexey
