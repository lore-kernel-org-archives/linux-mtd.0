Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bioPq-0006cv-B6
 for linux-mtd@lists.infradead.org; Sat, 10 Sep 2016 19:58:19 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
Date: Sat, 10 Sep 2016 21:57:35 +0200
Message-Id: <20160910195748.1360407-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kernelci.org reports a warning for this driver, as it copies a local
variable into a 'const char *' string:

    drivers/mtd/maps/pmcmsp-flash.c:149:30: warning: passing argument 1 of 'strncpy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

Using kstrndup() simplifies the code and avoids the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/pmcmsp-flash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 744ca5cacc9b..cf54420f943d 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -139,15 +139,13 @@ static int __init init_msp_flash(void)
 		}
 
 		msp_maps[i].bankwidth = 1;
-		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
+		msp_maps[i].name = kstrndup(flash_name, 7, GFP_KERNEL);
 		if (!msp_maps[i].name) {
 			iounmap(msp_maps[i].virt);
 			kfree(msp_parts[i]);
 			goto cleanup_loop;
 		}
 
-		msp_maps[i].name = strncpy(msp_maps[i].name, flash_name, 7);
-
 		for (j = 0; j < pcnt; j++) {
 			part_name[5] = '0' + i;
 			part_name[7] = '0' + j;
-- 
2.9.0
