Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoMiU-0002Rk-7x
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2012 22:13:51 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: docg4: fix compiler warning
Date: Fri, 20 Jan 2012 14:12:49 -0800
Message-Id: <1327097569-6303-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This changes the declaration of the module parameter variable from int to bool,
an oversight that was flagged by the recent patch to moduleparam.h.

Also added an item to the TODO list in the commentary at the top of the file.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 0132745..3ec1d10 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -20,6 +20,11 @@
  *
  *  Hamming ecc when reading oob only
  *
+ *  According to the M-Sys documentation, this device is also available in a
+ *  "dual-die" configuration having a 256MB capacity, but no mechanism for
+ *  detecting this variant is documented.  Currently this driver assumes 128MB
+ *  capacity.
+ *
  *  Support for multiple cascaded devices ("floors").  Not sure which gadgets
  *  contain multiple G4s in a cascaded configuration, if any.
  *
@@ -48,8 +53,8 @@
  * it does not use mtd nand's method for marking bad blocks (using oob area).
  * This will also skip the check of the "page written" flag.
  */
-static int ignore_badblocks;
-module_param(ignore_badblocks, bool, false);
+static bool ignore_badblocks;
+module_param(ignore_badblocks, bool, 0);
 MODULE_PARM_DESC(ignore_badblocks, "no badblock checking performed");
 
 struct docg4_priv {
-- 
1.7.3.4
