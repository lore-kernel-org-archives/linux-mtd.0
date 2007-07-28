Received: from baikonur.stro.at ([213.239.196.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IEkBc-0003Gr-G2
	for linux-mtd@lists.infradead.org; Sat, 28 Jul 2007 07:10:17 -0400
Date: Sat, 28 Jul 2007 13:07:16 +0200
From: maximilian attems <max@stro.at>
To: dwmw2@infradead.org
Subject: [patch] nand_base.c fix broken link
Message-ID: <20070728110716.GA26191@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

replace with working link from nand Kconfig help text
fixes bugzilla 7815

Signed-off-by: maximilian attems <max@stro.at>

---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7e68203..6ede757 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -7,7 +7,7 @@
  *   Basic support for AG-AND chips is provided.
  *
  *	Additional technical information is available on
- *	http://www.linux-mtd.infradead.org/tech/nand.html
+ *	http://www.linux-mtd.infradead.org/doc/nand.html
  *
  *  Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
  *		  2002-2006 Thomas Gleixner (tglx@linutronix.de)
 
--
maks
