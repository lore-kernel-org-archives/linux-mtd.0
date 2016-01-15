Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aK1jR-00048d-Nr
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 10:35:50 +0000
Received: by mail-wm0-x241.google.com with SMTP id u188so2142148wmu.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 02:35:29 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v2 1/8] mtd: atmel_nand: Do not warn on bitflips
Date: Fri, 15 Jan 2016 11:34:55 +0100
Message-Id: <1452854102-6125-2-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
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
Acked-by:  Wenyou Yang <wenyou.yang@atmel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
v2: no change

 drivers/mtd/nand/atmel_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 583cdd9bb971..b8abf14e1298 100644
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
