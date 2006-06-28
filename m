Date: Wed, 28 Jun 2006 19:22:07 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-Reply-To: <Pine.LNX.4.64.0606271701120.28771@localhost.localdomain>
Message-ID: <Pine.LNX.4.56.0606281918430.15911@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
	<1151438714.6394.232.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271701120.28771@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas.

The code I verified today has some issues:

1. The resolution of sleeping procedure on erase operations is still very low. 
Tests showed erase performance ~278Kb/sec it's better than 246Kb/sec from original code but it's still far from real device speed ~310Kb/sec.

2. This code
>+		if (chip_op_time/2 >= 1000000/HZ) {
>+			/*
>+			 * Half of the normal delay still remaining
>+			 * can be performed with a sleeping delay instead
>+			 * of busy waiting.
>+			 */
>+			msleep(chip_op_time/2000);
>+			timeo -= chip_op_time/2;
>+			chip_op_time -= chip_op_time/2;
>+		} else {
>+			udelay(1);
>+			cond_resched();
>+			timeo--;
>+		}
may add additional load of CPU when it is unnecessary (necessety is doubtful here). If we need to wait for a long time (erase) we divide chip_op_time by 2 everytime. When we reach 10ms we go to the udelay(1) and perform ~10000 cycles. IMO there is no necessety to do this. 

I found a rather good idea in your code with handling of timeo variable. So I slightly modified your code to avoid the issues with erase performance and verified it. It passed the tests.
(New code showed erase performance ~310Kb/sec)

What do you think about this patch?

David, 
Here is a comment for the patch:

Fix of performance and stability issues on NOR chips. It fixes:
1. Very low write performance on Sibley (perf tests demonstrated write performance less than 100Kb/sec when it should be over 400Kb/sec).
2. Low erase performance. (perf tests on Sibleuy demonstrated erase performance 246Kb/sec when it should be over 300Kb/sec).
3. Error on JFFS2 tests with CPU loading application when MTD returns "block erase error: (status timeout)"
To fix the issue it does the following:
1. Removes the timeout tuning from inval_cache_and_wait_for_operation. 
2. Waiting conditions in inval_cache_and_wait_for_operation now is based on timer resolution
If timeout is lower than timer resolution then we do in cycle
	"Checking the status"
	udelay(1);
	cond_resched();
If timeout is greater than timer resolution (probably erase operation)
We do the following
	sleep for half of operation timeout
	and do in cycle the following
	"Checking the status"
	sleep for timer resolution

Thanks,
Alexey


Signed-off-by: Nicolas Pitre <nico@cam.org>
Signed-off-by: Alexey Korolev <akorolev@infradead.org>

diff -aur orig/drivers/mtd/chips/cfi_cmdset_0001.c latest/drivers/mtd/chips/cfi_cmdset_0001.c
--- orig/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-26 13:20:00.000000000 +0400
+++ latest/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-28 21:56:09.611390112 +0400
@@ -908,7 +908,7 @@
 
 static int __xipram xip_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
-		unsigned long adr, int *chip_op_time )
+		unsigned long adr, unsigned int chip_op_time )
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
@@ -917,7 +917,7 @@
 	flstate_t oldstate, newstate;
 
        	start = xip_currtime();
-	usec = *chip_op_time * 8;
+	usec = chip_op_time * 8;
 	if (usec == 0)
 		usec = 500000;
 	done = 0;
@@ -1027,8 +1027,8 @@
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
 	INVALIDATE_CACHED_RANGE(map, from, size)
 
-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, p_usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, p_usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec)
 
 #else
 
@@ -1040,64 +1040,64 @@
 static int inval_cache_and_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
 		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
-		int *chip_op_time )
+		unsigned int chip_op_time)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, status_OK = CMD(0x80);
-	int z, chip_state = chip->state;
-	unsigned long timeo;
+	int chip_state = chip->state;
+	unsigned int timeo, sleep_time;
 
 	spin_unlock(chip->mutex);
 	if (inval_len)
 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
-	if (*chip_op_time)
-		cfi_udelay(*chip_op_time);
 	spin_lock(chip->mutex);
 
-	timeo = *chip_op_time * 8 * HZ / 1000000;
-	if (timeo < HZ/2)
-		timeo = HZ/2;
-	timeo += jiffies;
+	/* set our timeout to 8 times the expected delay */
+	timeo = chip_op_time * 8;
+	if (!timeo)
+		timeo = 500000;
+	sleep_time = chip_op_time / 2;
 
-	z = 0;
 	for (;;) {
-		if (chip->state != chip_state) {
-			/* Someone's suspended the operation: sleep */
-			DECLARE_WAITQUEUE(wait, current);
-
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			spin_unlock(chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
-			spin_lock(chip->mutex);
-			continue;
-		}
-
 		status = map_read(map, cmd_adr);
 		if (map_word_andequal(map, status, status_OK, status_OK))
 			break;
 
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
+		if (!timeo) {
 			map_write(map, CMD(0x70), cmd_adr);
 			chip->state = FL_STATUS;
 			return -ETIME;
 		}
 
-		/* Latency issues. Drop the lock, wait a while and retry */
-		z++;
+		/* OK Still waiting. Drop the lock, wait a while and retry. */
 		spin_unlock(chip->mutex);
-		cfi_udelay(1);
+		if (sleep_time >= 1000000/HZ) {
+			/*
+			 * Half of the normal delay still remaining
+			 * can be performed with a sleeping delay instead
+			 * of busy waiting.
+			 */
+			msleep(sleep_time/1000);
+			timeo -= sleep_time;
+			sleep_time = 1000000/HZ;
+		} else {
+			udelay(1);
+			cond_resched();
+			timeo--;
+		}
 		spin_lock(chip->mutex);
-	}
 
-	if (!z) {
-		if (!--(*chip_op_time))
-			*chip_op_time = 1;
-	} else if (z > 1)
-		++(*chip_op_time);
+		if (chip->state != chip_state) {
+			/* Someone's suspended the operation: sleep */
+			DECLARE_WAITQUEUE(wait, current);
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			spin_unlock(chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			spin_lock(chip->mutex);
+		}
+	}
 
 	/* Done and happy. */
  	chip->state = FL_STATUS;
@@ -1107,8 +1107,7 @@
 #endif
 
 #define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	({ int __udelay = (udelay); \
-	   INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, &__udelay); })
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
 
 
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1332,7 +1331,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, map_bankwidth(map),
-				   &chip->word_write_time);
+				   chip->word_write_time);
 	if (ret) {
 		xip_enable(map, chip, adr);
 		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1569,7 +1568,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
 				   adr, len,
-				   &chip->buffer_write_time);
+				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);
 		chip->state = FL_STATUS;
@@ -1704,7 +1703,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, len,
-				   &chip->erase_time);
+				   chip->erase_time);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
