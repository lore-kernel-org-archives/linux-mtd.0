Received: from mordell.elzevir.fr ([92.243.3.74])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDsXA-0005lH-Jt
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 11:33:45 +0000
From: =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
To: kamlakant.patel@broadcom.com
Cc: gregkh@linuxfoundation.org, manonuevo@micron.com,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
Subject: [PATCH 1/4] staging: mt29f: fix malloc style for structs
Date: Tue, 29 Dec 2015 12:32:19 +0100
Message-Id: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to CodingStyle, sizeof(*p) is better than sizeof(struct foo).

Signed-off-by: Manuel Pégourié-Gonnard <mpg@elzevir.fr>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 47bb56f1f8c0..dc2b1fc995c2 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -852,8 +852,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	struct spinand_state *state;
 	struct mtd_part_parser_data ppdata;
 
-	info  = devm_kzalloc(&spi_nand->dev, sizeof(struct spinand_info),
-			     GFP_KERNEL);
+	info = devm_kzalloc(&spi_nand->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -861,8 +860,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 
 	spinand_lock_block(spi_nand, BL_ALL_UNLOCKED);
 
-	state = devm_kzalloc(&spi_nand->dev, sizeof(struct spinand_state),
-			     GFP_KERNEL);
+	state = devm_kzalloc(&spi_nand->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
@@ -872,8 +870,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	if (!state->buf)
 		return -ENOMEM;
 
-	chip = devm_kzalloc(&spi_nand->dev, sizeof(struct nand_chip),
-			    GFP_KERNEL);
+	chip = devm_kzalloc(&spi_nand->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -903,7 +900,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	chip->options	|= NAND_CACHEPRG;
 	chip->select_chip = spinand_select_chip;
 
-	mtd = devm_kzalloc(&spi_nand->dev, sizeof(struct mtd_info), GFP_KERNEL);
+	mtd = devm_kzalloc(&spi_nand->dev, sizeof(*mtd), GFP_KERNEL);
 	if (!mtd)
 		return -ENOMEM;
 
-- 
2.6.4
