Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGHWU-0007RP-5f
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 12:58:15 -0400
Message-ID: <46B0BBAD.4060702@gmx.net>
Date: Wed, 01 Aug 2007 18:58:21 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] MAPS: add support for Nvidia MCP55 to ck804xrom
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] MAPS: add support for Nvidia MCP55 to ck804xrom

This patch extends the existing MAPS driver for the Nvidia CK804 chipset
(ck804xrom.c) to also work on the Nvidia MCP55 chipset. As both chipsets
are rather similar, suporting them both with the same driver is easy.

The patch is not ready for inclusion yet, it needs some codingstyle care
and probably better comments. The indenting is wrong at some points to
keep the diff minimal for a first review. I will post a better version
once I get some comments.

Testers are most welcome! I lack access to the hardware in question and
would appreciate any reports.

Signed-off-by: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>

--- linux-mtd/drivers/mtd/maps/ck804xrom.c~	2007-08-01 14:51:00.000000000 +0200
+++ linux-mtd/drivers/mtd/maps/ck804xrom.c	2007-08-01 15:45:25.000000000 +0200
@@ -45,8 +45,9 @@
 	char map_name[sizeof(MOD_NAME) + 2 + ADDRESS_NAME_LEN];
 };
 
-
-/* The 2 bits controlling the window size are often set to allow reading
+/*
+ * The following applies to ck804 only:
+ * The 2 bits controlling the window size are often set to allow reading
  * the BIOS, but too small to allow writing, since the lock registers are
  * 4MiB lower in the address space than the data.
  *
@@ -58,10 +59,17 @@
  * If only the 7 Bit is set, it is a 4MiB window.  Otherwise, a
  * 64KiB window.
  *
+ * The following applies to mcp55 only:
+ * The 15 bits controlling the window size are distributed as follows: 
+ * byte @0x88: bit 0..7
+ * byte @0x8c: bit 8..15
+ * word @0x90: bit 16..30
+ * If all bits are enabled, we have a 16? MiB window
+ * Please set win_size_bits to 0x7fffffff if you actually want to do something
  */
 static uint win_size_bits = 0;
 module_param(win_size_bits, uint, 0);
-MODULE_PARM_DESC(win_size_bits, "ROM window size bits override for 0x88 byte, normally set by BIOS.");
+MODULE_PARM_DESC(win_size_bits, "ROM window size bits override, normally set by BIOS.");
 
 static struct ck804xrom_window ck804xrom_window = {
 	.maps = LIST_HEAD_INIT(ck804xrom_window.maps),
@@ -106,6 +114,7 @@
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	u8 byte;
+	u16 word;
 	struct ck804xrom_window *window = &ck804xrom_window;
 	struct ck804xrom_map_info *map = NULL;
 	unsigned long map_top;
@@ -113,6 +122,8 @@
 	/* Remember the pci dev I find the window in */
 	window->pdev = pci_dev_get(pdev);
 
+	switch (ent->driver_data) {
+	case 1:
 	/* Enable the selected rom window.  This is often incorrectly
 	 * set up by the BIOS, and the 4MiB offset for the lock registers
 	 * requires the full 5MiB of window space.
@@ -123,7 +134,6 @@
         pci_read_config_byte(pdev, 0x88, &byte);
         pci_write_config_byte(pdev, 0x88, byte | win_size_bits );
 
-
 	/* Assume the rom window is properly setup, and find it's size */
 	pci_read_config_byte(pdev, 0x88, &byte);
 
@@ -133,6 +143,20 @@
 		window->phys = 0xffc00000; /* 4MiB */
 	else
 		window->phys = 0xffff0000; /* 64KiB */
+	break;
+	case 2:
+	pci_read_config_byte(pdev, 0x88, &byte);
+	pci_write_config_byte(pdev, 0x88, byte | (win_size_bits & 0xff));
+
+	pci_read_config_byte(pdev, 0x8c, &byte);
+	pci_write_config_byte(pdev, 0x8c, byte | ((win_size_bits & 0xff00) >> 8));
+
+	pci_read_config_word(pdev, 0x90, &word);
+	pci_write_config_word(pdev, 0x90, word | ((win_size_bits & 0x7fff0000) >> 16));
+
+	window->phys = 0xff000000; /* 16MiB, hardcoded for now */
+	break;
+	}
 
 	window->size = 0xffffffffUL - window->phys + 1UL;
 
@@ -304,7 +328,23 @@
 
 static struct pci_device_id ck804xrom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_NVIDIA, 0x0051,
-        PCI_ANY_ID, PCI_ANY_ID, }, /* nvidia ck804 */
+        PCI_ANY_ID, PCI_ANY_ID, 1 }, /* nvidia ck804 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0360,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0361,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0362,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0363,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0364,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0365,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x0366,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
+	{ PCI_VENDOR_ID_NVIDIA, 0x03607,
+        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
 	{ 0, }
 };
 
@@ -332,7 +372,7 @@
 			break;
 	}
 	if (pdev) {
-		retVal = ck804xrom_init_one(pdev, &ck804xrom_pci_tbl[0]);
+		retVal = ck804xrom_init_one(pdev, id);
 		pci_dev_put(pdev);
 		return retVal;
 	}
