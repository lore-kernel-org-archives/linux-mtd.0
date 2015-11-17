Received: from mail-bn1on0139.outbound.protection.outlook.com
 ([157.56.110.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyhau-00086j-JA
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 14:50:53 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Fabio Estevam
 <fabio.estevam@freescale.com>
Subject: [PATCH] mtd: spi-nor: Check the return value from read_sr()
Date: Tue, 17 Nov 2015 12:50:24 -0200
Message-ID: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We should better check the return value from read_sr() and
propagate it in the case of error.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 12041e1..4d858f7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -459,11 +459,14 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 status_old, status_new;
+	u8 status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	int status_old;
 
 	status_old = read_sr(nor);
+	if (status_old < 0)
+		return status_old;
 
 	/* SPI NOR always locks to the end */
 	if (ofs + len != mtd->size) {
@@ -509,11 +512,14 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	uint8_t status_old, status_new;
+	uint8_t status_new;
+	int status_old;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 
 	status_old = read_sr(nor);
+	if (status_old < 0)
+		return status_old;
 
 	/* Cannot unlock; would unlock larger region than requested */
 	if (stm_is_locked_sr(nor, status_old, ofs - mtd->erasesize,
@@ -1013,6 +1019,8 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	int ret, val;
 
 	val = read_sr(nor);
+	if (val < 0)
+		return val;
 	write_enable(nor);
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
-- 
1.9.1
