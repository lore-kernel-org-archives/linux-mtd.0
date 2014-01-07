Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::11])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0TXB-0002Ho-Gx
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 10:05:18 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Date: Tue,  7 Jan 2014 11:04:43 +0100
Message-Id: <1389089083-29694-1-git-send-email-sr@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Toshiba's TC58NVG1S3ETAI0 is a single 3.3V 2 Gbit (2,214,592,512 bits) NAND
Electrically Erasable and Programmable Read-Only Memory (NAND E2PROM)
organized as (2048 + 64) bytes x 64 pages x 2048 blocks.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Pekon Gupta <pekon@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index a87b0a3..cb4ece3 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -31,6 +31,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 * listed by full ID. We list them first so that we can easily identify
 	 * the most specific match.
 	 */
+	{"TC58NVG1S3ETAI0 2G 3.3V 8-bit",
+		{ .id = {0x98, 0xda, 0x90, 0x15, 0x76, 0x00, 0x00, 0x00} },
+		  SZ_2K, SZ_256, SZ_128K, 0, 5, 64, NAND_ECC_INFO(1, SZ_512) },
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
 		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },
-- 
1.8.5.2
