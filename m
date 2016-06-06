From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH 5/7] mtd: nand: Add Hynix H27UBG8T2BTR-BC to nand_ids table
Date: Mon,  6 Jun 2016 13:24:22 +0300
Message-Id: <1465208664-9366-6-git-send-email-mamlinav@gmail.com>
In-Reply-To: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the full description of the Hynix H27UBG8T2BTR-BC NAND chip in the
nand_ids table so that we can later use the NAND ECC infos and ONFI timings
mode in controller drivers.

Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index ccc05f5..ccdc773 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -52,6 +52,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
 		  NAND_ECC_INFO(40, SZ_1K), 4 },
+	{"H27UBG8T2BTR-BC 32G 3.3V 8-bit",
+		{ .id = {0xad, 0xd7, 0x94, 0xda, 0x74, 0xc3} },
+		  SZ_8K, SZ_4K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
+		  NAND_ECC_INFO(40, SZ_1K), 0 },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
-- 
2.7.3
