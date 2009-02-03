Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUAmx-0003eo-Cw
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 02:13:26 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch 2.6.29-rc3] NAND: =?iso-8859-1?q?=A0fix_broken_debug?= messages
Date: Mon, 2 Feb 2009 18:13:20 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902021813.20748.david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Fix incorrect debug messages (*write* not read); someone
committed some cut'n'paste bugs.  There might be more,
I only noticed these since I was looking for nand_read
usage and landed in some very wrong functions.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/nand/nand_base.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1948,7 +1948,7 @@ static int nand_do_write_oob(struct mtd_
 	}
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
 			"Attempt to start write outside oob\n");
 		return -EINVAL;
 	}
@@ -1958,7 +1958,7 @@ static int nand_do_write_oob(struct mtd_
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
 			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
+		DEBUG(MTD_DEBUG_LEVEL0, "do_nand_write_oob: "
 			"Attempt write beyond end of device\n");
 		return -EINVAL;
 	}
@@ -2014,8 +2014,8 @@ static int nand_write_oob(struct mtd_inf
 
 	/* Do not allow writes past end of device */
 	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
-		      "Attempt read beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
+		      "Attempt write beyond end of device\n");
 		return -EINVAL;
 	}
 
