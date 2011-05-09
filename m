Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJNCE-0001uB-54
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 09:56:11 +0000
Received: by wyb28 with SMTP id 28so4728968wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 May 2011 02:56:08 -0700 (PDT)
Date: Mon, 9 May 2011 10:56:04 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: Removing CONFIG_MTD_PARTITIONS
Message-ID: <20110509095604.GA10860@pulham.picochip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutski <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've had a quick look at removing CONFIG_MTD_PARTITIONS so that MTD 
partitioning is always enabled and the patch below is what I have so 
far.

At the moment this just always builds in partitioning support and 
introduces mtd_device_{,un}register() (I'm not sure if these are the 
best names).  These effectively replace 
add_mtd_device()/add_mtd_partitions() and their deletion counterparts 
and will register partitions if supplied, or the whole device if there 
are no partitions.  I've also converted over a couple of mtd drivers, 
and will do them all if this is the correct approach.

I've left CONFIG_MTD_PARTITIONS as a bool with no description to keep 
the series bisectable - the final patch would remove it completely and 
make add_mtd_device and add_mtd_partitions internal only symbols.  Does 
this seem like a reasonable strategy?

Jamie

8<----

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b4567c3..7df4eec 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -34,18 +34,7 @@ config MTD_TESTS
 	  various checks and verifications when loaded.
 
 config MTD_PARTITIONS
-	bool "MTD partitioning support"
-	help
-	  If you have a device which needs to divide its flash chip(s) up
-	  into multiple 'partitions', each of which appears to the user as
-	  a separate MTD device, you require this option to be enabled. If
-	  unsure, say 'Y'.
-
-	  Note, however, that you don't need this option for the DiskOnChip
-	  devices. Partitioning on NFTL 'devices' is a different - that's the
-	  'normal' form of partitioning used on a block device.
-
-if MTD_PARTITIONS
+	bool
 
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
@@ -99,7 +88,7 @@ endif # MTD_REDBOOT_PARTS
 
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
-	depends on MTD_PARTITIONS = "y" && MTD = "y"
+	depends on MTD = "y"
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
 	  command line. Multiple flash resources are supported for hardware where
@@ -164,8 +153,6 @@ config MTD_AR7_PARTS
 	---help---
 	  TI AR7 partitioning support
 
-endif # MTD_PARTITIONS
-
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d578095..39664c4 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,8 +4,7 @@
 
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
-mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o
-mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
+mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
 mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7522df4..95d4f85 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -27,10 +27,8 @@ struct physmap_flash_info {
 	struct mtd_info		*mtd[MAX_RESOURCES];
 	struct mtd_info		*cmtd;
 	struct map_info		map[MAX_RESOURCES];
-#ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
 	struct mtd_partition	*parts;
-#endif
 };
 
 static int physmap_flash_remove(struct platform_device *dev)
@@ -47,18 +45,11 @@ static int physmap_flash_remove(struct platform_device *dev)
 	physmap_data = dev->dev.platform_data;
 
 	if (info->cmtd) {
-#ifdef CONFIG_MTD_PARTITIONS
+		mtd_device_unregister(info->cmtd);
 		if (info->nr_parts || physmap_data->nr_parts) {
-			del_mtd_partitions(info->cmtd);
-
 			if (info->nr_parts)
 				kfree(info->parts);
-		} else {
-			del_mtd_device(info->cmtd);
 		}
-#else
-		del_mtd_device(info->cmtd);
-#endif
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -76,9 +67,7 @@ static const char *rom_probe_types[] = {
 					"qinfo_probe",
 					"map_rom",
 					NULL };
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
@@ -164,24 +153,16 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				&info->parts, 0);
+				   &info->parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
+		mtd_device_register(info->cmtd, info->parts, err);
 		info->nr_parts = err;
 		return 0;
 	}
 
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
-		return 0;
-	}
-#endif
-
-	add_mtd_device(info->cmtd);
+	mtd_device_register(info->cmtd, physmap_data->parts,
+			    physmap_data->nr_parts);
 	return 0;
 
 err_out:
