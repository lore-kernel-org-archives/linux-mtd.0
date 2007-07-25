Received: from oogie-boogie.ics.uci.edu ([128.195.1.41])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDlOA-0001Tk-Pp
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 14:15:13 -0400
Message-ID: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
Date: Wed, 25 Jul 2007 11:08:46 -0700 (PDT)
Subject: [PATCH][MTD] CORE: sysfs support for mtd
From: sid@ics.uci.edu
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch adds sysfs support for mtd. It exports some of the members of the mtd_info structure
into the user space via sysfs. The idea is to use sysfs as an alternative to using mtd ioctl(). 
The following information from mtd_info struct [mtd.h] is exported as files:

- size              : Partition size
- erasesize         : Size of erase block
- writesize         : Page size
- type              : On of the following -> Absent, RAM, ROM, NOR Flash, NAND Flash, Data flash
- bbt               : List of bad blocks from device specific block_isbad() function
- numeraseregions   : Number of erase regions

The master mtd partition appears as a directory under sysfs as /sys/devices/mtd. For each mtd
partition (i.e., for each slave mtd found in mtdpart.c), a file under /sys/devices/mtd directory
by name mtdN (N = partition number) is generated. A struct kobject kobj is added as member of
struct mtd_info mtd [mtd.h] to enable mtd_info to become part of the kobjects hierarchy. The
attributes to be exported are added as struct mtd_attr [mtdpart.c]. A soft link from
/sys/bus/platform/devices/mtd points to /sys/deevices/mtd. Additional attributes can be added by
adding an entry to the mtd_default_attrs[] structure [mtdpart.c]

It would be nice if the patch could be tested. I have tested it on a MIPS based board with NAND
flash. (Please bear with me if the patch does not appear correctly. This is my first patch to the
list and I have tested by sending the patch to myself as per the FAQs).

Signed-off-by: Siddharth Choudhuri <sid@ics.uci.edu>
________________________________________
diff -urN linux-2.6.18.orig/drivers/mtd/mtdpart.c linux-2.6.18.sysfs/drivers/mtd/mtdpart.c
--- linux-2.6.18.orig/drivers/mtd/mtdpart.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18.sysfs/drivers/mtd/mtdpart.c	2007-07-24 14:39:24.000000000 -0700
@@ -9,6 +9,9 @@
  *
  * 	02-21-2002	Thomas Gleixner <gleixner@autronix.de>
  *			added support for read_oob, write_oob
+ *
+ *	07-24-2007	Siddharth Choudhuri <sid@ics.uci.edu>
+ *			added support for sysfs
  */

 #include <linux/module.h>
@@ -20,6 +23,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
+#include <linux/kobject.h>
+#include <linux/device.h>

 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
@@ -40,6 +45,180 @@
  */
 #define PART(x)  ((struct mtd_part *)(x))

