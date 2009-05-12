Received: from n22a.bullet.mail.mud.yahoo.com ([68.142.207.188])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M41Jy-0004Ck-L8
	for linux-mtd@lists.infradead.org; Tue, 12 May 2009 23:23:44 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch 2.6.30-rc5+] davinci_nand: cmdlinepart uses MTD IDs
Date: Tue, 12 May 2009 16:23:32 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905121623.32809.david-b@pacbell.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Snehaprabha Narnakaje <nsnehaprabha@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Remove some legacy code from the davinci_nand driver, which made
cmdlinepart ignore the the MTD ID passed to it.  Boards can have
multiple NAND chips, and some do (like the DM357 EVM), so this
dated hack is undesirable.

Correct labels a"re like davinci_nand.0" (for chipselect 0).

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/nand/davinci_nand.c |   11 -----------
 1 file changed, 11 deletions(-)

--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -718,19 +718,8 @@ syndrome_done:
 			static const char *probes[] __initconst =
 				{ "cmdlinepart", NULL };
 
-			const char		*master_name;
-
-			/* Set info->mtd.name = 0 temporarily */
-			master_name		= info->mtd.name;
-			info->mtd.name		= (char *)0;
-
-			/* info->mtd.name == 0, means: don't bother checking
-			   <mtd-id> */
 			mtd_parts_nb = parse_mtd_partitions(&info->mtd, probes,
 							    &mtd_parts, 0);
-
-			/* Restore info->mtd.name */
-			info->mtd.name = master_name;
 		}
 
 		if (mtd_parts_nb <= 0) {
