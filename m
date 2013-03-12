Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN35-0007UB-FN
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/9] mtd: physmap: add const qualifiers
Date: Tue, 12 Mar 2013 13:08:22 +0200
Message-Id: <1363086508-2405-4-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/maps/physmap.c  |   17 +++++++----------
 include/linux/mtd/physmap.h |    2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

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
-- 
1.7.10.4
