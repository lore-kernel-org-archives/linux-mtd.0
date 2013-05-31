Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UiTeV-0008PV-Hv
 for linux-mtd@lists.infradead.org; Fri, 31 May 2013 18:02:12 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: docg4: fix status polling loop
Date: Fri, 31 May 2013 11:00:31 -0700
Message-Id: <1370023231-8779-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The loop that polls the status register after a write or erase operation is a
simple loop that is independent of the processor clock rate.  This bit of
sloppiness came back to bite me when I increased the clock rate and timeouts
started occurring.  This patch cleans this up by basing the timeout on jiffies.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

This is a rework of an earlier patch, based on Artem's suggestion to use
jiffies.  I did not call it 'v2' because the original description is no longer
correct (udelay() is not used in this patch).  Thanks Artem.

 drivers/mtd/nand/docg4.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index fa25e7a..6c3be21 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -44,6 +44,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/bch.h>
 #include <linux/bitrev.h>
+#include <linux/jiffies.h>
 
 /*
  * In "reliable mode" consecutive 2k pages are used in parallel (in some
@@ -269,7 +270,7 @@ static int poll_status(struct docg4_priv *doc)
 	 */
 
 	uint16_t flash_status;
-	unsigned int timeo;
+	unsigned long timeo;
 	void __iomem *docptr = doc->virtadr;
 
 	dev_dbg(doc->dev, "%s...\n", __func__);
@@ -277,22 +278,18 @@ static int poll_status(struct docg4_priv *doc)
 	/* hardware quirk requires reading twice initially */
 	flash_status = readw(docptr + DOC_FLASHCONTROL);
 
-	timeo = 1000;
+	timeo = jiffies + msecs_to_jiffies(200); /* generous timeout */
 	do {
 		cpu_relax();
 		flash_status = readb(docptr + DOC_FLASHCONTROL);
-	} while (!(flash_status & DOC_CTRL_FLASHREADY) && --timeo);
+	} while (!(flash_status & DOC_CTRL_FLASHREADY) &&
+		 time_before(jiffies, timeo));
 
-
-	if (!timeo) {
+	if (unlikely(!(flash_status & DOC_CTRL_FLASHREADY))) {
 		dev_err(doc->dev, "%s: timed out!\n", __func__);
 		return NAND_STATUS_FAIL;
 	}
 
-	if (unlikely(timeo < 50))
-		dev_warn(doc->dev, "%s: nearly timed out; %d remaining\n",
-			 __func__, timeo);
-
 	return 0;
 }
 
-- 
1.7.8.6
