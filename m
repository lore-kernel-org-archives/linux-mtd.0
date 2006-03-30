Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOnIl-0003h1-7z
	for linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 21:54:31 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWX002OG6QGDN20@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 21:54:17 -0500 (EST)
Date: Wed, 29 Mar 2006 21:54:16 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603291745000.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_+nH62Gta8hBYMboVXJpqjQ)"
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
	<442943A3.6060807@intel.com>
	<Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_+nH62Gta8hBYMboVXJpqjQ)
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT

On Wed, 29 Mar 2006, Nicolas Pitre wrote:

> On Tue, 28 Mar 2006, Alexey, Korolev wrote:
> 
> > I've made some more investigations for the write errors issue on XIP.
> > The issue takes place when I attempt to write some data to one chip and erase
> > data from another.
> > 
> > I found two possible ways for fixing this issue:
> > 1. Which has been sent before.
> > Add lines in waiting cycle of do_write_buffer.
> > 
> > 2. Fixup in xip_udelay function.
> > xip_udelay already check's the status. So this function will not wait more
> > than required.
> 
> I think both solutions, although they fix this particular problem, are 
> not addressing the fundamental issue which is that the current code 
> structure to cope with XIP and non-XIP is becoming a total mess.  In 
> fact the whole timeout/error handling should be factored out of every 
> functions into a sincle subfunction, actually one for XIP and one for 
> non-XIP.  This way the XIP case would not have to care about chip 
> state changing since that cannot happen, and the timeout treshold 
> would be more accurately computed as well.

Please find attached a patch for what I mean.

Could you test it and confirm the problem is actually gone?


Nicolas

--Boundary_(ID_+nH62Gta8hBYMboVXJpqjQ)
Content-id: <Pine.LNX.4.64.0603292154160.14923@localhost.localdomain>
Content-type: TEXT/PLAIN; charset=US-ASCII; name=cfi_cmdset_0001.diff
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=cfi_cmdset_0001.diff
Content-description: 

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.190
diff -u -r1.190 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	29 Mar 2006 22:31:38 -0000	1.190
+++ drivers/mtd/chips/cfi_cmdset_0001.c	29 Mar 2006 22:38:34 -0000
@@ -406,7 +406,7 @@
 	for (i=0; i< cfi->numchips; i++) {
 		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
-		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+		cfi->chips[i].erase_time = 1000<<cfi->cfiq->BlockEraseTimeoutTyp;
 		cfi->chips[i].ref_point_counter = 0;
 	}
 
@@ -895,26 +895,33 @@
 
 /*
  * When a delay is required for the flash operation to complete, the
- * xip_udelay() function is polling for both the given timeout and pending
- * (but still masked) hardware interrupts.  Whenever there is an interrupt
- * pending then the flash erase or write operation is suspended, array mode
- * restored and interrupts unmasked.  Task scheduling might also happen at that
- * point.  The CPU eventually returns from the interrupt or the call to
- * schedule() and the suspended flash operation is resumed for the remaining
- * of the delay period.
+ * xip_wait_for_operation() function is polling for both the given timeout
+ * and pending (but still masked) hardware interrupts.  Whenever there is an
+ * interrupt pending then the flash erase or write operation is suspended,
+ * array mode restored and interrupts unmasked.  Task scheduling might also
+ * happen at that point.  The CPU eventually returns from the interrupt or
+ * the call to schedule() and the suspended flash operation is resumed for
+ * the remaining of the delay period.
  *
  * Warning: this function _will_ fool interrupt latency tracing tools.
  */
 
-static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
-				unsigned long adr, int usec)
+static int __xipram xip_wait_for_operation(
+		struct map_info *map, struct flchip *chip,
+		unsigned long adr, int *chip_op_time )
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
 	map_word status, OK = CMD(0x80);
-	unsigned long suspended, start = xip_currtime();
+	unsigned long usec, suspended, start, done;
 	flstate_t oldstate, newstate;
 
