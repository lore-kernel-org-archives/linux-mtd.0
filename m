Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A5AC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C51860EAF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C51860EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbjHjhzDZesgpwVKNYOA6nX5AWzcid+zMg82qgKgihM=; b=u1PIle5kYdNXP9
	Mx9+SafsOT+h6QZ/ls5oIPK8mi8za3V+A+mwO3U/2TWKN62lMjgU/s56Pl41zCgu3D+rnNnbQo/b7
	6tL4jHjkPl+6JDOhdGQmNlvyoqjS3flf+1CHPISdLfVvd3SCKUw3JpcdPC+hBhfanhen6A5gk/8ln
	Laysqm3DOfNuj0+XYHaWtwd2IfbwJSRlXzbXcM/XG4s/PlOduB75YFNSKx4pNNYwXl0D8H20utaEd
	0LsyROseeigEMiKCxY++V53S3Dv35CShzgic7s8L7PTUJbU7fVX6lIRgoZK6JYX8es52FthjtEPMC
	rua/za1dZO/rXVg/b/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFo8M-000jtp-M2; Tue, 17 Aug 2021 01:43:19 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvm-000gn3-CJ
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:26 +0000
Received: by mail-lj1-x236.google.com with SMTP id y6so13444133lje.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
 b=kn4kT2Hz//hHPdVcdZ/vDzNa1AeB3fmoQ2KajKAe8K7HeAMLN9J+RLJn4O28AknXce
 O2Uwz+3Yl0HQPwUdJJ7gnzB+AAvuNYEvsVKU5gzzehu4Ot/microMtTIcN2BWF9rXCaz
 B8yn4zAA/jxH8Gy0lwR0fopTYPFhuNd2yvKwuGedIegQZfEuPz+7R7Lfy/3hj0LXXZRu
 /2zacj4fZCA9HTFFaFNhgAdlvb+Sffe0y/0KJLEluMiCSdWTI1ZcpPIFPI8Lfvx35l+v
 IjrIHeypjpz8Nd6Z+KW5WqXJWbCNUfPhk2W6I1nnjI74cdD5bp9O6HY8in4VjsotEekV
 Tl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiZ4j31PBjUgj6NMuu1gRDwGRqT/foQN2QYxiwSoqj4=;
 b=hu2AVqZ8ocyU7ocBdAHmi+qGsjI797uUc3dDK3mJ682nGI68n0Uckg+lFsQ94iarCz
 gbZkiCTmvMWezPM3pGWPFgqmu7XhNbek4juYWovZIN0ulibQtpUJ6FII/JOIHvOu/uic
 W/gBniFUuqZ3legIhGv17ugJTtj8zSrzN3K4XrsRBHrVqEQRJXVss/Kx188FLhpFzbxO
 qnPHGMcRYmlW6f5Cc6pkXMHS4tHlZEZk7xUjF+HV9Xc/rFyKFbUtuU2M7uDFUsmltggv
 nRqQGOuIVgRwINMwxjBwYsxKg+UJNsHOdWd8KSNglumiKwBI8Bo6NXXnpAyw7IeBYR0k
 PtdA==
X-Gm-Message-State: AOAM532w02y11jQoTeY5SrgiL6/FaIcVh9zSXywn7ioU+OYLzrtrJmC6
 7M3hDCCbod6aGZf/5yOqLOc=
X-Google-Smtp-Source: ABdhPJzs3U6yU/CHeEWumMqhudKOiOVdPxHW87EZcifX16I4zyesaHC8qzahhba2hNw8USFhBY7eAw==
X-Received: by 2002:a2e:9593:: with SMTP id w19mr836879ljh.323.1629163817004; 
 Mon, 16 Aug 2021 18:30:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 13/34] drm/tegra: hdmi: Add OPP support
Date: Tue, 17 Aug 2021 04:27:33 +0300
Message-Id: <20210817012754.8710-14-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183018_506714_20DE2E2B 
X-CRM114-Status: GOOD (  17.88  )
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

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..aa13028480f7 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -11,10 +11,13 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -1195,7 +1198,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
+	err = dev_pm_opp_set_rate(hdmi->dev, hdmi->pixel_clock);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
 			err);
@@ -1516,6 +1519,12 @@ static int tegra_hdmi_runtime_resume(struct host1x_client *client)
 		return err;
 	}
 
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		goto put_rpm;
+	}
+
 	err = clk_prepare_enable(hdmi->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable clock: %d\n", err);
@@ -1708,6 +1717,10 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_output_probe(&hdmi->output);
 	if (err < 0)
 		return err;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
