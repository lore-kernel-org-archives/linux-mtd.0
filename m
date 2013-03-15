Received: from mail-db8lp0187.outbound.messaging.microsoft.com
 ([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGKw5-0007I1-P6
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 03:04:03 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 2/3] mtd: add the support to parse out the full-id nand type
Date: Fri, 15 Mar 2013 11:01:00 +0800
Message-ID: <1363316461-10592-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1363316461-10592-1-git-send-email-b32955@freescale.com>
References: <1363316461-10592-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we meet a full-id nand type whose @id_len is not zero, we can use
the find_full_id_nand() to parse out the necessary information for a
nand chip.

If we meet a non full-id nand type, we can handle it in the legacy way.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   35 ++++++++++++++++++++++++++++++++---
 1 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 72eada2..49de9da 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3123,6 +3123,30 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
+static inline bool is_full_id_nand(struct nand_flash_dev *type)
+{
+	return type->id_len;
+}
+
+static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
+		   struct nand_flash_dev *type, u8 *id_data, int *busw)
+{
+	if (!strncmp(type->id, id_data, type->id_len)) {
+		mtd->writesize = type->pagesize;
+		mtd->erasesize = type->erasesize;
+		mtd->oobsize = type->oobsize;
+
+		chip->cellinfo = id_data[2];
+		chip->chipsize = (uint64_t)type->chipsize << 20;
+		chip->options |= type->options;
+
+		*busw = type->options & NAND_BUSWIDTH_16;
+
+		return true;
+	}
+	return false;
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -3174,9 +3198,14 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (!type)
 		type = nand_flash_ids;
 
-	for (; type->name != NULL; type++)
-		if (*dev_id == type->dev_id)
-			break;
+	for (; type->name != NULL; type++) {
+		if (is_full_id_nand(type)) {
+			if (find_full_id_nand(mtd, chip, type, id_data, &busw))
+				goto ident_done;
+		} else if (*dev_id == type->dev_id) {
+				break;
+		}
+	}
 
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
-- 
1.7.1
