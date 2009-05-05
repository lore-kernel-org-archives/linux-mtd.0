From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Tue, 5 May 2009 11:04:19 +0300
Subject: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by Numonyx
Message-ID: <mailman.2.1241512013.18153.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

In addition to adding the Numonyx manufacturer code, this patch
also ensures 'sync. write' is disabled when reading identification
data - something that the Numonyx chip objects to, but the
Samsung chip seems to ignore.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 ++-
 include/linux/mtd/onenand.h        |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 524af9a..f6cfadb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2576,6 +2576,7 @@ static void onenand_print_device_info(int device, int version)
 
 static const struct onenand_manufacturers onenand_manuf_ids[] = {
         {ONENAND_MFR_SAMSUNG, "Samsung"},
+	{ONENAND_MFR_NUMONYX, "Numonyx"},
 };
 
 /**
@@ -2621,7 +2622,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* Save system configuration 1 */
 	syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
 	/* Clear Sync. Burst Read mode to read BootRAM */
-	this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ), this->base + ONENAND_REG_SYS_CFG1);
+	this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ & ~ONENAND_SYS_CFG1_SYNC_WRITE), this->base + ONENAND_REG_SYS_CFG1);
 
 	/* Send the command for reading device ID from BootRAM */
 	this->write_word(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 9aa2a91..0fa3ac4 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -176,6 +176,7 @@ struct onenand_chip {
  * OneNAND Flash Manufacturer ID Codes
  */
 #define ONENAND_MFR_SAMSUNG	0xec
+#define ONENAND_MFR_NUMONYX	0x20
 
 /**
  * struct onenand_manufacturers - NAND Flash Manufacturer ID Structure
-- 
1.5.6.3
