Received: from viridian.itc.virginia.edu ([128.143.12.139])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TaW6g-0003Gj-CI
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 18:31:41 +0000
From: Bill Pemberton <wfp5p@virginia.edu>
To: gregkh@linuxfoundation.org
Subject: [PATCH 314/493] mtd: remove use of __devinitdata
Date: Mon, 19 Nov 2012 13:24:23 -0500
Message-Id: <1353349642-3677-314-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CONFIG_HOTPLUG is going away as an option so __devinitdata is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: David Woodhouse <dwmw2@infradead.org> 
Cc: linux-mtd@lists.infradead.org 
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 drivers/mtd/devices/sst25l.c        | 2 +-
 drivers/mtd/maps/esb2rom.c          | 2 +-
 drivers/mtd/maps/ichxrom.c          | 2 +-
 drivers/mtd/nand/mpc5121_nfc.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 080cb1c..0b3f173 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -705,7 +705,7 @@ struct flash_info {
 #define IS_POW2PS	0x0001		/* uses 2^N byte pages */
 };
 
-static struct flash_info __devinitdata dataflash_data [] = {
+static struct flash_info dataflash_data [] = {
 
 	/*
 	 * NOTE:  chips with SUP_POW2PS (rev D and up) need two entries,
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index ab4154d..e4f2339 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -64,7 +64,7 @@ struct flash_info {
 
 #define to_sst25l_flash(x) container_of(x, struct sst25l_flash, mtd)
 
-static struct flash_info __devinitdata sst25l_flash_info[] = {
+static struct flash_info sst25l_flash_info[] = {
 	{"sst25lf020a", 0xbf43, 256, 1024, 4096},
 	{"sst25lf040a",	0xbf44,	256, 2048, 4096},
 };
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index 3797825..664303f 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -384,7 +384,7 @@ static void __devexit esb2rom_remove_one (struct pci_dev *pdev)
 	esb2rom_cleanup(window);
 }
 
-static struct pci_device_id esb2rom_pci_tbl[] __devinitdata = {
+static struct pci_device_id esb2rom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,
 	  PCI_ANY_ID, PCI_ANY_ID, },
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index a9bab67..9673601 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -321,7 +321,7 @@ static void __devexit ichxrom_remove_one (struct pci_dev *pdev)
 	ichxrom_cleanup(window);
 }
 
-static struct pci_device_id ichxrom_pci_tbl[] __devinitdata = {
+static struct pci_device_id ichxrom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,
 	  PCI_ANY_ID, PCI_ANY_ID, },
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index f779e6a..09f75a5 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -841,7 +841,7 @@ static int __devexit mpc5121_nfc_remove(struct platform_device *op)
 	return 0;
 }
 
-static struct of_device_id mpc5121_nfc_match[] __devinitdata = {
+static struct of_device_id mpc5121_nfc_match[] = {
 	{ .compatible = "fsl,mpc5121-nfc", },
 	{},
 };
-- 
1.8.0
