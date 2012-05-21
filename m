Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWOCR-0006Uk-JB
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 08:42:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 0C52E1672CB
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:41 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id y2tVRv1OZ75g for <linux-mtd@lists.infradead.org>;
 Mon, 21 May 2012 10:42:39 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by ra.se.axis.com (Postfix) with ESMTP id 781441672C7
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by thoth.se.axis.com (Postfix) with ESMTP id 7606C34E78
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
Date: Mon, 21 May 2012 10:42:38 +0200
Message-ID: <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
In-Reply-To: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: jespern@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previous, jiffy-based, implementation had three issues:

1. For low HZ values (<100 and >=50) the timeout would be 1 jiffy,
   which can cause premature timeouts if a timer interrupt happens
   right after the "timeo" value is assigned.
2. For very low HZ values (<50) the timeout is 0 jiffies, which also
   cause premature timeouts.
3. The jiffies counter is not reliable on multicore systems when
   interrupts are disabled for long times (a couple of timer interrupt
   periods). For example with excessive printk and serial output in
   interrupt context. The jiffies counting stops during the period
   with disabled interrupts and recovers by counting up all lost jiffy
   increments very, very fast when interrupts are later enabled. This,
   together with bad luck, can cause a third type of premature
   timeouts.

All three issues can cause good blocks being marked bad.

Signed-off-by: Johan Gunnarsson <johan.gunnarsson@axis.com>
---
 drivers/mtd/nand/nand_base.c |   36 ++++++++++++++++++++++++++++++------
 1 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b927e64..0db920b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,6 +47,7 @@
 #include <linux/bitops.h>
 #include <linux/leds.h>
 #include <linux/io.h>
+#include <linux/hrtimer.h>
 #include <linux/mtd/partitions.h>
 
 /* Define default oob placement schemes for large and small page devices */
@@ -99,6 +100,13 @@ static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
+/**
+ * NOP nand_wait timeout callback.
+ */
+static enum hrtimer_restart nand_wait_timeout_callback(struct hrtimer* timer) {
+	return HRTIMER_NORESTART;
+}
+
 /*
  * For devices which display every fart in the system on a separate LED. Is
  * compiled away when LED support is disabled.
@@ -533,19 +541,29 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	struct hrtimer timer;
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
 		return panic_nand_wait_ready(mtd, 400);
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
+
+	/* Arm timeout timer for 20ms timeout */
+	hrtimer_init(&timer, CLOCK_REALTIME, HRTIMER_MODE_REL);
+	timer.function = nand_wait_timeout_callback;
+	hrtimer_start(&timer, ns_to_ktime(20 * 1000 * 1000),
+	              HRTIMER_MODE_REL);
+
 	/* Wait until command is processed or timeout occurs */
 	do {
 		if (chip->dev_ready(mtd))
 			break;
 		touch_softlockup_watchdog();
-	} while (time_before(jiffies, timeo));
+	} while (ktime_to_ns(hrtimer_get_expires(&timer)) > 0);
+
+	hrtimer_cancel(&timer);
+
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
@@ -868,7 +886,6 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
 	unsigned long timeout_ms;
-	unsigned long timeo = jiffies;
 	int status, state = chip->state;
 
 	if (state == FL_ERASING)
@@ -876,8 +893,6 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	else
 		timeout_ms = 20;
 
-	timeo += (HZ * timeout_ms) / 1000;
-
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
 	/*
@@ -894,7 +909,14 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	if (in_interrupt() || oops_in_progress)
 		panic_nand_wait(mtd, chip, timeout_ms);
 	else {
-		while (time_before(jiffies, timeo)) {
+		struct hrtimer timer;
+
+		hrtimer_init(&timer, CLOCK_REALTIME, HRTIMER_MODE_REL);
+		timer.function = nand_wait_timeout_callback;
+		hrtimer_start(&timer, ns_to_ktime(timeout_ms * 1000 * 1000),
+		              HRTIMER_MODE_REL);
+
+		while(ktime_to_ns(hrtimer_get_expires(&timer)) > 0) {
 			if (chip->dev_ready) {
 				if (chip->dev_ready(mtd))
 					break;
@@ -904,6 +926,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			}
 			cond_resched();
 		}
+
+		hrtimer_cancel(&timer);
 	}
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
-- 
1.7.2.5