+       	start = xip_currtime();
+	usec = *chip_op_time * 8;
+	if (usec == 0)
+		usec = 500000;
+	done = 0;
+
 	do {
 		cpu_relax();
 		if (xip_irqpending() && cfip &&
@@ -931,9 +938,9 @@
 			 * we resume the whole thing at once).  Yes, it
 			 * can happen!
 			 */
+			usec -= done;
 			map_write(map, CMD(0xb0), adr);
 			map_write(map, CMD(0x70), adr);
-			usec -= xip_elapsed_since(start);
 			suspended = xip_currtime();
 			do {
 				if (xip_elapsed_since(suspended) > 100000) {
@@ -943,7 +950,7 @@
 					 * This is a critical error but there
 					 * is not much we can do here.
 					 */
-					return;
+					return -EIO;
 				}
 				status = map_read(map, adr);
 			} while (!map_word_andequal(map, status, OK, OK));
@@ -1003,65 +1010,106 @@
 			xip_cpu_idle();
 		}
 		status = map_read(map, adr);
+		done = xip_elapsed_since(start);
 	} while (!map_word_andequal(map, status, OK, OK)
-		 && xip_elapsed_since(start) < usec);
-}
+		 && done < usec);
 
-#define UDELAY(map, chip, adr, usec)  xip_udelay(map, chip, adr, usec)
+	return (done >= usec) ? -ETIME : 0;
+}
 
 /*
  * The INVALIDATE_CACHED_RANGE() macro is normally used in parallel while
  * the flash is actively programming or erasing since we have to poll for
  * the operation to complete anyway.  We can't do that in a generic way with
  * a XIP setup so do it before the actual flash operation in this case
- * and stub it out from INVALIDATE_CACHE_UDELAY.
+ * and stub it out from INVAL_CACHE_AND_WAIT.
  */
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
 	INVALIDATE_CACHED_RANGE(map, from, size)
 
-#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
-	UDELAY(map, chip, cmd_adr, usec)
-
-/*
- * Extra notes:
- *
- * Activating this XIP support changes the way the code works a bit.  For
- * example the code to suspend the current process when concurrent access
- * happens is never executed because xip_udelay() will always return with the
- * same chip state as it was entered with.  This is why there is no care for
- * the presence of add_wait_queue() or schedule() calls from within a couple
- * xip_disable()'d  areas of code, like in do_erase_oneblock for example.
- * The queueing and scheduling are always happening within xip_udelay().
- *
- * Similarly, get_chip() and put_chip() just happen to always be executed
- * with chip->state set to FL_READY (or FL_XIP_WHILE_*) where flash state
- * is in array mode, therefore never executing many cases therein and not
- * causing any problem with XIP.
- */
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, p_usec) \
+	xip_wait_for_operation(map, chip, cmd_adr, p_usec)
 
 #else
 
 #define xip_disable(map, chip, adr)
 #define xip_enable(map, chip, adr)
 #define XIP_INVAL_CACHED_RANGE(x...)
