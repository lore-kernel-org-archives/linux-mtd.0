Received: from bitbox.plus.com ([81.174.226.42] helo=pangolin.localnet)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq0m4-0002w3-Em
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 07:58:51 +0000
Date: Sat, 4 Apr 2009 08:31:55 +0100
From: Peter Horton <zero@colonel-panic.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix erase timeout in M25P80 driver
Message-ID: <20090404073155.GA12392@turtle.localnet>
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

The M25P80 driver erase operations timeout when using a M25P128 part with a
Marvell Kirkwood (ARM) processor. Change the timeout from a simple loop count
to a time based timeout. Also added a conditional schedule() in the loop.

Signed-off-by: Peter Horton <zero@colonel-panic.org>
Tested-by: Martin Michlmayr <tbm@cyrius.com>

--- linux-2.6.29-git8.orig/drivers/mtd/devices/m25p80.c	2009-03-23 23:12:14.000000000 +0000
+++ linux-2.6.29-git8/drivers/mtd/devices/m25p80.c	2009-04-02 20:37:47.000000000 +0100
@@ -54,7 +54,7 @@
 #define	SR_SRWD			0x80	/* SR write protect */
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_COUNT	100000
+#define	MAX_READY_WAIT_TIMEOUT	7000	/* ms - M25P128 max is 6s */
 #define	CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
@@ -145,19 +145,25 @@
  */
 static int wait_till_ready(struct m25p *flash)
 {
-	int count;
+#	define DIV_U(n,d)		(((n)+(d)-1)/(d))
+
+	unsigned long deadline;
 	int sr;
 
-	/* one chip guarantees max 5 msec wait here after page writes,
-	 * but potentially three seconds (!) after page erase.
+	deadline = jiffies + DIV_U(MAX_READY_WAIT_TIMEOUT * HZ, 1000);
+
+	/* this can take a long time for sector erase.
+	 * we should probably have a separate timeout
+	 * for program and erase and we should check
+	 * for signals ...
 	 */
-	for (count = 0; count < MAX_READY_WAIT_COUNT; count++) {
+	while (!time_after_eq(jiffies, deadline)) {
 		if ((sr = read_sr(flash)) < 0)
 			break;
 		else if (!(sr & SR_WIP))
 			return 0;
 
-		/* REVISIT sometimes sleeping would be best */
+		cond_resched();
 	}
 
 	return 1;
