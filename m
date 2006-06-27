Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvIRx-00051d-2R
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 14:38:18 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J1J001B57RM97I0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 14:38:11 -0400 (EDT)
Date: Tue, 27 Jun 2006 14:38:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-reply-to: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
To: Alexey Korolev <akorolev@pentafluge.infradead.org>
Message-id: <Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jun 2006, Alexey Korolev wrote:

> Hi All, 
> 
> The current implementation has some performance and stability issues in CFI drivers.
> 
> I found the following bugs:
> 1. Very low write performance on Sibley (perf tests demonstrated write performance less than 100Kb/sec when it should be over 400Kb/sec): 
> The root of the issue is in the following code:
> 
> static inline void cfi_udelay(int us)
> {
> 	if (us >= 1000) {
> 		msleep((us+999)/1000);
> 	} else {
> 		udelay(us);
> 		cond_resched();
> 	}
> }
> According to spec Sibley buffer write time is 2048us. It is greater than 1000us. 
> So we call msleep which has resolution 10000 us. 

OK, agreed.

> 2. Erase speed is rather low on non XIP configurations on Sibley and 
> probably other NOR chips. This problem is related to work of waiting 
> procedure. This procedure performs waiting by one msleep call for all 
> erase time. Due to msleep time and erase time may vary - in some cases 
> we wait more than needed. Tuning +-1 usec doesn't make sense here. 

Yeah this is the effect of the last cleanup.  I still had to fix that on 
my todo list, like doing a delay refinement with a step proportional to 
the actual expected delay instead of the current 1us step, but haven't 
done it yet.

> 3. JFFS2 tests with CPU loading application cause "block erase error: (status timeout)". 
> The reason of the failure is following:
> During erase the process goes to sleep for rather long time. 
> CPU load application takes the control. Timeout tuning code in CFI driver reduces erase timeout. 
> It happens until erase timeout is reduced to very low value. 
> This case maximum wait timeout will be set to HZ/2 which is lower than erase timeout. 
> If nobody loads CPU next erase will wait for 0.5 sec (HZ/2) and return with error flag. 
> 
> To solve all theses issues I did the following:
> 
> 1) Removed the timeout tuning from inval_cache_and_wait_for_operation. 
> IMO there are very few advantages in it. Time out for msleep and "udelay + cond_resched" may vary significantly. Chip operations timeout may also vary. 
> I guess that chip op timeout tuning is not a very good definition of real timout for chip operations. But removing this solves potentially/practically danger behavior of code. (Issue 3)
> 
> 2) Waiting conditions in inval_cache_and_wait_for_operation now is based on timer resolution
> If timeout is lower than timer resolution then we do in cycle
> 	"Checking the status"
> 	udelay(1);
> 	cond_resched();
> Udelay is just a cycle so substitution of udelay(500) for 500 
> udelay(1) will not affect on system performance negatively but it will 
> provide much higher resolution. It fixes the issue with very low 
> performance on Sibley. It increases write speed on it greater by 400%.

... and it also improves system responsiveness too, especially in the 
case were the loop uses udelay() which is a spin delay as there is more 
opportunities for rescheduling.  However...

> If timeout is greater than timer resolution (probably erase operation)
> We do the following
> 	sleep for half of operation timeout
> 	and do in cycle the following
> 	"Checking the status"
> 	sleep for timer resolution
> It adds insignificant CPU overhead but it provides higher resolution 
> and resolves the issue of low erase speed. (In some cases this 
> solution saves CPU resources significantly - if we exit before than 
> erase operation is done we will wait for 1us in cycle for case old 
> implementation. Due to erase time is very big we will do cycle for 
> long time.)

OK, but I think this should all be done within cfi_udelay().  Or maybe 
not since cfi_udelay() is used by other chip drivers.  So actually I 
think we should simply not use cfi_udelay() and simply open code those 
delay choices right within inval_cache_and_wait_for_operation() 
directly.  

What about this (untested) patch?  It does simplify the code as well.

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0d43581..d241c5d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -907,7 +907,7 @@ static void __xipram xip_enable(struct m
 
 static int __xipram xip_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
-		unsigned long adr, int *chip_op_time )
+		unsigned long adr, unsigned int chip_op_time )
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
@@ -916,7 +916,7 @@ static int __xipram xip_wait_for_operati
 	flstate_t oldstate, newstate;
 
        	start = xip_currtime();
-	usec = *chip_op_time * 8;
+	usec = chip_op_time * 8;
 	if (usec == 0)
 		usec = 500000;
 	done = 0;
@@ -1026,8 +1026,8 @@ static int __xipram xip_wait_for_operati
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
 	INVALIDATE_CACHED_RANGE(map, from, size)
 
-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, p_usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, p_usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec)
 
 #else
 
@@ -1039,64 +1039,63 @@ #define INVAL_CACHE_AND_WAIT inval_cache
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
+	unsigned int timeo;
 
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
+		if (chip_op_time/2 >= 1000000/HZ) {
+			/*
+			 * Half of the normal delay still remaining
+			 * can be performed with a sleeping delay instead
+			 * of busy waiting.
+			 */
+			msleep(chip_op_time/2000);
+			timeo -= chip_op_time/2;
+			chip_op_time -= chip_op_time/2;
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
@@ -1106,8 +1105,7 @@ static int inval_cache_and_wait_for_oper
 #endif
 
 #define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	({ int __udelay = (udelay); \
-	   INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, &__udelay); })
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
 
 
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1331,7 +1329,7 @@ static int __xipram do_write_oneword(str
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, map_bankwidth(map),
-				   &chip->word_write_time);
+				   chip->word_write_time);
 	if (ret) {
 		xip_enable(map, chip, adr);
 		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1568,7 +1566,7 @@ static int __xipram do_write_buffer(stru
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
 				   adr, len,
-				   &chip->buffer_write_time);
+				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);
 		chip->state = FL_STATUS;
@@ -1703,7 +1701,7 @@ static int __xipram do_erase_oneblock(st
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, len,
-				   &chip->erase_time);
+				   chip->erase_time);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
