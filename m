Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK62F-0005R4-0I
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:39:16 +0000
Date: 28 Jul 2015 14:38:45 -0000
Message-Id: <811a63901539d976b651cf4ca69142951603fa58.1438093758.git.hramrach@gmail.com>
In-Reply-To: <cover.1438093758.git.hramrach@gmail.com>
References: <cover.1438093758.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 1/2] mtd: nand: add Samsung's K9GBG08U0B to nand_ids table
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

From: Petros Angelatos <petrosagg@gmail.com>
Date: Mon, 25 Aug 2014 23:54:57 +0200

Add the full description of the Samsung K9GBG08U0B NAND chip in the
nand_ids table so that we can later use the NAND ECC infos and ONFI timings
mode in controller drivers.

Signed-off-by: Petros Angelatos <petrosagg@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 7124400..749a3e0 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -48,6 +48,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
 		  4 },
+	{"K9GBG08U0B 32G 3.3V 8-bit",
+		{ .id = {0xec, 0xd7, 0x94, 0x7e, 0x64, 0x44} },
+		  SZ_8K, SZ_4K, SZ_1M, 0, 6, 1024, NAND_ECC_INFO(40, SZ_1K) },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
-- 
2.1.4
