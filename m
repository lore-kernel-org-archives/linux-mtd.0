Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcVYM-0007Vw-At
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 11:41:35 +0000
Received: by mail-pf0-x244.google.com with SMTP id j68so1326671pfc.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 04:41:14 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] mtd: st_spi_fsm: Handle
 clk_prepare_enable/clk_disable_unprepare.
Date: Tue,  1 Aug 2017 17:10:58 +0530
Message-Id: <1501587658-21332-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 - clk_prepare_enable() can fail here and we must check its return value.
 - stfsm_probe() can fail here and we must disable clock.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/devices/st_spi_fsm.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 21afd94..7bc29d7 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2073,15 +2073,17 @@ static int stfsm_probe(struct platform_device *pdev)
 	ret = stfsm_init(fsm);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialise FSM Controller\n");
-		return ret;
+		goto err_clk_unprepare;
 	}
 
 	stfsm_fetch_platform_configs(pdev);
 
 	/* Detect SPI FLASH device */
 	info = stfsm_jedec_probe(fsm);
-	if (!info)
-		return -ENODEV;
+	if (!info) {
+		ret = -ENODEV;
+		goto err_clk_unprepare;
+	}
 	fsm->info = info;
 
 	/* Use device size to determine address width */
@@ -2095,11 +2097,11 @@ static int stfsm_probe(struct platform_device *pdev)
 	if (info->config) {
 		ret = info->config(fsm);
 		if (ret)
-			return ret;
+			goto err_clk_unprepare;
 	} else {
 		ret = stfsm_prepare_rwe_seqs_default(fsm);
 		if (ret)
-			return ret;
+			goto err_clk_unprepare;
 	}
 
 	fsm->mtd.name		= info->name;
@@ -2124,6 +2126,10 @@ static int stfsm_probe(struct platform_device *pdev)
 		fsm->mtd.erasesize, (fsm->mtd.erasesize >> 10));
 
 	return mtd_device_register(&fsm->mtd, NULL, 0);
+
+err_clk_unprepare:
+	clk_disable_unprepare(fsm->clk);
+	return ret;
 }
 
 static int stfsm_remove(struct platform_device *pdev)
@@ -2147,9 +2153,7 @@ static int stfsmfsm_resume(struct device *dev)
 {
 	struct stfsm *fsm = dev_get_drvdata(dev);
 
-	clk_prepare_enable(fsm->clk);
-
-	return 0;
+	return clk_prepare_enable(fsm->clk);
 }
 #endif
 
-- 
1.9.1
