Received: from mail.tricorecenter.de ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RV25E-0002oj-0E
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 14:21:28 +0000
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mtd/nand: modify NAND_CHIPOPTIONS_MSK
Date: Mon, 28 Nov 2011 15:20:40 +0100
Message-Id: <1322490040-27161-1-git-send-email-j.weitzel@phytec.de>
Cc: dedekind@infradead.org, Jan Weitzel <j.weitzel@phytec.de>,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trying to set NAND_NO_SUBPAGE_WRITE from platform fail, because
nand_flash_detect_onfi options from struct nand_flash_dev overwrite the flag.

Removing NAND_NO_SUBPAGE_WRITE from NAND_CHIPOPTIONS_MSK fix this,
but setting it via struct nand_flash_dev table is not longer supported.

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
 include/linux/mtd/nand.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 904131b..babef5b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -216,7 +216,8 @@ typedef enum {
 					&& (chip->page_shift > 9))
 
 /* Mask to zero out the chip options, which come from the id table */
-#define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
+#define NAND_CHIPOPTIONS_MSK \
+	(0x0000ffff & ~NAND_NO_AUTOINCR & ~NAND_NO_SUBPAGE_WRITE)
 
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
-- 
1.7.0.4
