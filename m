Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rdSp-00082v-RF
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 14:02:23 +0100
Received: from apollo.nbase.co.il ([194.90.137.2])
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 19rdSP-0006hb-97
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2003 14:01:57 +0100
Date: Tue, 26 Aug 2003 16:01:46 +0300
To: dwmw2@redhat.com
Message-ID: <20030826130146.GC26520@nbase.co.il>
Mime-Version: 1.0
Content-Disposition: inline
From: gleb@nbase.co.il (Gleb Natapov)
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
cc: linux-mtd@lists.infradead.org
Subject: [PATCH] Support for multiple physical mappings for MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I work with Motorola MPC8245 processor. It has one memory window for
extended ROM and another for boot ROM.

Currently physmap driver supports only one memory window for MTD device. 
Attached quick patch makes it more easy task to add more then one memory window.

The patch is against linux-2.4.22 an not tested properly yet. It's easy to add the same 
functionality to 2.6.

Is this functionality is required or am I the only one who needs it?

Thank you,

--
			Gleb.

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="physmap.c.diff"

--- drivers/mtd/maps/physmap.c.org	2003-08-26 10:19:05.000000000 +0300
+++ drivers/mtd/maps/physmap.c	2003-08-26 15:26:35.000000000 +0300
@@ -20,8 +20,6 @@
 #define WINDOW_SIZE CONFIG_MTD_PHYSMAP_LEN
 #define BUSWIDTH CONFIG_MTD_PHYSMAP_BUSWIDTH
 
-static struct mtd_info *mymtd;
-
 __u8 physmap_read8(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readb(map->map_priv_1 + ofs);
@@ -65,25 +63,23 @@
 	memcpy_toio(map->map_priv_1 + to, from, len);
 }
 