+/* kobject related data structures */
+extern struct subsystem devices_subsys;
+extern struct bus_type platform_bus_type;
+
+/* sysfs bindings for mtd */
+struct mtd_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct mtd_info *, char *);
+	ssize_t (*store)(struct mtd_info *, const char *, size_t);
+};
+
+/* Call the appropriate show function depending on attribute */
+static ssize_t
+mtd_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
+{
+	struct mtd_info *m = container_of(kobj, struct mtd_info, kobj);
+	struct mtd_attr *mtd_attribute = container_of(attr, struct mtd_attr, attr);
+	ssize_t ret = 0;
+	if (mtd_attribute->show)
+		ret = mtd_attribute->show(m, page);
+	return ret;
+}
+
+/* There are no write attributes under sysfs for mtd */
+static ssize_t
+mtd_attr_store(struct kobject *kobj, struct attribute *attr,
+		const char *page, size_t count)
+{
+	ssize_t ret = 0;
+	return ret;
+}
+
+static struct sysfs_ops mtd_sysfs_ops = {
+	.show	= mtd_attr_show,
+	.store	= mtd_attr_store,
+};
+
+static ssize_t mtd_sysfs_rd_type(struct mtd_info *mtd, char *page)
+{
+	switch(mtd->type) {
+		case MTD_ABSENT:    return sprintf(page, "Absent\n");
+		case MTD_RAM:       return sprintf(page, "RAM\n");
+		case MTD_ROM:       return sprintf(page, "ROM\n");
+		case MTD_NORFLASH:  return sprintf(page, "NOR flash\n");
+		case MTD_NANDFLASH: return sprintf(page, "NAND flash\n");
+		case MTD_DATAFLASH: return sprintf(page, "Data flash\n");
+		default:
+			return sprintf(page, "Unknown %d\n", (u_char)mtd->type);
+	}
+}
+
+static ssize_t mtd_sysfs_rd_size(struct mtd_info *mtd, char *page)
+{
+	return sprintf(page, "%d\n", (u_int32_t)mtd->size);
+}
+
+static ssize_t mtd_sysfs_rd_erasesize(struct mtd_info *mtd, char *page)
+{
+	return sprintf(page, "%d\n", (u_int32_t)mtd->erasesize);
+}
+
+static ssize_t mtd_sysfs_rd_ecctype(struct mtd_info *mtd, char *page)
+{
+	switch(mtd->ecctype) {
+		case MTD_ECC_NONE:          return sprintf(page, "None\n");
+		case MTD_ECC_RS_DiskOnChip: return sprintf(page, "ECC DiskOnChip\n");
+		case MTD_ECC_SW:            return sprintf(page, "Software\n");
+		default:
+			return sprintf(page, "Unknown %d\n", (u_int32_t)mtd->ecctype);
+	}
+}
+
+static ssize_t mtd_sysfs_rd_eccsize(struct mtd_info *mtd, char *page)
+{
+	return sprintf(page, "%d\n", (u_int32_t)mtd->eccsize);
+}
+
+static ssize_t mtd_sysfs_rd_writesize(struct mtd_info *mtd, char *page)
+{
+	return sprintf(page, "%d\n", (u_int32_t)mtd->writesize);
+}
+
+static ssize_t mtd_sysfs_rd_numeraseregions(struct mtd_info *mtd, char *page)
+{
+	return sprintf(page, "%d\n", mtd->numeraseregions);
+}
+
+/*
+ * Display the list of bad blocks from bad block table, list limited
+ * to whatever fits in one page
+ */
+static ssize_t mtd_sysfs_rd_bbt(struct mtd_info *mtd, char *page)
+{
+	int res = 0, ret = 0, lim;
+	loff_t offset = 0;
+	uint32_t i = 0, numblks;
+
+	lim = PAGE_SIZE/12; /* "0x%08x  " is 12 chars */
+	numblks = mtd->size/mtd->erasesize;
+	if (numblks < lim)
+		lim = numblks;
+	for (i = 0; i < lim; i++) {
+		offset = i*mtd->erasesize;
+		res = mtd->block_isbad(mtd, offset);
+		if (res)
+			ret += sprintf(page+ret,"0x%08x  ", i);
+	}
+	ret += sprintf(page+ret,"\n");
+	return ret;
+}
+
+static struct mtd_attr mtd_attr_type = {
+	.attr = {.name = "type", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_type
+};
+
+static struct mtd_attr mtd_attr_size = {
+	.attr = {.name = "size", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_size
+};
+
+static struct mtd_attr mtd_attr_erasesize = {
+	.attr = {.name = "erasesize", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_erasesize
+};
+
+static struct mtd_attr mtd_attr_ecctype = {
+	.attr = {.name = "ecctype", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_ecctype
+};
+
+static struct mtd_attr mtd_attr_eccsize = {
+	.attr = {.name = "eccsize", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_eccsize
+};
+
+static struct mtd_attr mtd_attr_writesize = {
+	.attr = {.name = "writesize", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_writesize
+};
+
+static struct mtd_attr mtd_attr_numeraseregions = {
+	.attr = {.name = "numeraseregions", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_numeraseregions
+};
+
+static struct mtd_attr mtd_attr_bbt = {
+	.attr = {.name = "bbt", .mode = S_IRUGO },
+	.show = mtd_sysfs_rd_bbt
+};
+
+static struct attribute *mtd_default_attrs[] = {
+	&mtd_attr_type.attr,
+	&mtd_attr_erasesize.attr,
+	&mtd_attr_size.attr,
+	&mtd_attr_ecctype.attr,
+	&mtd_attr_eccsize.attr,
+	&mtd_attr_writesize.attr,
+	&mtd_attr_numeraseregions.attr,
+	&mtd_attr_bbt.attr,
+	NULL
+};
+
+/* Free done inside del_mtd_device() so do nothing */
+static void mtd_release(struct kobject *kobj)
+{
+	return;
+}
+
+static struct kobj_type ktype_mtd = {
+	.release	= mtd_release,
+	.sysfs_ops 	= &mtd_sysfs_ops,
+	.default_attrs	= mtd_default_attrs,
+};

 /*
  * MTD methods which simply translate the effective address and pass through
@@ -293,8 +472,10 @@
 		if (slave->master == master) {
 			struct list_head *prev = node->prev;
 			__list_del(prev, node->next);
-			if(slave->registered)
+			if(slave->registered) {
 				del_mtd_device(&slave->mtd);
+				kobject_del(&slave->mtd.kobj);
+			}
 			kfree(slave);
 			node = prev;
 		}
@@ -320,6 +501,16 @@

 	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);

+	memset(&master->kobj, 0, sizeof(master->kobj));
+	kobj_set_kset_s(master, devices_subsys);
+	master->kobj.parent = &devices_subsys.kset.kobj;
+	master->kobj.ktype = &ktype_mtd;
+	if (kobject_set_name(&master->kobj, "mtd") < 0) {
+		return -ENOMEM;
+	}
+	kobject_init(&master->kobj);
+	kobject_add(&master->kobj);
+
 	for (i = 0; i < nbparts; i++) {

 		/* allocate the partition structure */
@@ -480,6 +671,17 @@
 			add_mtd_device(&slave->mtd);
 			slave->registered = 1;
 		}
+		memset(&slave->mtd.kobj, 0, sizeof(slave->mtd.kobj));
+		slave->mtd.kobj.kset = master->kobj.kset;
+		slave->mtd.kobj.parent = &master->kobj;
+		slave->mtd.kobj.ktype = &ktype_mtd;
+		slave->mtd.kobj.kset->ktype = &ktype_mtd;
+		if (kobject_set_name(&slave->mtd.kobj, "mtd%d", i) < 0) {
+			return -ENOMEM;
+		}
+		kobject_init(&slave->mtd.kobj);
+		kobject_add(&slave->mtd.kobj);
+		sysfs_create_link(&platform_bus_type.devices.kobj, &master->kobj, "mtd");
 	}

 	return 0;
diff -urN linux-2.6.18.orig/include/linux/mtd/mtd.h linux-2.6.18.sysfs/include/linux/mtd/mtd.h
--- linux-2.6.18.orig/include/linux/mtd/mtd.h	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18.sysfs/include/linux/mtd/mtd.h	2007-07-23 12:11:29.000000000 -0700
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/uio.h>
 #include <linux/notifier.h>
+#include <linux/kobject.h>

 #include <linux/mtd/compatmac.h>
 #include <mtd/mtd-abi.h>
@@ -122,6 +123,8 @@
 	u_int32_t ecctype;
 	u_int32_t eccsize;

+	struct kobject kobj;	// use kobject to export info to sysfs
+
 	/*
 	 * Reuse some of the above unused fields in the case of NOR flash
 	 * with configurable programming regions to avoid modifying the
______________________________________

regards,
-siddharth
