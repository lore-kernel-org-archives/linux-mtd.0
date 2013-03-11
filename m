Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UF5Z1-0001MK-Bn
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 16:27:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: =?utf-8?q?=5BPATCH=20RFC=5D=20mtd=3A=20const=20char=20*=20const=20stuff?=
Date: Mon, 11 Mar 2013 18:28:38 +0200
Message-Id: <1363019318-4852-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This is a minor patch which should help us to get rid checkpatch warning which
advises to use 'const char * const' for a constant array of constant elements.

We change the 'mtd_device_parse_register' interface to use
'const char * const *' and amend all the users.

I will probably split this patch a little bit later, so this is just an RFC so
far.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/bcma/driver_mips.c            |    2 +-
 drivers/mtd/devices/bcm47xxsflash.c   |    2 +-
 drivers/mtd/devices/docg3.c           |    2 +-
 drivers/mtd/maps/bfin-async-flash.c   |    3 ++-
 drivers/mtd/maps/dc21285.c            |    3 +--
 drivers/mtd/maps/gpio-addr-flash.c    |    3 ++-
 drivers/mtd/maps/impa7.c              |    7 ++-----
 drivers/mtd/maps/intel_vr_nor.c       |    4 ++--
 drivers/mtd/maps/ixp4xx.c             |    2 +-
 drivers/mtd/maps/lantiq-flash.c       |    3 +--
 drivers/mtd/maps/pci.c                |    3 +--
 drivers/mtd/maps/physmap.c            |   17 +++++++----------
 drivers/mtd/maps/physmap_of.c         |   16 +++++++++-------
 drivers/mtd/maps/plat-ram.c           |    2 +-
 drivers/mtd/maps/pxa2xx-flash.c       |    4 +---
 drivers/mtd/maps/rbtx4939-flash.c     |    5 +++--
 drivers/mtd/maps/sa1100-flash.c       |    2 +-
 drivers/mtd/maps/solutionengine.c     |    2 +-
 drivers/mtd/maps/tsunami_flash.c      |    5 +++--
 drivers/mtd/mtdcore.c                 |    2 +-
 drivers/mtd/mtdcore.h                 |    3 ++-
 drivers/mtd/mtdpart.c                 |    4 ++--
 drivers/mtd/nand/bcm47xxnflash/main.c |    2 +-
 drivers/mtd/nand/cafe_nand.c          |    2 +-
 drivers/mtd/nand/docg4.c              |    2 +-
 drivers/mtd/nand/fsl_elbc_nand.c      |    2 +-
 drivers/mtd/nand/fsl_ifc_nand.c       |    5 +++--
 drivers/mtd/nand/mxc_nand.c           |    2 +-
 drivers/mtd/nand/plat_nand.c          |    4 ++--
 drivers/mtd/nand/xway_nand.c          |    2 +-
 drivers/ssb/driver_mipscore.c         |    2 +-
 include/linux/mtd/mtd.h               |    8 ++++----
 include/linux/mtd/nand.h              |    2 +-
 include/linux/mtd/physmap.h           |    2 +-
 include/linux/mtd/plat-ram.h          |    4 ++--
 35 files changed, 66 insertions(+), 69 deletions(-)

diff --git a/drivers/bcma/driver_mips.c b/drivers/bcma/driver_mips.c
index 9a7f0e3..11115bb 100644
--- a/drivers/bcma/driver_mips.c
+++ b/drivers/bcma/driver_mips.c
@@ -21,7 +21,7 @@
 #include <linux/serial_reg.h>
 #include <linux/time.h>
 
-static const char *part_probes[] = { "bcm47xxpart", NULL };
+static const char * const part_probes[] = { "bcm47xxpart", NULL };
 
 static struct physmap_flash_data bcma_pflash_data = {
 	.part_probe_types	= part_probes,
diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 9526628..f86a787 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -10,7 +10,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
 
-static const char *probes[] = { "bcm47xxpart", NULL };
+static const char * const probes[] = { "bcm47xxpart", NULL };
 
 static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 8510ccb..a8caad2 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -123,7 +123,7 @@ static inline void doc_flash_address(struct docg3 *docg3, u8 addr)
 	doc_writeb(docg3, addr, DOC_FLASHADDRESS);
 }
 
