Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN38-0007UB-OD
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:19 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/9] mtd: physmap_of: add const qualifiers
Date: Tue, 12 Mar 2013 13:08:25 +0200
Message-Id: <1363086508-2405-7-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/maps/physmap_of.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

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
-- 
1.7.10.4
