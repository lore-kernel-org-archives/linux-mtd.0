Message-Id: <200903042001.n24K1ctw028782@imap1.linux-foundation.org>
Subject: [patch 11/15] NAND: fix broken debug messages
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:38 -0800
Cc: akpm@linux-foundation.org, dbrownell@users.sourceforge.net,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Fix incorrect debug messages (*write* not read); someone committed some
cut'n'paste bugs.   There might be more, I only noticed these since I was
looking for nand_read usage and landed in some very wrong functions.

IMO all MTD debugging message framework is goofed, anyway.  It uses
"DEBUG" in a way that's incompatible with usage most everywhere else in
the kernel, and which prevents normal pr_dbg() and dev_dbg() calls from
working right.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nand_base.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -puN drivers/mtd/nand/nand_base.c~nand-fix-broken-debug-messages drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c~nand-fix-broken-debug-messages
+++ a/drivers/mtd/nand/nand_base.c
@@ -1946,7 +1946,7 @@ static int nand_do_write_oob(struct mtd_
 	}
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
 			"Attempt to start write outside oob\n");
 		return -EINVAL;
 	}
@@ -1956,7 +1956,7 @@ static int nand_do_write_oob(struct mtd_
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
 			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
 			"Attempt write beyond end of device\n");
 		return -EINVAL;
 	}
@@ -2012,8 +2012,8 @@ static int nand_write_oob(struct mtd_inf
 
 	/* Do not allow writes past end of device */
 	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
-		      "Attempt read beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
+		      "Attempt write beyond end of device\n");
 		return -EINVAL;
 	}
 
_
