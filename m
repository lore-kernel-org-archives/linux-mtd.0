Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFkPG-00086I-AZ
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 12:03:43 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: use more reasonable integer types
Date: Wed, 13 Mar 2013 14:05:00 +0200
Message-Id: <1363176300-9016-1-git-send-email-dedekind1@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Use 'unsigned int' instead of 'unsigned long' in the NAND chip description data
structure, because 32-bits is more than enough for our purposes. We do not need
64-bits, which is what we end up on 64-bit architectures. We declare many
instances of this data structure, so this should help saving some amount of
memory.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0c40beb..e2c7173 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -578,8 +578,8 @@ struct nand_chip {
  * @pagesize: size of the NAND page in bytes; if 0, then the real page size (as
  *            well as the eraseblock size) is determined from the extended NAND
  *            chip ID array)
- * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
  * @chipsize: total chip size in MiB
+ * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
  * @options: stores various chip bit options
  */
 struct nand_flash_dev {
@@ -591,10 +591,10 @@ struct nand_flash_dev {
 		};
 		uint8_t id[8];
 	};
-	unsigned long pagesize;
-	unsigned long chipsize;
-	unsigned long erasesize;
-	unsigned long options;
+	unsigned int pagesize;
+	unsigned int chipsize;
+	unsigned int erasesize;
+	unsigned int options;
 };
 
 /**
-- 
1.7.10.4
