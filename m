Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ01x-0001bL-70
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 14:34:44 +0000
Received: by mail-wm0-x243.google.com with SMTP id l65so31646898wmf.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2016 06:34:20 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <josh.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [RFC PATCH 1/4] mtd: atmel_nand: Do not warn on bitflips
Date: Tue, 12 Jan 2016 15:33:40 +0100
Message-Id: <1452609223-14790-2-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using multi-bit ECC, it is normal for the NAND Flash driver to
correct bit errors during the life of the product. Those errors will
only be cleared once a threshold has been reached, and corrections can
occur regularly before this.

Use only dev_dbg and not dev_info to report the bitflips, to keep the
system log clean when everything works correctly.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 46010bd895b1..9d71f9e6a8de 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -824,7 +824,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 			*(buf + byte_pos) ^= (1 << bit_pos);
 
 			pos = sector_num * host->pmecc_sector_size + byte_pos;
-			dev_info(host->dev, "Bit flip in data area, byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
+			dev_dbg(host->dev, "Bit flip in data area, byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
 				pos, bit_pos, err_byte, *(buf + byte_pos));
 		} else {
 			/* Bit flip in OOB area */
@@ -834,7 +834,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 			ecc[tmp] ^= (1 << bit_pos);
 
 			pos = tmp + nand_chip->ecc.layout->eccpos[0];
-			dev_info(host->dev, "Bit flip in OOB, oob_byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
+			dev_dbg(host->dev, "Bit flip in OOB, oob_byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
 				pos, bit_pos, err_byte, ecc[tmp]);
 		}
 
-- 
2.5.0
