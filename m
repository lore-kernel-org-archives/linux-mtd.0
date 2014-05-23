Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnqUG-0000zZ-4F
 for linux-mtd@lists.infradead.org; Fri, 23 May 2014 14:30:21 +0000
Message-ID: <1400855394.31526.37.camel@x220>
Subject: [PATCH] mtd: maps: remove check for CONFIG_MTD_SUPERH_RESERVE
From: Paul Bolle <pebolle@tiscali.nl>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Date: Fri, 23 May 2014 16:29:54 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since (a few releases before) v2.6.0 there have been checks for
CONFIG_MTD_SUPERH_RESERVE. One check is still present. But a Kconfig
symbol MTD_SUPERH_RESERVE has never been added. So a few lines of dead
code can be removed.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 drivers/mtd/maps/solutionengine.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/mtd/maps/solutionengine.c b/drivers/mtd/maps/solutionengine.c
index 83a7a7091562..bb580bc16445 100644
--- a/drivers/mtd/maps/solutionengine.c
+++ b/drivers/mtd/maps/solutionengine.c
@@ -33,28 +33,6 @@ struct map_info soleng_flash_map = {
 
 static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
-#ifdef CONFIG_MTD_SUPERH_RESERVE
-static struct mtd_partition superh_se_partitions[] = {
-	/* Reserved for boot code, read-only */
-	{
-		.name = "flash_boot",
-		.offset = 0x00000000,
-		.size = CONFIG_MTD_SUPERH_RESERVE,
-		.mask_flags = MTD_WRITEABLE,
-	},
-	/* All else is writable (e.g. JFFS) */
-	{
-		.name = "Flash FS",
-		.offset = MTDPART_OFS_NXTBLK,
-		.size = MTDPART_SIZ_FULL,
-	}
-};
-#define NUM_PARTITIONS ARRAY_SIZE(superh_se_partitions)
-#else
-#define superh_se_partitions NULL
-#define NUM_PARTITIONS 0
-#endif /* CONFIG_MTD_SUPERH_RESERVE */
-
 static int __init init_soleng_maps(void)
 {
 	/* First probe at offset 0 */
@@ -92,8 +70,7 @@ static int __init init_soleng_maps(void)
 		mtd_device_register(eprom_mtd, NULL, 0);
 	}
 
-	mtd_device_parse_register(flash_mtd, probes, NULL,
-				  superh_se_partitions, NUM_PARTITIONS);
+	mtd_device_parse_register(flash_mtd, probes, NULL, NULL, 0);
 
 	return 0;
 }
-- 
1.9.0
