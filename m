Received: from smtp34.i.mail.ru ([94.100.177.94])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQt4g-0000N8-JY
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 05:32:31 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: nand_base: Use io{read,
 write}*_rep functions for transfer
Date: Sat, 13 Apr 2013 09:32:13 +0400
Message-Id: <1365831133-22245-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch replaces the usage of loops in the nand_base code with
io{read,write}{8,16}_rep calls instead.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/nand_base.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b6daaf..d99ab3d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -255,11 +255,9 @@ static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
  */
 static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 
-	for (i = 0; i < len; i++)
-		writeb(buf[i], chip->IO_ADDR_W);
+	iowrite8_rep(chip->IO_ADDR_W, buf, len);
 }
 
 /**
@@ -272,11 +270,9 @@ static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 
-	for (i = 0; i < len; i++)
-		buf[i] = readb(chip->IO_ADDR_R);
+	ioread8_rep(chip->IO_ADDR_R, buf, len);
 }
 
 /**
@@ -289,14 +285,10 @@ static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
  */
 static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 	u16 *p = (u16 *) buf;
-	len >>= 1;
-
-	for (i = 0; i < len; i++)
-		writew(p[i], chip->IO_ADDR_W);
 
+	iowrite16_rep(chip->IO_ADDR_W, p, len >> 1);
 }
 
 /**
@@ -309,13 +301,10 @@ static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 	u16 *p = (u16 *) buf;
-	len >>= 1;
 
-	for (i = 0; i < len; i++)
-		p[i] = readw(chip->IO_ADDR_R);
+	ioread16_rep(chip->IO_ADDR_R, p, len >> 1);
 }
 
 /**
-- 
1.8.1.5
