Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK62F-0005R3-5Z
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:39:18 +0000
Date: 28 Jul 2015 14:38:46 -0000
Message-Id: <69e4f06f2fd77db83320999a64a32239eacde7a3.1438093758.git.hramrach@gmail.com>
In-Reply-To: <cover.1438093758.git.hramrach@gmail.com>
References: <cover.1438093758.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 2/2] mtd: nand: add Samsung K9GBG08U0A chip id
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Petros Angelatos <petrosagg@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nand reportedly uses 30MHz clock but according to datasheet some timings
are on the slow side. Onfi 0 timing should work at least.

The chip ID in datasheet is different. Allwinner code uses multiple IDs:

0xec, 0xd7, 0x94, 0x76, 0xff, 0xff, 0xff, 0xff
0xec, 0xd7, 0x94, 0x7A, 0xff, 0xff, 0xff, 0xff

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 749a3e0..76e545b 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -48,6 +48,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
 		  4 },
+	{"K9GBG08U0A 32G 3.3V 8-bit", /* Note: other IDs probably exist */
+		{ .id = {0xec, 0xd7, 0x94, 0x7a, 0x54, 0x43} },
+		  SZ_8K, SZ_4K, SZ_1M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K) },
 	{"K9GBG08U0B 32G 3.3V 8-bit",
 		{ .id = {0xec, 0xd7, 0x94, 0x7e, 0x64, 0x44} },
 		  SZ_8K, SZ_4K, SZ_1M, 0, 6, 1024, NAND_ECC_INFO(40, SZ_1K) },
-- 
2.1.4
