Received: from wx-out-0506.google.com ([66.249.82.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq2pY-0006uW-CO
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 02:29:11 -0500
Received: by wx-out-0506.google.com with SMTP id h30so3108849wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Nov 2006 23:29:06 -0800 (PST)
Message-ID: <428201f00611302329s49ecae5dha076c40192f21b3e@mail.gmail.com>
Date: Fri, 1 Dec 2006 15:29:06 +0800
From: "=?ISO-2022-JP?B?Sm9leSBLdSAoGyRCbWM9dzBpGyhCKQ==?=" <joey.ku@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] MAPS: add support for ICH6/7/8 in ichxrom.c
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] MAPS: add support for ICH6/7/8 in ichxrom.c

Add code to support ICH6/7/8
BTW, I don't have ICH7/8 machine for testing.
I guess it should work. :>

Signed-off-by: laface.tw@gmail.com

--

--- ichxrom.c.org	2006-11-30 16:56:49.000000000 +0800
+++ ichxrom.c	2006-12-01 15:02:21.086309768 +0800
@@ -26,11 +26,28 @@

 #define ROM_PROBE_STEP_SIZE (64*1024) /* 64KiB */

-#define BIOS_CNTL	0x4e
-#define FWH_DEC_EN1	0xE3
-#define FWH_DEC_EN2	0xF0
-#define FWH_SEL1	0xE8
-#define FWH_SEL2	0xEE
+enum ichxrom_chip_type {
+	ICHXROM_ICH5 = 0,
+	ICHXROM_ICH6,
+};
+
+struct ichxrom_conf_reg_offset {
+	u8 bios_cntl;
+	u8 fwh_dec_en1;
+	u8 fwh_dec_en2;
+	u8 fwh_sel1;
+	u8 fwh_sel2;
+};
+	
+struct ichxrom_chip_info {
+	struct pci_device_id pci_dev_id;
+	enum ichxrom_chip_type type;
+};
+
+struct ichxrom_chip {
+	struct ichxrom_conf_reg_offset reg_offset;
+	unsigned long (*setup_addr)(const struct ichxrom_chip *chip, struct
pci_dev *pdev);
+};

 struct ichxrom_window {
 	void __iomem* virt;
@@ -39,6 +56,7 @@
 	struct list_head maps;
 	struct resource rsrc;
 	struct pci_dev *pdev;
+	const struct ichxrom_chip *chip;
 };

 struct ichxrom_map_info {
@@ -53,14 +71,79 @@
 	.maps = LIST_HEAD_INIT(ichxrom_window.maps),
 };

