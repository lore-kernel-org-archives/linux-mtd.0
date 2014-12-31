Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6IsJ-0003f1-OQ
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 12:59:44 +0000
From: Oleksij Rempel <linux@rempel-privat.de>
To: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
Subject: [PATCH v3 3/3] mtd: nand: add Toshiba TC58NVG0S3E to nand_ids table
Date: Wed, 31 Dec 2014 13:58:53 +0100
Message-Id: <1420030733-10374-3-git-send-email-linux@rempel-privat.de>
In-Reply-To: <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the full description of the Toshiba TC58NVG0S3E NAND chip in the
nand_ids table so that we can later use the NAND ECC infos and ONFI timings
mode in controller drivers.

Tested with asm9260_nand driver.

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 drivers/mtd/nand/nand_ids.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index fbde8910..47b5cdf 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -31,6 +31,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 * listed by full ID. We list them first so that we can easily identify
 	 * the most specific match.
 	 */
+	{"TC58NVG0S3E 1G 3.3V 8-bit",
+		{ .id = {0x98, 0xd1, 0x90, 0x15, 0x76, 0x14, 0x01, 0x00} },
+		  SZ_2K, SZ_128, SZ_128K, 0, 8, 64, NAND_ECC_INFO(1, SZ_512),
+		  2 },
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
 		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },
-- 
1.9.1
