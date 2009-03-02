Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Le3Yo-0002HR-Jv
	for linux-mtd@lists.infradead.org; Mon, 02 Mar 2009 08:31:41 +0000
From: graff.yang@gmail.com
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: Fix a bug in
	inval_cache_and_wait_for_operation().
Date: Mon,  2 Mar 2009 16:31:29 +0800
Message-Id: <12359826893947-git-send-email-graff.yang@gmail.com>
Cc: Graff Yang <graff.yang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graff Yang <graff.yang@gmail.com>

If the inval_cache_and_wait_for_operation() is re-entered by write operation when erase
operation is in progress, the chip->erase_suspended will be cleared, this cause the erase
timeo is not reset and will result time out error for erase.

Signed-off-by: Graff Yang <graff.yang@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5157e3c..a254fc3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1223,10 +1223,14 @@ static int inval_cache_and_wait_for_operation(
 			remove_wait_queue(&chip->wq, &wait);
 			spin_lock(chip->mutex);
 		}
-		if (chip->erase_suspended || chip->write_suspended)  {
-			/* Suspend has occured while sleep: reset timeout */
+		if (chip->erase_suspended && chip_state == FL_ERASING)  {
+			/* Erase suspend occured while sleep: reset timeout */
 			timeo = reset_timeo;
 			chip->erase_suspended = 0;
+		}
+		if (chip->write_suspended && chip_state == FL_WRITING)  {
+			/* Write suspend occured while sleep: reset timeout */
+			timeo = reset_timeo;
 			chip->write_suspended = 0;
 		}
 	}
-- 
1.5.2.5
