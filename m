Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUkf5-0005qB-Mp
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2003 10:36:43 +0000
Message-ID: <3FD998F6.9000303@arcom.com>
Date: Fri, 12 Dec 2003 10:31:18 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Linux MTD List <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed;
 boundary="------------080508010503090208040802"
Subject: cfi_cmdset_0002 -- erase suspends broken.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------080508010503090208040802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The latest cfi_cmdset_0002.c (AMD chips) in CVS has broken erase-suspends.

1. Erase suspend command must be written to the block to be resumed.
2. When erasing DQ2 must a) be read from the erase in progress block b) 
doesn't indicate that an erase has been suspended.  DQ6 is the toggle 
bit to check.

There's a patch attached that fixes these issues.  It's a 
work-in-progress as there's still an issue remaining -- JFFS2 reports 
(for example):

"Newly-erased block contained word 0xff7fffff at offset 0x00ca4540
Newly-erased block contained word 0xffefffff at offset 0x00c90a14
Newly-erased block contained word 0xffffffbf at offset 0x00c82ef4
Newly-erased block contained word 0xfffffbff at offset 0x00df0e20
Newly-erased block contained word 0xfffffffe at offset 0x00de0010"

My 1st thought was that some toggle/status bit were still active but it 
doesn't really make sense.

(Tested with an AMD AM29LV128M part.)

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
--------------080508010503090208040802
Content-Type: text/plain;
 name="mtd-cfi_cmdset_0002.c-erase-suspend-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-cfi_cmdset_0002.c-erase-suspend-fix.patch"

Index: linux-2.4.21/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.4.21.orig/drivers/mtd/chips/cfi_cmdset_0002.c	2003-12-11 15:03:06.000000000 +0000
+++ linux-2.4.21/drivers/mtd/chips/cfi_cmdset_0002.c	2003-12-12 10:00:53.000000000 +0000
@@ -505,22 +505,29 @@
 		      || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1))))
 			goto sleep;
 
+                oldstatus = cfi_read(map, adr);
+                status = cfi_read(map, adr);
+                if ((oldstatus ^ status) & dq2) {
+                        printk(KERN_ERR "Can't suspend erase -- block in progress\n");
+                        goto sleep;
+                }
+
 		/* Erase suspend */
 		/* FIXME - is there a way to verify suspend? */
-		cfi_write(map, CMD(0xB0), adr);
+		cfi_write(map, CMD(0xB0), chip->in_progress_block_addr);
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
-			oldstatus = cfi_read(map, adr);
-			status = cfi_read(map, adr);
-			if (((oldstatus ^ status) & dq2) == dq2)
+			oldstatus = cfi_read(map, chip->in_progress_block_addr);
+			status = cfi_read(map, chip->in_progress_block_addr);
+			if (((oldstatus ^ status) & dq6) != dq6)
 			        break;
 
 			if (time_after(jiffies, timeo)) {
 				/* Urgh. Resume and pretend we weren't here. */
 				/* FIXME - is there a way to verify resume? */
-				cfi_write(map, CMD(0x30), adr);
+				cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
 				chip->state = FL_ERASING;
 				chip->oldstate = FL_READY;
 				printk(KERN_ERR "Chip not ready after erase "
@@ -562,7 +569,7 @@
 	switch(chip->oldstate) {
 	case FL_ERASING:
 		chip->state = chip->oldstate;
-		cfi_write(map, CMD(0x30), adr);
+		cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
@@ -1507,7 +1514,8 @@
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
-	
+        chip->in_progress_block_addr = adr;
+
 	cfi_spin_unlock(chip->mutex);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout((chip->erase_time*HZ)/(2*1000));
@@ -1739,6 +1747,7 @@
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
+        chip->in_progress_block_addr = adr;
 	
 	cfi_spin_unlock(chip->mutex);
 	set_current_state(TASK_UNINTERRUPTIBLE);
Index: linux-2.4.21/include/linux/mtd/flashchip.h
===================================================================
--- linux-2.4.21.orig/include/linux/mtd/flashchip.h	2003-12-11 11:19:59.000000000 +0000
+++ linux-2.4.21/include/linux/mtd/flashchip.h	2003-12-11 15:09:22.000000000 +0000
@@ -61,6 +61,7 @@
 
 	int write_suspended:1;
 	int erase_suspended:1;
+        unsigned long in_progress_block_addr;
 
 	spinlock_t *mutex;
 	spinlock_t _spinlock; /* We do it like this because sometimes they'll be shared. */

--------------080508010503090208040802--
