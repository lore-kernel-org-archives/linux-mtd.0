Date: Tue, 16 Dec 2008 18:22:39 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, jaredeh@gmail.com
Subject: [PATCH 6/8] LPDDR extended physmap driver to support LPDDR flash
Message-ID: <alpine.LFD.2.00.0812161821140.15885@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Physmap is a generic map driver for different platforms and flash types.
We added support of LPDDR to physmap.
All changes here are related to introduction of new pfow_base parameter.
This parameter is valid in case of LPDDR chips only.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Acked-by: Jared Hulbert <jaredeh@gmail.com>
---

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 5ea1693..e823437 100644
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
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 42d844f..c06f5a6 100644
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
 
