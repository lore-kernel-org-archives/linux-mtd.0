Message-ID: <49FFF86F.2070402@nokia.com>
Date: Tue, 05 May 2009 11:27:27 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by Numonyx
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e400da3456896505edbf7c39a14668c2c718ace4 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Tue, 5 May 2009 11:04:19 +0300
Subject: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by Numonyx

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
