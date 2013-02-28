Received: from smtp17.mail.ru ([94.100.176.154])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAyRm-00052v-HH
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 08:02:37 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: nand_base: Use readsb/readsw/writesb/writesw if
 possible
Date: Thu, 28 Feb 2013 12:02:21 +0400
Message-Id: <1362038541-22406-3-git-send-email-shc_work@mail.ru>
In-Reply-To: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
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

This patch provide using readsb/readsw/writesb/writesw functions
if it possible for particular platform.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/nand_base.c |   29 ++++++++++++++++++++++++-----
 1 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 382b857..4efde01 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -214,11 +214,16 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
  */
 static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 
+#ifndef writesb
+	int i;
+
 	for (i = 0; i < len; i++)
 		writeb(buf[i], chip->IO_ADDR_W);
+#else
+	writesb(chip->IO_ADDR_W, buf, len);
+#endif
 }
 
 /**
@@ -231,11 +236,16 @@ static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 
+#ifndef readsb
+	int i;
+
 	for (i = 0; i < len; i++)
 		buf[i] = readb(chip->IO_ADDR_R);
+#else
+	readsb(chip->IO_ADDR_R, buf, len);
+#endif
 }
 
 /**
@@ -248,14 +258,18 @@ static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
  */
 static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
+#ifndef writesw
+	int i;
+
 	for (i = 0; i < len; i++)
 		writew(p[i], chip->IO_ADDR_W);
-
+#else
+	writesw(chip->IO_ADDR_W, p, len);
+#endif
 }
 
 /**
@@ -268,13 +282,18 @@ static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
+#ifndef readsw
+	int i;
+
 	for (i = 0; i < len; i++)
 		p[i] = readw(chip->IO_ADDR_R);
+#else
+	readsw(chip->IO_ADDR_R, p, len);
+#endif
 }
 
 /**
-- 
1.7.3.4
