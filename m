Message-Id: <200905122106.n4CL6HIl009491@imap1.linux-foundation.org>
Subject: [patch 10/14] mtd: nand: don't walk past end of oobfree[]
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:47:01 -0700
Cc: nsnehaprabha@ti.com, akpm@linux-foundation.org,
	dbrownell@users.sourceforge.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Resolve issue noted by Sneha: when computing oobavail from the list of
free areas in the OOB, don't assume there will always be an unused slot at
the end.  With ECC_HW_SYNDROME and 4KB page chips, it's fairly likely
there *won't* be one.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>"
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nand_base.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN drivers/mtd/nand/nand_base.c~mtd-nand-dont-walk-past-end-of-oobfree drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c~mtd-nand-dont-walk-past-end-of-oobfree
+++ a/drivers/mtd/nand/nand_base.c
@@ -2756,7 +2756,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * the out of band area
 	 */
 	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
+	for (i = 0; chip->ecc.layout->oobfree[i].length
+			&& i < ARRAY_SIZE(chip->ecc.layout->oobfree); i++)
 		chip->ecc.layout->oobavail +=
 			chip->ecc.layout->oobfree[i].length;
 	mtd->oobavail = chip->ecc.layout->oobavail;
_
