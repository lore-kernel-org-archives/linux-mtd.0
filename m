Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anX0s-0006LG-9Z
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 19:51:48 +0000
Received: by mail-qg0-x22a.google.com with SMTP id j35so19426552qge.0
 for <linux-mtd@lists.infradead.org>; Tue, 05 Apr 2016 12:51:25 -0700 (PDT)
Date: Tue, 5 Apr 2016 16:51:20 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Subject: nand-disk LED trigger: to remove, or not to remove
Message-ID: <20160405195120.GA6111@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Due to the way the 'nand-disk' LED trigger is implemented,
it currently does not work correctly for all NAND drivers.

This is somewhat related to an old thread, where we discussed
the addition of an "mtd" LED trigger. See:

  http://www.spinics.net/lists/linux-leds/msg01181.html

My question is:

 * given that nobody has complained about "nand-disk"
   working on just some NAND drivers, and...
 * given that nobody has complained (except that 2013 patch)
   about lacking a generic MTD LED trigger...

Does it make any sense to have such a trigger at all?
In other words, should we simply get rid of "nand-disk" trigger?

In case the answer is "We want to keep some LED trigger",
then here's a patch for you to f̶l̶a̶m̶e̶  review:

>From 88c7102bb67056b443da323bd3e28b60aca948a2 Mon Sep 17 00:00:00 2001
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 2 Apr 2016 18:35:50 -0300
Subject: [PATCH] leds: trigger: Introduce a MTD (NAND/NOR) trigger

This commit introduces a MTD trigger for flash (NAND/NOR) device
activity. The implementation is copied from IDE disk.

This deprecates the "nand-disk" LED trigger, but for backwards
compatibility, we still keep the "nand-disk" trigger around.

The motivation for deprecating the "nand-disk" LED trigger is that
it only works for NAND drivers, whereas the "mtd" LED trigger
is more generic (in fact, "nand-disk" currently only works for
certain NAND drivers).

  TODO: Measure how the trigger affects MTD I/O performance.
  It should be cheap because the blink is deferred, but still
  it makes sense to provide some hard numbers.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 48 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              |  4 ++++
 drivers/mtd/nand/nand_base.c       | 29 +----------------------
 include/linux/leds.h               |  6 +++++
 6 files changed, 68 insertions(+), 28 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 554f5bfbeced..b7044a0530c7 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -115,4 +115,12 @@ config LEDS_TRIGGER_PANIC
 	  This allows LEDs to be configured to blink on a kernel panic.
 	  If unsure, say Y.
 
+config LEDS_TRIGGER_MTD
+	bool "LED MTD (NAND/NOR) Trigger"
+	depends on MTD
+	depends on LEDS_TRIGGERS
+	help
+	  This allows LEDs to be controlled by MTD activity.
+	  If unsure, say N.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 547bf5c80e52..80e32add3b07 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
+obj-$(CONFIG_LEDS_TRIGGER_MTD)		+= ledtrig-mtd.o
diff --git a/drivers/leds/trigger/ledtrig-mtd.c b/drivers/leds/trigger/ledtrig-mtd.c
new file mode 100644
index 000000000000..badf72aa1f5f
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-mtd.c
@@ -0,0 +1,48 @@
+/*
+ * LED MTD trigger
+ *
+ * Copyright 2016 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+ *
+ * Based on LED IDE-Disk Activity Trigger
+ *
+ * Copyright 2006 Openedhand Ltd.
+ *
+ * Author: Richard Purdie <rpurdie@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+
+#define BLINK_DELAY 30
+
+DEFINE_LED_TRIGGER(ledtrig_mtd);
+DEFINE_LED_TRIGGER(ledtrig_nand);
+static unsigned long blink_delay = BLINK_DELAY;
+
+void ledtrig_mtd_activity(void)
+{
+	led_trigger_blink_oneshot(ledtrig_nand,
+				  &blink_delay, &blink_delay, 0);
+	led_trigger_blink_oneshot(ledtrig_mtd,
+				  &blink_delay, &blink_delay, 0);
+}
+EXPORT_SYMBOL(ledtrig_mtd_activity);
+
+static int __init ledtrig_mtd_init(void)
+{
+	/* For backwards compatibility, we need to keep the nand-disk
+	 * trigger around. Users are encouraged to switch to the
+	 * "mtd" trigger.
+	 */
+	led_trigger_register_simple("nand-disk", &ledtrig_nand);
+	led_trigger_register_simple("mtd", &ledtrig_mtd);
+
+	return 0;
+}
+device_initcall(ledtrig_mtd_init);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 309625130b21..5c35a76faff0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/kconfig.h>
+#include <linux/leds.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -862,6 +863,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		mtd_erase_callback(instr);
 		return 0;
 	}
+	ledtrig_mtd_activity();
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -925,6 +927,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	if (!len)
 		return 0;
 
+	ledtrig_mtd_activity();
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
@@ -949,6 +952,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	ledtrig_mtd_activity();
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b6facac54fc0..8d6287ef3926 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -43,7 +43,6 @@
 #include <linux/mtd/nand_bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
-#include <linux/leds.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_mtd.h>
@@ -97,12 +96,6 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
-/*
- * For devices which display every fart in the system on a separate LED. Is
- * compiled away when LED support is disabled.
- */
-DEFINE_LED_TRIGGER(nand_led_trigger);
-
 static int check_offs_len(struct mtd_info *mtd,
 					loff_t ofs, uint64_t len)
 {
@@ -540,19 +533,16 @@ void nand_wait_ready(struct mtd_info *mtd)
 	if (in_interrupt() || oops_in_progress)
 		return panic_nand_wait_ready(mtd, timeo);
 
-	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* Wait until command is processed or timeout occurs */
 	timeo = jiffies + msecs_to_jiffies(timeo);
 	do {
 		if (chip->dev_ready(mtd))
-			goto out;
+			return;
 		cond_resched();
 	} while (time_before(jiffies, timeo));
 
 	if (!chip->dev_ready(mtd))
 		pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
-out:
-	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
 
@@ -885,8 +875,6 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	int status;
 	unsigned long timeo = 400;
 
-	led_trigger_event(nand_led_trigger, LED_FULL);
-
 	/*
 	 * Apply this short delay always to ensure that we do wait tWB in any
 	 * case on any machine.
@@ -910,7 +898,6 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			cond_resched();
 		} while (time_before(jiffies, timeo));
 	}
-	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
 	/* This can happen if in case of timeout or buggy dev_ready */
@@ -4474,20 +4461,6 @@ void nand_release(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
-static int __init nand_base_init(void)
-{
-	led_trigger_register_simple("nand-disk", &nand_led_trigger);
-	return 0;
-}
-
-static void __exit nand_base_exit(void)
-{
-	led_trigger_unregister_simple(nand_led_trigger);
-}
-
-module_init(nand_base_init);
-module_exit(nand_base_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
 MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f203a8f89d30..19eb10278bea 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -329,6 +329,12 @@ extern void ledtrig_ide_activity(void);
 static inline void ledtrig_ide_activity(void) {}
 #endif
 
+#ifdef CONFIG_LEDS_TRIGGER_MTD
+extern void ledtrig_mtd_activity(void);
+#else
+static inline void ledtrig_mtd_activity(void) {}
+#endif
+
 #if defined(CONFIG_LEDS_TRIGGER_CAMERA) || defined(CONFIG_LEDS_TRIGGER_CAMERA_MODULE)
 extern void ledtrig_flash_ctrl(bool on);
 extern void ledtrig_torch_ctrl(bool on);
-- 
2.7.0


-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
