Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmDxH-0000G6-KJ
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 21:14:46 +0000
From: David Brownell <david-b@pacbell.net>
To: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: udev problem (and fix) for /dev/mtdblock*
Date: Tue, 24 Mar 2009 14:14:35 -0700
References: <200903181244.23025.david-b@pacbell.net>
	<200903231149.15241.david-b@pacbell.net>
	<ac3eb2510903231317u52c9246cpeab84bf95105bd58@mail.gmail.com>
In-Reply-To: <ac3eb2510903231317u52c9246cpeab84bf95105bd58@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200903241414.35404.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>, linux-hotplug@vger.kernel.org,
	md@linux.it
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 23 March 2009, Kay Sievers wrote:
> >> I keep an untested and unfinished patch around, I did the last time
> >> someone tried to solve the problem of reordered mtd devices with udev
> >> rules:
> >>   http://git.kernel.org/?p=linux/kernel/git/kay/patches.git;a=blob;f=mtd-parent-dev.patch;hb=HEAD
> >
> > Looks plausible ... and I may have actually seen a system where
> > that "problem" matters.  (Normally all flash drivers are linked
> > statically, and the system root uses one of them.)
> >
> > That obviously needs to be split into "core" (mtd block and char
> > dev support) and driver bits; the core bits could go in at any
> > time once they're ready.
> >
> > FWIW I did a quick test of this on a physmap flash ... didn't
> > work, /sys/devices/virtual/mtd still held everything that was
> > not in /sys/devices/virtual/block/mtdblock*.  I think the issue
> > might be lack of mtdpart support.
> 
> Would be great, if you possibly could find out how to get something
> like this working, so the mtd devices which are backed by real
> hardware would no longer show up as virtual, and people have at least
> a chance to identify them by the properties of the platform devices.

See the appended.  I've not split out "core" bits yet, or
provided all attributes I expect would eventually appear.

=========== CUT HERE
This patch updates driver model support in the MTD framework:

 - Each mtd_info now has a device node; MTD drivers should set
   its parent field to point to the physical device, before
   setting up partitions.

 - Those device nodes always map to /sys/class/mtdX device nodes,
   which no longer depend on MTD_CHARDEV.

 - Those mtdX sysfs nodes have a "starter set" of attributes;
   it's not yet sufficient to replace /proc/mtd

 - Enabling MTD_CHARDEV provides /sys/class/mtdXro/ nodes and the
   /sys/class/mtd*/dev attributes (for udev, mdev, etc).

So the sysfs structure is pretty much what you'd expect, except
that readonly chardev nodes are a bit quirky.

Based on a partial patch from Kay Sievers.

