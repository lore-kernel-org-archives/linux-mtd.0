Received: from nwd2mail10.analog.com ([137.71.25.55])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfRYO-0004RJ-2T
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 04:20:58 +0000
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: CFI: fix bug - bonnie++ error on BF548 NOR flash
Date: Fri,  6 Mar 2009 11:32:18 +0800
Message-Id: <1236310338-24256-1-git-send-email-cooloney@kernel.org>
Cc: Graf Yang <graf.yang@analog.com>, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graf Yang <graf.yang@analog.com>

The function inval_cache_and_wait_for_operation() is called both
by write and erase operation. If erase call it and stayed there, then write
call it and male-cleared chip->erase_suspended, the time out error may arise.

Signed-off-by: Graf Yang <graf.yang@analog.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index f5ab6fa..c151075 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1236,10 +1236,14 @@ static int inval_cache_and_wait_for_operation(
 			remove_wait_queue(&chip->wq, &wait);
 			spin_lock(chip->mutex);
 		}
-		if (chip->erase_suspended || chip->write_suspended)  {
-			/* Suspend has occured while sleep: reset timeout */
+		if (chip->erase_suspended && chip_state == FL_ERASING)  {
+			/* Erase suspend has occured while sleep: reset timeout */
 			timeo = reset_timeo;
 			chip->erase_suspended = 0;
+		}
+		if (chip->write_suspended && chip_state == FL_WRITING)  {
+			/* Write suspend has occured while sleep: reset timeout */
+			timeo = reset_timeo;
 			chip->write_suspended = 0;
 		}
 	}
-- 
1.5.6.3
