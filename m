Received: from mail-yk0-f179.google.com ([209.85.160.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0UJi-0000WN-Lv
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 12:00:01 +0000
Received: by mail-yk0-f179.google.com with SMTP id 19so4835839ykq.24
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 03:59:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH v3 04/13] mtd: st_spi_fsm: Fetch boot device locations from DT
 match tables
Date: Mon, 15 Dec 2014 11:59:11 +0000
Message-Id: <1418644760-18773-5-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
Cc: lee.jones@linaro.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To trim down on the amount of properties used by this driver and to conform
to the newly agreed method of acquiring syscfg registers/offsets, we now
obtain this information using match tables.

In the process we are deprecating the old generic compatible string and
providing 3 shiny new ones for each of the support platforms.  The
deprecated compatible string will be removed in due course.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 75 ++++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index fac0fe9..d82394a 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -29,6 +29,21 @@
 #include "serial_flash_cmds.h"
 
 /*
+ * FSM SPI Boot Mode Registers/Masks
+ */
+#define STID127_SYSCON_BOOT_DEV_REG	0x0D8
+#define STID127_SYSCON_BOOT_DEV_SPI	0x068
+#define STID127_SYSCON_BOOT_DEV_MASK	0x07C
+
+#define STIH407_SYSCON_BOOT_DEV_REG	0x8C4
+#define STIH407_SYSCON_BOOT_DEV_SPI	0x068
+#define STIH407_SYSCON_BOOT_DEV_MASK	0x07C
+
+#define STIH416_SYSCON_BOOT_DEV_REG	0x958
+#define STIH416_SYSCON_BOOT_DEV_SPI	0x01A
+#define STIH416_SYSCON_BOOT_DEV_MASK	0x01F
+
+/*
  * FSM SPI Controller Registers
  */
 #define SPI_CLOCKDIV			0x0010
@@ -288,6 +303,12 @@ struct seq_rw_config {
 	uint8_t         dummy_cycles;   /* No. of DUMMY cycles */
 };
 
+struct stfsm_boot_dev {
+	uint32_t		reg;
+	uint32_t		spi;
+	uint32_t		mask;
+};
+
 /* SPI Flash Device Table */
 struct flash_info {
 	char            *name;
@@ -313,6 +334,24 @@ struct flash_info {
 	int             (*config)(struct stfsm *);
 };
 
+static struct stfsm_boot_dev stfsm_stid127_data = {
+	.reg  = STID127_SYSCON_BOOT_DEV_REG,
+	.spi  = STID127_SYSCON_BOOT_DEV_SPI,
+	.mask = STID127_SYSCON_BOOT_DEV_MASK,
+};
+
+static struct stfsm_boot_dev stfsm_stih407_data = {
+	.reg  = STIH407_SYSCON_BOOT_DEV_REG,
+	.spi  = STIH407_SYSCON_BOOT_DEV_SPI,
+	.mask = STIH407_SYSCON_BOOT_DEV_MASK,
+};
+
+static struct stfsm_boot_dev stfsm_stih416_data = {
+	.reg  = STIH416_SYSCON_BOOT_DEV_REG,
+	.spi  = STIH416_SYSCON_BOOT_DEV_SPI,
+	.mask = STIH416_SYSCON_BOOT_DEV_MASK,
+};
+
 static int stfsm_n25q_config(struct stfsm *fsm);
 static int stfsm_mx25_config(struct stfsm *fsm);
 static int stfsm_s25fl_config(struct stfsm *fsm);
@@ -1977,14 +2016,23 @@ static int stfsm_init(struct stfsm *fsm)
 	return 0;
 }
 
+static const struct of_device_id stfsm_match[] = {
+	{ .compatible = "st,spi-fsm" }, /* DEPRECATED */
+	{ .compatible = "st,stid127-spi-fsm", .data = &stfsm_stid127_data },
+	{ .compatible = "st,stih407-spi-fsm", .data = &stfsm_stih407_data },
+	{ .compatible = "st,stih416-spi-fsm", .data = &stfsm_stih416_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, stfsm_match);
+
 static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 {
 	struct stfsm *fsm = platform_get_drvdata(pdev);
 	struct device_node *np = pdev->dev.of_node;
+	const struct stfsm_boot_dev *boot_dev;
+	const struct of_device_id *match;
 	struct regmap *regmap;
-	uint32_t boot_device_reg;
-	uint32_t boot_device_spi;
-	uint32_t boot_device;     /* Value we read from *boot_device_reg */
+	uint32_t boot_device;    /* Value we read from the boot dev mode pins */
 	int ret;
 
 	/* Booting from SPI NOR Flash is the default */
@@ -1998,21 +2046,18 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 
 	fsm->reset_por = of_property_read_bool(np, "st,reset-por");
 
-	/* Where in the syscon the boot device information lives */
-	ret = of_property_read_u32(np, "st,boot-device-reg", &boot_device_reg);
-	if (ret)
+	match = of_match_node(stfsm_match, np);
+	if (!match)
 		goto boot_device_fail;
+	boot_dev = match->data;
 
-	/* Boot device value when booted from SPI NOR */
-	ret = of_property_read_u32(np, "st,boot-device-spi", &boot_device_spi);
+	ret = regmap_read(regmap, boot_dev->reg, &boot_device);
 	if (ret)
 		goto boot_device_fail;
 
-	ret = regmap_read(regmap, boot_device_reg, &boot_device);
-	if (ret)
-		goto boot_device_fail;
+	boot_device &= boot_dev->mask;
 
-	if (boot_device != boot_device_spi)
+	if (boot_device != boot_dev->spi)
 		fsm->booted_from_spi = false;
 
 	return;
@@ -2156,12 +2201,6 @@ static int stfsmfsm_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
 
-static const struct of_device_id stfsm_match[] = {
-	{ .compatible = "st,spi-fsm", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, stfsm_match);
-
 static struct platform_driver stfsm_driver = {
 	.probe		= stfsm_probe,
 	.remove		= stfsm_remove,
-- 
1.9.1
