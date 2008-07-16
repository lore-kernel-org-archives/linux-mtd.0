Date: Wed, 16 Jul 2008 15:28:56 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] Bugfix: -ETIMEO errors in CFI driver
Message-ID: <alpine.LFD.1.10.0807161442500.5059@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Existing CFI driver has problems with excessive writes during erase. 
If CFI driver does many writes during one erase cycle we may face the 
messages with -ETIMEO error on erase operation.  It may cause the
following data corruption and kernel panics.

The reason of the issue is related to specifics of suspend operation: 
if we write to flash during erase, suspend operation will cost some time 
to erase procedure (for P30 it could be significant). In current version of 
cfi driver the problem of many suspends is partially workarounded by adding 
some time reserv to any operation (8xerase_time) but if we have many writes 
during one erase the problem appears. 
 
This patch detects the suspend and resets timer if suspend occured. It
has been well verified on different chips. No problems were found.
Could you please include the patch as it is simple and fixes bad issue.

Signed-off-by: Alexey Korolev <akorolev@infradead.org> 
------------------
diff -aurp linux-2.6.25.4/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.25.4/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.25.4/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-15 19:00:12.000000000 +0400
+++ linux-2.6.25.4/drivers/mtd/chips/cfi_cmdset_0001.c	2008-07-16 18:06:27.000000000 +0400
@@ -1145,7 +1145,7 @@ static int inval_cache_and_wait_for_oper
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, status_OK = CMD(0x80);
 	int chip_state = chip->state;
-	unsigned int timeo, sleep_time;
+	unsigned int timeo, sleep_time, reset_timeo;
 
 	spin_unlock(chip->mutex);
 	if (inval_len)
@@ -1156,6 +1156,7 @@ static int inval_cache_and_wait_for_oper
 	timeo = chip_op_time * 8;
 	if (!timeo)
 		timeo = 500000;
+	reset_timeo = timeo;
 	sleep_time = chip_op_time / 2;
 
 	for (;;) {
@@ -1197,6 +1198,12 @@ static int inval_cache_and_wait_for_oper
 			remove_wait_queue(&chip->wq, &wait);
 			spin_lock(chip->mutex);
 		}
+		if (chip->erase_suspended || chip->write_suspended)  {
+			/* Suspend has occured while sleep: reset timeout */
+			timeo = reset_timeo;
+			chip->erase_suspended = 0;
+			chip->write_suspended = 0;
+		}
 	}
 
 	/* Done and happy. */

------------------
Thanks,
Alexey
