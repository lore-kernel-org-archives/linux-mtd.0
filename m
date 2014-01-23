Received: from mail-we0-f172.google.com ([74.125.82.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HaT-0007uq-5K
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:32:41 +0000
Received: by mail-we0-f172.google.com with SMTP id q58so954904wes.17
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:32:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 15/37] mtd: st_spi_fsm: Fetch boot-device from mode
 pins
Date: Thu, 23 Jan 2014 10:31:03 +0000
Message-Id: <1390473085-24626-16-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
References: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
Cc: olivier.clergeaud@st.com, Angus.Clark@st.com,
 Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, DCG_UPD_stlinux_kernel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's important for us to determine which device was used to boot from in
order to make some correct decisions surrounding Power Management. On
each of the platforms which support the FSM this is communicated via
a set of mode pins held in the system configuration area. This patch
determine the boot device and stores the result.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 961abfd..94840b5 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -14,7 +14,9 @@
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mtd/mtd.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
@@ -243,6 +245,7 @@ struct stfsm {
 	struct flash_info       *info;
 
 	uint32_t                fifo_dir_delay;
+	bool                    booted_from_spi;
 };
 
 struct stfsm_seq {
@@ -727,10 +730,48 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 {
 	struct stfsm *fsm = platform_get_drvdata(pdev);
 	struct flash_info *info = fsm->info;
+	struct device_node *np = pdev->dev.of_node;
+	struct regmap *regmap;
+	uint32_t boot_device_reg;
+	uint32_t boot_device_spi;
+	uint32_t boot_device;     /* Value we read from *boot_device_reg */
+	int ret;
+
+	/* Booting from SPI NOR Flash is the default */
+	fsm->booted_from_spi = true;
 
 	/* Use device size to determine address width */
 	if (info->sector_size * info->n_sectors > 0xFFFFFF)
 		info->flags |= FLASH_FLAG_32BIT_ADDR;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	if (!IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		goto boot_device_fail;
+	}
+
+	/* Where in the syscon the boot device information lives */
+	ret = of_property_read_u32(np, "st,boot-device-reg", &boot_device_reg);
+	if (ret)
+		goto boot_device_fail;
+
+	/* Boot device value when booted from SPI NOR */
+	ret = of_property_read_u32(np, "st,boot-device-spi", &boot_device_spi);
+	if (ret)
+		goto boot_device_fail;
+
+	ret = regmap_read(regmap, boot_device_reg, &boot_device);
+	if (ret)
+		goto boot_device_fail;
+
+	if (boot_device != boot_device_spi)
+		fsm->booted_from_spi = false;
+
+	return;
+
+boot_device_fail:
+	dev_warn(&pdev->dev,
+		 "failed to fetch boot device, assuming boot from SPI\n");
 }
 
 static int stfsm_probe(struct platform_device *pdev)
-- 
1.8.3.2
