Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG32N-000457-47
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 07:57:19 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: introduce a macro for max NAND ID sequence length
Date: Thu, 14 Mar 2013 09:58:58 +0200
Message-Id: <1363247938-2915-1-git-send-email-dedekind1@gmail.com>
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

Introduce a helpful macro for the maximum NAND ID sequence length instead of
using the "8" magic number.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/nand.h |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e2c7173..33516eb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -542,6 +542,9 @@ struct nand_chip {
 #define NAND_MFR_MACRONIX	0xc2
 #define NAND_MFR_EON		0x92
 
+/* The maximum expected count of bytes in the NAND ID sequence */
+#define NAND_MAX_ID_LEN 8
+
 /*
  * A helper for defining older NAND chips where the second ID byte fully
  * defined the chip, including the geometry (chip size, eraseblock size, page
@@ -589,7 +592,7 @@ struct nand_flash_dev {
 			uint8_t mfr_id;
 			uint8_t dev_id;
 		};
-		uint8_t id[8];
+		uint8_t id[NAND_MAX_ID_LEN];
 	};
 	unsigned int pagesize;
 	unsigned int chipsize;
-- 
1.7.10.4
