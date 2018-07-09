Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fccUN-00016N-Vt
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 20:10:37 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 14/24] mtd: rawnand: fsmc: Use uintptr_t casts instead of
 unsigned ones
Date: Mon,  9 Jul 2018 22:09:35 +0200
Message-Id: <20180709200945.30116-15-boris.brezillon@bootlin.com>
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

uintptr_t should be used when casting a pointer to an unsigned int so
that the code compiles without warnings even on 64-bit architectures.

This is needed if we want to allow selection of this driver when
COMPILE_TEST=y.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index d71c49f50e77..527bebc7e6c9 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -547,7 +547,7 @@ static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
 
-	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
+	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
@@ -570,7 +570,7 @@ static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
 
-	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
+	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
-- 
2.14.1