Sanity tested with NOR (physmap, omap_nor, m25p80), DataFlash,
NAND (davinci, omap), OneNand (omap); with and without mtdblock.
When the MTD driver has been converted, /sys/devices/virtual/mtd/*
nodes are gone.

NOT YET SIGNED-OFF ... needs splitting into core vs drivers,
and probably a few more attributes.

---
 drivers/mtd/devices/m25p80.c        |    2 
 drivers/mtd/devices/mtd_dataflash.c |    2 
 drivers/mtd/maps/omap_nor.c         |    2 
 drivers/mtd/maps/physmap.c          |   15 ++--
 drivers/mtd/maps/plat-ram.c         |    1 
 drivers/mtd/mtd_blkdevs.c           |    1 
 drivers/mtd/mtdchar.c               |   46 +------------
 drivers/mtd/mtdcore.c               |  115 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c               |    9 ++
 drivers/mtd/nand/davinci_nand.c     |    2 
 drivers/mtd/nand/mxc_nand.c         |    1 
 drivers/mtd/onenand/omap2.c         |    2 
 include/linux/mtd/mtd.h             |    7 ++
 13 files changed, 156 insertions(+), 49 deletions(-)

--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -678,6 +678,8 @@ static int __devinit m25p_probe(struct s
 		flash->mtd.erasesize = info->sector_size;
 	}
 
+	flash->mtd.dev.parent = &spi->dev;
+
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)flash->mtd.size >> 10);
 
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -670,6 +670,8 @@ add_dataflash_otp(struct spi_device *spi
 	device->write = dataflash_write;
 	device->priv = priv;
 
+	device->dev.parent = &spi->dev;
+
 	if (revision >= 'c')
 		otp_tag = otp_setup(device, revision);
 
--- a/drivers/mtd/maps/omap_nor.c
+++ b/drivers/mtd/maps/omap_nor.c
@@ -115,6 +115,8 @@ static int __init omapflash_probe(struct
 	}
 	info->mtd->owner = THIS_MODULE;
 
+	info->mtd->dev.parent = &pdev->dev;
+
 #ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -147,6 +147,7 @@ static int physmap_flash_probe(struct pl
 			devices_found++;
 		}
 		info->mtd[i]->owner = THIS_MODULE;
+		info->mtd[i]->dev.parent = &dev->dev;
 	}
 
 	if (devices_found == 1) {
@@ -171,16 +172,16 @@ static int physmap_flash_probe(struct pl
 #ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
 				&info->parts, 0);
-	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
+	if (err > 0)
 		info->nr_parts = err;
-		return 0;
+	else {
+		dev_notice(&dev->dev, "Using static partition information\n");
+		info->nr_parts = physmap_data->nr_parts;
+		info->parts = physmap_data->parts;
 	}
 
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
+	if (info->nr_parts > 0) {
+		add_mtd_partitions(info->cmtd, info->parts, info->nr_parts);
 		return 0;
 	}
 #endif
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -224,6 +224,7 @@ static int platram_probe(struct platform
 	}
 
 	info->mtd->owner = THIS_MODULE;
+	info->mtd->dev.parent = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
 
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -286,6 +286,7 @@ int add_mtd_blktrans_dev(struct mtd_blkt
 	gd->private_data = new;
 	new->blkcore_priv = gd;
 	gd->queue = tr->blkcore_priv->rq;
+	gd->driverfs_dev = new->mtd->dev.parent;
 
 	if (new->readonly)
 		set_disk_ro(gd, 1);
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -19,33 +19,6 @@
 
 #include <asm/uaccess.h>
 
-static struct class *mtd_class;
-
-static void mtd_notify_add(struct mtd_info* mtd)
-{
-	if (!mtd)
-		return;
-
-	device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
-		      NULL, "mtd%d", mtd->index);
-
-	device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
-		      NULL, "mtd%dro", mtd->index);
-}
-
-static void mtd_notify_remove(struct mtd_info* mtd)
-{
-	if (!mtd)
-		return;
-
-	device_destroy(mtd_class, MKDEV(MTD_CHAR_MAJOR, mtd->index*2));
-	device_destroy(mtd_class, MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1));
-}
-
-static struct mtd_notifier notifier = {
-	.add	= mtd_notify_add,
-	.remove	= mtd_notify_remove,
-};
 
 /*
  * Data structure to hold the pointer to the mtd device as well
@@ -793,28 +766,19 @@ static const struct file_operations mtd_
 
 static int __init init_mtdchar(void)
 {
-	if (register_chrdev(MTD_CHAR_MAJOR, "mtd", &mtd_fops)) {
+	int status;
+
+	status = register_chrdev(MTD_CHAR_MAJOR, "mtd", &mtd_fops);
+	if (status < 0) {
 		printk(KERN_NOTICE "Can't allocate major number %d for Memory Technology Devices.\n",
 		       MTD_CHAR_MAJOR);
-		return -EAGAIN;
 	}
 
-	mtd_class = class_create(THIS_MODULE, "mtd");
-
-	if (IS_ERR(mtd_class)) {
-		printk(KERN_ERR "Error creating mtd class.\n");
-		unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
-		return PTR_ERR(mtd_class);
-	}
-
-	register_mtd_user(&notifier);
-	return 0;
+	return status;
 }
 
 static void __exit cleanup_mtdchar(void)
 {
-	unregister_mtd_user(&notifier);
-	class_destroy(mtd_class);
 	unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
 }
 
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -22,6 +22,9 @@
 
 #include "mtdcore.h"
 
+
+static struct class *mtd_class;
+
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
 DEFINE_MUTEX(mtd_table_mutex);
@@ -32,6 +35,82 @@ EXPORT_SYMBOL_GPL(mtd_table);
 
 static LIST_HEAD(mtd_notifiers);
 
+
+#if defined(CONFIG_MTD_CHAR) || defined(CONFIG_MTD_CHAR_MODULE)
+#define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
+#else
+#define MTD_DEVT(index) 0
+#endif
+
+/* REVISIT once MTD uses the driver model better, whoever allocates
+ * the mtd_info will probably want to use the release() hook...
+ */
+static void mtd_release(struct device *dev)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	/* remove /dev/mtdXro node if needed */
+	if (MTD_DEVT(mtd->index))
+		device_destroy(mtd_class, MTD_DEVT(mtd->index) + 1);
+}
+
+static ssize_t mtd_type_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+	char *type;
+
+	switch (mtd->type) {
+	case MTD_ABSENT:
+		type = "absent";
+		break;
+	case MTD_RAM:
+		type = "ram";
+		break;
+	case MTD_ROM:
+		type = "rom";
+		break;
+	case MTD_NORFLASH:
+		type = "nor";
+		break;
+	case MTD_NANDFLASH:
+		type = "nand";
+		break;
+	case MTD_DATAFLASH:
+		type = "dataflash";
+		break;
+	case MTD_UBIVOLUME:
+		type = "ubi";
+		break;
+	default:
+		type = "unknown";
+	}
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", type);
+}
+static DEVICE_ATTR(mtd_type, S_IRUGO, mtd_type_show, NULL);
+
+static struct attribute *mtd_attrs[] = {
+	&dev_attr_mtd_type.attr,
+	/* FIXME provide a /proc/mtd superset */
+	NULL,
+};
+
+struct attribute_group mtd_group = {
+	.attrs		= mtd_attrs,
+};
+
+struct attribute_group *mtd_groups[] = {
+	&mtd_group,
+	NULL,
+};
+
+static struct device_type mtd_devtype = {
+	.name		= "mtd",
+	.groups		= mtd_groups,
+	.release	= mtd_release,
+};
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -40,6 +119,7 @@ static LIST_HEAD(mtd_notifiers);
  *	notify each currently active MTD 'user' of its arrival. Returns
  *	zero on success or 1 on failure, which currently will only happen
  *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
