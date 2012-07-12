Received: from xes-mad.com ([216.165.139.218])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpRHg-0005Dw-EN
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 21:50:53 +0000
Date: Thu, 12 Jul 2012 16:50:25 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org, Lew Glendenning <lglendenning@lnxi.com>
Subject: [PATCH 2/2] mtd: esb2rom: rework ROM scanning and resources
Message-ID: <848a19c3-8f67-44f1-89ec-ac89e3a95035@zimbra>
In-Reply-To: <91f4cca2-bcce-46aa-b69a-107fdce3ec73@zimbra>
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

This patch collapses the various 4MB limit workarounds of the original
driver to a single limit when probing the Decode Enable Register. This
allows the driver to request an iomem region no larger than 4MB and no
larger than needed. The Intel 3100 chipset hardware that I test on only
has a 1MB ROM region and I experienced resource conflict warnings with
the BIOS and a kernel call trace on each boot without this change.

It also changes the way the ROM region is requested so that it requires
less manual resource structure manipulation and no longer always fails
for me.

These are the issues that are resolved for me:

resource map sanity check conflict: 0xffb00000 0xffffffff 0xffc00000 0xffefffff pnp 00:0a
------------[ cut here ]------------
WARNING: at arch/x86/mm/ioremap.c:171 __ioremap_caller+0x2ee/0x351()
Hardware name: XPedite7170
Info: mapping multiple BARs. Your kernel is fine.
Modules linked in:
Pid: 1, comm: swapper/0 Tainted: G        W    3.5.0-rc6-next-20120712-dirty #4
Call Trace:
 [<c10215e8>] warn_slowpath_common+0x65/0x7a
 [<c101b57a>] ? __ioremap_caller+0x2ee/0x351
 [<c1021661>] warn_slowpath_fmt+0x26/0x2a
 [<c101b57a>] __ioremap_caller+0x2ee/0x351
 [<c101b654>] ioremap_nocache+0xd/0xf
 [<c1347d4d>] ? esb2rom_init_one+0x264/0x4bf
 [<c1347d4d>] esb2rom_init_one+0x264/0x4bf
 [<c10ca7b5>] ? sysfs_create_link+0xa/0xd
 [<c11db377>] platform_drv_probe+0xc/0xe
 [<c11da702>] driver_probe_device+0x81/0x15c
 [<c11da820>] __driver_attach+0x43/0x5f
 [<c11d9572>] bus_for_each_dev+0x3d/0x67
 [<c11da5ae>] driver_attach+0x14/0x16
 [<c11da7dd>] ? driver_probe_device+0x15c/0x15c
 [<c11d9b48>] bus_add_driver+0xa0/0x1d0
 [<c11dab0e>] driver_register+0x74/0xdb
 [<c11db533>] platform_driver_register+0x38/0x3a
 [<c14d089c>] init_esb2rom+0xd/0xf
 [<c1001071>] do_one_initcall+0x71/0x113
 [<c14d088f>] ? jedec_probe_init+0x11/0x11
 [<c14b152f>] kernel_init+0xdf/0x168
 [<c14b1450>] ? repair_env_string+0x53/0x53
 [<c1352db6>] kernel_thread_helper+0x6/0xd
---[ end trace fbfdeab81d912055 ]---

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/maps/esb2rom.c |   89 +++++++++++++------------------------------
 1 files changed, 27 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index fc7a9e6..3d9712b 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -95,7 +95,7 @@ struct esb2rom_window {
 	unsigned long phys;
 	unsigned long size;
 	struct list_head maps;
-	struct resource rsrc;
+	struct resource *rsrc;
 	struct platform_device *dev;
 };
 
@@ -103,7 +103,6 @@ struct esb2rom_map_info {
 	struct list_head list;
 	struct map_info map;
 	struct mtd_info *mtd;
-	struct resource rsrc;
 	char map_name[sizeof(KBUILD_MODNAME) + 2 + ADDRESS_NAME_LEN];
 };
 
@@ -124,15 +123,16 @@ static void esb2rom_cleanup(struct esb2rom_window *window)
 
 	/* Free all of the mtd devices */
 	list_for_each_entry_safe(map, scratch, &window->maps, list) {
-		if (map->rsrc.parent)
-			release_resource(&map->rsrc);
 		mtd_device_unregister(map->mtd);
 		map_destroy(map->mtd);
 		list_del(&map->list);
 		kfree(map);
 	}
