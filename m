Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQlsO-0000Ns-OY
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 14:51:55 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2CEntls013820
	for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2007 16:50:04 +0200
Message-ID: <45F56851.2080500@nokia.com>
Date: Mon, 12 Mar 2007 16:48:49 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [RFC] [MTD] NAND: Add partition capability to nandsim
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
 drivers/mtd/nand/nandsim.c |  101 ++++++++++++++++++++++++++++++++++----------
 1 files changed, 78 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c3bca95..db6bbbd 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -90,6 +90,7 @@ static uint bus_width      = CONFIG_NAND
 static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
 static uint log            = CONFIG_NANDSIM_LOG;
 static uint dbg            = CONFIG_NANDSIM_DBG;
+static char *parts = NULL;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -104,6 +105,7 @@ module_param(bus_width,      uint, 0400)
 module_param(do_delays,      uint, 0400);
 module_param(log,            uint, 0400);
 module_param(dbg,            uint, 0400);
+module_param(parts,          charp, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
@@ -118,6 +120,7 @@ MODULE_PARM_DESC(bus_width,      "Chip's
 MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
 MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
+MODULE_PARM_DESC(parts,          "Partition sizes (in blocks) separated by commas");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -131,9 +134,9 @@ #define NS_LOG(args...) \
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
@@ -238,7 +241,8 @@ union ns_mem {
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
-	struct mtd_partition part;
+	struct mtd_partition parts[MAX_MTD_DEVICES];
+	int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
 	u_char ids[4];          /* chip's ID bytes */
@@ -381,6 +385,13 @@ static void free_device(struct nandsim *
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
@@ -390,7 +401,9 @@ static int init_nandsim(struct mtd_info 
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 	struct nandsim   *ns   = (struct nandsim *)(chip->priv);
-	int i;
+	int i, ret = 0;
+	u_int32_t remains;
+	u_int32_t next_offset;
 
 	if (NS_IS_INITIALIZED(ns)) {
 		NS_ERR("init_nandsim: nandsim is already initialized\n");
@@ -448,6 +461,48 @@ static int init_nandsim(struct mtd_info 
 		}
 	}
 
+	/* Fill the partition_info structure */
+	remains = ns->geom.totsz;
+	next_offset = 0;
+	i = 0;
+	if (parts) {
+		char *next_part = parts;
+		unsigned long part;
+		do {
+			part = simple_strtoul(next_part, &next_part, 0);
+			if (!part || part > remains / ns->geom.secsz) {
+				NS_ERR("bad partition size.\n");
+				ret = -EINVAL;
+				goto error;
+			}
+			if (i >= ARRAY_SIZE(ns->parts)) {
+				NS_ERR("too many partitions.\n");
+				ret = -EINVAL;
+				goto error;
+			}
+			ns->parts[i].name   = get_partition_name(i);
+			ns->parts[i].offset = next_offset;
+			ns->parts[i].size   = part * ns->geom.secsz;
+			next_offset += ns->parts[i].size;
+			remains -= ns->parts[i].size;
+			ns->nbparts += 1;
+			i += 1;
+			if (*next_part == ',')
+				next_part += 1;
+		} while (*next_part);
+	}
+	if (remains) {
+		if (i >= ARRAY_SIZE(ns->parts)) {
+			NS_ERR("too many partitions.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+		ns->parts[i].name   = get_partition_name(i);
+		ns->parts[i].offset = next_offset;
+		ns->parts[i].size   = remains;
+		ns->nbparts += 1;
+	}
+
 	/* Detect how many ID bytes the NAND chip outputs */
         for (i = 0; nand_flash_ids[i].name != NULL; i++) {
                 if (second_id_byte != nand_flash_ids[i].id)
@@ -474,7 +529,7 @@ static int init_nandsim(struct mtd_info 
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if (alloc_device(ns) != 0)
+	if ((ret = alloc_device(ns)) != 0)
 		goto error;
 
 	/* Allocate / initialize the internal buffer */
@@ -482,21 +537,17 @@ static int init_nandsim(struct mtd_info 
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
@@ -1503,7 +1554,7 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
-	int retval = -ENOMEM;
+	int retval = -ENOMEM, i;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -1564,21 +1615,23 @@ static int __init ns_init_module(void)
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
+	if ((retval = add_mtd_partitions(nsmtd, &nand->parts[0], nand->nbparts)) != 0)
+		goto err_exit;
 
         return 0;
 
+err_exit:
+	free_nandsim(nand);
+	nand_release(nsmtd);
+	for (i = 0;i < ARRAY_SIZE(nand->parts); ++i)
+		kfree(nand->parts[i].name);
 error:
 	kfree(nsmtd);
 
@@ -1593,9 +1646,12 @@ module_init(ns_init_module);
 static void __exit ns_cleanup_module(void)
 {
 	struct nandsim *ns = (struct nandsim *)(((struct nand_chip *)nsmtd->priv)->priv);
+	int i;
 
 	free_nandsim(ns);    /* Free nandsim private resources */
 	nand_release(nsmtd); /* Unregisterd drived */
+	for (i = 0;i < ARRAY_SIZE(ns->parts); ++i)
+		kfree(ns->parts[i].name);
 	kfree(nsmtd);        /* Free other structures */
 }
 
@@ -1604,4 +1660,3 @@ module_exit(ns_cleanup_module);
 MODULE_LICENSE ("GPL");
 MODULE_AUTHOR ("Artem B. Bityuckiy");
 MODULE_DESCRIPTION ("The NAND flash simulator");
-
-- 
1.4.3