+ *	or there's a sysfs error.
  */
 
 int add_mtd_device(struct mtd_info *mtd)
@@ -80,6 +160,23 @@ int add_mtd_device(struct mtd_info *mtd)
 					       mtd->name);
 			}
 
+			/* Caller should have set dev.parent to match the
+			 * physical device.
+			 */
+			mtd->dev.type = &mtd_devtype;
+			mtd->dev.class = mtd_class;
+			mtd->dev.devt = MTD_DEVT(i);
+			dev_set_name(&mtd->dev, "mtd%d", i);
+			if (device_register(&mtd->dev) != 0) {
+				mtd_table[i] = NULL;
+				break;
+			}
+
+			if (MTD_DEVT(i))
+				device_create(mtd_class, mtd->dev.parent,
+						MTD_DEVT(i) + 1,
+						NULL, "mtd%dro", i);
+
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
@@ -343,6 +440,24 @@ EXPORT_SYMBOL_GPL(register_mtd_user);
 EXPORT_SYMBOL_GPL(unregister_mtd_user);
 EXPORT_SYMBOL_GPL(default_mtd_writev);
 
+static int __init mtd_setup(void)
+{
+	mtd_class = class_create(THIS_MODULE, "mtd");
+
+	if (IS_ERR(mtd_class)) {
+		pr_err("Error creating mtd class.\n");
+		return PTR_ERR(mtd_class);
+	}
+	return 0;
+}
+core_initcall(mtd_setup);
+
+static void __exit mtd_teardown(void)
+{
+	class_destroy(mtd_class);
+}
+__exitcall(mtd_teardown);
+
 #ifdef CONFIG_PROC_FS
 
 /*====================================================================*/
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -343,6 +343,11 @@ static struct mtd_part *add_one_partitio
 	slave->mtd.name = part->name;
 	slave->mtd.owner = master->owner;
 
+	/* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
+	 * to have the same data be in two different partitions.
+	 */
+	slave->mtd.dev.parent = master->dev.parent;
+
 	slave->mtd.read = part_read;
 	slave->mtd.write = part_write;
 
@@ -493,7 +498,9 @@ out_register:
  * This function, given a master MTD object and a partition table, creates
  * and registers slave MTD objects which are bound to the master according to
  * the partition definitions.
- * (Q: should we register the master MTD object as well?)
+ *
+ * We don't register the master, or expect the caller to have done so,
+ * for reasons of data integrity.
  */
 
 int add_mtd_partitions(struct mtd_info *master,
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -615,6 +615,8 @@ static int __init nand_davinci_probe(str
 	info->mtd.name		= dev_name(&pdev->dev);
 	info->mtd.owner		= THIS_MODULE;
 
+	info->mtd.dev.parent	= &pdev->dev;
+
 	info->chip.IO_ADDR_R	= vaddr;
 	info->chip.IO_ADDR_W	= vaddr;
 	info->chip.chip_delay	= 0;
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct pla
 	mtd = &host->mtd;
 	mtd->priv = this;
 	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	/* 50 us command delay time */
 	this->chip_delay = 5;
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -672,6 +672,8 @@ static int __devinit omap2_onenand_probe
 	c->mtd.priv = &c->onenand;
 	c->mtd.owner = THIS_MODULE;
 
+	c->mtd.dev.parent = &pdev->dev;
+
 	if (c->dma_channel >= 0) {
 		struct onenand_chip *this = &c->onenand;
 
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uio.h>
 #include <linux/notifier.h>
+#include <linux/device.h>
 
 #include <linux/mtd/compatmac.h>
 #include <mtd/mtd-abi.h>
@@ -223,6 +224,7 @@ struct mtd_info {
 	void *priv;
 
 	struct module *owner;
+	struct device dev;
 	int usecount;
 
 	/* If the driver is something smart, like UBI, it may need to maintain
@@ -233,6 +235,11 @@ struct mtd_info {
 	void (*put_device) (struct mtd_info *mtd);
 };
 
+static inline struct mtd_info *dev_to_mtd(struct device *dev)
+{
+	return dev ? container_of(dev, struct mtd_info, dev) : NULL;
+}
+
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
 {
 	if (mtd->erasesize_shift)
