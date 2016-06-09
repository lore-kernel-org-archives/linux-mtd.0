Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB4QB-00045q-1H
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 18:11:11 +0000
Received: by mail-lf0-x242.google.com with SMTP id u74so4178004lff.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 11:10:50 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: add ESMT manufacturer
Date: Thu,  9 Jun 2016 20:10:11 +0200
Message-Id: <1465495811-3551-1-git-send-email-zajec5@gmail.com>
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

I got device with ESMT (Elite Semiconductor Memory Technology Inc)
F59L1G81MA flash that was detected as:
[    0.852034] nand: device found, Manufacturer ID: 0xc8, Chip ID: 0xd1
[    0.858402] nand: Unknown NAND 128MiB 3,3V 8-bit
[    0.863031] nand: 128MiB, SLC, page size: 2048, OOB size: 64

According to the F59L1G81MA datasheet (and Read Id documentation) C8h is
a "Maker Code" which should mean ESMT. Add it to fix above "Unknown".

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 1 +
 include/linux/mtd/nand.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index ccc05f5..2af9869 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -168,6 +168,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 /* Manufacturer IDs */
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
+	{NAND_MFR_ESMT, "ESMT"},
 	{NAND_MFR_SAMSUNG, "Samsung"},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
 	{NAND_MFR_NATIONAL, "National"},
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index fbe8e16..8dd6e01 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -783,6 +783,7 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
  * NAND Flash Manufacturer ID Codes
  */
 #define NAND_MFR_TOSHIBA	0x98
+#define NAND_MFR_ESMT		0xc8
 #define NAND_MFR_SAMSUNG	0xec
 #define NAND_MFR_FUJITSU	0x04
 #define NAND_MFR_NATIONAL	0x8f
-- 
1.8.4.5
