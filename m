Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN39-0007Td-9u
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/9] mtd: maps: add const qualifiers
Date: Tue, 12 Mar 2013 13:08:26 +0200
Message-Id: <1363086508-2405-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Be a bit stricter and add few more 'const' qualifiers.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/maps/bfin-async-flash.c |    3 ++-
 drivers/mtd/maps/dc21285.c          |    3 +--
 drivers/mtd/maps/gpio-addr-flash.c  |    3 ++-
 drivers/mtd/maps/impa7.c            |    7 ++-----
 drivers/mtd/maps/intel_vr_nor.c     |    4 ++--
 drivers/mtd/maps/ixp4xx.c           |    2 +-
 drivers/mtd/maps/lantiq-flash.c     |    3 +--
 drivers/mtd/maps/pci.c              |    3 +--
 drivers/mtd/maps/pxa2xx-flash.c     |    4 +---
 drivers/mtd/maps/rbtx4939-flash.c   |    5 +++--
 drivers/mtd/maps/sa1100-flash.c     |    2 +-
 drivers/mtd/maps/solutionengine.c   |    2 +-
 drivers/mtd/maps/tsunami_flash.c    |    5 +++--
 13 files changed, 21 insertions(+), 25 deletions(-)

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
 
-- 
1.7.10.4