@@ -245,14 +226,12 @@ void physmap_configure(unsigned long addr, unsigned long size,
 	physmap_flash_data.set_vpp = set_vpp;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
 {
 	physmap_flash_data.nr_parts = num_parts;
 	physmap_flash_data.parts = parts;
 }
 #endif
-#endif
 
 static int __init physmap_init(void)
 {
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..8e9cf21 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,6 +37,7 @@
 #include <linux/gfp.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
 /*
@@ -426,6 +427,31 @@ out_error:
 	return ret;
 }
 
+int mtd_device_register(struct mtd_info *master,
+			const struct mtd_partition *parts,
+			int nr_parts)
+{
+	if ((parts && nr_parts <= 0) ||
+	    (!parts && nr_parts >= 0))
+		return -EINVAL;
+
+	return parts ? add_mtd_partitions(master, parts, nr_parts) :
+		add_mtd_device(master);
+}
+EXPORT_SYMBOL_GPL(mtd_device_register);
+
+int mtd_device_unregister(struct mtd_info *master)
+{
+	int err;
+
+	err = del_mtd_partitions(master);
+	if (err)
+		return err;
+
+	return del_mtd_device(master);
+}
+EXPORT_SYMBOL_GPL(mtd_device_unregister);
+
 /**
  *	register_mtd_user - register a 'user' of MTD devices.
  *	@new: pointer to notifier info structure
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0cde618..914fe56 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -25,7 +25,6 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
-#include <linux/mtd/partitions.h>
 #include <linux/mtd/nand-gpio.h>
 
 struct gpiomtd {
@@ -316,8 +315,8 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
 					   gpiomtd->mtd_info.size);
 
-	add_mtd_partitions(&gpiomtd->mtd_info, gpiomtd->plat.parts,
-			   gpiomtd->plat.num_parts);
+	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
+			    gpiomtd->plat.num_parts);
 	platform_set_drvdata(dev, gpiomtd);
 
 	return 0;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..46be430 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3539,12 +3539,7 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
-#ifdef CONFIG_MTD_PARTITIONS
-	/* Deregister partitions */
-	del_mtd_partitions(mtd);
-#endif
-	/* Deregister the device */
-	del_mtd_device(mtd);
+	mtd_device_unregister(mtd);
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index caf5a73..e28bd03 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -21,10 +21,8 @@ struct plat_nand_data {
 	struct nand_chip	chip;
 	struct mtd_info		mtd;
 	void __iomem		*io_base;
-#ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
 	struct mtd_partition	*parts;
-#endif
 };
 
 /*
@@ -101,7 +99,6 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	if (pdata->chip.part_probe_types) {
 		err = parse_mtd_partitions(&data->mtd,
 					pdata->chip.part_probe_types,
@@ -113,14 +110,11 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	}
 	if (pdata->chip.set_parts)
 		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
-	if (pdata->chip.partitions) {
+	if (pdata->chip.partitions)
 		data->parts = pdata->chip.partitions;
-		err = add_mtd_partitions(&data->mtd, data->parts,
-			pdata->chip.nr_partitions);
-	} else
-#endif
-	err = add_mtd_device(&data->mtd);
 
+	err = mtd_device_register(&data->mtd, data->parts,
+				  pdata->chip.nr_partitions);
 	if (!err)
 		return err;
 
@@ -149,10 +143,8 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	nand_release(&data->mtd);
-#ifdef CONFIG_MTD_PARTITIONS
 	if (data->parts && data->parts != pdata->chip.partitions)
 		kfree(data->parts);
-#endif
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..8c524a7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -325,6 +325,12 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 extern int add_mtd_device(struct mtd_info *mtd);
 extern int del_mtd_device (struct mtd_info *mtd);
 
+struct mtd_partition;
+extern int mtd_device_register(struct mtd_info *master,
+			       const struct mtd_partition *parts,
+			       int nr_parts);
+extern int mtd_device_unregister(struct mtd_info *master);
+
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
@@ -348,15 +354,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
-#ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
-#else
-static inline void mtd_erase_callback(struct erase_info *instr)
-{
-	if (instr->callback)
-		instr->callback(instr);
-}
-#endif
 
 /*
  * Debugging macro and defines
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index bcfd9f7..e963b86 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -35,8 +35,6 @@ struct physmap_flash_data {
 void physmap_configure(unsigned long addr, unsigned long size,
 		int bankwidth, void (*set_vpp)(struct map_info *, int) );
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 /*
  * Machines that wish to do flash partition may want to call this function in
  * their setup routine.
@@ -48,6 +46,4 @@ void physmap_configure(unsigned long addr, unsigned long size,
  */
 void physmap_set_partitions(struct mtd_partition *parts, int num_parts);
 
-#endif /* defined(CONFIG_MTD_PARTITIONS) */
-
 #endif /* __LINUX_MTD_PHYSMAP__ */