-	if (window->rsrc.parent)
-		release_resource(&window->rsrc);
+	if (window->rsrc) {
+		release_mem_region(window->rsrc->start,
+					resource_size(window->rsrc));
+		window->rsrc = NULL;
+	}
 	if (window->virt) {
 		iounmap(window->virt);
 		window->virt = NULL;
@@ -148,7 +148,7 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 	struct esb2rom_window *window = &esb2rom_window;
 	struct esb2rom_map_info *map = NULL;
 	struct pci_dev *pdev = to_pci_dev(dev->dev.parent);
-	unsigned long map_top;
+	resource_size_t map_top, map_bottom;
 	u8 byte;
 	u16 word;
 
@@ -176,20 +176,17 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 */
 
 
-	/* Find a region continuous to the end of the ROM window  */
+	/* Find a region contiguous with the top of the ROM window  */
 	window->phys = 0;
 	pci_read_config_word(pdev, FWH_DEC_EN1, &word);
 	pr_debug("pci_read_config_word : %x\n", word);
 
-	if ((word & FWH_8MiB) == FWH_8MiB)
-		window->phys = 0xff400000;
-	else if ((word & FWH_7MiB) == FWH_7MiB)
-		window->phys = 0xff500000;
-	else if ((word & FWH_6MiB) == FWH_6MiB)
-		window->phys = 0xff600000;
-	else if ((word & FWH_5MiB) == FWH_5MiB)
-		window->phys = 0xFF700000;
-	else if ((word & FWH_4MiB) == FWH_4MiB)
+	/* The probe sequence run over the firmware hub lock
+	 * registers sets them to 0x7 (no access).
+	 * (Insane hardware design, but most copied Intel's.)
+	 * ==> Probe at most the last 4M of the address space.
+	 */
+	if ((word & FWH_4MiB) == FWH_4MiB)
 		window->phys = 0xffc00000;
 	else if ((word & FWH_3_5MiB) == FWH_3_5MiB)
 		window->phys = 0xffc80000;
@@ -211,8 +208,6 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 		goto out;
 	}
 
-	/* reserved  0x0020 and 0x0010 */
-	window->phys -= 0x400000UL;
 	window->size = (0xffffffffUL - window->phys) + 1UL;
 
 	/* Enable writes through the rom window */
@@ -230,15 +225,11 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 	 * Try to reserve the window mem region.  If this fails then
 	 * it is likely due to the window being "reseved" by the BIOS.
 	 */
-	window->rsrc.name = KBUILD_MODNAME;
-	window->rsrc.start = window->phys;
-	window->rsrc.end   = window->phys + window->size - 1;
-	window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
-	if (request_resource(&iomem_resource, &window->rsrc)) {
-		window->rsrc.parent = NULL;
+	window->rsrc = request_mem_region(window->phys, window->size,
+						KBUILD_MODNAME);
+	if (!window->rsrc)
 		pr_debug("%s(): Unable to register resource %pR - kernel bug?\n",
 			__func__, &window->rsrc);
-	}
 
 	/* Map the firmware hub into my address space. */
 	window->virt = ioremap_nocache(window->phys, window->size);
@@ -249,22 +240,11 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 	}
 
 	/* Get the first address to look for an rom chip at */
-	map_top = window->phys;
-	if ((window->phys & 0x3fffff) != 0) {
-		/* if not aligned on 4MiB, look 4MiB lower in address space */
-		map_top = window->phys + 0x400000;
-	}
-#if 1
-	/* The probe sequence run over the firmware hub lock
-	 * registers sets them to 0x7 (no access).
-	 * (Insane hardware design, but most copied Intel's.)
-	 * ==> Probe at most the last 4M of the address space.
-	 */
-	if (map_top < 0xffc00000)
-		map_top = 0xffc00000;
-#endif
+	map_top = 0xffffffffUL;
+	map_bottom = window->phys;
+
 	/* Loop through and look for rom chips */
-	while ((map_top - 1) < 0xffffffffUL) {
+	while ((map_bottom - 1) < map_top) {
 		struct cfi_private *cfi;
 		unsigned long offset;
 		int i;
@@ -278,11 +258,11 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 		memset(map, 0, sizeof(*map));
 		INIT_LIST_HEAD(&map->list);
 		map->map.name = map->map_name;
-		map->map.phys = map_top;
-		offset = map_top - window->phys;
+		map->map.phys = map_bottom;
+		offset = map_bottom - window->phys;
 		map->map.virt = (void __iomem *)
 			(((unsigned long)(window->virt)) + offset);
-		map->map.size = 0xffffffffUL - map_top + 1UL;
+		map->map.size = map_top - map_bottom + 1UL;
 		/* Set the name of the map to the address I am trying */
 		sprintf(map->map_name, "%s @%08Lx",
 			KBUILD_MODNAME, (unsigned long long)map->map.phys);
@@ -309,7 +289,7 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 					goto found;
 			}
 		}
-		map_top += ROM_PROBE_STEP_SIZE;
+		map_bottom += ROM_PROBE_STEP_SIZE;
 		continue;
 	found:
 		/* Trim the size if we are larger than the map */
@@ -318,21 +298,6 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
-		if (window->rsrc.parent) {
-			/*
-			 * Registering the MTD device in iomem may not be possible
-			 * if there is a BIOS "reserved" and BUSY range.  If this
-			 * fails then continue anyway.
-			 */
-			map->rsrc.name  = map->map_name;
-			map->rsrc.start = map->map.phys;
-			map->rsrc.end   = map->map.phys + map->mtd->size - 1;
-			map->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
-			if (request_resource(&window->rsrc, &map->rsrc)) {
-				pr_err("cannot reserve MTD resource\n");
-				map->rsrc.parent = NULL;
-			}
-		}
 
 		/* Make the whole region visible in the map */
 		map->map.virt = window->virt;
@@ -349,8 +314,8 @@ static int __devinit esb2rom_init_one(struct platform_device *dev)
 			goto out;
 		}
 
-		/* Calculate the new value of map_top */
-		map_top += map->mtd->size;
+		/* Calculate the new value of map_bottom */
+		map_bottom += map->mtd->size;
 
 		/* File away the map structure */
 		list_add(&map->list, &window->maps);
-- 
1.7.0.4
