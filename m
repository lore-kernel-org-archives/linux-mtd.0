Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu2TV-0008Qa-KO
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 17:35:42 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: part: add generic parsing of linux,part-probe
Date: Sun, 17 May 2015 19:35:12 +0200
Message-Id: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, jogo@openwrt.org, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This moves the linux,part-probe device tree parsing code from
physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
providing a reference to they device tree node in struct
mtd_part_parser_data.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/maps/physmap_of.c | 40 +---------------------------------------
 drivers/mtd/mtdpart.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 774b32f..fd3750f 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -112,45 +112,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 static const char * const part_probe_types_def[] = {
 	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
 
-static const char * const *of_get_probes(struct device_node *dp)
-{
-	const char *cp;
-	int cplen;
-	unsigned int l;
-	unsigned int count;
-	const char **res;
-
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
-		return part_probe_types_def;
-
-	count = 0;
-	for (l = 0; l != cplen; l++)
-		if (cp[l] == 0)
-			count++;
-
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
-	count = 0;
-	while (cplen > 0) {
-		res[count] = cp;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-		count++;
-	}
-	return res;
-}
-
-static void of_free_probes(const char * const *probes)
-{
-	if (probes != part_probe_types_def)
-		kfree(probes);
-}
-
 static const struct of_device_id of_flash_match[];
 static int of_flash_probe(struct platform_device *dev)
 {
-	const char * const *part_probe_types;
 	const struct of_device_id *match;
 	struct device_node *dp = dev->dev.of_node;
 	struct resource res;
@@ -310,10 +274,8 @@ static int of_flash_probe(struct platform_device *dev)
 		goto err_out;
 
 	ppdata.of_node = dp;
-	part_probe_types = of_get_probes(dp);
-	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
+	mtd_device_parse_register(info->cmtd, part_probe_types_def, &ppdata,
 			NULL, 0);
-	of_free_probes(part_probe_types);
 
 	kfree(mtd_list);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..b3059d6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -29,6 +29,7 @@
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 #include <linux/err.h>
 #include <linux/kconfig.h>
 
@@ -718,6 +719,35 @@ void deregister_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
+static const char * const *of_get_probes(struct device_node *dp)
+{
+	const char *cp;
+	int cplen;
+	unsigned int l;
+	unsigned int count;
+	const char **res;
+
+	cp = of_get_property(dp, "linux,part-probe", &cplen);
+	if (cp == NULL)
+		return NULL;
+
+	count = 0;
+	for (l = 0; l != cplen; l++)
+		if (cp[l] == 0)
+			count++;
+
+	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
+	count = 0;
+	while (cplen > 0) {
+		res[count] = cp;
+		l = strlen(cp) + 1;
+		cp += l;
+		cplen -= l;
+		count++;
+	}
+	return res;
+}
+
 /*
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
@@ -754,6 +784,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 {
 	struct mtd_part_parser *parser;
 	int ret = 0;
+	const char *const *types_of = NULL;
+
+	if (data && data->of_node) {
+		types_of = of_get_probes(data->of_node);
+		if (types_of != NULL)
+			types = types_of;
+	}
 
 	if (!types)
 		types = default_mtd_part_types;
@@ -772,6 +809,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			break;
 		}
 	}
+	kfree(types_of);
 	return ret;
 }
 
-- 
2.1.4
