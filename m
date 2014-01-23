Received: from mail-wg0-f48.google.com ([74.125.82.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Hhg-0003nT-OI
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:40:10 +0000
Received: by mail-wg0-f48.google.com with SMTP id x13so1252370wgg.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:39:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 12/37] mtd: st_spi_fsm: Fetch platform specific
 configurations
Date: Thu, 23 Jan 2014 10:31:00 +0000
Message-Id: <1390473085-24626-13-git-send-email-lee.jones@linaro.org>
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

All supported platforms are able to pass specific configurations via
the Device Tree on boot. Here we add a function which is to be called
during the probing process which will extract them, or make other
assumptions based on capabilities provided.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index efd8fdb..1803f94 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -654,6 +654,16 @@ static int stfsm_init(struct stfsm *fsm)
 	return 0;
 }
 
+static void stfsm_fetch_platform_configs(struct platform_device *pdev)
+{
+	struct stfsm *fsm = platform_get_drvdata(pdev);
+	struct flash_info *info = fsm->info;
+
+	/* Use device size to determine address width */
+	if (info->sector_size * info->n_sectors > 0xFFFFFF)
+		info->flags |= FLASH_FLAG_32BIT_ADDR;
+}
+
 static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -712,6 +722,8 @@ static int stfsm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsm);
 
+	stfsm_fetch_platform_configs(pdev);
+
 	fsm->mtd.dev.parent	= &pdev->dev;
 	fsm->mtd.type		= MTD_NORFLASH;
 	fsm->mtd.writesize	= 4;
-- 
1.8.3.2