-struct map_info physmap_map = {
-	name: "Physically mapped flash",
-	size: WINDOW_SIZE,
-	buswidth: BUSWIDTH,
-	read8: physmap_read8,
-	read16: physmap_read16,
-	read32: physmap_read32,
-	copy_from: physmap_copy_from,
-	write8: physmap_write8,
-	write16: physmap_write16,
-	write32: physmap_write32,
-	copy_to: physmap_copy_to
+struct physmap_info
+{
+	struct list_head list;
+	struct map_info map;
+	struct mtd_info *mtd;
+#if defined (CONFIG_MTD_PARTITIONS) && defined (CONFIG_MTD_CMDLINE_PARTS)
+	struct mtd_partition *mtd_parts;
+	int mtd_parts_nb;
+#endif
+	char name[30];
+	int index;
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static struct mtd_partition *mtd_parts = 0;
-static int                   mtd_parts_nb = 0;
-#else
+spinlock_t physmap_lock = SPIN_LOCK_UNLOCKED;
+LIST_HEAD(physmaps);
+
+#if defined (CONFIG_MTD_PARTITIONS) && !defined (CONFIG_MTD_CMDLINE_PARTS)
 static struct mtd_partition physmap_partitions[] = {
 /* Put your own partition definitions here */
 #if 0
@@ -113,67 +109,140 @@
 #define NUM_PARTITIONS	(sizeof(physmap_partitions)/sizeof(struct mtd_partition))
 
 #endif
-#endif
 
-int __init init_physmap(void)
+int init_physmap_one (unsigned int windows_addr,
+		      unsigned int windows_size,
+		      unsigned int bus_width,
+		      struct mtd_partition *partitions,
+		      unsigned int part_nr)
 {
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
 	const char **type;
+	struct physmap_info *physmap = NULL;
+	static int index = 0;
+	int err = -ENOMEM;
+
+	spin_lock (&physmap_lock);
+	
+	if ((physmap = kmalloc (sizeof (struct physmap_info), GFP_KERNEL)) == NULL)
+		goto err;
+
+	snprintf (physmap->name, 30, "Physically mapped flash %2d", index);
+	physmap->index = index;
+	
+	physmap->map.name = physmap->name;
+	physmap->map.size = windows_size;
+	physmap->map.buswidth = bus_width;
+	physmap->map.read8 = physmap_read8;
+	physmap->map.read16 = physmap_read16;
+	physmap->map.read32 = physmap_read32;
+	physmap->map.copy_from = physmap_copy_from;
+	physmap->map.write8 = physmap_write8;
+	physmap->map.write16 = physmap_write16;
+	physmap->map.write32 = physmap_write32;
+	physmap->map.copy_to = physmap_copy_to;
+
+	printk(KERN_NOTICE "physmap flash device: %x at %x\n", windows_size,
+	       windows_addr);
 
-       	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
-	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+	physmap->map.map_priv_1 =
+		(unsigned long)ioremap(windows_addr, windows_size);
 
-	if (!physmap_map.map_priv_1) {
+	if (!physmap->map.map_priv_1) {
 		printk("Failed to ioremap\n");
-		return -EIO;
+		err = -EIO;
+		goto err;
 	}
+
+	physmap->mtd = NULL;
 	
-	mymtd = 0;
 	type = rom_probe_types;
-	for(; !mymtd && *type; type++) {
-		mymtd = do_map_probe(*type, &physmap_map);
+	for(; !physmap->mtd && *type; type++) {
+		physmap->mtd = do_map_probe(*type, &physmap->map);
 	}
-	if (mymtd) {
-		mymtd->module = THIS_MODULE;
+	
+	if (physmap->mtd) {
+		physmap->mtd->module = THIS_MODULE;
 
-		add_mtd_device(mymtd);
+		add_mtd_device(physmap->mtd);
 #ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
-		mtd_parts_nb = parse_cmdline_partitions(mymtd, &mtd_parts, 
-							"phys");
-		if (mtd_parts_nb > 0)
+		physmap->mtd_parts_nb =
+			parse_cmdline_partitions(physmap->mtd,
+						 &physmap->mtd_parts, 
+						 "phys");
+		if (physmap->mtd_parts_nb > 0)
 		{
 			printk(KERN_NOTICE 
 			       "Using command line partition definition\n");
-			add_mtd_partitions (mymtd, mtd_parts, mtd_parts_nb);
+			add_mtd_partitions (physmap->mtd, physmap->mtd_parts,
+					    physmap->mtd_parts_nb);
 		}
 #else
-		if (NUM_PARTITIONS != 0) 
+		if (part_nr != 0) 
 		{
 			printk(KERN_NOTICE 
 			       "Using physmap partition definition\n");
-			add_mtd_partitions (mymtd, physmap_partitions, NUM_PARTITIONS);
+			add_mtd_partitions (physmap->mtd, partitions, part_nr);
 		}
 
 #endif
 #endif
-		return 0;
+
+		list_add (&physmap->list, &physmaps);
+
+		index++;
+		spin_unlock (&physmap_lock);
+		return physmap->index;
+	}
+	
+	err = -ENXIO;
+ err:
+	if (physmap)
+	{
+		if (physmap->map.map_priv_1)
+			iounmap((void*)physmap->map.map_priv_1);
+		kfree (physmap);
 	}
+	spin_unlock (&physmap_lock);
+	return err;
+}
+
+int __init init_physmap(void)
+{
+	init_physmap_one (WINDOW_ADDR, WINDOW_SIZE, BUSWIDTH,
+			  physmap_partitions, NUM_PARTITIONS);
+	init_physmap_one (0xffc00000, 0x400000, 1, NULL, 0);
+	
+	return 0;
+}
+
+/* if index is -1 cleanup all */
+void cleanup_physmap_one (int index)
+{
+	struct list_head *elem, *n;
 
-	iounmap((void *)physmap_map.map_priv_1);
-	return -ENXIO;
+	spin_lock (&physmap_lock);
+	list_for_each_safe (elem, n, &physmaps)
+	{
+		struct physmap_info *physmap =
+			list_entry (elem, struct physmap_info, list);
+		
+		if (index > 0 && physmap->index != index)
+			continue;
+		
+		del_mtd_device (physmap->mtd);
+		map_destroy (physmap->mtd);
+		iounmap ((void*)physmap->map.map_priv_1);
+		list_del (elem);
+		kfree (physmap);
+	}
+	spin_unlock (&physmap_lock);
 }
 
 static void __exit cleanup_physmap(void)
 {
-	if (mymtd) {
-		del_mtd_device(mymtd);
-		map_destroy(mymtd);
-	}
-	if (physmap_map.map_priv_1) {
-		iounmap((void *)physmap_map.map_priv_1);
-		physmap_map.map_priv_1 = 0;
-	}
+	cleanup_physmap_one (-1);
 }
 
 module_init(init_physmap);
@@ -183,3 +252,5 @@
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("Generic configurable MTD map driver");
+EXPORT_SYMBOL (init_physmap_one);
+EXPORT_SYMBOL (cleanup_physmap_one);

--tThc/1wpZn/ma/RB--
