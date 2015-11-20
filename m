Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzqOr-0006F6-Us
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 18:27:10 +0000
Received: by ykdv3 with SMTP id v3so174290787ykd.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 10:26:48 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH v2] mtd: spi-nor: Check the return value from read_sr()
Date: Fri, 20 Nov 2015 16:26:11 -0200
Message-Id: <1448043971-20230-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

We should better check the return value from read_sr() and
propagate it in the case of error.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- Change status_old and status_new to int (Brian).

 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 16c9f55..b5e505d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -459,11 +459,13 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 status_old, status_new;
+	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 
 	status_old = read_sr(nor);
+	if (status_old < 0)
+		return status_old;
 
 	/* SPI NOR always locks to the end */
 	if (ofs + len != mtd->size) {
@@ -509,11 +511,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	uint8_t status_old, status_new;
+	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 
 	status_old = read_sr(nor);
+	if (status_old < 0)
+		return status_old;
 
 	/* Cannot unlock; would unlock larger region than requested */
 	if (stm_is_locked_sr(nor, status_old, ofs - mtd->erasesize,
@@ -1013,6 +1017,8 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	int ret, val;
 
 	val = read_sr(nor);
+	if (val < 0)
+		return val;
 	write_enable(nor);
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
-- 
1.9.1
