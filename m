Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnl7-0003Dg-Ar
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:29 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi5so452672wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 29/47] mtd: nand: stm_nand_bch: populate IBBT BCH Header
Date: Thu,  1 May 2014 10:56:36 +0100
Message-Id: <1398938214-17847-30-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The STM NAND BCH Controller driver has extended the IBBT header with
some extra convenience properties. This function populates both those
and the standard header specified by 'struct nand_ibbt_header'.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 27a87a3..bf8669b 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/stm_nand.h>
 #include <linux/mtd/partitions.h>
+#include <generated/utsrelease.h>
 
 #include "stm_nand_regs.h"
 #include "stm_nand_dt.h"
@@ -741,6 +742,22 @@ static int bbt_is_block_bad(uint8_t *bbt, uint32_t block)
 	return bbt_get_block_mark(bbt, block) == BBT_MARK_GOOD ? 0 : 1;
 }
 
+/* Populate IBBT BCH Header */
+static void bch_fill_ibbt_header(struct nandi_controller *nandi,
+				 struct nand_ibbt_bch_header *ibbt_header,
+				 int bak, uint8_t vers)
+{
+	const char author[] = "STLinux " UTS_RELEASE " (stm-nand-bch)";
+
+	memcpy(ibbt_header->base.signature, ibbt_sigs[bak], NAND_IBBT_SIGLEN);
+	ibbt_header->base.version = vers;
+	memset(ibbt_header->base.schema, NAND_IBBT_SCHEMA, 4);
+
+	memset(ibbt_header->schema, NAND_IBBT_SCHEMA, 4);
+	memset(ibbt_header->ecc_size, bch_ecc_sizes[nandi->bch_ecc_mode], 4);
+	memcpy(ibbt_header->author, author, sizeof(author));
+}
+
 /* Scan block for IBBT signature */
 static int bch_find_ibbt_sig(struct nandi_controller *nandi,
 			     uint32_t block, int *bak, uint8_t *vers,
-- 
1.8.3.2
