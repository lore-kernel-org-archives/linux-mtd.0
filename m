From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/3] mtd: nand: add NAND_NEED_SCRAMBLING flag to the
 H27UCG8T2ATR-BC definition
Date: Thu, 15 Oct 2015 19:17:22 +0200
Message-Id: <1444929443-25537-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1444929443-25537-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1444929443-25537-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The H27UCG8T2ATR-BC requires an external data scrambler. Reflect this
constraint in the nand_flash_ids definition.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_ids.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index a8804a3..ccc05f5 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -50,8 +50,8 @@ struct nand_flash_dev nand_flash_ids[] = {
 		  SZ_16K, SZ_8K, SZ_4M, 0, 6, 1280, NAND_ECC_INFO(40, SZ_1K) },
 	{"H27UCG8T2ATR-BC 64G 3.3V 8-bit",
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
-		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
-		  4 },
+		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
+		  NAND_ECC_INFO(40, SZ_1K), 4 },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
-- 
2.1.4
