Received: from baikonur.stro.at ([213.239.196.228])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAaPk-00029j-Qq
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 16:42:19 -0400
To: dwmw2@redhat.com
From: janitor@sternwelten.at
Date: Thu, 23 Sep 2004 22:42:05 +0200
Message-ID: <E1CAaPl-00028K-AF@sputnik>
Cc: nacc@us.ibm.com, janitor@sternwelten.at, linux-mtd@lists.infradead.org
Subject: [patch 4/4] mtd/cfi_cmdset_0020: replace schedule_timeout() with
	msleep()
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

 linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/cfi_cmdset_0020.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/chips/cfi_cmdset_0020.c~msleep-drivers_mtd_chips_cfi_cmdset_0020 drivers/mtd/chips/cfi_cmdset_0020.c
--- linux-2.6.9-rc2-bk7/drivers/mtd/chips/cfi_cmdset_0020.c~msleep-drivers_mtd_chips_cfi_cmdset_0020	2004-09-21 21:07:48.000000000 +0200
+++ linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/cfi_cmdset_0020.c	2004-09-21 21:07:48.000000000 +0200
@@ -788,7 +788,7 @@ retry:
 	chip->state = FL_ERASING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
@@ -1087,7 +1087,7 @@ retry:
 	chip->state = FL_LOCKING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
@@ -1236,7 +1236,7 @@ retry:
 	chip->state = FL_UNLOCKING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
_
