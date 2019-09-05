Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3ADC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567D920CC7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCzMK0YZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kf9BCxH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567D920CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eGYWl3hbplHXOx0IlXVZ3CcbxXLRkeBP4/r1hKsfxWo=; b=cCzMK0YZWnu0YesfcFUfdK3aBg
	ZyZYuSqYi4fD2AzBKE94SYj2b3buV+Cw9/ipAbrzI4y7iOUE5nvG4ue4l5FfuFP+ZnHig0kZ2QoKb
	GNerGnkOv4pnhYxH0vrg65JyFpuezsWvSlW0P0HjN6W0b2qKjequywRnU3aHGyVnTAwIrZCKmQkY/
	UWk+QjptyK7lxxnVnpj7rV1gyrkjKYc4CKmPAMzA3pjzk8mFfeziTd3+20zJYBd75p+duaQDOXgBM
	jjgDQw7jEfLH1eV/y8clBTA0VhJ7EjtqURcZ/wk/ekHlIDDCdg5l1BAX5qFqgS9bEjFEJB49KvVg9
	mpCyPA7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uT5-0001fZ-AV; Thu, 05 Sep 2019 16:18:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uST-0000qZ-Ah
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:06 +0000
Received: by mail-pf1-x441.google.com with SMTP id h195so2075625pfe.5
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L8hOfhOr51aqScCCWWbh9I9oRm+jyZZGT7N1Ouypdt4=;
 b=Kf9BCxH5tyFR8Sxb6davF0tw/g0BJcQ2LTgqYDRkCXe99lige8xFTOyajGrEfuPQ/R
 I0jfW+xyceHiuUmlk5yy9H/wHaQBHzqM6/NCd+6TYi2hTFJcP+V9Qy+4KG7IN1UQJXhm
 SHxD8duKsNPol28y9SdpztaPVTFslQB1ZJ4shENKHGBsNtllukJz/Fvv4h2tEY0T/gDA
 A2nAqicaFTIrh+VxqbojFsyy6M/2eC5AmJiZLPVyY+LXna6RGps4ro7SxWrWHOr8M3f3
 r5tzdOU8n4cY0b4Asgrm+yIMVuJn8WX1xgQ9ScuHQJtGCR5wLKwPCsSipBa/U9NOB1IX
 2SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L8hOfhOr51aqScCCWWbh9I9oRm+jyZZGT7N1Ouypdt4=;
 b=T2msVtzzlvDseEywe+rhhY7KQh95GQppKxwLVUIatautrqpC/FuHPgpCSuqLpP0SVx
 +NoxRaFzKK6V5rCu502rpXPjXmnUHNfx9+UBRDYgcLYvV/alVsNyWh1zwrpQuLBiJI74
 cwFDGyB7ost2HhYaw2ODBqHCyKvLoeBUqai1ULAa2OALXYz8YMnCeD+tY1gDrXPBo0sc
 FdRB3w9eX8wgXy7ZrOByRAbiAYigv9v9Xhfx54TJ/0YHYFh8yGEYsg0aRBMNOXQsVBUP
 DqqLV9JXTHkkXRloycCn1W8gt8CqSG4mAANsom6uPqUDVvtPk0qM0cpiOy9Ge2bossUa
 Fg8A==
X-Gm-Message-State: APjAAAV7vhChkDyJGZHOzRbp9HzRpJctYZPtSAoKkEK/mIgCENTX2Xk9
 BIrF9eZyaMMSn0rsbXTarWSH2g==
X-Google-Smtp-Source: APXvYqzPIZoynm5wH2XSzFsQu6YuhHmdV6ACJ/jbefAUC4vneQ0qioQJzoA1wj/k15d4/pVhs+puhw==
X-Received: by 2002:a63:df06:: with SMTP id u6mr3817337pgg.96.1567700284680;
 Thu, 05 Sep 2019 09:18:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:04 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 03/18] drm/omap: panel-dsi-cm: fix driver
Date: Thu,  5 Sep 2019 10:17:44 -0600
Message-Id: <20190905161759.28036-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091805_382351_4C679DDE 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tony Lindgren <tony@atomide.com>

commit e128310ddd379b0fdd21dc41d176c3b3505a0832 upstream

This adds support for get_timings() and check_timings()
to get the driver working and properly initializes the
timing information from DT.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 56 +++++++++++++++++--
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 92c556ac22c7..905b71719d65 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -25,6 +25,7 @@
 #include <linux/of_gpio.h>
 
 #include <video/mipi_display.h>
+#include <video/of_display_timing.h>
 
 #include "../dss/omapdss.h"
 
@@ -1099,6 +1100,36 @@ static void dsicm_ulps_work(struct work_struct *work)
 	mutex_unlock(&ddata->lock);
 }
 
+static void dsicm_get_timings(struct omap_dss_device *dssdev,
+			      struct videomode *vm)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+
+	*vm = ddata->vm;
+}
+
+static int dsicm_check_timings(struct omap_dss_device *dssdev,
+			       struct videomode *vm)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	int ret = 0;
+
+	if (vm->hactive != ddata->vm.hactive)
+		ret = -EINVAL;
+
+	if (vm->vactive != ddata->vm.vactive)
+		ret = -EINVAL;
+
+	if (ret) {
+		dev_warn(dssdev->dev, "wrong resolution: %d x %d",
+			 vm->hactive, vm->vactive);
+		dev_warn(dssdev->dev, "panel resolution: %d x %d",
+			 ddata->vm.hactive, ddata->vm.vactive);
+	}
+
+	return ret;
+}
+
 static struct omap_dss_driver dsicm_ops = {
 	.connect	= dsicm_connect,
 	.disconnect	= dsicm_disconnect,
@@ -1109,6 +1140,9 @@ static struct omap_dss_driver dsicm_ops = {
 	.update		= dsicm_update,
 	.sync		= dsicm_sync,
 
+	.get_timings	= dsicm_get_timings,
+	.check_timings	= dsicm_check_timings,
+
 	.enable_te	= dsicm_enable_te,
 	.get_te		= dsicm_get_te,
 
@@ -1120,7 +1154,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *in;
-	int gpio;
+	struct display_timing timing;
+	int gpio, err;
 
 	gpio = of_get_named_gpio(node, "reset-gpios", 0);
 	if (!gpio_is_valid(gpio)) {
@@ -1137,6 +1172,17 @@ static int dsicm_probe_of(struct platform_device *pdev)
 		return gpio;
 	}
 
+	err = of_get_display_timing(node, "panel-timing", &timing);
+	if (!err) {
+		videomode_from_timing(&timing, &ddata->vm);
+		if (!ddata->vm.pixelclock)
+			ddata->vm.pixelclock =
+				ddata->vm.hactive * ddata->vm.vactive * 60;
+	} else {
+		dev_warn(&pdev->dev,
+			 "failed to get video timing, using defaults\n");
+	}
+
 	in = omapdss_of_find_source_for_first_ep(node);
 	if (IS_ERR(in)) {
 		dev_err(&pdev->dev, "failed to find video source\n");
@@ -1171,14 +1217,14 @@ static int dsicm_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	r = dsicm_probe_of(pdev);
-	if (r)
-		return r;
-
 	ddata->vm.hactive = 864;
 	ddata->vm.vactive = 480;
 	ddata->vm.pixelclock = 864 * 480 * 60;
 
+	r = dsicm_probe_of(pdev);
+	if (r)
+		return r;
+
 	dssdev = &ddata->dssdev;
 	dssdev->dev = dev;
 	dssdev->driver = &dsicm_ops;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
