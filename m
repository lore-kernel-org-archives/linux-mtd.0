Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDZ1b-0000hT-Sr
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 13:39:21 +0000
From: Niklas Cassel <niklas.cassel@axis.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: use hrtimer to measure timeout in nand_wait{_ready}
Date: Tue, 20 Jan 2015 14:38:04 +0100
Message-ID: <1421761084-3825-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Niklas Cassel <niklass@axis.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
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
2. For very low HZ values the timeout is 0 jiffies, which also causes
   premature timeouts.
3. The jiffies counter is not reliable on multicore systems when
   interrupts are disabled for long times (a couple of timer interrupt
   periods). For example with excessive printk and serial output in
   interrupt context. The jiffies counting stops during the period
   with disabled interrupts and recovers by counting up all lost jiffy
   increments very, very fast when interrupts are later enabled. This,
   together with bad luck, can cause a third type of premature
   timeouts.

All three issues can cause good blocks being marked bad.

Signed-off-by: Niklas Cassel <niklass@axis.com>
---
 drivers/mtd/nand/nand_base.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 816b5c1..2fe1992 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,6 +47,7 @@
 #include <linux/bitops.h>
 #include <linux/leds.h>
 #include <linux/io.h>
+#include <linux/hrtimer.h>
 #include <linux/mtd/partitions.h>
 
 /* Define default oob placement schemes for large and small page devices */
@@ -544,23 +545,41 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 	}
 }
 
+/**
+ * nand_wait_timeout_callback - Called when timeout expires, do nothing.
+ */
+static enum hrtimer_restart nand_wait_timeout_callback(struct hrtimer *timer)
+{
+	return HRTIMER_NORESTART;
+}
+
 /* Wait for the ready pin, after a command. The timeout is caught later. */
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + msecs_to_jiffies(20);
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
+		      HRTIMER_MODE_REL);
+
 	/* Wait until command is processed or timeout occurs */
 	do {
 		if (chip->dev_ready(mtd))
 			break;
 		touch_softlockup_watchdog();
-	} while (time_before(jiffies, timeo));
+	} while (ktime_to_ns(hrtimer_expires_remaining(&timer)) > 0);
+
+	hrtimer_cancel(&timer);
+
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
@@ -890,8 +909,14 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	if (in_interrupt() || oops_in_progress)
 		panic_nand_wait(mtd, chip, timeo);
 	else {
-		timeo = jiffies + msecs_to_jiffies(timeo);
-		while (time_before(jiffies, timeo)) {
+		struct hrtimer timer;
+
+		hrtimer_init(&timer, CLOCK_REALTIME, HRTIMER_MODE_REL);
+		timer.function = nand_wait_timeout_callback;
+		hrtimer_start(&timer, ns_to_ktime(timeo * 1000 * 1000),
+			      HRTIMER_MODE_REL);
+
+		while (ktime_to_ns(hrtimer_expires_remaining(&timer)) > 0) {
 			if (chip->dev_ready) {
 				if (chip->dev_ready(mtd))
 					break;
@@ -901,6 +926,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			}
 			cond_resched();
 		}
+		hrtimer_cancel(&timer);
 	}
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
-- 
2.1.4