+#define INVAL_CACHE_AND_WAIT inval_cache_and_wait_for_operation
+
+static int inval_cache_and_wait_for_operation(
+		struct map_info *map, struct flchip *chip,
+		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
+		int *chip_op_time )
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	map_word status, status_OK = CMD(0x80);
+	int z, chip_state = chip->state;
+	unsigned long timeo;
+
+	spin_unlock(chip->mutex);
+	if (inval_len)
+		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
+	if (*chip_op_time)
+		cfi_udelay(*chip_op_time);
+	spin_lock(chip->mutex);
+
+	timeo = *chip_op_time * 8 * HZ / 1000000;
+	if (timeo < HZ/2)
+		timeo = HZ/2;
+	timeo += jiffies;
+
+	z = 0;
+	for (;;) {
+		if (chip->state != chip_state) {
+			/* Someone's suspended the operation: sleep */
+			DECLARE_WAITQUEUE(wait, current);
+
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			spin_unlock(chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + (HZ / 2); /* FIXME */
+			spin_lock(chip->mutex);
+			continue;
+		}
+
+		status = map_read(map, cmd_adr);
+		if (map_word_andequal(map, status, status_OK, status_OK))
+			break;
 
-#define UDELAY(map, chip, adr, usec)  \
-do {  \
-	spin_unlock(chip->mutex);  \
-	cfi_udelay(usec);  \
-	spin_lock(chip->mutex);  \
-} while (0)
-
-#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
-do {  \
-	spin_unlock(chip->mutex);  \
-	INVALIDATE_CACHED_RANGE(map, adr, len);  \
-	cfi_udelay(usec);  \
-	spin_lock(chip->mutex);  \
-} while (0)
+		/* OK Still waiting */
+		if (time_after(jiffies, timeo)) {
+			map_write(map, CMD(0x70), cmd_adr);
+			chip->state = FL_STATUS;
+			return -ETIME;
+		}
+
+		/* Latency issues. Drop the lock, wait a while and retry */
+		z++;
+		spin_unlock(chip->mutex);
+		cfi_udelay(1);
+		spin_lock(chip->mutex);
+	}
+
+	if (!z) {
+		if (!--(*chip_op_time))
+			*chip_op_time = 1;
+	} else if (z > 1)
+		*chip_op_time += z/2;
+
+	/* Done and happy. */
+ 	chip->state = FL_STATUS;
+	return 0;
+}
 
 #endif
 
