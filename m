Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkvLE-0005My-M1
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 12:32:41 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI param
 or nand_id[]
Date: Mon, 25 Nov 2013 18:02:08 +0530
Message-ID: <1385382728-7913-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is alternative implementation for following commit which introduced
NAND_BUSWIDTH_AUTO for detection of bus-width during device probe
   commit 64b37b2a63eb2f80b65c7185f0013f8ffc637ae3
   Author:     Matthieu CASTET <matthieu.castet@parrot.com>
   AuthorDate: 2012-11-06

As NAND device is identified only during nand_scan_ident(), so this patch 
assumes that NAND driver may un-initialized or partially congigured while
calling nand_scan_ident(). Hence, this patch does following:

(1) Temporarily configures 'bus-width=x8' mode before reading ONFI parameters,
 (as required by ONFI spec Refer[*]), and then reverts to original bus-width.
 This allows nand_flash_detect_onfi() to read ONFI paramers page even if
 bus-width was un-initialized or incorrectly configured.

(2) reconfigures driver with correct bus-width determined by:
 - either by reading ONFI param OR
 - as found in nand_flash_id[] table
 So, any driver-specific callback overrides should be done post nand_scan_ident.

This patch removes any dependency on either 'DT binding' or 'platform data' to
for determining NAND device bus-width.

[*] Reference: ONFI spec version 3.1 (section 3.5.3. Target Initialization)
    "The Read ID and Read Parameter Page commands only use the lower 8-bits
     of the data bus. The host shall not issue commands that use a word
     data width on x16 devices until the host determines the device supports
     a 16-bit data bus width in the parameter page."


Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 43 ++++++++++++++++++-------------------------
 include/linux/mtd/nand.h     |  7 -------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..3d581a4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2942,14 +2942,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
 
-	/*
-	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
-	 * with NAND_BUSWIDTH_16
-	 */
-	if (chip->options & NAND_BUSWIDTH_16) {
-		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
-		return 0;
-	}
+	/* ONFI must be probed in 8-bit mode only, so switch to x8 mode */
+	if (chip->options & NAND_BUSWIDTH_16)
+		nand_set_defaults(chip, 0);
 
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
@@ -2962,7 +2957,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (i == 3) {
 		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		return 0;
+		goto return_error;
 	}
 
 	/* Check version */
@@ -2980,7 +2975,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (!chip->onfi_version) {
 		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
-		return 0;
+		goto return_error;
 	}
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
@@ -3033,6 +3028,12 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	return 1;
+
+return_error:
+	/* revert to original bus-width */
+	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
+	return 0;
+
 }
 
 /*
@@ -3431,22 +3432,14 @@ ident_done:
 			break;
 	}
 
-	if (chip->options & NAND_BUSWIDTH_AUTO) {
-		WARN_ON(chip->options & NAND_BUSWIDTH_16);
-		chip->options |= busw;
+
+	/* re-configure driver is bus-width was incorrectly configured */
+	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
+		pr_warn("reconfiguring NAND bus width to %d instead %d bit\n",
+			   busw ? 16 : 8,
+			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
+		chip->options = (chip->options & ~NAND_BUSWIDTH_16) | busw;
 		nand_set_defaults(chip, busw);
-	} else if (busw != (chip->options & NAND_BUSWIDTH_16)) {
-		/*
-		 * Check, if buswidth is correct. Hardware drivers should set
-		 * chip correct!
-		 */
-		pr_info("NAND device: Manufacturer ID:"
-			" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-			*dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
-		pr_warn("NAND bus width %d instead %d bit\n",
-			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
-			   busw ? 16 : 8);
-		return ERR_PTR(-EINVAL);
 	}
 
 	nand_decode_bbm_options(mtd, chip, id_data);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9e6c8f9..d5cc642 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -183,13 +183,6 @@ typedef enum {
 #define NAND_OWN_BUFFERS	0x00020000
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
-/*
- * Autodetect nand buswidth with readid/onfi.
- * This suppose the driver will configure the hardware in 8 bits mode
- * when calling nand_scan_ident, and update its configuration
- * before calling nand_scan_tail.
- */
-#define NAND_BUSWIDTH_AUTO      0x00080000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.8.1
