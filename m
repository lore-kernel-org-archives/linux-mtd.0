Received: from baikonur.stro.at ([213.239.196.228])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAaPh-00029d-El
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 16:42:04 -0400
To: dwmw2@redhat.com
From: janitor@sternwelten.at
Date: Thu, 23 Sep 2004 22:41:56 +0200
Message-ID: <E1CAaPc-00020Q-NJ@sputnik>
Cc: nacc@us.ibm.com, janitor@sternwelten.at, linux-mtd@lists.infradead.org
Subject: [patch 1/4] mtd/amd_flash: replace schedule_timeout() with msleep()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Signed-off-by: Maximilian Attems <janitor@sternwelten.at>
---

 linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/amd_flash.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/chips/amd_flash.c~msleep-drivers_mtd_chips_amd_flash drivers/mtd/chips/amd_flash.c
--- linux-2.6.9-rc2-bk7/drivers/mtd/chips/amd_flash.c~msleep-drivers_mtd_chips_amd_flash	2004-09-21 21:07:45.000000000 +0200
+++ linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/amd_flash.c	2004-09-21 21:07:45.000000000 +0200
@@ -1122,7 +1122,7 @@ retry:
 	timeo = jiffies + (HZ * 20);
 
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 	
 	while (flash_is_busy(map, adr, private->interleave)) {
_
