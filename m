Date: Tue, 27 Jun 2006 15:16:07 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD performance issues on XIP configuration.
In-Reply-To: <1151415660.17609.132.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.56.0606271510390.31772@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
	<1151415660.17609.132.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
Cc: davide.cascone@st.com, nico@cam.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jun 2006, David Woodhouse wrote:
> 
> Code looks fine but please could you resubmit with an appropriate
> Signed-off-by: line?

Oh sory I forget about this here is this patch again:

Signed-off-by: Alexey, Korolev <akorolev@infradead.org>

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
 
