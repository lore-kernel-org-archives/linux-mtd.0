Received: from mail.aswsp.com ([193.34.35.150])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQcwH-0000vx-4u
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 17:09:11 +0000
From: Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: remove hard-coded NAND ids length
Date: Thu, 29 Jun 2017 19:08:30 +0200
Message-ID: <20170629170830.8084-1-jeanlouis.thekekara@parrot.com>
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

This commit removes hard-coded '8' used for looping into
struct nand_chip.id.data array.

NAND_MAX_ID_LEN has been introduced by Artem Bityutskiy in
53552d22bfe1f for defining ids length in nand_flash_ids[] list.

This commit unifies ids length in nand base driver.

Signed-off-by: Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com>
---
 drivers/mtd/nand/nand_base.c |  4 ++--
 include/linux/mtd/nand.h     | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 85edac9b2bb5..66db2ced87ad 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4056,7 +4056,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
 	/* Read entire ID string */
-	for (i = 0; i < 8; i++)
+	for (i = 0; i < ARRAY_SIZE(chip->id.data); i++)
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != maf_id || id_data[1] != dev_id) {
@@ -4065,7 +4065,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		return -ENODEV;
 	}
 
-	chip->id.len = nand_id_len(id_data, 8);
+	chip->id.len = nand_id_len(id_data, ARRAY_SIZE(chip->id.data));
 
 	/* Try to identify manufacturer */
 	manufacturer = nand_get_manufacturer(maf_id);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index dc8fbc033442..c3c1a32a5ade 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -449,14 +449,16 @@ struct nand_jedec_params {
 	__le16 crc;
 } __packed;
 
+/* The maximum expected count of bytes in the NAND ID sequence */
+#define NAND_MAX_ID_LEN 8
+
 /**
  * struct nand_id - NAND id structure
- * @data: buffer containing the id bytes. Currently 8 bytes large, but can
- *	  be extended if required.
+ * @data: buffer containing the id bytes.
  * @len: ID length.
  */
 struct nand_id {
-	u8 data[8];
+	u8 data[NAND_MAX_ID_LEN];
 	int len;
 };
 
@@ -1028,8 +1030,6 @@ static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
 #define NAND_MFR_ATO		0x9b
 #define NAND_MFR_WINBOND	0xef
 
-/* The maximum expected count of bytes in the NAND ID sequence */
-#define NAND_MAX_ID_LEN 8
 
 /*
  * A helper for defining older NAND chips where the second ID byte fully
-- 
2.13.2
