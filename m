Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWk-0002w3-KS
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:24:23 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so1442156pdj.25
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:23:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 13/23] mtd: st_spi_fsm: Fetch platform specific configurations
Date: Fri, 22 Nov 2013 16:22:50 +0000
Message-Id: <1385137380-28968-14-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
References: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All supported platforms are able to pass specific configurations via
the Device Tree on boot. Here we add a function which is to be called
during the probing process which will extract them, or make other
assumptions based on capabilities provided.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 0b32fef..5bced00 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -273,6 +273,15 @@ static int stfsm_init(struct stfsm *fsm)
 	return 0;
 }
 
+static void stfsm_fetch_platform_configs(struct platform_device *pdev)
+{
+	struct stfsm *fsm = platform_get_drvdata(pdev);
+	struct flash_info *info = fsm->info;
+
+	if (info->sector_size * info->n_sectors > 0xFFFFFF)
+		info->flags |= FLASH_FLAG_32BITADDR;
+}
+
 static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -331,6 +340,8 @@ static int stfsm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsm);
 
+	stfsm_fetch_platform_configs(pdev);
+
 	fsm->mtd.dev.parent	= &pdev->dev;
 	fsm->mtd.type		= MTD_NORFLASH;
 	fsm->mtd.writesize	= 4;
-- 
1.8.1.2
