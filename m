Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lc8Jw-00050N-Ka
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 01:12:23 +0000
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch/RESEND 2.6.29-rc3] NAND:
	=?iso-8859-1?q?=A0fix_broken_debug_messages?= (v2)
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
Date: Tue, 24 Feb 2009 15:10:24 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <200902241510.24993.david-b@pacbell.net>
Cc: lkml <linux-kernel@vger.kernel.org>
Reply-To: dbrownell@users.sourceforge.net
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
committed some cut'n'paste bugs.  There might be more,
I only noticed these since I was looking for nand_read
usage and landed in some very wrong functions.

IMO all MTD debugging message framework is goofed, anyway.
It uses "DEBUG" in a way that's incompatible with usage
most everywhere else in the kernel, and which prevents
normal pr_dbg() and dev_dbg() calls from working right.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
Fix a goofed string.

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
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
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
 
