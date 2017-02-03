Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZaVa-0003HE-27
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 09:50:24 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
Date: Fri,  3 Feb 2017 10:49:17 +0100
Message-Id: <20170203094946.2112158-1-arnd@arndb.de>
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
index f9fa3fad728e..2051f28ddac6 100644
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