+static unsigned long ichxrom_find_decode_region(u8 en1, u8 en2)
+{
+	unsigned long phys = 0;
+	
+	if (en1 == 0xff) {
+		phys = 0xffc00000;
+		if ((en2 & 0x0f) == 0x0f) {
+			phys = 0xff400000;
+		}
+		else if ((en2 & 0x0e) == 0x0e) {
+			phys = 0xff500000;
+		}
+		else if ((en2 & 0x0c) == 0x0c) {
+			phys = 0xff600000;
+		}
+		else if ((en2 & 0x08) == 0x08) {
+			phys = 0xff700000;
+		}
+	}
+	else if ((en1 & 0xfe) == 0xfe) {
+		phys = 0xffc80000;
+	}
+	else if ((en1 & 0xfc) == 0xfc) {
+		phys = 0xffd00000;
+	}
+	else if ((en1 & 0xf8) == 0xf8) {
+		phys = 0xffd80000;
+	}
+	else if ((en1 & 0xf0) == 0xf0) {
+		phys = 0xffe00000;
+	}
+	else if ((en1 & 0xe0) == 0xe0) {
+		phys = 0xffe80000;
+	}
+	else if ((en1 & 0xc0) == 0xc0) {
+		phys = 0xfff00000;
+	}
+	else if ((en1 & 0x80) == 0x80) {
+		phys = 0xfff80000;
+	}
+	
+	return phys;
+}
+
+static unsigned long ichxrom_ich5_setup_addr(const struct
ichxrom_chip *chip, struct pci_dev *pdev)
+{
+	u8 en1, en2;
+	
+	pci_read_config_byte(pdev, chip->reg_offset.fwh_dec_en1, &en1);
+	pci_read_config_byte(pdev, chip->reg_offset.fwh_dec_en2, &en2);
+	
+	return ichxrom_find_decode_region(en1, en2);
+}
+
+static unsigned long ichxrom_ich6_setup_addr(const struct
ichxrom_chip *chip, struct pci_dev *pdev)
+{
+	u16 word;
+	
+	pci_read_config_word(pdev, chip->reg_offset.fwh_dec_en1, &word);
+	
+	return ichxrom_find_decode_region((word>>8), (word&0x0f));
+}
+
 static void ichxrom_cleanup(struct ichxrom_window *window)
 {
 	struct ichxrom_map_info *map, *scratch;
 	u16 word;

 	/* Disable writes through the rom window */
-	pci_read_config_word(window->pdev, BIOS_CNTL, &word);
-	pci_write_config_word(window->pdev, BIOS_CNTL, word & ~1);
+	pci_read_config_word(window->pdev,
+			window->chip->reg_offset.bios_cntl, &word);
+	pci_write_config_word(window->pdev,
+			window->chip->reg_offset.bios_cntl, word & ~1);
 	pci_dev_put(window->pdev);

 	/* Free all of the mtd devices */
@@ -85,13 +168,12 @@


 static int __devinit ichxrom_init_one (struct pci_dev *pdev,
-	const struct pci_device_id *ent)
+	const struct ichxrom_chip *chip)
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	struct ichxrom_window *window = &ichxrom_window;
 	struct ichxrom_map_info *map = NULL;
 	unsigned long map_top;
-	u8 byte;
 	u16 word;

 	/* For now I just handle the ichx and I assume there
@@ -105,47 +187,10 @@
 	 * but don't currently handle that case either.
 	 */
 	window->pdev = pdev;
+	window->chip = chip;

 	/* Find a region continuous to the end of the ROM window  */
