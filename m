Received: from baikonur.stro.at ([213.239.196.228])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAaPi-00029f-0z
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 16:42:06 -0400
To: dwmw2@redhat.com
From: janitor@sternwelten.at
Date: Thu, 23 Sep 2004 22:42:02 +0200
Message-ID: <E1CAaPi-00025g-Hx@sputnik>
Cc: nacc@us.ibm.com, janitor@sternwelten.at, linux-mtd@lists.infradead.org
Subject: [patch 3/4] mtd/cfi_cmdset_0002: replace schedule_timeout() with
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

 linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/cfi_cmdset_0002.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff -puN drivers/mtd/chips/cfi_cmdset_0002.c~msleep-drivers_mtd_chips_cfi_cmdset_0002 drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.6.9-rc2-bk7/drivers/mtd/chips/cfi_cmdset_0002.c~msleep-drivers_mtd_chips_cfi_cmdset_0002	2004-09-21 21:07:47.000000000 +0200
+++ linux-2.6.9-rc2-bk7-max/drivers/mtd/chips/cfi_cmdset_0002.c	2004-09-21 21:07:47.000000000 +0200
@@ -1175,8 +1175,7 @@ static inline int do_erase_chip(struct m
 	chip->in_progress_block_addr = adr;
 
 	cfi_spin_unlock(chip->mutex);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((chip->erase_time*HZ)/(2*1000));
+	msleep(chip->erase_time/2);
 	cfi_spin_lock(chip->mutex);
 
 	timeo = jiffies + (HZ*20);
@@ -1354,8 +1353,7 @@ static inline int do_erase_oneblock(stru
 	chip->in_progress_block_addr = adr;
 	
 	cfi_spin_unlock(chip->mutex);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((chip->erase_time*HZ)/(2*1000));
+	msleep(chip->erase_time/2);
 	cfi_spin_lock(chip->mutex);
 
 	timeo = jiffies + (HZ*20);
_
