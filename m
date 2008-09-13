Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeOgs-0008Vk-Sd
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 06:33:07 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1126135wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2008 23:33:06 -0700 (PDT)
Message-ID: <48CB5E9F.9060109@gmail.com>
Date: Fri, 12 Sep 2008 23:33:03 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] [MTD] physmap.c: Add #endif comments
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


Adding comments to a few of the less painfully-obvious #endifs.

Signed-off-by: Zev Weiss <zevweiss@gmail.com>
---
  drivers/mtd/maps/physmap.c |    6 +++---
  1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 6fba0d4..49e2039 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -244,7 +244,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
  #define physmap_flash_suspend NULL
  #define physmap_flash_resume NULL
  #define physmap_flash_shutdown NULL
-#endif
+#endif /* CONFIG_PM */

  static struct platform_driver physmap_flash_driver = {
  	.probe		= physmap_flash_probe,
@@ -302,8 +302,8 @@ void physmap_set_partitions(struct mtd_partition *parts, int
num_parts)
  	physmap_flash_data.nr_parts = num_parts;
  	physmap_flash_data.parts = parts;
  }
-#endif
-#endif
+#endif /* CONFIG_MTD_PARTITIONS */
+#endif /* PHYSMAP_COMPAT */

  static int __init physmap_init(void)
  {
-- 
1.5.4.1
