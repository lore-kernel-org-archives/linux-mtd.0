Received: from loncoche.terra.com.br ([200.154.55.229])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BikmW-0007wp-FU
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2004 22:06:34 -0400
Received: from rosario.terra.com.br (rosario.terra.com.br [200.154.55.129])
	by loncoche.terra.com.br (Postfix) with ESMTP id 68943E78514
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jul 2004 23:06:29 -0300 (BRT)
Received: from ummagumma.ozzmosis.net
	(200-102-085-248.nhoce7002.dsl.brasiltelecom.net.br [200.102.85.248])
	(authenticated user lucasvr)
	by rosario.terra.com.br (Postfix) with ESMTP id 83F133C01A
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jul 2004 23:06:28 -0300 (BRT)
From: Lucas Correia Villa Real <lucasvr@gobolinux.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 8 Jul 2004 23:07:31 -0300
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_j3f7ADlSI/pgRTS"
Message-Id: <200407082307.31287.lucasvr@gobolinux.org>
Subject: [patch] physmap.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_j3f7ADlSI/pgRTS
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I've been working with an ARM iMX board, where it was needed to have mtd
partitions on flash memory (using "phys_mapped_flash") and on SRAM chips
(using "map_ram") at the same time. I wasn't able to do that with the current
physmap.c mapping, so a few modifications were made to handle this situation
properly.

This patch allows one to define more than one device when using physmap
mapping, for those who aren't using CONFIG_MTD_CMDLINE_PARTS.

I would like to know if such feature is welcome. If so, I can give a code
cleanup and repost (if needed), or just tell me to shut up and walk away 
otherwise :-)

Could someone give a review on it? The patch was applied against
mtd-snapshot-20040707.

Thanks,
Lucas

--Boundary-00=_j3f7ADlSI/pgRTS
Content-Type: text/x-diff;
  charset="us-ascii";
  name="physmap.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="physmap.c.diff"

--- mtd/drivers/mtd/maps/physmap.c.orig	2004-06-05 19:00:10.000000000 -0300
+++ mtd/drivers/mtd/maps/physmap.c	2004-07-08 17:19:34.000000000 -0300
@@ -7,6 +7,7 @@
  * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
  *
  * 031022 - [jsun] add run-time configure and partition setup
+ * 040708 - [lucasvr] support for more than one partition type
  */
 
 #include <linux/module.h>
@@ -20,95 +21,199 @@
 #include <linux/config.h>
 #include <linux/mtd/partitions.h>
 
-static struct mtd_info *mymtd;
-
-struct map_info physmap_map = {.name = "phys_mapped_flash"};
-
-#ifdef CONFIG_MTD_PARTITIONS
-static struct mtd_partition *mtd_parts;
-static int                   mtd_parts_nb;
+struct partition_types {
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	struct mtd_partition *mtd_parts;
+	int    mtd_parts_nb;
+#endif
+	struct mtd_partition *physmap_partitions;
+	int    num_physmap_partitions;
+	char  *probe_type;
+	struct mtd_info *mymtd;
+	struct map_info physmap_map;
+};
 
-static int num_physmap_partitions;
-static struct mtd_partition *physmap_partitions;
 
+#ifdef CONFIG_MTD_CMDLINE_PARTS
 static const char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
+static struct partition_types supported_devices {
+	.physmap_map = { .name = "phys_mapped_flash" };
+};
+
+#else
+static struct mtd_partition mtd_physmap_partitions[] = {
+	{
+        	name:           "bootloader/param/kernel",
+		size:           0x100000,
+		offset:         0,
+		mask_flags:     MTD_WRITEABLE | MTD_ERASEABLE,  /* force read-only */
+        },{
+		name:           "file system",
+		size:           0xF00000,
+		offset:         0x100000,
+        }
+};
+static struct mtd_partition ram_physmap_partitions[] = {
+	{
+		name:           "1MB fs",
+		size:           0x100000,
+		offset:         0,
+        }
+};
+static struct partition_types supported_devices[] = {
+	{
+		.physmap_partitions = mtd_physmap_partitions,
+		.num_physmap_partitions = sizeof(mtd_physmap_partitions) /
+					  sizeof(struct mtd_partition),
+		.probe_type = "cfi_probe",
+		.physmap_map = {
+			.name = "phys_mapped_flash",
+			.phys = 0x10000000,
+			.size = 0x1000000,
+			.buswidth = 4
+		}
+	}, {
+		.physmap_partitions = ram_physmap_partitions,
+		.num_physmap_partitions = sizeof(ram_physmap_partitions) /
+					  sizeof(struct mtd_partition),
+		.probe_type = "map_ram",
+		.physmap_map = {
+			.name = "phys_mapped_ram",
+			.phys = 0x14000000,
+			.size = 0x100000,
+			.buswidth = 0 	/* don't care */
+		}
+	}
+};
+#endif
 
 void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
 {
-	physmap_partitions=parts;
-	num_physmap_partitions=num_parts;
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	struct partition_types *dev = &supported_devices;
+	dev->physmap_partitions = parts;
+	dev->num_physmap_partitions = num_parts;
+#endif
 }
-#endif /* CONFIG_MTD_PARTITIONS */
 
