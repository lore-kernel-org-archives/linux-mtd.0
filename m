Received: from samwise.efn.org ([12.33.21.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ITM2k-0001SD-Eo
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 14:25:35 -0400
Received: from amazonia.comcast.net (c-67-171-210-85.hsd1.or.comcast.net
	[67.171.210.85])
	by samwise.efn.org (Postfix) with ESMTP id 083CC170083
	for <linux-mtd@lists.infradead.org>;
	Thu,  6 Sep 2007 11:06:26 -0700 (PDT)
Received: from rick by amazonia.comcast.net with local (Exim 3.36 #1 (Debian))
	id 1ITLkE-0002LI-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2007 11:06:22 -0700
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Prevents NAND subsystem from hogging the CPU.
Message-Id: <E1ITLkE-0002LI-00@amazonia.comcast.net>
From: Rick Bronson <rick@efn.org>
Date: Thu, 06 Sep 2007 11:06:22 -0700
Reply-To: rick@efn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  This is my first patch for mtd so bear with me...  sorry if I missed
something.

[PATCH] [MTD] NAND: Prevents NAND subsystem from hogging the
CPU waiting for ready line.

This patch prevents the nand_wait_ready chip from using too much
CPU time.  This was causing very long thread latencies.  The
solution, which is used elsewhere in this same file, is to call
cond_resched() in the wait loop.

[From: Rick Bronson <rick@efn.org>]
[Acked-by: Realname <realmail>]
Signed-off-by: Realname <realmail>


diff -ruN mtd-2.6.orig/drivers/mtd/nand/nand_base.c mtd-2.6/drivers/mtd/nand/nand_base.c
--- mtd-2.6.orig/drivers/mtd/nand/nand_base.c   2007-09-06 07:46:18.000000000 -0700
+++ mtd-2.6/drivers/mtd/nand/nand_base.c        2007-09-06 08:31:20.000000000 -0700
@@ -429,6 +429,7 @@
                if (chip->dev_ready(mtd))
                        break;
                touch_softlockup_watchdog();
+               cond_resched();  /* let others run */
        } while (time_before(jiffies, timeo));
        led_trigger_event(nand_led_trigger, LED_OFF);
 }
