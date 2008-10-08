Date: Wed, 8 Oct 2008 22:39:11 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR flash.
Message-ID: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nico@cam.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Physmap is generic map driver for different platforms and flash types.
We added support of LPDDR to physmap.
All changes here are related to introduction of new pfow_base parameter.
This parameter is valid in case of LPDDR chips only.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 5ea1693..84522fb 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -10,8 +10,8 @@ config MTD_COMPLEX_MAPPINGS
 	  paged mappings of flash chips.
 
 config MTD_PHYSMAP
-	tristate "CFI Flash device in physical memory map"
-	depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM
+	tristate "Flash device in physical memory map"
+	depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_LPDDR
 	help
 	  This provides a 'mapping' driver which allows the NOR Flash and
 	  ROM driver code to communicate with chips which are mapped
@@ -61,6 +61,16 @@ config MTD_PHYSMAP_BANKWIDTH
 	  Ignore this option if you use run-time physmap configuration
 	  (i.e., run-time calling physmap_configure()).
 
+config MTD_PHYSMAP_PFOWBASE
+	hex "PFOW base address for LPDDR chips"
+	depends on MTD_PHYSMAP && MTD_LPDDR
+	default "0x00000000"
+	help
+	  This is the offset of PFOW window within address space of LPDDR flash 
+	  device. Refer to BSP documentation to get PFOW window base offset. 
+	  Ignore this option if you use run-time physmap configuration
+	  (i.e., run-time calling physmap_configure()).
+
 config MTD_PHYSMAP_OF
 	tristate "Flash device in physical memory map based on OF description"
 	depends on PPC_OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 42d844f..c2e1cb8 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -83,7 +83,12 @@ static int physmap_flash_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
+static const char *rom_probe_types[] = {
+					"cfi_probe",
+					"jedec_probe",
+					"qinfo_probe",
+					"map_rom",
+					NULL };
 #ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
 #endif
@@ -128,6 +133,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->map[i].size = dev->resource[i].end - dev->resource[i].start + 1;
 		info->map[i].bankwidth = physmap_data->width;
 		info->map[i].set_vpp = physmap_data->set_vpp;
+		info->map[i].pfow_base = physmap_data->pfow_base;
 
 		info->map[i].virt = ioremap(info->map[i].phys, info->map[i].size);
 		if (info->map[i].virt == NULL) {
@@ -269,6 +275,9 @@ static struct platform_driver physmap_flash_driver = {
 #ifdef PHYSMAP_COMPAT
 static struct physmap_flash_data physmap_flash_data = {
 	.width		= CONFIG_MTD_PHYSMAP_BANKWIDTH,
+#ifdef CONFIG_MTD_PHYSMAP_PFOWBASE
+	.pfow_base	= CONFIG_MTD_PHYSMAP_PFOWBASE,
+#endif
 };
 
 static struct resource physmap_flash_resource = {
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index c8e63a5..76f7cab 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -24,6 +24,7 @@ struct physmap_flash_data {
 	unsigned int		width;
 	void			(*set_vpp)(struct map_info *, int);
 	unsigned int		nr_parts;
+	unsigned int		pfow_base;
 	struct mtd_partition	*parts;
 };
 
