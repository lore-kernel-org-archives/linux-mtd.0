Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al3jn-0008G2-PS
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 10:12:59 +0000
Message-ID: <4014E81E.4090808@arcom.com>
Date: Mon, 26 Jan 2004 10:12:46 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Linux MTD List <linux-mtd@lists.infradead.org>
References: <3FD998F6.9000303@arcom.com> <3FDDD939.8030302@arcom.com>
In-Reply-To: <3FDDD939.8030302@arcom.com>
Content-Type: multipart/mixed;
 boundary="------------040908040503010007070805"
Subject: Re: cfi_cmdset_0002 -- erase suspends broken.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040908040503010007070805
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

David Vrabel wrote:
>
> The problem with the occasional bit errors appears to only occur when 
> the erase is suspended for a write so I've temporarily disabled that.

Seems I left the patch off that does this.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
--------------040908040503010007070805
Content-Type: text/plain;
 name="mtd-cfi_cmdset_0002.c-erase-suspend-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-cfi_cmdset_0002.c-erase-suspend-fix.patch"

%patch
Index: linux-2.4.21/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.4.21.orig/drivers/mtd/chips/cfi_cmdset_0002.c	2003-12-11 15:03:06.000000000 +0000
+++ linux-2.4.21/drivers/mtd/chips/cfi_cmdset_0002.c	2003-12-15 15:34:01.000000000 +0000
@@ -500,27 +500,37 @@
 		return 0;
 
 	case FL_ERASING:
+                if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
+                        goto sleep;
+
 		if (!(mode == FL_READY || mode == FL_POINT
 		      || (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))
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
+			if (((oldstatus ^ status) & dq6) == 0)
 			        break;
 
 			if (time_after(jiffies, timeo)) {
 				/* Urgh. Resume and pretend we weren't here. */
 				/* FIXME - is there a way to verify resume? */
-				cfi_write(map, CMD(0x30), adr);
+				cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
 				chip->state = FL_ERASING;
 				chip->oldstate = FL_READY;
 				printk(KERN_ERR "Chip not ready after erase "
@@ -534,7 +544,7 @@
 			/* Nobody will touch it while it's in state FL_ERASE_SUSPENDING.
 			   So we can just loop here. */
 		}
-		chip->state = FL_STATUS;
+		chip->state = FL_READY;
 		return 0;
 
 	case FL_POINT:
@@ -562,7 +572,7 @@
 	switch(chip->oldstate) {
 	case FL_ERASING:
 		chip->state = chip->oldstate;
-		cfi_write(map, CMD(0x30), adr);
+		cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
@@ -1507,7 +1517,8 @@
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
-	
+        chip->in_progress_block_addr = adr;
+
 	cfi_spin_unlock(chip->mutex);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout((chip->erase_time*HZ)/(2*1000));
@@ -1739,6 +1750,7 @@
 
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

--------------040908040503010007070805--
