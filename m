Received: from bitbox.plus.com ([81.174.226.42] helo=pangolin.localnet)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq72V-0008Dj-Hz
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 14:40:14 +0000
Date: Sat, 4 Apr 2009 15:38:48 +0100
From: Peter Horton <zero@colonel-panic.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix erase timeout in M25P80 driver
Message-ID: <20090404143848.GA13480@turtle.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tbm@cyrius.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Extend erase timeout in M25P80 SPI Flash driver.

The M25P80 drivers fails erasing sectors on a M25P128 because the ready
wait timeout is too short. Change the timeout from a simple loop count to a
suitable number of seconds.

Signed-off-by: Peter Horton <zero@colonel-panic.org>
---
Index: linux-2.6.29-git12/drivers/mtd/devices/m25p80.c
===================================================================
--- linux-2.6.29-git12.orig/drivers/mtd/devices/m25p80.c	2009-04-04 21:05:44.000000000 +0000
+++ linux-2.6.29-git12/drivers/mtd/devices/m25p80.c	2009-04-04 21:40:06.000000000 +0000
@@ -54,7 +54,7 @@
 #define	SR_SRWD			0x80	/* SR write protect */
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_COUNT	100000
+#define	MAX_READY_WAIT_JIFFIES	(10 * HZ)	/* eg. M25P128 specs 6s max sector erase */
 #define	CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
@@ -145,19 +145,16 @@
  */
 static int wait_till_ready(struct m25p *flash)
 {
-	int count;
+	unsigned long deadline;
 	int sr;
 
-	/* one chip guarantees max 5 msec wait here after page writes,
-	 * but potentially three seconds (!) after page erase.
-	 */
-	for (count = 0; count < MAX_READY_WAIT_COUNT; count++) {
+	for (deadline = jiffies + MAX_READY_WAIT_JIFFIES; !time_after_eq(jiffies, deadline);) {
 		if ((sr = read_sr(flash)) < 0)
 			break;
 		else if (!(sr & SR_WIP))
 			return 0;
 
-		/* REVISIT sometimes sleeping would be best */
+		cond_resched();
 	}
 
 	return 1;
