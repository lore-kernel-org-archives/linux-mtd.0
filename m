Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5MsR-0007rt-Gz
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 10:41:51 +0000
Message-ID: <405EC2EE.2020607@arcom.com>
Date: Mon, 22 Mar 2004 10:41:50 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <E1B3wBv-0005HA-9d@pentafluge.infradead.org>
	<200403182302.45350.dk.dbox2@gmx.net> <405AC989.7020100@arcom.com>
	<136325089484.20040319132715@gmx.de>
In-Reply-To: <136325089484.20040319132715@gmx.de>
Content-Type: multipart/mixed;
 boundary="------------090907000903070005090204"
Subject: Re: Erasebug on AMD flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090907000903070005090204
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

> There are two AM29DL322D chips in parallel forming a 32 bit data bus (i.e. interleaved)

It's as I suspected.  Someone with interleaved AMD chips will have to 
fix the status checking code.

[30 mins later]

Find a patch attached.  It's not been tested or even been passed through 
a compiler. Let me know if it works or doesn't work, please.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/

--------------090907000903070005090204
Content-Type: text/plain;
 name="mtd-interleaved-amd-chip-status-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-interleaved-amd-chip-status-fix.patch"

Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.97
diff -u -B -p -r1.97 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	24 Feb 2004 13:50:21 -0000	1.97
+++ drivers/mtd/chips/cfi_cmdset_0002.c	22 Mar 2004 10:37:32 -0000
@@ -451,6 +451,16 @@ static int chip_status(struct map_info *
 	return CHIP_ERROR;
 }
 
+static int chip_ready(struct map_info *map, unsigned long addr)
+{
+    cf_word d, t;
+
+    d = cfi_read(map, addr);
+    t = d ^ cfi_read(map, addr);
+
+    return t == 0;
+}
+
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
 	DECLARE_WAITQUEUE(wait, current);
@@ -465,7 +475,7 @@ static int get_chip(struct map_info *map
 
 	case FL_STATUS:
 		for (;;) {
-			if (chip_status(map, adr) == CHIP_READY)
+			if (chip_ready(map, adr))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -506,7 +516,7 @@ static int get_chip(struct map_info *map
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
-			if (chip_status(map, adr) == CHIP_READY)
+			if (chip_ready(map, adr))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -821,8 +831,11 @@ static int do_write_oneword(struct map_i
 			continue;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY)
-			break;
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
+                        break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
@@ -830,18 +843,8 @@ static int do_write_oneword(struct map_i
 		cfi_spin_lock(chip->mutex);
 	}
 
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-			__func__, status);
+        printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1185,10 +1188,11 @@ static inline int do_write_buffer(struct
 			continue;
 		}
 
-		if( (status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) ) {
+		if (chip_ready(map, adr))
+                        goto op_done;
+                    
+		if( time_after(jiffies, timeo))
 			break;
-		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
@@ -1196,20 +1200,8 @@ static inline int do_write_buffer(struct
 		cfi_spin_lock(chip->mutex);
 	}
 
-
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT) {
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	}
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-			__func__, status);
+        printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1356,10 +1348,12 @@ static inline int do_erase_chip(struct m
 			chip->erase_suspended = 0;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) )
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
 			break;
-		
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -1367,18 +1361,8 @@ static inline int do_erase_chip(struct m
 		cfi_spin_lock(chip->mutex);
 	}
 
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-		       __func__, status);
+        printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1546,8 +1530,10 @@ static inline int do_erase_oneblock(stru
 			chip->erase_suspended = 0;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) )
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
 			break;
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
@@ -1556,20 +1542,10 @@ static inline int do_erase_oneblock(stru
 		schedule_timeout(1);
 		cfi_spin_lock(chip->mutex);
 	}
-
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-		       __func__, status);
-
+        
+        printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
+        
  op_failed:
 	/* reset on all failures. */
 	cfi_write( map, CMD(0xF0), chip->start );

--------------090907000903070005090204--
