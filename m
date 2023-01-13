Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A8BC54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cYwPTU+Ehe1+amohmAI1odUk/QOn8lq92j0vy/XDUI=; b=SOzAUgKKsyK+Nh
	p49fPv0QRRzvMkcVlu4V9t6ihrTW7buKJt6aju9Xq+yLoRKeDFwb7bcBqwcEVWydRQmWwebNSMXgd
	BJmsR+S2qiKWMLOyACtpWm8hYKJeF2tqtvDJwYWm7J24UBA0wSHMnc/g24cvj9V0QSohZmgqyQuto
	2YolCCnGxcooFn37Od/KUfYx6RmTdShajmgAxSGsuHA/hgFiQBxVZHq6zGjjQ4ZqAAk46/zBOX28C
	GsDRRO0hqgLBIgWd9JB/DUeOocO6nxIqnQRvxTfi8aysxjasQlOmFPJc0TS7awVw7Cx8IfVjt2Gda
	MVt2e3wI3px0/Gd9uGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDWO-000nPx-3c; Fri, 13 Jan 2023 06:26:36 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDUl-000m83-Hp; Fri, 13 Jan 2023 06:24:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 21/22] drivers: platform: remove is_sh_early_platform_device
Date: Fri, 13 Jan 2023 07:23:38 +0100
Message-Id: <20230113062339.1909087-22-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This was used as a hack for sh-architecture device initialization, and
with sh gone now, only the stub that always returns 0 is left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/clocksource/sh_cmt.c    |  8 ++------
 drivers/clocksource/sh_mtu2.c   |  8 ++------
 drivers/clocksource/sh_tmu.c    |  9 ++-------
 include/linux/platform_device.h | 12 ------------
 4 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 7fed3529bbaf82..4f6d7d40c9fcb1 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -1109,10 +1109,8 @@ static int sh_cmt_probe(struct platform_device *pdev)
 	struct sh_cmt_device *cmt = platform_get_drvdata(pdev);
 	int ret;
 
-	if (!is_sh_early_platform_device(pdev)) {
-		pm_runtime_set_active(&pdev->dev);
-		pm_runtime_enable(&pdev->dev);
-	}
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	if (cmt) {
 		dev_info(&pdev->dev, "kept as earlytimer\n");
@@ -1129,8 +1127,6 @@ static int sh_cmt_probe(struct platform_device *pdev)
 		pm_runtime_idle(&pdev->dev);
 		return ret;
 	}
-	if (is_sh_early_platform_device(pdev))
-		return 0;
 
  out:
 	if (cmt->has_clockevent || cmt->has_clocksource)
diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index e81e978513f80e..97ac2929e424be 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -448,10 +448,8 @@ static int sh_mtu2_probe(struct platform_device *pdev)
 	struct sh_mtu2_device *mtu = platform_get_drvdata(pdev);
 	int ret;
 
-	if (!is_sh_early_platform_device(pdev)) {
-		pm_runtime_set_active(&pdev->dev);
-		pm_runtime_enable(&pdev->dev);
-	}
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	if (mtu) {
 		dev_info(&pdev->dev, "kept as earlytimer\n");
@@ -468,8 +466,6 @@ static int sh_mtu2_probe(struct platform_device *pdev)
 		pm_runtime_idle(&pdev->dev);
 		return ret;
 	}
-	if (is_sh_early_platform_device(pdev))
-		return 0;
 
  out:
 	if (mtu->has_clockevent)
diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index 596e9146ad54e9..940378d38dd523 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -595,10 +595,8 @@ static int sh_tmu_probe(struct platform_device *pdev)
 	struct sh_tmu_device *tmu = platform_get_drvdata(pdev);
 	int ret;
 
-	if (!is_sh_early_platform_device(pdev)) {
-		pm_runtime_set_active(&pdev->dev);
-		pm_runtime_enable(&pdev->dev);
-	}
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	if (tmu) {
 		dev_info(&pdev->dev, "kept as earlytimer\n");
@@ -616,9 +614,6 @@ static int sh_tmu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (is_sh_early_platform_device(pdev))
-		return 0;
-
  out:
 	if (tmu->has_clockevent || tmu->has_clocksource)
 		pm_runtime_irq_safe(&pdev->dev);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index b0d5a253156ece..894939a74dd20f 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -352,18 +352,6 @@ extern int platform_pm_restore(struct device *dev);
 #define USE_PLATFORM_PM_SLEEP_OPS
 #endif
 
-#ifndef CONFIG_SUPERH
-/*
- * REVISIT: This stub is needed for all non-SuperH users of early platform
- * drivers. It should go away once we introduce the new platform_device-based
- * early driver framework.
- */
-static inline int is_sh_early_platform_device(struct platform_device *pdev)
-{
-	return 0;
-}
-#endif /* CONFIG_SUPERH */
-
 /* For now only SuperH uses it */
 void early_platform_cleanup(void);
 
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
