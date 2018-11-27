Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRkN8-0007rR-3m
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 20:54:19 +0000
Received: by mail-lf1-x141.google.com with SMTP id c16so17653596lfj.8
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 12:54:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2 v3] mtd: physmap_of_gemini: Handle pin control
Date: Tue, 27 Nov 2018 21:53:58 +0100
Message-Id: <20181127205358.32502-2-linus.walleij@linaro.org>
In-Reply-To: <20181127205358.32502-1-linus.walleij@linaro.org>
References: <20181127205358.32502-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enables the complex mapping for the Gemini and kicks in
custom read/write functions that will wrap the existing
simple functions in calls to enable/disable the parallel
flash pins using pin controls.

This is necessary on some hardware such as the D-Link
DIR-685 where all flash pins are patched in/out at the same
time, but some of the flash pins are in practice unused by
the flash and have anyway been reused as GPIO.

This concerns specifically CE1 on the Gemini. There is only
one flash chip, so only CE0 is used, and the line for CE1
has been reused as chip select for the emulated SPI port
connected to the display. If we try to use the same lines
for flash and GPIO at the same time, one of them will loose:
the GPIO line will disappear because it gets disconnected
from the pin when the flash group is muxed out.

Fix this by introducing two pin control states named simply
"enabled" and "disabled" and only enable the flash lines
when absolutely necessary (during read/write/copy). This
way, they are available for GPIO at all other times and
the display works.

Collect all the state variables in a struct named
struct gemini_flash and allocate this struct at probe
time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Resend
ChangeLog v1->v2:
- Rebase on latest MTD development branch
---
 drivers/mtd/maps/Kconfig          |   1 +
 drivers/mtd/maps/physmap-gemini.c | 110 +++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 2edd8bcdbe1c..e0cf869c8544 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -88,6 +88,7 @@ config MTD_PHYSMAP_GEMINI
 	bool "Cortina Gemini OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
 	depends on MFD_SYSCON
+	select MTD_COMPLEX_MAPPINGS
 	default ARCH_GEMINI
 	help
 	  This provides some extra DT physmap parsing for the Gemini
diff --git a/drivers/mtd/maps/physmap-gemini.c b/drivers/mtd/maps/physmap-gemini.c
index 1cf128a0526d..60775b208fc9 100644
--- a/drivers/mtd/maps/physmap-gemini.c
+++ b/drivers/mtd/maps/physmap-gemini.c
@@ -10,9 +10,11 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/bitops.h>
+#include <linux/pinctrl/consumer.h>
 #include "physmap-gemini.h"
 
 /*
@@ -44,6 +46,82 @@
 
 #define FLASH_PARALLEL_HIGH_PIN_CNT	(1 << 20)	/* else low pin cnt */
 
+static const struct of_device_id syscon_match[] = {
+	{ .compatible = "cortina,gemini-syscon" },
+	{ },
+};
+
+struct gemini_flash {
+	struct device *dev;
+	struct pinctrl *p;
+	struct pinctrl_state *enabled_state;
+	struct pinctrl_state *disabled_state;
+};
+
+/* Static local state */
+static struct gemini_flash *gf;
+
+static void gemini_flash_enable_pins(void)
+{
+	int ret;
+
+	if (IS_ERR(gf->enabled_state))
+		return;
+	ret = pinctrl_select_state(gf->p, gf->enabled_state);
+	if (ret)
+		dev_err(gf->dev, "failed to enable pins\n");
+}
+
+static void gemini_flash_disable_pins(void)
+{
+	int ret;
+
+	if (IS_ERR(gf->disabled_state))
+		return;
+	ret = pinctrl_select_state(gf->p, gf->disabled_state);
+	if (ret)
+		dev_err(gf->dev, "failed to disable pins\n");
+}
+
+static map_word __xipram gemini_flash_map_read(struct map_info *map,
+					       unsigned long ofs)
+{
+	map_word __xipram ret;
+
+	gemini_flash_enable_pins();
+	ret = inline_map_read(map, ofs);
+	gemini_flash_disable_pins();
+
+	return ret;
+}
+
+static void __xipram gemini_flash_map_write(struct map_info *map,
+					    const map_word datum,
+					    unsigned long ofs)
+{
+	gemini_flash_enable_pins();
+	inline_map_write(map, datum, ofs);
+	gemini_flash_disable_pins();
+}
+
+static void __xipram gemini_flash_map_copy_from(struct map_info *map,
+						void *to, unsigned long from,
+						ssize_t len)
+{
+	gemini_flash_enable_pins();
+	inline_map_copy_from(map, to, from, len);
+	gemini_flash_disable_pins();
+}
+
+static void __xipram gemini_flash_map_copy_to(struct map_info *map,
+					      unsigned long to,
+					      const void *from, ssize_t len)
+{
+	gemini_flash_enable_pins();
+	inline_map_copy_to(map, to, from, len);
+	gemini_flash_disable_pins();
+}
+
 int of_flash_probe_gemini(struct platform_device *pdev,
 			  struct device_node *np,
 			  struct map_info *map)
@@ -57,6 +135,11 @@ int of_flash_probe_gemini(struct platform_device *pdev,
 	if (!of_device_is_compatible(np, "cortina,gemini-flash"))
 		return 0;
 
+	gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
+	if (!gf)
+		return -ENOMEM;
+	gf->dev = dev;
+
 	rmap = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(rmap)) {
 		dev_err(dev, "no syscon\n");
@@ -91,7 +174,32 @@ int of_flash_probe_gemini(struct platform_device *pdev,
 				 map->bankwidth * 8);
 	}
 
-	dev_info(&pdev->dev, "initialized Gemini-specific physmap control\n");
+	gf->p = devm_pinctrl_get(dev);
+	if (IS_ERR(gf->p)) {
+		dev_err(dev, "no pinctrl handle\n");
+		ret = PTR_ERR(gf->p);
+		return ret;
+	}
+
+	gf->enabled_state = pinctrl_lookup_state(gf->p, "enabled");
+	if (IS_ERR(gf->enabled_state))
+		dev_err(dev, "no enabled pin control state\n");
+
+	gf->disabled_state = pinctrl_lookup_state(gf->p, "disabled");
+	if (IS_ERR(gf->enabled_state)) {
+		dev_err(dev, "no disabled pin control state\n");
+	} else {
+		ret = pinctrl_select_state(gf->p, gf->disabled_state);
+		if (ret)
+			dev_err(gf->dev, "failed to disable pins\n");
+	}
+
+	map->read = gemini_flash_map_read;
+	map->write = gemini_flash_map_write;
+	map->copy_from = gemini_flash_map_copy_from;
+	map->copy_to = gemini_flash_map_copy_to;
+
+	dev_info(dev, "initialized Gemini-specific physmap control\n");
 
 	return 0;
 }
-- 
2.19.1
