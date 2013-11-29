Received: from mail-yh0-f46.google.com ([209.85.213.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3Q-0006j5-Iz
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:26 +0000
Received: by mail-yh0-f46.google.com with SMTP id l109so6590065yhq.5
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:19:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 12/36] mtd: st_spi_fsm: Fetch platform specific
 configurations
Date: Fri, 29 Nov 2013 12:19:01 +0000
Message-Id: <1385727565-25794-13-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
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
index 5f21d14..1f54983 100644
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
+		info->flags |= FLASH_FLAG_32BIT_ADDR;
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
1.8.3.2
