Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkuNH-0003mV-ID
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 11:30:44 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] mtd: nand: Refactor print messages
Date: Mon, 25 Nov 2013 08:30:31 -0300
Message-Id: <1385379031-27766-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a nice "nand:" prefix to all pr_xxx() messages. This allows
to get rid of the "NAND" words in messages, given the context
is already given by the prefix.

Remove the __func__ report from messages where it's not needed and refactor
the device detection messages to show itself in several lines.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Currently, we report found devices with:

NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
NAND device: 512MiB, SLC, page size: 2048, OOB size: 64

And after this change, the above is:

nand: device found, Manufacturer ID: 0xec, Chip ID: 0xdc
nand: Samsung NAND 512MiB 3,3V 8-bit
nand: 512MiB, SLC, page size: 2048, OOB size: 64

 drivers/mtd/nand/nand_base.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..4bdc0df 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -29,6 +29,8 @@
  *
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -2979,7 +2981,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->onfi_version = 10;
 
 	if (!chip->onfi_version) {
-		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
+		pr_info("unsupported ONFI version: %d\n", val);
 		return 0;
 	}
 
@@ -3372,8 +3374,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
-		pr_info("%s: second ID read did not match "
-			"%02x,%02x against %02x,%02x\n", __func__,
+		pr_info("second ID read did not match "
+			"%02x,%02x against %02x,%02x\n",
 			*maf_id, *dev_id, id_data[0], id_data[1]);
 		return ERR_PTR(-ENODEV);
 	}
@@ -3440,10 +3442,10 @@ ident_done:
 		 * Check, if buswidth is correct. Hardware drivers should set
 		 * chip correct!
 		 */
-		pr_info("NAND device: Manufacturer ID:"
-			" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-			*dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
-		pr_warn("NAND bus width %d instead %d bit\n",
+		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
+			*maf_id, *dev_id);
+		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
+		pr_warn("bus width %d instead %d bit\n",
 			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 			   busw ? 16 : 8);
 		return ERR_PTR(-EINVAL);
@@ -3472,14 +3474,13 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
-	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s)\n",
-		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
+	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
+		*maf_id, *dev_id);
+	pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
 		chip->onfi_version ? chip->onfi_params.model : type->name);
-
-	pr_info("NAND device: %dMiB, %s, page size: %d, OOB size: %d\n",
+	pr_info("%dMiB, %s, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->writesize, mtd->oobsize);
-
 	return type;
 }
 
@@ -3535,7 +3536,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		chip->select_chip(mtd, -1);
 	}
 	if (i > 1)
-		pr_info("%d NAND chips detected\n", i);
+		pr_info("%d chips detected\n", i);
 
 	/* Store the number of chips and calc total size for mtd */
 	chip->numchips = i;
-- 
1.8.1.5
