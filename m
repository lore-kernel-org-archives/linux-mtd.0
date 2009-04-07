Received: from n21.bullet.mail.mud.yahoo.com ([68.142.206.160])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrL88-0003fq-H6
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 23:55:06 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch 2.6.30-rc1] NAND:  don't walk past end of oobfree[]
Date: Tue, 7 Apr 2009 16:54:55 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904071654.55886.david-b@pacbell.net>
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>
Reply-To: dbrownell@users.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Resolve issue noted by Sneha:  when computing oobavail from
the list of free areas in the OOB, don't assume there will
always be an unused slot at the end.  With ECC_HW_SYNDROME
and 4K page chips, it's fairly likely there *won't* be one.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>"
---
Seems appropriate for a 2.6.30-rc merge.

 drivers/mtd/nand/nand_base.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
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
