Received: from mail-yk0-f181.google.com ([209.85.160.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwTYg-0004Gz-TS
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 10:22:51 +0000
Received: by mail-yk0-f181.google.com with SMTP id 142so7699539ykq.26
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 02:22:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 10/11] mtd: st_spi_fsm: Provide mask to obtain
 correct boot device pins
Date: Thu,  4 Dec 2014 10:21:51 +0000
Message-Id: <1417688512-7644-11-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
References: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org,
 Christophe Kerello <christophe.kerello@st.com>, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Christophe Kerello <christophe.kerello@st.com>

This patch adds a mask to be able to get the right boot device selection.

For example:
    for STiH415, value = SYSTEM_STATUS398[4:0]
    for STiH416, value = SYSTEM_STATUS2598[4:0]
    for STiH407, value = SYSTEM_STATUS5561[6:2]

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 18f6f0b..f992f00 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2123,6 +2123,7 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 	struct regmap *regmap;
 	uint32_t boot_device_reg;
 	uint32_t boot_device_spi;
+	uint32_t boot_device_msk;
 	uint32_t boot_device;     /* Value we read from *boot_device_reg */
 	int ret;
 
@@ -2147,10 +2148,17 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 	if (ret)
 		goto boot_device_fail;
 
+	/* Mask to apply on boot_device_reg */
+	ret = of_property_read_u32(np, "st,boot-device-msk", &boot_device_msk);
+	if (ret)
+		goto boot_device_fail;
+
 	ret = regmap_read(regmap, boot_device_reg, &boot_device);
 	if (ret)
 		goto boot_device_fail;
 
+	boot_device &= boot_device_msk;
+
 	if (boot_device != boot_device_spi)
 		fsm->booted_from_spi = false;
 
-- 
1.9.1
