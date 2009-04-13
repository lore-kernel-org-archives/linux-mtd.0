Received: from relay.pcl-ipout01.plus.net ([212.159.7.99])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtN7S-0005kl-Rq
	for linux-mtd@lists.infradead.org; Mon, 13 Apr 2009 14:26:54 +0000
Date: Mon, 13 Apr 2009 15:26:33 +0100
From: Peter Horton <zero@colonel-panic.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix timeout in M25P80 driver
Message-ID: <20090413142633.GA1560@sloth.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org
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
--- linux-2.6.29-git12.orig/drivers/mtd/devices/m25p80.c	2009-04-12 21:41:16.000000000 +0000
+++ linux-2.6.29-git12/drivers/mtd/devices/m25p80.c	2009-04-12 21:43:01.000000000 +0000
@@ -54,7 +54,7 @@
 #define	SR_SRWD			0x80	/* SR write protect */
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_COUNT	100000
+#define	MAX_READY_WAIT_JIFFIES	(10 * HZ)	/* eg. M25P128 specs 6s max sector erase */
 #define	CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
@@ -145,20 +145,20 @@
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
+	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
+
+	do {
 		if ((sr = read_sr(flash)) < 0)
 			break;
 		else if (!(sr & SR_WIP))
 			return 0;
 
-		/* REVISIT sometimes sleeping would be best */
-	}
+		cond_resched();
+
+	} while (!time_after_eq(jiffies, deadline));
 
 	return 1;
 }
