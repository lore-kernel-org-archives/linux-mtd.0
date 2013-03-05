Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCrj3-0006vW-On
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/11] mtd: nand: remove NAND_NO_PADDING macro
Date: Tue,  5 Mar 2013 15:17:20 +0200
Message-Id: <1362489444-27762-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

It is not used anywhere.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 69097e8..822bc48c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -145,8 +145,6 @@ typedef enum {
  */
 /* Buswidth is 16 bit */
 #define NAND_BUSWIDTH_16	0x00000002
-/* Device supports partial programming without padding */
-#define NAND_NO_PADDING		0x00000004
 /* Chip has cache program function */
 #define NAND_CACHEPRG		0x00000008
 /* Chip has copy back function */
@@ -164,11 +162,9 @@ typedef enum {
 #define NAND_SUBPAGE_READ	0x00001000
 
 /* Options valid for Samsung large page devices */
-#define NAND_SAMSUNG_LP_OPTIONS \
-	(NAND_NO_PADDING | NAND_CACHEPRG | NAND_COPYBACK)
+#define NAND_SAMSUNG_LP_OPTIONS (NAND_CACHEPRG | NAND_COPYBACK)
 
 /* Macros to identify the above */
-#define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
 #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
 #define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
-- 
1.7.10.4
