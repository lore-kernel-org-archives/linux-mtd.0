Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CaAyM-00059u-T9
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2004 05:47:36 -0500
Message-ID: <41B04442.9050109@arcom.com>
Date: Fri, 03 Dec 2004 10:47:30 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="------------000608040601060201060402"
Subject: cfi_cmdset_0002: don't use jiffies for short timeouts
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000608040601060201060402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Due to problems I've been having with short timeouts expiring early [1] 
I propose the following patch:

   - Add word_write_time_max, write_buffer_time_max, erase_time_max 
field to struct flchips.
   - Fill in the above fields based on the CFI data.
   - Use a simple down counter for the timeout on word and buffer writes 
instead of jiffies and time_after().

The first two bits seem generally useful so I could commit those if the 
3rd part is acceptable.

[1] 
http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2004-December/025695.html

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/

--------------000608040601060201060402
Content-Type: text/plain;
	name="mtd-cfi_cmdset_0002-no-jiffies-for-short-timeouts"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="mtd-cfi_cmdset_0002-no-jiffies-for-short-timeouts"

? j
? drivers/mtd/chips/log
Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.113
diff -u -B -p -r1.113 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	3 Dec 2004 10:26:41 -0000	1.113
+++ drivers/mtd/chips/cfi_cmdset_0002.c	3 Dec 2004 10:34:57 -0000
@@ -303,6 +303,12 @@ struct mtd_info *cfi_cmdset_0002(struct 
 		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+		cfi->chips[i].word_write_time_max = (1<<cfi->cfiq->WordWriteTimeoutTyp)
+			* (1<<cfi->cfiq->WordWriteTimeoutMax);
+		cfi->chips[i].buffer_write_time_max = (1<<cfi->cfiq->BufWriteTimeoutTyp)
+			* (1<<cfi->cfiq->BufWriteTimeoutMax);
+		cfi->chips[i].erase_time_max = (1<<cfi->cfiq->BlockEraseTimeoutTyp)
+			* (1<<cfi->cfiq->BlockEraseTimeoutMax);
 	}		
 	
 	map->fldrv = &cfi_amdstd_chipdrv;
@@ -695,19 +701,9 @@ static int cfi_amdstd_secsi_read (struct
 static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
-	 * have a max write time of a few hundreds usec). However, we should
-	 * use the maximum timeout value given by the chip at probe time
-	 * instead.  Unfortunately, struct flchip does have a field for
-	 * maximum timeout, only for typical which can be far too short
-	 * depending of the conditions.	 The ' + 1' is to avoid having a
-	 * timeout of 0 jiffies if HZ is smaller than 1000.
-	 */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long timeo;
 	int ret = 0;
-	map_word oldd, curd;
+	map_word oldd;
 	int retry_cnt = 0;
 
 	adr += chip->start;
@@ -747,9 +743,8 @@ static int do_write_oneword(struct map_i
 	cfi_udelay(chip->word_write_time);
 	cfi_spin_lock(chip->mutex);
 
-	/* See comment above for timeout value. */
-	timeo = jiffies + uWriteTimeout; 
-	for (;;) {
+	timeo = chip->word_write_time_max * 2;
+	do {
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
@@ -759,7 +754,6 @@ static int do_write_oneword(struct map_i
 			cfi_spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
 			cfi_spin_lock(chip->mutex);
 			continue;
 		}
@@ -767,14 +761,11 @@ static int do_write_oneword(struct map_i
 		if (chip_ready(map, adr))
 			goto op_done;
 
-		if (time_after(jiffies, timeo))
-                        break;
-
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
 		cfi_udelay(1);
 		cfi_spin_lock(chip->mutex);
-	}
+	} while (--timeo > 0);
 
 	printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 
@@ -943,9 +934,7 @@ static inline int do_write_buffer(struct
 				  unsigned long adr, const u_char *buf, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long timeo;
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1000,9 +989,8 @@ static inline int do_write_buffer(struct
 	cfi_udelay(chip->buffer_write_time);
 	cfi_spin_lock(chip->mutex);
 
-	timeo = jiffies + uWriteTimeout; 
-		
-	for (;;) {
+	timeo = chip->buffer_write_time_max * 2;
+	do {
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
@@ -1012,22 +1000,18 @@ static inline int do_write_buffer(struct
 			cfi_spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
 			cfi_spin_lock(chip->mutex);
 			continue;
 		}
 
 		if (chip_ready(map, adr))
 			goto op_done;
-		    
-		if( time_after(jiffies, timeo))
-			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
 		cfi_udelay(1);
 		cfi_spin_lock(chip->mutex);
-	}
+	} while (--timeo > 0);
 
 	printk(KERN_WARNING "MTD %s(): software timeout\n",
 	       __func__ );
Index: include/linux/mtd/flashchip.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/flashchip.h,v
retrieving revision 1.15
diff -u -B -p -r1.15 flashchip.h
--- include/linux/mtd/flashchip.h	5 Nov 2004 22:41:06 -0000	1.15
+++ include/linux/mtd/flashchip.h	3 Dec 2004 10:34:58 -0000
@@ -70,9 +70,12 @@ struct flchip {
 	spinlock_t _spinlock; /* We do it like this because sometimes they'll be shared. */
 	wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
 			     to be ready */
-	int word_write_time;
+	int word_write_time;       /* Typical */
 	int buffer_write_time;
 	int erase_time;
+	int word_write_time_max;   /* Maximum */
+	int buffer_write_time_max;
+	int erase_time_max;
 
 	void *priv;
 };

--------------000608040601060201060402--
