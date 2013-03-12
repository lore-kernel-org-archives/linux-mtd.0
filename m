Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN34-0007TK-Tf
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/9] mtd: plat-ram: add const quilifiers
Date: Tue, 12 Mar 2013 13:08:21 +0200
Message-Id: <1363086508-2405-3-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/maps/plat-ram.c  |    2 +-
 include/linux/mtd/plat-ram.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