-static char const *part_probes[] = { "cmdlinepart", "saftlpart", NULL };
+static char const * const part_probes[] = { "cmdlinepart", "saftlpart", NULL };
 
 static int doc_register_readb(struct docg3 *docg3, int reg)
 {
diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index f833edf..319b04a 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -122,7 +122,8 @@ static void bfin_flash_copy_to(struct map_info *map, unsigned long to, const voi
 	switch_back(state);
 }
 
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char * const part_probe_types[] = {
+	"cmdlinepart", "RedBoot", NULL };
 
 static int bfin_flash_probe(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 080f060..f8a7dd1 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -143,9 +143,8 @@ static struct map_info dc21285_map = {
 	.copy_from = dc21285_copy_from,
 };
 
-
 /* Partition stuff */
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int __init init_dc21285(void)
 {
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 7b643de..5ede282 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -157,7 +157,8 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
 	memcpy_toio(map->virt + (to % state->win_size), from, len);
 }
 
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char * const part_probe_types[] = {
+	"cmdlinepart", "RedBoot", NULL };
 
 /**
  * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 834a06c..4968674 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -24,14 +24,12 @@
 #define NUM_FLASHBANKS 2
 #define BUSWIDTH     4
 
-/* can be { "cfi_probe", "jedec_probe", "map_rom", NULL } */
-#define PROBETYPES { "jedec_probe", NULL }
-
 #define MSG_PREFIX "impA7:"   /* prefix for our printk()'s */
 #define MTDID      "impa7-%d"  /* for mtdparts= partitioning */
 
 static struct mtd_info *impa7_mtd[NUM_FLASHBANKS];
 
+static const char * const rom_probe_types[] = { "jedec_probe", NULL };
 
 static struct map_info impa7_map[NUM_FLASHBANKS] = {
 	{
@@ -60,8 +58,7 @@ static struct mtd_partition partitions[] =
 
 static int __init init_impa7(void)
 {
-	static const char *rom_probe_types[] = PROBETYPES;
-	const char **type;
+	const char * const *type;
 	int i;
 	static struct { u_long addr; u_long size; } pt[NUM_FLASHBANKS] = {
 	  { WINDOW_ADDR0, WINDOW_SIZE0 },
diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index b14053b..f581ac1 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -82,9 +82,9 @@ static void vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
 
 static int vr_nor_mtd_setup(struct vr_nor_mtd *p)
 {
-	static const char *probe_types[] =
+	static const char * const probe_types[] =
 	    { "cfi_probe", "jedec_probe", NULL };
-	const char **type;
+	const char * const *type;
 
 	for (type = probe_types; !p->info && *type; type++)
 		p->info = do_map_probe(*type, &p->map);
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index e864fc6..52b3410 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -148,7 +148,7 @@ struct ixp4xx_flash_info {
 	struct resource *res;
 };
 
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int ixp4xx_flash_remove(struct platform_device *dev)
 {
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index d1da6ed..d7ac65d 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -46,8 +46,7 @@ struct ltq_mtd {
 };
 
 static const char ltq_map_name[] = "ltq_nor";
-static const char *ltq_probe_types[] = {
-					"cmdlinepart", "ofpart", NULL };
+static const char * const ltq_probe_types[] = { "cmdlinepart", "ofpart", NULL };
 
 static map_word
 ltq_read16(struct map_info *map, unsigned long adr)
diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index c3aebd5..c2604f8 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -283,8 +283,7 @@ static int mtd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (err)
 		goto release;
 
-	/* tsk - do_map_probe should take const char * */
-	mtd = do_map_probe((char *)info->map_name, &map->map);
+	mtd = do_map_probe(info->map_name, &map->map);
 	err = -ENODEV;
 	if (!mtd)
 		goto release;
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 21b0b71..e7a592c 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -87,21 +87,18 @@ static void physmap_set_vpp(struct map_info *map, int state)
 	spin_unlock_irqrestore(&info->vpp_lock, flags);
 }
 
-static const char *rom_probe_types[] = {
-					"cfi_probe",
-					"jedec_probe",
-					"qinfo_probe",
-					"map_rom",
-					NULL };
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", "afs",
-					  NULL };
+static const char * const rom_probe_types[] = {
+	"cfi_probe", "jedec_probe", "qinfo_probe", "map_rom", NULL };
+
+static const char * const part_probe_types[] = {
+	"cmdlinepart", "RedBoot", "afs", NULL };
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
 	struct physmap_flash_data *physmap_data;
 	struct physmap_flash_info *info;
-	const char **probe_type;
-	const char **part_types;
+	const char * const *probe_type;
+	const char * const *part_types;
 	int err = 0;
 	int i;
 	int devices_found = 0;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 363939d..d111097 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -71,6 +71,9 @@ static int of_flash_remove(struct platform_device *dev)
 	return 0;
 }
 
+static const char * const rom_probe_types[] = {
+	"cfi_probe", "jedec_probe", "map_rom" };
+
 /* Helper function to handle probing of the obsolete "direct-mapped"
  * compatible binding, which has an extra "probe-type" property
  * describing the type of flash probe necessary. */
@@ -80,8 +83,6 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 	struct device_node *dp = dev->dev.of_node;
 	const char *of_probe;
 	struct mtd_info *mtd;
-	static const char *rom_probe_types[]
-		= { "cfi_probe", "jedec_probe", "map_rom"};
 	int i;
 
 	dev_warn(&dev->dev, "Device tree uses obsolete \"direct-mapped\" "
@@ -111,9 +112,10 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
    specifies the list of partition probers to use. If none is given then the
    default is use. These take precedence over other device tree
    information. */
-static const char *part_probe_types_def[] = { "cmdlinepart", "RedBoot",
-					"ofpart", "ofoldpart", NULL };
-static const char **of_get_probes(struct device_node *dp)
+static const char * const part_probe_types_def[] = {
+	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
+
+static const char * const *of_get_probes(struct device_node *dp)
 {
 	const char *cp;
 	int cplen;
@@ -142,7 +144,7 @@ static const char **of_get_probes(struct device_node *dp)
 	return res;
 }
 
-static void of_free_probes(const char **probes)
+static void of_free_probes(const char * const *probes)
 {
 	if (probes != part_probe_types_def)
 		kfree(probes);
@@ -151,7 +153,7 @@ static void of_free_probes(const char **probes)
 static struct of_device_id of_flash_match[];
 static int of_flash_probe(struct platform_device *dev)
 {
-	const char **part_probe_types;
+	const char * const *part_probe_types;
 	const struct of_device_id *match;
 	struct device_node *dp = dev->dev.of_node;
 	struct resource res;
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 2de66b0..71fdda2 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -199,7 +199,7 @@ static int platram_probe(struct platform_device *pdev)
 	 * supplied by the platform_data struct */
 
 	if (pdata->map_probes) {
-		const char **map_probes = pdata->map_probes;
+		const char * const *map_probes = pdata->map_probes;
 
 		for ( ; !info->mtd && *map_probes; map_probes++)
 			info->mtd = do_map_probe(*map_probes , &info->map);
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 43e3dbb..acb1dbc 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -45,9 +45,7 @@ struct pxa2xx_flash_info {
 	struct map_info		map;
 };
 
-
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
-
+static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int pxa2xx_flash_probe(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 49c3fe7..ac02fbf 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -45,14 +45,15 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
+static const char * const rom_probe_types[] = {
+	"cfi_probe", "jedec_probe", NULL };
 
 static int rbtx4939_flash_probe(struct platform_device *dev)
 {
 	struct rbtx4939_flash_data *pdata;
 	struct rbtx4939_flash_info *info;
 	struct resource *res;
-	const char **probe_type;
+	const char * const *probe_type;
 	int err = 0;
 	unsigned long size;
 
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index f694417..29e3dca 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -244,7 +244,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 	return ERR_PTR(ret);
 }
 
-static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+static const char * const part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static int sa1100_mtd_probe(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/maps/solutionengine.c b/drivers/mtd/maps/solutionengine.c
index 9d900ad..83a7a70 100644
--- a/drivers/mtd/maps/solutionengine.c
+++ b/drivers/mtd/maps/solutionengine.c
@@ -31,7 +31,7 @@ struct map_info soleng_flash_map = {
 	.bankwidth = 4,
 };
 
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 #ifdef CONFIG_MTD_SUPERH_RESERVE
 static struct mtd_partition superh_se_partitions[] = {
diff --git a/drivers/mtd/maps/tsunami_flash.c b/drivers/mtd/maps/tsunami_flash.c
index 1de390e..da2cdb5 100644
--- a/drivers/mtd/maps/tsunami_flash.c
+++ b/drivers/mtd/maps/tsunami_flash.c
@@ -82,11 +82,12 @@ static void __exit  cleanup_tsunami_flash(void)
 	tsunami_flash_mtd = 0;
 }
 
+static const char * const rom_probe_types[] = {
+	"cfi_probe", "jedec_probe", "map_rom", NULL };
 
 static int __init init_tsunami_flash(void)
 {
-	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
-	char **type;
+	const char * const *type;
 
 	tsunami_tig_writeb(FLASH_ENABLE_BYTE, FLASH_ENABLE_PORT);
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 61d5f56..681bb6d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -492,7 +492,7 @@ out_error:
  *
  * Returns zero in case of success and a negative error code in case of failure.
  */
-int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
+int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      struct mtd_part_parser_data *parser_data,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 961a384..62bf5ac 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -15,7 +15,8 @@ extern int del_mtd_device(struct mtd_info *mtd);
 extern int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
 			      int);
 extern int del_mtd_partitions(struct mtd_info *);
-extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
+extern int parse_mtd_partitions(struct mtd_info *master,
+				const char * const *types,
 				struct mtd_partition **pparts,
 				struct mtd_part_parser_data *data);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 70fa70a..3014933 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -694,7 +694,7 @@ EXPORT_SYMBOL_GPL(deregister_mtd_parser);
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
  */
-static const char *default_mtd_part_types[] = {
+static const char * const default_mtd_part_types[] = {
 	"cmdlinepart",
 	"ofpart",
 	NULL
@@ -720,7 +720,7 @@ static const char *default_mtd_part_types[] = {
  * o a positive number of found partitions, in which case on exit @pparts will
  *   point to an array containing this number of &struct mtd_info objects.
  */
-int parse_mtd_partitions(struct mtd_info *master, const char **types,
+int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data)
 {
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 7bae569..297889a 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -21,7 +21,7 @@ MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rafał Miłecki");
 
-static const char *probes[] = { "bcm47xxpart", NULL };
+static const char * const probes[] = { "bcm47xxpart", NULL };
 
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index a01ccb9..499a472 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -90,7 +90,7 @@ static unsigned int numtimings;
 static int timing[3];
 module_param_array(timing, int, &numtimings, 0644);
 
-static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+static const char * const part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 /* Hrm. Why isn't this already conditional on something in the struct device? */
 #define cafe_dev_dbg(dev, args...) do { if (debug) dev_dbg(dev, ##args); } while(0)
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 18fa448..4740a6e 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1289,7 +1289,7 @@ static int __init read_id_reg(struct mtd_info *mtd)
 	return -ENODEV;
 }
 
-static char const *part_probes[] = { "cmdlinepart", "saftlpart", NULL };
+static char const * const part_probes[] = { "cmdlinepart", "saftlpart", NULL };
 
 static int __init probe_docg4(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 2065720..fc74429 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -805,7 +805,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct fsl_elbc_mtd *priv;
 	struct resource res;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
-	static const char *part_probe_types[]
+	static const char * const part_probe_types[]
 		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	int ret;
 	int bank;
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index f1f7f12..b56e625 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -39,6 +39,9 @@
 
 struct fsl_ifc_ctrl;
 
+static const char * const part_probe_types[] = {
+	"cmdlinepart", "RedBoot", "ofpart", NULL };
+
 /* mtd information per set */
 struct fsl_ifc_mtd {
 	struct mtd_info mtd;
@@ -933,8 +936,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	struct fsl_ifc_regs __iomem *ifc;
 	struct fsl_ifc_mtd *priv;
 	struct resource res;
-	static const char *part_probe_types[]
-		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	int ret;
 	int bank;
 	struct device_node *node = dev->dev.of_node;
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 07e5784..31dc894 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
 	}
 };
 
-static const char const *part_probes[] = {
+static const char * const part_probes[] = {
 	"cmdlinepart", "RedBoot", "ofpart", NULL };
 
 static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index c004566..2ea5519 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -23,7 +23,7 @@ struct plat_nand_data {
 	void __iomem		*io_base;
 };
 
-static const char *part_probe_types[] = { "cmdlinepart", NULL };
+static const char * const part_probe_types[] = { "cmdlinepart", NULL };
 
 /*
  * Probe for the NAND device.
@@ -34,7 +34,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 	struct mtd_part_parser_data ppdata;
 	struct plat_nand_data *data;
 	struct resource *res;
-	const char **part_types;
+	const char * const *part_types;
 	int err = 0;
 
 	if (!pdata) {
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 3f81dc8..f531f1d 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -161,7 +161,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 }
 
 /* allow users to override the partition in DT using the cmdline */
-static const char *part_probes[] = { "cmdlinepart", "ofpart", NULL };
+static const char * const part_probes[] = { "cmdlinepart", "ofpart", NULL };
 
 static struct platform_nand_data xway_nand_data = {
 	.chip = {
diff --git a/drivers/ssb/driver_mipscore.c b/drivers/ssb/driver_mipscore.c
index 33b37da..8b64f82 100644
--- a/drivers/ssb/driver_mipscore.c
+++ b/drivers/ssb/driver_mipscore.c
@@ -18,7 +18,7 @@
 
 #include "ssb_private.h"
 
-static const char *part_probes[] = { "bcm47xxpart", NULL };
+static const char * const part_probes[] = { "bcm47xxpart", NULL };
 
 static struct physmap_flash_data ssb_pflash_data = {
 	.part_probe_types	= part_probes,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f9ac289..a5cf4e8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -362,10 +362,10 @@ struct mtd_partition;
 struct mtd_part_parser_data;
 
 extern int mtd_device_parse_register(struct mtd_info *mtd,
-			      const char **part_probe_types,
-			      struct mtd_part_parser_data *parser_data,
-			      const struct mtd_partition *defparts,
-			      int defnr_parts);
+				     const char * const *part_probe_types,
+				     struct mtd_part_parser_data *parser_data,
+				     const struct mtd_partition *defparts,
+				     int defnr_parts);
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 591eeeb..3bcbcf6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -637,7 +637,7 @@ struct platform_nand_chip {
 	int chip_delay;
 	unsigned int options;
 	unsigned int bbt_options;
-	const char **part_probe_types;
+	const char * const *part_probe_types;
 };
 
 /* Keep gcc happy */
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index d2887e7..aa6a263 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -30,7 +30,7 @@ struct physmap_flash_data {
 	unsigned int		pfow_base;
 	char                    *probe_type;
 	struct mtd_partition	*parts;
-	const char		**part_probe_types;
+	const char * const	*part_probe_types;
 };
 
 #endif /* __LINUX_MTD_PHYSMAP__ */
diff --git a/include/linux/mtd/plat-ram.h b/include/linux/mtd/plat-ram.h
index e07890a..44212d6 100644
--- a/include/linux/mtd/plat-ram.h
+++ b/include/linux/mtd/plat-ram.h
@@ -20,8 +20,8 @@
 
 struct platdata_mtd_ram {
 	const char		*mapname;
-	const char		**map_probes;
-	const char		**probes;
+	const char * const      *map_probes;
+	const char * const      *probes;
 	struct mtd_partition	*partitions;
 	int			 nr_partitions;
 	int			 bankwidth;
-- 
1.7.10.4