+#define WAIT_TIMEOUT(map, chip, adr, udelay) \
+	({ int __udelay = (udelay); \
+	   INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, &__udelay); })
+
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
 {
 	unsigned long cmd_addr;
@@ -1251,14 +1299,11 @@
 				     unsigned long adr, map_word datum, int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK, write_cmd;
-	unsigned long timeo;
-	int z, ret=0;
+	map_word status, write_cmd;
+	int ret=0;
 
 	adr += chip->start;
 
-	/* Let's determine those according to the interleave only once */
-	status_OK = CMD(0x80);
 	switch (mode) {
 	case FL_WRITING:
 		write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0x40) : CMD(0x41);
@@ -1284,57 +1329,17 @@
 	map_write(map, datum, adr);
 	chip->state = mode;
 
-	INVALIDATE_CACHE_UDELAY(map, chip, adr,
-				adr, map_bankwidth(map),
-				chip->word_write_time);
-
-	timeo = jiffies + (HZ/2);
-	z = 0;
-	for (;;) {
-		if (chip->state != mode) {
-			/* Someone's suspended the write. Sleep */
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
-		status = map_read(map, adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
-			break;
-
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			map_write(map, CMD(0x70), adr);
-			chip->state = FL_STATUS;
-			xip_enable(map, chip, adr);
-			printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
-			ret = -EIO;
-			goto out;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		z++;
-		UDELAY(map, chip, adr, 1);
-	}
-	if (!z) {
-		chip->word_write_time--;
-		if (!chip->word_write_time)
-			chip->word_write_time = 1;
+	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
+				   adr, map_bankwidth(map),
+				   &chip->word_write_time);
+	if (ret) {
+		xip_enable(map, chip, adr);
+		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
+		goto out;
 	}
-	if (z > 1)
-		chip->word_write_time++;
-
-	/* Done and happy. */
-	chip->state = FL_STATUS;
 
 	/* check for errors */
+	status = map_read(map, adr);
 	if (map_word_bitsset(map, status, CMD(0x1a))) {
 		unsigned long chipstatus = MERGESTATUS(status);
 
@@ -1451,9 +1456,9 @@
 				    unsigned long *pvec_seek, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK, write_cmd, datum;
-	unsigned long cmd_adr, timeo;
-	int wbufsize, z, ret=0, word_gap, words;
+	map_word status, write_cmd, datum;
+	unsigned long cmd_adr;
+	int ret, wbufsize, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
 
@@ -1462,7 +1467,6 @@
 	cmd_adr = adr & ~(wbufsize-1);
 
 	/* Let's determine this according to the interleave only once */
-	status_OK = CMD(0x80);
 	write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0xe8) : CMD(0xe9);
 
 	spin_lock(chip->mutex);
@@ -1494,32 +1498,20 @@
 	}
 
 	chip->state = FL_WRITING_TO_BUFFER;
-
-	z = 0;
-	for (;;) {
-		map_write(map, write_cmd, cmd_adr);
-
+	map_write(map, write_cmd, cmd_adr);
+	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0);
+	if (ret) {
+		/* Argh. Not ready for write to buffer */
+		map_word Xstatus = map_read(map, cmd_adr);
+		map_write(map, CMD(0x70), cmd_adr);
+		chip->state = FL_STATUS;
 		status = map_read(map, cmd_adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
-			break;
-
-		UDELAY(map, chip, cmd_adr, 1);
-
-		if (++z > 20) {
-			/* Argh. Not ready for write to buffer */
-			map_word Xstatus;
-			map_write(map, CMD(0x70), cmd_adr);
-			chip->state = FL_STATUS;
-			Xstatus = map_read(map, cmd_adr);
-			/* Odd. Clear status bits */
-			map_write(map, CMD(0x50), cmd_adr);
-			map_write(map, CMD(0x70), cmd_adr);
-			xip_enable(map, chip, cmd_adr);
-			printk(KERN_ERR "%s: Chip not ready for buffer write. status = %lx, Xstatus = %lx\n",
-			       map->name, status.x[0], Xstatus.x[0]);
-			ret = -EIO;
-			goto out;
-		}
+		map_write(map, CMD(0x50), cmd_adr);
+		map_write(map, CMD(0x70), cmd_adr);
+		xip_enable(map, chip, cmd_adr);
+		printk(KERN_ERR "%s: Chip not ready for buffer write. Xstatus = %lx, status = %lx\n",
+				map->name, Xstatus.x[0], status.x[0]);
+		goto out;
 	}
 
 	/* Figure out the number of words to write */
@@ -1574,56 +1566,19 @@
 	map_write(map, CMD(0xd0), cmd_adr);
 	chip->state = FL_WRITING;
 
-	INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
-				adr, len,
-				chip->buffer_write_time);
-
-	timeo = jiffies + (HZ/2);
-	z = 0;
-	for (;;) {
-		if (chip->state != FL_WRITING) {
-			/* Someone's suspended the write. Sleep */
-			DECLARE_WAITQUEUE(wait, current);
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
-		status = map_read(map, cmd_adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
-			break;
-
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			map_write(map, CMD(0x70), cmd_adr);
-			chip->state = FL_STATUS;
-			xip_enable(map, chip, cmd_adr);
-			printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
-			ret = -EIO;
-			goto out;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		z++;
-		UDELAY(map, chip, cmd_adr, 1);
-	}
-	if (!z) {
-		chip->buffer_write_time--;
-		if (!chip->buffer_write_time)
-			chip->buffer_write_time = 1;
+	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
+				   adr, len,
+				   &chip->buffer_write_time);
+	if (ret) {
+		map_write(map, CMD(0x70), cmd_adr);
+		chip->state = FL_STATUS;
+		xip_enable(map, chip, cmd_adr);
+		printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
+		goto out;
 	}
-	if (z > 1)
-		chip->buffer_write_time++;
-
-	/* Done and happy. */
- 	chip->state = FL_STATUS;
 
 	/* check for errors */
+	status = map_read(map, cmd_adr);
 	if (map_word_bitsset(map, status, CMD(0x1a))) {
 		unsigned long chipstatus = MERGESTATUS(status);
 
@@ -1719,17 +1674,12 @@
 				      unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK;
-	unsigned long timeo;
+	map_word status;
 	int retries = 3;
-	DECLARE_WAITQUEUE(wait, current);
-	int ret = 0;
+	int ret;
 
 	adr += chip->start;
 
-	/* Let's determine this according to the interleave only once */
-	status_OK = CMD(0x80);
-
  retry:
 	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_ERASING);
@@ -1751,48 +1701,15 @@
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 
-	INVALIDATE_CACHE_UDELAY(map, chip, adr,
-				adr, len,
-				chip->erase_time*1000/2);
-
-	/* FIXME. Use a timer to check this, and return immediately. */
-	/* Once the state machine's known to be working I'll do that */
-
-	timeo = jiffies + (HZ*20);
-	for (;;) {
-		if (chip->state != FL_ERASING) {
-			/* Someone's suspended the erase. Sleep */
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			spin_unlock(chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			spin_lock(chip->mutex);
-			continue;
-		}
-		if (chip->erase_suspended) {
-			/* This erase was suspended and resumed.
-			   Adjust the timeout */
-			timeo = jiffies + (HZ*20); /* FIXME */
-			chip->erase_suspended = 0;
-		}
-
-		status = map_read(map, adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
-			break;
-
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			map_write(map, CMD(0x70), adr);
-			chip->state = FL_STATUS;
-			xip_enable(map, chip, adr);
-			printk(KERN_ERR "%s: block erase error: (status timeout)\n", map->name);
-			ret = -EIO;
-			goto out;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1000000/HZ);
+	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
+				   adr, len,
+				   &chip->erase_time);
+	if (ret) {
+		map_write(map, CMD(0x70), adr);
+		chip->state = FL_STATUS;
+		xip_enable(map, chip, adr);
+		printk(KERN_ERR "%s: block erase error: (status timeout)\n", map->name);
+		goto out;
 	}
 
 	/* We've broken this before. It doesn't hurt to be safe */
@@ -1821,7 +1738,6 @@
 			ret = -EIO;
 		} else if (chipstatus & 0x20 && retries--) {
 			printk(KERN_DEBUG "block erase failed at 0x%08lx: status 0x%lx. Retrying...\n", adr, chipstatus);
-			timeo = jiffies + HZ;
 			put_chip(map, chip, adr);
 			spin_unlock(chip->mutex);
 			goto retry;
@@ -1927,15 +1843,11 @@
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-	map_word status, status_OK;
-	unsigned long timeo = jiffies + HZ;
+	int udelay;
 	int ret;
 
 	adr += chip->start;
 
-	/* Let's determine this according to the interleave only once */
-	status_OK = CMD(0x80);
-
 	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_LOCKING);
 	if (ret) {
@@ -1960,41 +1872,21 @@
 	 * If Instant Individual Block Locking supported then no need
 	 * to delay.
 	 */
+	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
 
-	if (!extp || !(extp->FeatureSupport & (1 << 5)))
-		UDELAY(map, chip, adr, 1000000/HZ);
-
-	/* FIXME. Use a timer to check this, and return immediately. */
-	/* Once the state machine's known to be working I'll do that */
-
-	timeo = jiffies + (HZ*20);
-	for (;;) {
-
-		status = map_read(map, adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
-			break;
-
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			map_write(map, CMD(0x70), adr);
-			chip->state = FL_STATUS;
-			xip_enable(map, chip, adr);
-			printk(KERN_ERR "%s: block unlock error: (status timeout)\n", map->name);
-			put_chip(map, chip, adr);
-			spin_unlock(chip->mutex);
-			return -EIO;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay);
+	if (ret) {
+		map_write(map, CMD(0x70), adr);
+		chip->state = FL_STATUS;
+		xip_enable(map, chip, adr);
+		printk(KERN_ERR "%s: block unlock error: (status timeout)\n", map->name);
+		goto out;
 	}
 
-	/* Done and happy. */
-	chip->state = FL_STATUS;
 	xip_enable(map, chip, adr);
-	put_chip(map, chip, adr);
+out:	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
-	return 0;
+	return ret;
 }
 
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)

--Boundary_(ID_+nH62Gta8hBYMboVXJpqjQ)--
