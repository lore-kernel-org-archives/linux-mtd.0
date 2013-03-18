Received: from mail-db8lp0186.outbound.messaging.microsoft.com
 ([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHY9N-00006R-1Q
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:22:46 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 10/11] mtd: add the ecc info for some full-id nand chips
Date: Mon, 18 Mar 2013 19:18:53 +0800
Message-ID: <1363605534-24776-11-git-send-email-b32955@freescale.com>
In-Reply-To: <1363605534-24776-1-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the ecc info for TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2 and TC58NVG6D2.

>From these chips' datasheets, we know that:
   The TC58NVG2S0F and TC58NVG3S0F require 4bit ECC for per 512byte.
   The TC58NVG5D2 and TC58NVG6D2 require 40bits ECC for per 1024byte.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_ids.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 1c242cc..6220ec3 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -30,16 +30,16 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 */
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
-			SZ_4K, SZ_512, SZ_256K, 0, 8, 224},
+			SZ_4K, SZ_512, SZ_256K, 0, 8, 224, ECC_INFO(4, SZ_512)},
 	{"TC58NVG3S0F 8G 3.3V 8-bit",
 		{ .id = {0x98, 0xd3, 0x90, 0x26, 0x76, 0x15, 0x02, 0x08} },
-			SZ_4K, SZ_1K, SZ_256K, 0, 8, 232},
+			SZ_4K, SZ_1K, SZ_256K, 0, 8, 232, ECC_INFO(4, SZ_512)},
 	{"TC58NVG5D2 32G 3.3V 8-bit",
 		{ .id = {0x98, 0xd7, 0x94, 0x32, 0x76, 0x56, 0x09, 0x00} },
-			SZ_8K, SZ_4K, SZ_1M, 0, 8, 640},
+			SZ_8K, SZ_4K, SZ_1M, 0, 8, 640, ECC_INFO(40, SZ_1K)},
 	{"TC58NVG6D2 64G 3.3V 8-bit",
 		{ .id = {0x98, 0xde, 0x94, 0x82, 0x76, 0x56, 0x04, 0x20} },
-			SZ_8K, SZ_8K, SZ_2M, 0, 8, 640},
+			SZ_8K, SZ_8K, SZ_2M, 0, 8, 640, ECC_INFO(40, SZ_1K)},
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 512, 4, 0x2000, 0),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 512, 4, 0x2000, 0),
-- 
1.7.1
