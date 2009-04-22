Received: from n13a.bullet.mail.mud.yahoo.com ([68.142.207.51])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LwSl0-0004O9-3x
	for linux-mtd@lists.infradead.org; Wed, 22 Apr 2009 03:04:24 +0000
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch/RESEND 2.6.30-rc2 1/3] NAND: don't walk past end of oobfree[]
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
Date: Tue, 21 Apr 2009 19:51:20 -0700
MIME-Version: 1.0
Message-Id: <200904211951.21270.david-b@pacbell.net>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
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
and 4KB page chips, it's fairly likely there *won't* be one.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>"
---
RESEND refreshed 7-april version.
Still seems appropriate for a 2.6.30-rc merge.

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