-	window->phys = 0;
-	pci_read_config_byte(pdev, FWH_DEC_EN1, &byte);
-	if (byte == 0xff) {
-		window->phys = 0xffc00000;
-		pci_read_config_byte(pdev, FWH_DEC_EN2, &byte);
-		if ((byte & 0x0f) == 0x0f) {
-			window->phys = 0xff400000;
-		}
-		else if ((byte & 0x0e) == 0x0e) {
-			window->phys = 0xff500000;
-		}
-		else if ((byte & 0x0c) == 0x0c) {
-			window->phys = 0xff600000;
-		}
-		else if ((byte & 0x08) == 0x08) {
-			window->phys = 0xff700000;
-		}
-	}
-	else if ((byte & 0xfe) == 0xfe) {
-		window->phys = 0xffc80000;
-	}
-	else if ((byte & 0xfc) == 0xfc) {
-		window->phys = 0xffd00000;
-	}
-	else if ((byte & 0xf8) == 0xf8) {
-		window->phys = 0xffd80000;
-	}
-	else if ((byte & 0xf0) == 0xf0) {
-		window->phys = 0xffe00000;
-	}
-	else if ((byte & 0xe0) == 0xe0) {
-		window->phys = 0xffe80000;
-	}
-	else if ((byte & 0xc0) == 0xc0) {
-		window->phys = 0xfff00000;
-	}
-	else if ((byte & 0x80) == 0x80) {
-		window->phys = 0xfff80000;
-	}
+	window->phys = chip->setup_addr(chip, pdev);

 	if (window->phys == 0) {
 		printk(KERN_ERR MOD_NAME ": Rom window is closed\n");
@@ -155,7 +200,7 @@
 	window->size = (0xffffffffUL - window->phys) + 1UL;

 	/* Enable writes through the rom window */
-	pci_read_config_word(pdev, BIOS_CNTL, &word);
+	pci_read_config_word(pdev, chip->reg_offset.bios_cntl, &word);
 	if (!(word & 1)  && (word & (1<<1))) {
 		/* The BIOS will generate an error if I enable
 		 * this device, so don't even try.
@@ -163,7 +208,7 @@
 		printk(KERN_ERR MOD_NAME ": firmware access control, I can't enable
writes\n");
 		goto out;
 	}
-	pci_write_config_word(pdev, BIOS_CNTL, word | 1);
+	pci_write_config_word(pdev, chip->reg_offset.bios_cntl, word | 1);

 	/*
 	 * Try to reserve the window mem region.  If this fails then
@@ -304,7 +349,6 @@
 		list_add(&map->list, &window->maps);
 		map = NULL;
 	}
-
  out:
 	/* Free any left over map structures */
 	kfree(map);
@@ -317,25 +361,96 @@
 	return 0;
 }

-
 static void __devexit ichxrom_remove_one (struct pci_dev *pdev)
 {
 	struct ichxrom_window *window = &ichxrom_window;
 	ichxrom_cleanup(window);
 }

-static struct pci_device_id ichxrom_pci_tbl[] __devinitdata = {
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
-	{ 0, },
+const static const struct ichxrom_chip ichxrom_chip_tbl[] = {
+	[ICHXROM_ICH5] = {
+		.reg_offset = {
+			.bios_cntl = 0x4E,
+			.fwh_dec_en1 = 0xE3,
+			.fwh_dec_en2 = 0xF0,
+			.fwh_sel1 = 0xE8,
+			.fwh_sel2 = 0xEE
+		},
+		.setup_addr = ichxrom_ich5_setup_addr,
+	},
+
+	[ICHXROM_ICH6] = {
+		.reg_offset = {
+			.bios_cntl = 0xDC,
+			.fwh_dec_en1 = 0xD8,
+			.fwh_dec_en2 = 0x00,	/* the register is not exist */
+			.fwh_sel1 = 0xD0,
+			.fwh_sel2 = 0xD4
+		},
+		.setup_addr = ichxrom_ich6_setup_addr,
+	}
+};
+
+static struct ichxrom_chip_info ichxrom_chip_probe_tbl[] __devinitdata = {
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH5,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH5,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_0,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH5,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801EB_0,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH5,
+	},	
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_1,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH5,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH6_0 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH6_1 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+/* Not yet tested! It should work for ich7/8.
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_0 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_1 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_31 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},	
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH8_0 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH8_2 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH8_3 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+	{ .pci_dev_id = { PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB2_0 ,
+			  PCI_ANY_ID, PCI_ANY_ID, },
+	  .type = ICHXROM_ICH6,
+	},
+*/
+	{ { 0 }, },
 };

 #if 0
@@ -352,18 +467,23 @@
 static int __init init_ichxrom(void)
 {
 	struct pci_dev *pdev;
-	struct pci_device_id *id;
+	struct ichxrom_chip_info *chip;

 	pdev = NULL;
-	for (id = ichxrom_pci_tbl; id->vendor; id++) {
-		pdev = pci_get_device(id->vendor, id->device, NULL);
+
+	for (chip = ichxrom_chip_probe_tbl; chip->pci_dev_id.vendor ; chip++) {
+		pdev = pci_get_device(chip->pci_dev_id.vendor,
+					chip->pci_dev_id.device, NULL);
+	
 		if (pdev) {
 			break;
 		}
+	
 	}
 	if (pdev) {
-		return ichxrom_init_one(pdev, &ichxrom_pci_tbl[0]);
+		return ichxrom_init_one(pdev, &ichxrom_chip_tbl[chip->type]);
 	}
+
 	return -ENXIO;
 #if 0
 	return pci_register_driver(&ichxrom_driver);
