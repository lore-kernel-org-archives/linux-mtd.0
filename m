Received: from moutng.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjAau-0005l3-GN
 for linux-mtd@lists.infradead.org; Sun, 02 Jun 2013 15:53:21 +0000
Message-ID: <51AB6A69.9080004@efe-gmbh.de>
Date: Sun, 02 Jun 2013 17:53:13 +0200
From: "Jens Renner (EFE)" <renner@efe-gmbh.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: Add LED trigger support "mtd-disk" to indicate
 activity
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Register a MTD LED trigger called "mtd-disk" (similar to the "ide-disk" and
"nand-disk" triggers) to indicate read / write / erase acitivity. Panic writes
and OOB reads / writes are not covered as of now. The trigger is global as it
does not discriminate between individual devices or partitions.
The patch uses the generic LED trigger interface which can be configured via
SYSFS (/sys/class/leds/<name>/trigger) or DTS file entry for "gpio-leds"
(linux,default-trigger = "mtd-disk").

Since the MTD framework is independant of the memory devices, driver-specific
LED triggers like "nand-disk" will indicate a subset of all MTD activity.

Tested on Microblaze architecture with Micron N25Q256A serial flash.
Added a bit of documentation (including other new LED triggers).

Signed-off-by: Jens Renner <renner at efe-gmbh.de>
---
Changes in v2:
- fix whitespace problem

 drivers/mtd/mtdcore.c                                          |   25 ++++++++++++++++++--
 Documentation/devicetree/bindings/leds/common.txt              |    4 ++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c400c57..fbf1ed8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,6 +37,7 @@
 #include <linux/backing-dev.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/leds.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -100,6 +101,8 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
+DEFINE_LED_TRIGGER(mtd_led_trigger);
+
 /* REVISIT once MTD uses the driver model better, whoever allocates
  * the mtd_info will probably want to use the release() hook...
  */
@@ -727,6 +730,7 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  */
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
+	int ret_code;
 	if (instr->addr > mtd->size || instr->len > mtd->size - instr->addr)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -737,7 +741,11 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		mtd_erase_callback(instr);
 		return 0;
 	}
-	return mtd->_erase(mtd, instr);
+	led_trigger_event(mtd_led_trigger, LED_FULL);
+	ret_code = mtd->_erase(mtd, instr);
+	led_trigger_event(mtd_led_trigger, LED_OFF);
+
+	return ret_code;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
 
@@ -800,12 +808,17 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	if (!len)
 		return 0;
 
+	led_trigger_event(mtd_led_trigger, LED_FULL);
+
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
 	 * any one ecc region (if applicable; zero otherwise).
 	 */
 	ret_code = mtd->_read(mtd, from, len, retlen, buf);
+
+	led_trigger_event(mtd_led_trigger, LED_OFF);
+
 	if (unlikely(ret_code < 0))
 		return ret_code;
 	if (mtd->ecc_strength == 0)
@@ -817,6 +830,7 @@ EXPORT_SYMBOL_GPL(mtd_read);
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
 {
+	int ret_code;
 	*retlen = 0;
 	if (to < 0 || to > mtd->size || len > mtd->size - to)
 		return -EINVAL;
@@ -824,7 +838,11 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
-	return mtd->_write(mtd, to, len, retlen, buf);
+	led_trigger_event(mtd_led_trigger, LED_FULL);
+	ret_code = mtd->_write(mtd, to, len, retlen, buf);
+	led_trigger_event(mtd_led_trigger, LED_OFF);
+
+	return ret_code;
 }
 EXPORT_SYMBOL_GPL(mtd_write);
 
@@ -1187,6 +1205,8 @@ static int __init init_mtd(void)
 	if (ret)
 		goto out_procfs;
 
+	led_trigger_register_simple("mtd-disk", &mtd_led_trigger);
+
 	return 0;
 
 out_procfs:
@@ -1205,6 +1225,7 @@ err_reg:
 
 static void __exit cleanup_mtd(void)
 {
+	led_trigger_unregister_simple(mtd_led_trigger);
 	cleanup_mtdchar();
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 2d88816..9875cd2 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -12,6 +12,10 @@ Optional properties for child nodes:
 		    property in Documentation/devicetree/bindings/gpio/led.txt)
      "heartbeat" - LED "double" flashes at a load average based rate
      "ide-disk" - LED indicates disk activity
+     "mtd-disk" - LED indicates MTD activity
+     "nand-disk" - LED indicates NAND activity
+     "mmc<n>" - LED indicates activity of SD/MMC #n (e.g. "mmc0")
+     "cpu<n>" - LED indicates activity of CPU #n (e.g. "cpu0")
      "timer" - LED flashes at a fixed, configurable rate
 
 Examples:
