Received: from xes-mad.com ([216.165.139.218])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpRHe-000062-Hk
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 21:50:53 +0000
Date: Thu, 12 Jul 2012 16:50:14 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org, Lew Glendenning <lglendenning@lnxi.com>
Subject: [PATCH 1/2] mtd: esb2rom: convert to MFD model
Message-ID: <42f902f6-f22d-4498-80e2-bb3a3bc809bf@zimbra>
In-Reply-To: <00fa37e2-1c56-4401-8555-d81699ef33cf@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Guenter Roeck <guenter@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move esb2rom PCI device scanning to lpc_ich.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mfd/Kconfig         |    4 +-
 drivers/mfd/lpc_ich.c       |   32 +++++++++++
 drivers/mtd/maps/Kconfig    |    1 +
 drivers/mtd/maps/esb2rom.c  |  130 ++++++++++++++-----------------------------
 include/linux/mfd/lpc_ich.h |    1 +
 5 files changed, 78 insertions(+), 90 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index fa267d4..02e4646 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -834,8 +834,8 @@ config LPC_ICH
 	help
 	  The LPC bridge function of the Intel ICH provides support for
 	  many functional units. This driver provides needed support for
-	  other drivers to control these functions, currently GPIO and
-	  watchdog.
+	  other drivers to control these functions, currently GPIO,
+	  watchdog, and boot ROM.
 
 config MFD_RDC321X
 	tristate "Support for RDC-R321x southbridge"
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 027cc8f..8089324 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -115,6 +115,7 @@ static struct resource gpio_ich_res[] = {
 enum lpc_cells {
 	LPC_WDT = 0,
 	LPC_GPIO,
+	LPC_ROM,
 };
 
 static struct mfd_cell lpc_ich_cells[] = {
@@ -130,6 +131,12 @@ static struct mfd_cell lpc_ich_cells[] = {
 		.resources = gpio_ich_res,
 		.ignore_resource_conflicts = true,
 	},
+	[LPC_ROM] = {
+		.name = "esb2rom",
+		.num_resources = 0,
+		.resources = NULL,
+		.ignore_resource_conflicts = true,
+	},
 };
 
 /* chipset related info */
@@ -206,6 +213,7 @@ struct lpc_ich_info lpc_chipset_info[] __devinitdata = {
 	[LPC_ICH2] = {
 		.name = "ICH2",
 		.iTCO_version = 1,
+		.esb2rom_present = 1,
 	},
 	[LPC_ICH2M] = {
 		.name = "ICH2-M",
@@ -214,6 +222,7 @@ struct lpc_ich_info lpc_chipset_info[] __devinitdata = {
 	[LPC_ICH3] = {
 		.name = "ICH3-S",
 		.iTCO_version = 1,
+		.esb2rom_present = 1,
 	},
 	[LPC_ICH3M] = {
 		.name = "ICH3-M",
@@ -222,6 +231,7 @@ struct lpc_ich_info lpc_chipset_info[] __devinitdata = {
 	[LPC_ICH4] = {
 		.name = "ICH4",
 		.iTCO_version = 1,
+		.esb2rom_present = 1,
 	},
 	[LPC_ICH4M] = {
 		.name = "ICH4-M",
@@ -234,10 +244,12 @@ struct lpc_ich_info lpc_chipset_info[] __devinitdata = {
 	[LPC_ICH5] = {
 		.name = "ICH5 or ICH5R",
 		.iTCO_version = 1,
+		.esb2rom_present = 1,
 	},
 	[LPC_6300ESB] = {
 		.name = "6300ESB",
 		.iTCO_version = 1,
+		.esb2rom_present = 1,
 	},
 	[LPC_ICH6] = {
 		.name = "ICH6 or ICH6R",
@@ -258,6 +270,7 @@ struct lpc_ich_info lpc_chipset_info[] __devinitdata = {
 		.name = "631xESB/632xESB",
 		.iTCO_version = 2,
 		.gpio_version = ICH_V6_GPIO,
+		.esb2rom_present = 1,
 	},
 	[LPC_ICH7] = {
 		.name = "ICH7 or ICH7R",
@@ -831,6 +844,21 @@ wdt_done:
 	return ret;
 }
 
+static int __devinit lpc_ich_init_rom(struct pci_dev *dev,
+				const struct pci_device_id *id)
+{
+	int ret;
+
+	if (!lpc_chipset_info[id->driver_data].esb2rom_present)
+		return -ENODEV;
+
+	lpc_ich_finalize_cell(&lpc_ich_cells[LPC_ROM], id);
+	ret = mfd_add_devices(&dev->dev, -1, &lpc_ich_cells[LPC_ROM],
+				1, NULL, 0);
+
+	return ret;
+}
+
 static int __devinit lpc_ich_probe(struct pci_dev *dev,
 				const struct pci_device_id *id)
 {
@@ -845,6 +873,10 @@ static int __devinit lpc_ich_probe(struct pci_dev *dev,
 	if (!ret)
 		cell_added = true;
 
+	ret = lpc_ich_init_rom(dev, id);
+	if (!ret)
+		cell_added = true;
+
 	/*
 	 * We only care if at least one or none of the cells registered
 	 * successfully.
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 53850f1..a0758ec 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -207,6 +207,7 @@ config MTD_ICHXROM
 config MTD_ESB2ROM
         tristate "BIOS flash chip on Intel ESB Controller Hub 2"
         depends on X86 && MTD_JEDECPROBE && PCI
+        select LPC_ICH
         help
           Support for treating the BIOS flash chip on ESB2 motherboards
           as an MTD device - with this you can reprogram your BIOS.
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index 08322b1..fc7a9e6 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -10,21 +10,18 @@
  * Eric Biederman, of course, was a major help in this effort.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/module.h>
-#include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/slab.h>
-#include <asm/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/pci.h>
-#include <linux/pci_ids.h>
 #include <linux/list.h>
-
-#define MOD_NAME KBUILD_BASENAME
+#include <linux/mfd/core.h>
 
 #define ADDRESS_NAME_LEN 18
 
@@ -99,7 +96,7 @@ struct esb2rom_window {
 	unsigned long size;
 	struct list_head maps;
 	struct resource rsrc;
-	struct pci_dev *pdev;
+	struct platform_device *dev;
 };
 
 struct esb2rom_map_info {
@@ -107,7 +104,7 @@ struct esb2rom_map_info {
 	struct map_info map;
 	struct mtd_info *mtd;
 	struct resource rsrc;
-	char map_name[sizeof(MOD_NAME) + 2 + ADDRESS_NAME_LEN];
+	char map_name[sizeof(KBUILD_MODNAME) + 2 + ADDRESS_NAME_LEN];
 };
 
 static struct esb2rom_window esb2rom_window = {
@@ -117,11 +114,12 @@ static struct esb2rom_window esb2rom_window = {
 static void esb2rom_cleanup(struct esb2rom_window *window)
 {
 	struct esb2rom_map_info *map, *scratch;
+	struct pci_dev *pdev = to_pci_dev(window->dev->dev.parent);
 	u8 byte;
 
 	/* Disable writes through the rom window */
-	pci_read_config_byte(window->pdev, BIOS_CNTL, &byte);
-	pci_write_config_byte(window->pdev, BIOS_CNTL,
+	pci_read_config_byte(pdev, BIOS_CNTL, &byte);
+	pci_write_config_byte(pdev, BIOS_CNTL,
 		byte & ~BIOS_WRITE_ENABLE);
 
 	/* Free all of the mtd devices */
@@ -141,15 +139,15 @@ static void esb2rom_cleanup(struct esb2rom_window *window)
 		window->phys = 0;
 		window->size = 0;
 	}
-	pci_dev_put(window->pdev);
+	pci_dev_put(pdev);
 }
 
-static int __devinit esb2rom_init_one(struct pci_dev *pdev,
-				      const struct pci_device_id *ent)
+static int __devinit esb2rom_init_one(struct platform_device *dev)
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	struct esb2rom_window *window = &esb2rom_window;
 	struct esb2rom_map_info *map = NULL;
+	struct pci_dev *pdev = to_pci_dev(dev->dev.parent);
 	unsigned long map_top;
 	u8 byte;
 	u16 word;
@@ -164,28 +162,24 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 	 * Also you can page firmware hubs if an 8MiB window isn't enough
 	 * but don't currently handle that case either.
 	 */
-	window->pdev = pci_dev_get(pdev);
+	window->dev = dev;
+	pci_dev_get(pdev);
 
 	/* RLG:  experiment 2.  Force the window registers to the widest values */
 
 /*
 	pci_read_config_word(pdev, FWH_DEC_EN1, &word);
-	printk(KERN_DEBUG "Original FWH_DEC_EN1 : %x\n", word);
-	pci_write_config_byte(pdev, FWH_DEC_EN1, 0xff);
-	pci_read_config_byte(pdev, FWH_DEC_EN1, &byte);
-	printk(KERN_DEBUG "New FWH_DEC_EN1 : %x\n", byte);
-
-	pci_read_config_byte(pdev, FWH_DEC_EN2, &byte);
-	printk(KERN_DEBUG "Original FWH_DEC_EN2 : %x\n", byte);
-	pci_write_config_byte(pdev, FWH_DEC_EN2, 0x0f);
-	pci_read_config_byte(pdev, FWH_DEC_EN2, &byte);
-	printk(KERN_DEBUG "New FWH_DEC_EN2 : %x\n", byte);
+	pr_debug("Original FWH_DEC_EN1 : %x\n", word);
+	pci_write_config_word(pdev, FWH_DEC_EN1, 0x0fff);
+	pci_read_config_word(pdev, FWH_DEC_EN1, &word);
+	pr_debug("New FWH_DEC_EN1 : %x\n", word);
 */
 
+
 	/* Find a region continuous to the end of the ROM window  */
 	window->phys = 0;
 	pci_read_config_word(pdev, FWH_DEC_EN1, &word);
-	printk(KERN_DEBUG "pci_read_config_word : %x\n", word);
+	pr_debug("pci_read_config_word : %x\n", word);
 
 	if ((word & FWH_8MiB) == FWH_8MiB)
 		window->phys = 0xff400000;
@@ -213,7 +207,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 		window->phys = 0xfff80000;
 
 	if (window->phys == 0) {
-		printk(KERN_ERR MOD_NAME ": Rom window is closed\n");
+		pr_err("ROM window is closed\n");
 		goto out;
 	}
 
@@ -227,7 +221,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 		/* The BIOS will generate an error if I enable
 		 * this device, so don't even try.
 		 */
-		printk(KERN_ERR MOD_NAME ": firmware access control, I can't enable writes\n");
+		pr_err("firmware access control, I can't enable writes\n");
 		goto out;
 	}
 	pci_write_config_byte(pdev, BIOS_CNTL, byte | BIOS_WRITE_ENABLE);
@@ -236,21 +230,20 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 	 * Try to reserve the window mem region.  If this fails then
 	 * it is likely due to the window being "reseved" by the BIOS.
 	 */
-	window->rsrc.name = MOD_NAME;
+	window->rsrc.name = KBUILD_MODNAME;
 	window->rsrc.start = window->phys;
 	window->rsrc.end   = window->phys + window->size - 1;
 	window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 	if (request_resource(&iomem_resource, &window->rsrc)) {
 		window->rsrc.parent = NULL;
-		printk(KERN_DEBUG MOD_NAME ": "
-		       "%s(): Unable to register resource %pR - kernel bug?\n",
+		pr_debug("%s(): Unable to register resource %pR - kernel bug?\n",
 			__func__, &window->rsrc);
 	}
 
 	/* Map the firmware hub into my address space. */
 	window->virt = ioremap_nocache(window->phys, window->size);
 	if (!window->virt) {
-		printk(KERN_ERR MOD_NAME ": ioremap(%08lx, %08lx) failed\n",
+		pr_err("ioremap(%08lx, %08lx) failed\n",
 			window->phys, window->size);
 		goto out;
 	}
@@ -279,7 +272,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 		if (!map)
 			map = kmalloc(sizeof(*map), GFP_KERNEL);
 		if (!map) {
-			printk(KERN_ERR MOD_NAME ": kmalloc failed");
+			pr_err("kmalloc failed");
 			goto out;
 		}
 		memset(map, 0, sizeof(*map));
@@ -292,7 +285,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 		map->map.size = 0xffffffffUL - map_top + 1UL;
 		/* Set the name of the map to the address I am trying */
 		sprintf(map->map_name, "%s @%08Lx",
-			MOD_NAME, (unsigned long long)map->map.phys);
+			KBUILD_MODNAME, (unsigned long long)map->map.phys);
 
 		/* Firmware hubs only use vpp when being programmed
 		 * in a factory setting.  So in-place programming
@@ -321,8 +314,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 	found:
 		/* Trim the size if we are larger than the map */
 		if (map->mtd->size > map->map.size) {
-			printk(KERN_WARNING MOD_NAME
-				" rom(%llu) larger than window(%lu). fixing...\n",
+			pr_warn("ROM(%llu) larger than window(%lu). fixing...\n",
 				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
@@ -337,8 +329,7 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 			map->rsrc.end   = map->map.phys + map->mtd->size - 1;
 			map->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 			if (request_resource(&window->rsrc, &map->rsrc)) {
-				printk(KERN_ERR MOD_NAME
-					": cannot reserve MTD resource\n");
+				pr_err("cannot reserve MTD resource\n");
 				map->rsrc.parent = NULL;
 			}
 		}
@@ -378,70 +369,32 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 	return 0;
 }
 
-static void __devexit esb2rom_remove_one (struct pci_dev *pdev)
+static int __devexit esb2rom_remove_one(struct platform_device *dev)
 {
 	struct esb2rom_window *window = &esb2rom_window;
-	esb2rom_cleanup(window);
-}
 
-static struct pci_device_id esb2rom_pci_tbl[] __devinitdata = {
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_0,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801EB_0,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_1,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB2_0,
-	  PCI_ANY_ID, PCI_ANY_ID, },
-	{ 0, },
-};
+	esb2rom_cleanup(window);
 
-#if 0
-MODULE_DEVICE_TABLE(pci, esb2rom_pci_tbl);
+	return 0;
+}
 
-static struct pci_driver esb2rom_driver = {
-	.name =		MOD_NAME,
-	.id_table =	esb2rom_pci_tbl,
-	.probe =	esb2rom_init_one,
-	.remove =	esb2rom_remove_one,
+static struct platform_driver esb2rom_driver = {
+	.probe          = esb2rom_init_one,
+	.remove         = __devexit_p(esb2rom_remove_one),
+	.driver         = {
+		.owner  = THIS_MODULE,
+		.name   = KBUILD_MODNAME,
+	},
 };
-#endif
 
 static int __init init_esb2rom(void)
 {
-	struct pci_dev *pdev;
-	struct pci_device_id *id;
-	int retVal;
-
-	pdev = NULL;
-	for (id = esb2rom_pci_tbl; id->vendor; id++) {
-		printk(KERN_DEBUG "device id = %x\n", id->device);
-		pdev = pci_get_device(id->vendor, id->device, NULL);
-		if (pdev) {
-			printk(KERN_DEBUG "matched device = %x\n", id->device);
-			break;
-		}
-	}
-	if (pdev) {
-		printk(KERN_DEBUG "matched device id %x\n", id->device);
-		retVal = esb2rom_init_one(pdev, &esb2rom_pci_tbl[0]);
-		pci_dev_put(pdev);
-		printk(KERN_DEBUG "retVal = %d\n", retVal);
-		return retVal;
-	}
-	return -ENXIO;
-#if 0
-	return pci_register_driver(&esb2rom_driver);
-#endif
+	return platform_driver_register(&esb2rom_driver);
 }
 
 static void __exit cleanup_esb2rom(void)
 {
-	esb2rom_remove_one(esb2rom_window.pdev);
+	platform_driver_unregister(&esb2rom_driver);
 }
 
 module_init(init_esb2rom);
@@ -450,3 +403,4 @@ module_exit(cleanup_esb2rom);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lew Glendenning <lglendenning@lnxi.com>");
 MODULE_DESCRIPTION("MTD map driver for BIOS chips on the ESB2 southbridge");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index fec5256..bd7f74a 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -43,6 +43,7 @@ struct lpc_ich_info {
 	char name[32];
 	unsigned int iTCO_version;
 	unsigned int gpio_version;
+	unsigned int esb2rom_present;
 };
 
 #endif
-- 
1.7.0.4
