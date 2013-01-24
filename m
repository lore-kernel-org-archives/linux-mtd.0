Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TyGvQ-0001aX-Ds
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 07:08:41 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 3/3] mtd: add the new detection method for the unparsable
 nand chips
Date: Thu, 24 Jan 2013 14:11:41 +0800
Message-ID: <1359007901-26464-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1359007901-26464-1-git-send-email-b32955@freescale.com>
References: <1359007901-26464-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the new detection method find_nand_type_by_fullid() for the
unparsable nand chips. The new detection method is called firstly
before all the other detection methods.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   33 ++++++++++++++++++++++++++++++++-
 1 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0e80ec4..7f0431d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3152,6 +3152,29 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
+static struct nand_flash_dev *find_nand_type_by_fullid(struct mtd_info *mtd,
+				struct nand_chip *chip, u8 *id_data, int *busw)
+{
+	struct nand_flash_dev *type = nand_flash_full_ids;
+
+	for (; type->name != NULL; type++) {
+		if (!strncmp(type->id, id_data, type->id_len)) {
+			mtd->writesize = type->pagesize;
+			mtd->erasesize = type->erasesize;
+			mtd->oobsize = type->oobsize;
+
+			chip->cellinfo = id_data[2];
+			chip->chipsize = (uint64_t)type->chipsize << 20;
+			chip->options |= type->options;
+
+			*busw = type->options & NAND_BUSWIDTH_16;
+
+			break;
+		}
+	}
+	return type;
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -3200,8 +3223,16 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		return ERR_PTR(-ENODEV);
 	}
 
-	if (!type)
+	if (!type) {
+		/*
+		 * Some nand chips's information can not be paresed out
+		 * from the id data. So, try your luck in the full-id table.
+		 */
+		type = find_nand_type_by_fullid(mtd, chip, id_data, &busw);
+		if (type->name != NULL)
+			goto ident_done;
 		type = nand_flash_ids;
+	}
 
 	for (; type->name != NULL; type++)
 		if (*dev_id == type->id[1])
-- 
1.7.0.4
