Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyY5s-0004a9-05
	for linux-mtd@lists.infradead.org; Mon, 27 Apr 2009 21:10:39 +0000
Message-ID: <49F61F32.3020003@harris.com>
Date: Mon, 27 Apr 2009 17:10:10 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Bug in m25p80.c during whole-chip erase
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a logic error in "whole chip erase" for the m25p80 family.  If
the whole device is successfully erased, erase_chip() will return 0, and
the code will fall through to the "else" clause, and do sector-by-sector
erase in addition to the whole-chip erase.  This patch corrects that.

Also, the MAX_READY_WAIT_COUNT is insufficient for an m25p16 connected
to a 400 MHz powerpc.  Increasing it allows me to successfully program
the device on my board.

Signed-off-by: Steven A. Falco <sfalco@harris.com>
---

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6659b22..3a2fed8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -53,7 +53,7 @@
 #define	SR_SRWD			0x80	/* SR write protect */
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_COUNT	100000
+#define	MAX_READY_WAIT_COUNT	1000000
 #define	CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
@@ -251,10 +251,12 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	mutex_lock(&flash->lock);
 
 	/* whole-chip erase? */
-	if (len == flash->mtd.size && erase_chip(flash)) {
-		instr->state = MTD_ERASE_FAILED;
-		mutex_unlock(&flash->lock);
-		return -EIO;
+	if (len == flash->mtd.size) {
+		if (erase_chip(flash)) {
+			instr->state = MTD_ERASE_FAILED;
+			mutex_unlock(&flash->lock);
+			return -EIO;
+		}
 
 	/* REVISIT in some cases we could speed up erasing large regions
 	 * by using OPCODE_SE instead of OPCODE_BE_4K.  We may have set up
