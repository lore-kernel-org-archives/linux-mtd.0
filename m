Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTFPW-00070L-Ja
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 06:48:28 -0400
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2JAmCr0023217
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:48:12 +0200
Message-ID: <45FE6A13.9080304@nokia.com>
Date: Mon, 19 Mar 2007 12:46:43 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [MTD] NAND: Add partition capability to nandsim
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enhance nandsim to be able to create more than 1 partition.
A new module parameter 'parts' may be used to specify partition
sizes.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   97 +++++++++++++++++++++++++++++++++-----------
 1 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c3bca95..638e6c2 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -37,6 +37,7 @@ #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
+#include <linux/list.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -90,6 +91,8 @@ static uint bus_width      = CONFIG_NAND
 static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
 static uint log            = CONFIG_NANDSIM_LOG;
 static uint dbg            = CONFIG_NANDSIM_DBG;
+static unsigned long parts[MAX_MTD_DEVICES];
+static unsigned int parts_num;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -104,6 +107,7 @@ module_param(bus_width,      uint, 0400)
 module_param(do_delays,      uint, 0400);
 module_param(log,            uint, 0400);
 module_param(dbg,            uint, 0400);
+module_param_array(parts, ulong, &parts_num, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
@@ -118,6 +122,7 @@ MODULE_PARM_DESC(bus_width,      "Chip's
 MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
 MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
+MODULE_PARM_DESC(parts,          "Partition sizes (in erase blocks) separated by commas");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -131,9 +136,9 @@ #define NS_LOG(args...) \
 #define NS_DBG(args...) \
 	do { if (dbg) printk(KERN_DEBUG NS_OUTPUT_PREFIX " debug: " args); } while(0)
 #define NS_WARN(args...) \
-	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warnig: " args); } while(0)
+	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: " args); } while(0)
 #define NS_ERR(args...) \
-	do { printk(KERN_ERR NS_OUTPUT_PREFIX " errorr: " args); } while(0)
+	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: " args); } while(0)
 
 /* Busy-wait delay macros (microseconds, milliseconds) */
 #define NS_UDELAY(us) \
@@ -238,7 +243,8 @@ union ns_mem {
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
-	struct mtd_partition part;
+	struct mtd_partition partitions[MAX_MTD_DEVICES];
+	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
 	u_char ids[4];          /* chip's ID bytes */
@@ -381,6 +387,13 @@ static void free_device(struct nandsim *
 	}
 }
 
+static char *get_partition_name(int i)
+{
+	char buf[64];
+	sprintf(buf, "NAND simulator partition %d", i);
+	return kstrdup(buf, GFP_KERNEL);
+}
+
 /*
  * Initialize the nandsim structure.
  *
@@ -390,7 +403,9 @@ static int init_nandsim(struct mtd_info 
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 	struct nandsim   *ns   = (struct nandsim *)(chip->priv);
-	int i;
+	int i, ret = 0;
+	u_int32_t remains;
+	u_int32_t next_offset;
 
 	if (NS_IS_INITIALIZED(ns)) {
 		NS_ERR("init_nandsim: nandsim is already initialized\n");
@@ -448,6 +463,40 @@ static int init_nandsim(struct mtd_info 
 		}
 	}
 
+	/* Fill the partition_info structure */
+	if (parts_num > ARRAY_SIZE(ns->partitions)) {
+		NS_ERR("too many partitions.\n");
+		ret = -EINVAL;
+		goto error;
+	}
+	remains = ns->geom.totsz;
+	next_offset = 0;
+	for (i = 0; i < parts_num; ++i) {
+		unsigned long part = parts[i];
+		if (!part || part > remains / ns->geom.secsz) {
+			NS_ERR("bad partition size.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].offset = next_offset;
+		ns->partitions[i].size   = part * ns->geom.secsz;
+		next_offset += ns->partitions[i].size;
+		remains -= ns->partitions[i].size;
+	}
+	ns->nbparts = parts_num;
+	if (remains) {
+		if (parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
+			NS_ERR("too many partitions.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].offset = next_offset;
+		ns->partitions[i].size   = remains;
+		ns->nbparts += 1;
+	}
+
 	/* Detect how many ID bytes the NAND chip outputs */
         for (i = 0; nand_flash_ids[i].name != NULL; i++) {
                 if (second_id_byte != nand_flash_ids[i].id)
@@ -474,7 +523,7 @@ static int init_nandsim(struct mtd_info 
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if (alloc_device(ns) != 0)
+	if ((ret = alloc_device(ns)) != 0)
 		goto error;
 
 	/* Allocate / initialize the internal buffer */
@@ -482,21 +531,17 @@ static int init_nandsim(struct mtd_info 
 	if (!ns->buf.byte) {
 		NS_ERR("init_nandsim: unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
+		ret = -ENOMEM;
 		goto error;
 	}
 	memset(ns->buf.byte, 0xFF, ns->geom.pgszoob);
 
-	/* Fill the partition_info structure */
-	ns->part.name   = "NAND simulator partition";
-	ns->part.offset = 0;
-	ns->part.size   = ns->geom.totsz;
-
 	return 0;
 
 error:
 	free_device(ns);
 
-	return -ENOMEM;
+	return ret;
 }
 
 /*
@@ -1503,7 +1548,7 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
-	int retval = -ENOMEM;
+	int retval = -ENOMEM, i;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -1564,21 +1609,23 @@ static int __init ns_init_module(void)
 		goto error;
 	}
 
-	if ((retval = init_nandsim(nsmtd)) != 0) {
-		NS_ERR("scan_bbt: can't initialize the nandsim structure\n");
-		goto error;
-	}
+	if ((retval = init_nandsim(nsmtd)) != 0)
+		goto err_exit;
 
-	if ((retval = nand_default_bbt(nsmtd)) != 0) {
-		free_nandsim(nand);
-		goto error;
-	}
+	if ((retval = nand_default_bbt(nsmtd)) != 0)
+		goto err_exit;
 
-	/* Register NAND as one big partition */
-	add_mtd_partitions(nsmtd, &nand->part, 1);
+	/* Register NAND partitions */
+	if ((retval = add_mtd_partitions(nsmtd, &nand->partitions[0], nand->nbparts)) != 0)
+		goto err_exit;
 
         return 0;
 
+err_exit:
+	free_nandsim(nand);
+	nand_release(nsmtd);
+	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
+		kfree(nand->partitions[i].name);
 error:
 	kfree(nsmtd);
 
@@ -1593,9 +1640,12 @@ module_init(ns_init_module);
 static void __exit ns_cleanup_module(void)
 {
 	struct nandsim *ns = (struct nandsim *)(((struct nand_chip *)nsmtd->priv)->priv);
+	int i;
 
 	free_nandsim(ns);    /* Free nandsim private resources */
-	nand_release(nsmtd); /* Unregisterd drived */
+	nand_release(nsmtd); /* Unregister driver */
+	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
+		kfree(ns->partitions[i].name);
 	kfree(nsmtd);        /* Free other structures */
 }
 
@@ -1604,4 +1654,3 @@ module_exit(ns_cleanup_module);
 MODULE_LICENSE ("GPL");
 MODULE_AUTHOR ("Artem B. Bityuckiy");
 MODULE_DESCRIPTION ("The NAND flash simulator");
-
-- 
1.4.3