-int __init init_physmap(void)
+struct mtd_info *get_mtd(struct partition_types *dev)
 {
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
 	const char **type;
 
-       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
-	physmap_map.virt = (unsigned long)ioremap(physmap_map.phys, physmap_map.size);
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	type = rom_probed_types;
+	for (dev->mymtd = NULL; !dev->mymtd && *type; type++) {
+		dev->mymtd = do_map_probe(*type, &dev->physmap_map);
+	}
+#else
+	dev->mymtd = do_map_probe(dev->probe_type, &dev->physmap_map);
+#endif
+	return dev->mymtd;
+}
 
-	if (!physmap_map.virt) {
+static int probe_memory(struct partition_types *dev)
+{
+	unsigned long map_size = dev->physmap_map.size;
+	unsigned long map_phys = dev->physmap_map.phys;
+	
+       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", map_size, map_phys);
+	dev->physmap_map.virt = (unsigned long) ioremap(map_phys, map_size);
+	
+	if (!dev->physmap_map.virt) {
 		printk("Failed to ioremap\n");
 		return -EIO;
 	}
 
-	simple_map_init(&physmap_map);
+	simple_map_init(&dev->physmap_map);
+	
+	dev->mymtd = get_mtd(dev);
+	if (! dev->mymtd) {
+		iounmap((void *)dev->physmap_map.virt);
+		return -ENXIO;
+	}
 
-	mymtd = 0;
-	type = rom_probe_types;
-	for(; !mymtd && *type; type++) {
-		mymtd = do_map_probe(*type, &physmap_map);
-	}
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
-
-#ifdef CONFIG_MTD_PARTITIONS
-		mtd_parts_nb = parse_mtd_partitions(mymtd, part_probes, 
-						    &mtd_parts, 0);
-
-		if (mtd_parts_nb > 0)
-		{
-			add_mtd_partitions (mymtd, mtd_parts, mtd_parts_nb);
-			return 0;
-		}
+	dev->mymtd->owner = THIS_MODULE;
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	dev->mtd_parts_nb = parse_mtd_partitions(dev->mymtd, part_probes, &dev->mtd_parts, 0);
+	if (dev->mtd_parts_nb > 0) {
+		add_mtd_partitions(dev->mymtd, dev->mtd_parts, dev->mtd_parts_nb);
+		return 0;
+	}
 
-		if (num_physmap_partitions != 0) 
-		{
-			printk(KERN_NOTICE 
-			       "Using physmap partition definition\n");
-			add_mtd_partitions (mymtd, physmap_partitions, num_physmap_partitions);
-			return 0;
-		}
+	if (dev->num_physmap_partitions != 0) {
+		printk(KERN_NOTICE "Using physmap partition definition\n");
+		add_mtd_partitions(dev->mymtd, physmap_partitions, dev->num_physmap_partitions);
+		return 0;
+	}
+#else
+	if (dev->num_physmap_partitions != 0) {
+		printk(KERN_NOTICE "Using physmap partition definition\n");
+		add_mtd_partitions(dev->mymtd, dev->physmap_partitions,
+ 				   dev->num_physmap_partitions);
+	}
+#endif
+	add_mtd_device(dev->mymtd);
+	return 0;
+}
 
+int __init init_physmap(void)
+{
+	int ret = 0;
+	int i, searches;
+	struct partition_types *dev;
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	return probe_memory(&supported_devices);
 #endif
-		add_mtd_device(mymtd);
+	searches = (sizeof(supported_devices)/sizeof(struct partition_types));
+	printk(KERN_INFO "Looking for %d devices\n", searches);
 
-		return 0;
+	for (i=0; i < searches; i++) {
+		dev= &supported_devices[i];
+		printk(KERN_INFO "probing for memory type %s\n", dev->probe_type);
+		ret = probe_memory(dev);
+		if (ret < 0) {
+			printk(KERN_WARNING "Aieeee! Could not probe memory type %s\n", dev->probe_type);
+			break;
+		}
 	}
-
-	iounmap((void *)physmap_map.virt);
-	return -ENXIO;
+	return ret;
 }
 
-static void __exit cleanup_physmap(void)
+static void do_cleanup(struct partition_types *dev)
 {
-#ifdef CONFIG_MTD_PARTITIONS
-	if (mtd_parts_nb) {
-		del_mtd_partitions(mymtd);
-		kfree(mtd_parts);
-	} else if (num_physmap_partitions) {
-		del_mtd_partitions(mymtd);
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	if (dev->mtd_parts_nb) {
+		del_mtd_partitions(dev->mymtd);
+		kfree(dev->mtd_parts);
+	} else if (dev->num_physmap_partitions) {
+		del_mtd_partitions(dev->mymtd);
 	} else {
-		del_mtd_device(mymtd);
+		del_mtd_device(dev->mymtd);
 	}
 #else
-	del_mtd_device(mymtd);
+	del_mtd_device(dev->mymtd);
 #endif
-	map_destroy(mymtd);
+	map_destroy(dev->mymtd);
+
+	iounmap((void *)dev->physmap_map.virt);
+	dev->physmap_map.virt = 0;
+}
+
+static void __exit cleanup_physmap(void)
+{
+	int i, searches;
 
-	iounmap((void *)physmap_map.virt);
-	physmap_map.virt = 0;
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	do_cleanup(&supported_devices);
+#else
+	searches = (sizeof(supported_devices)/sizeof(struct partition_types));
+	for (i = 0; i < searches; ++i) {
+		printk(KERN_INFO "cleaning up device %s\n", supported_devices[i].probe_type);
+		do_cleanup(&supported_devices[i]);
+	}
+#endif
 }
 
 module_init(init_physmap);

--Boundary-00=_j3f7ADlSI/pgRTS--
