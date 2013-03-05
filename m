Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCrj4-0006w4-Qk
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/11] mtd: nand: remove NAND_COPYBACK macro
Date: Tue,  5 Mar 2013 15:17:21 +0200
Message-Id: <1362489444-27762-9-git-send-email-dedekind1@gmail.com>
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

It is unused.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 822bc48c..9af859f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -147,8 +147,6 @@ typedef enum {
 #define NAND_BUSWIDTH_16	0x00000002
 /* Chip has cache program function */
 #define NAND_CACHEPRG		0x00000008
-/* Chip has copy back function */
-#define NAND_COPYBACK		0x00000010
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 
@@ -162,11 +160,10 @@ typedef enum {
 #define NAND_SUBPAGE_READ	0x00001000
 
 /* Options valid for Samsung large page devices */
-#define NAND_SAMSUNG_LP_OPTIONS (NAND_CACHEPRG | NAND_COPYBACK)
+#define NAND_SAMSUNG_LP_OPTIONS (NAND_CACHEPRG)
 
 /* Macros to identify the above */
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
-#define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
 #define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
 
 /* Non chip related options */
-- 
1.7.10.4
