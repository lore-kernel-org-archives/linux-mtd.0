Received: from mail-we0-f179.google.com ([74.125.82.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqsb-0008TW-QA
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:42 +0000
Received: by mail-we0-f179.google.com with SMTP id x48so1339096wes.10
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:40:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/15] mtd: st_spi_fsm: Provide mask to obtain correct boot
 device pins
Date: Wed, 26 Mar 2014 16:39:28 +0000
Message-Id: <1395851969-13520-15-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, Christophe Kerello <christophe.kerello@st.com>,
 kernel@stlinux.com, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org
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
index 9e00173..3ab27c8 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2159,6 +2159,7 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 	struct regmap *regmap;
 	uint32_t boot_device_reg;
 	uint32_t boot_device_spi;
+	uint32_t boot_device_msk;
 	uint32_t boot_device;     /* Value we read from *boot_device_reg */
 	int ret;
 
@@ -2183,10 +2184,17 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
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
1.8.3.2
