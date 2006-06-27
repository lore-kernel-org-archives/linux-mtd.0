Date: Tue, 27 Jun 2006 13:40:46 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: nico@cam.org, linux-mtd@lists.infradead.org
Subject: [PATCH]Fixes of performance and stability issues in CFI driver. 
Message-ID: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, 

The current implementation has some performance and stability issues in CFI drivers.

I found the following bugs:
1. Very low write performance on Sibley (perf tests demonstrated write performance less than 100Kb/sec when it should be over 400Kb/sec): 
The root of the issue is in the following code:

static inline void cfi_udelay(int us)
{
	if (us >= 1000) {
		msleep((us+999)/1000);
	} else {
		udelay(us);
		cond_resched();
	}
}
According to spec Sibley buffer write time is 2048us. It is greater than 1000us. 
So we call msleep which has resolution 10000 us. 

2. Erase speed is rather low on non XIP configurations on Sibley and probably other NOR chips.
This problem is related to work of waiting procedure. This procedure performs waiting by one msleep call for all erase time. 
Due to msleep time and erase time may vary - in some cases we wait more than needed. Tuning +-1 usec doesn't make sense here. 
According to test data on Sibley we have Erase Speed performance: 246 KB/sec (It should be over 300 KB/sec)


3. JFFS2 tests with CPU loading application cause "block erase error: (status timeout)". 
The reason of the failure is following:
During erase the process goes to sleep for rather long time. 
CPU load application takes the control. Timeout tuning code in CFI driver reduces erase timeout. 
It happens until erase timeout is reduced to very low value. 
This case maximum wait timeout will be set to HZ/2 which is lower than erase timeout. 
If nobody loads CPU next erase will wait for 0.5 sec (HZ/2) and return with error flag. 

To solve all theses issues I did the following:

1) Removed the timeout tuning from inval_cache_and_wait_for_operation. 
IMO there are very few advantages in it. Time out for msleep and "udelay + cond_resched" may vary significantly. Chip operations timeout may also vary. 
I guess that chip op timeout tuning is not a very good definition of real timout for chip operations. But removing this solves potentially/practically danger behavior of code. (Issue 3)

2) Waiting conditions in inval_cache_and_wait_for_operation now is based on timer resolution
If timeout is lower than timer resolution then we do in cycle
	"Checking the status"
	udelay(1);
	cond_resched();
Udelay is just a cycle so substitution of udelay(500) for 500 udelay(1) will not affect on system performance negatively but it will provide much higher resolution. It fixes the issue with very low performance on Sibley. It increases write speed on it greater by 400%.

If timeout is greater than timer resolution (probably erase operation)
We do the following
	sleep for half of operation timeout
	and do in cycle the following
	"Checking the status"
	sleep for timer resolution
It adds insignificant CPU overhead but it provides higher resolution and resolves the issue of low erase speed. (In some cases this solution saves CPU resources significantly - if we exit before than erase operation is done we will wait for 1us in cycle for case old implementation. Due to erase time is very big we will do cycle for long time.)
Test results are following: Without patch: Erase Speed: 246 KB/sec With patch: Erase Speed: 318 KB/sec.


Nicolas,
I separated fix for performance issues on XIP and these fixes by two patches. Please see my patch for XIP perf issues in previous letter ([PATCH] MTD performance issues on XIP configuration). Fixes for issues 1,2,3 can not be spited because they are hardly connected to each other.


Here is the patch. Your suggestions and comments are welcome.


Thanks,
Alexey

diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c c/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-26 19:13:15.000000000 +0400
+++ c/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-26 13:27:21.000000000 +0400
@@ -908,7 +908,7 @@
 
 static int __xipram xip_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
-		unsigned long adr, int *chip_op_time )
+		unsigned long adr, int chip_op_time )
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
@@ -1001,7 +1001,7 @@
 			map_write(map, CMD(0x70), adr);
 			chip->state = oldstate;
 			start = xip_currtime();
-		} else if (usec >= 1000000/HZ) {
+		} else if (chip_op_time >= 1000000/HZ) {
 			/*
 			 * Try to save on CPU power when waiting delay
 			 * is at least a system timer tick period.
@@ -1027,8 +1027,8 @@
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
 	INVALIDATE_CACHED_RANGE(map, from, size)
 
-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, p_usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, p_usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec)
 
 #else
 
@@ -1040,26 +1040,24 @@
 static int inval_cache_and_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
 		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
-		int *chip_op_time )
+		int chip_op_time )
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, status_OK = CMD(0x80);
-	int z, chip_state = chip->state;
-	unsigned long timeo;
-
+	int chip_state = chip->state;
+	unsigned long timeo, timer_resolution = 1000000/HZ;
+	
 	spin_unlock(chip->mutex);
 	if (inval_len)
 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
-	if (*chip_op_time)
-		cfi_udelay(*chip_op_time);
+	
+	if ( chip_op_time / 2 > timer_resolution)
+		cfi_udelay(chip_op_time / 2 );
+		
 	spin_lock(chip->mutex);
+	
+	timeo = jiffies + HZ/2 + chip_op_time * 8 / timer_resolution;
 
-	timeo = *chip_op_time * 8 * HZ / 1000000;
-	if (timeo < HZ/2)
-		timeo = HZ/2;
-	timeo += jiffies;
-
-	z = 0;
 	for (;;) {
 		if (chip->state != chip_state) {
 			/* Someone's suspended the operation: sleep */
@@ -1070,7 +1068,7 @@
 			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
+			timeo = jiffies + HZ/2 + chip_op_time * 8 / timer_resolution;
 			spin_lock(chip->mutex);
 			continue;
 		}
@@ -1087,18 +1085,14 @@
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		z++;
 		spin_unlock(chip->mutex);
-		cfi_udelay(1);
+		if (chip_op_time / 2 < timer_resolution)
+		    cfi_udelay(1);
+    		else
+		    cfi_udelay(timer_resolution);
 		spin_lock(chip->mutex);
 	}
 
-	if (!z) {
-		if (!--(*chip_op_time))
-			*chip_op_time = 1;
-	} else if (z > 1)
-		++(*chip_op_time);
-
 	/* Done and happy. */
  	chip->state = FL_STATUS;
 	return 0;
@@ -1107,9 +1101,7 @@
 #endif
 
 #define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	({ int __udelay = (udelay); \
-	   INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, &__udelay); })
-
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay)
 
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
 {
@@ -1332,7 +1324,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, map_bankwidth(map),
-				   &chip->word_write_time);
+				   chip->word_write_time);
 	if (ret) {
 		xip_enable(map, chip, adr);
 		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1569,7 +1561,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
 				   adr, len,
-				   &chip->buffer_write_time);
+				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);
 		chip->state = FL_STATUS;
@@ -1704,7 +1696,7 @@
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, len,
-				   &chip->erase_time);
+				   chip->erase_time);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
