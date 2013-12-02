Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnQ5f-00089I-Ss
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 09:46:57 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: parse out the datasheet's required minimum ECC for
 Hynix(>=26nm)
Date: Mon, 2 Dec 2013 17:20:26 +0800
Message-ID: <1385976026-31606-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1385974906-29891-1-git-send-email-b32955@freescale.com>
References: <1385974906-29891-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Parse out the datasheet's required minimum ECC for Hynix nand chips which
use the >=26 technology and the id length is 6.

Referencd to the H27UBG8T2B.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4dab696..5c1ffd0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3201,6 +3201,26 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->erasesize = 768 * 1024;
 		else
 			mtd->erasesize = (64 * 1024) << tmp;
+
+		/* ecc info */
+		tmp = (id_data[4] >> 4) & 0x7;
+
+		if (tmp <= 4) {
+			if (tmp == 0)
+				chip->ecc_strength_ds = 0;
+			else
+				chip->ecc_strength_ds = 1 << (tmp - 1);
+			chip->ecc_step_ds = 512;
+		} else {
+			chip->ecc_step_ds = 1024;
+			if (tmp == 5)
+				chip->ecc_strength_ds = 24;
+			else if (tmp == 6)
+				chip->ecc_strength_ds = 32;
+			else /* (tmp == 7) */
+				chip->ecc_strength_ds = 40;
+		}
+
 		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
 			!nand_is_slc(chip) && (id_data[5] & 0x7) > 3) {
-- 
1.7.2.rc3
