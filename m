Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E784FC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81AE60F55
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A81AE60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyBXtGbBgRWNyPgxS6IrM56v0WkzN1DD5r/e79+CZjQ=; b=ellvxVPK7RXGso
	BR8cyCIKPPlBIfeypso0Us60qTIZ5usaPJei1OaD1W9gn4o1uzY22CsLJObq1vcsIX0AvwY7t1UKZ
	o3I2/u0odcfT1SV4PlMkozFfchLBBGoJ1wmFTfiunUknGIhsMvGq3KFR9hMZZgIixvYCRN3QhKfbw
	HGnl+q9u1pklnjCUcijaE+XqO5M0G37eGfJJcTiZOYltK9J4G+YF0A5GLds7YScb2APxS0hh1fk6/
	R2APEUYH/KWDkffCFpdkBRRam431cpnjIAXeBKnF9UzS6zU1mc1nyHEJhocWmTLVcpGeVXlTUt3VL
	sNnMoMFOftIAQ4KejX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoSY-000mbA-58; Tue, 17 Aug 2021 02:04:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvx-000gvt-Kk
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:36 +0000
Received: by mail-lf1-x132.google.com with SMTP id x27so38185476lfu.5
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
 b=akMX2IQiN5C+wsFejbQ7AaZ+aEU812b5i7ElnI7gcJqxm1qRG/X5nkz7zPNl/SEuMH
 QYUoyowBTGQltjI7rFnyUsvx1P3XCb2OTN8HMc5ZVPvu356dI6iNPo+FE1gI3G2skcAZ
 zA06NlaJ0U14aSpiH7ZYOwXfSia2rN6scqCmOQTUapIIluAVOffKIxK+c1yKDRTvbUY2
 3HH/mdwiEU/wLbJGKSQojE13f0Fb0t1wG+JFucgpENZr3k6Vt8XgEIqnJmTsyJD5X4NS
 LYXnAFgRsIPnmTCV8x/cfPZl/+PqCsMY81oJpWDePTLH7Xxhs3PQ8mSYbT1yqTQ/4Y3Y
 RO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
 b=PVKUVonxPDW8WFzDU7RfwJjHd4Y5TV+7BO94754clwZV/zCbKxcCkSzCV3qXePn+Ee
 MN2/dylRTRR02z/mfxQCfft0C8tHYw8mDzBnIN/Kv172G6SwmxTSBqLTEUWfm5eWOS4F
 25byprmmi0TYTO2FMDB502Vty7am9qbMHFU+IwgZ/naWZi958XtE+6HeTZSUHP04z3ri
 1WDHXM8Bde+6p2aIDdm+0ANQJ8hXjAQ7Tt4Z8SUA7NHi8+KqAc84wUBBEvLHj4u6yBwo
 +32XIoOyDVXGrxx1oVKHV+R5unDtvumoM9GNlN3f/7hraKJ+w0ocepo67TD2Dhgsm0uk
 k3Nw==
X-Gm-Message-State: AOAM533w8q0g6WScDC/htkL0mw4w2P+A0XHj442oT4ck/3j0R9ffPTk7
 2Aeb2cCDSEvhluemOQHgmXg=
X-Google-Smtp-Source: ABdhPJw02p9RsEdccY59vWAtODBKBNtEXdwRJ/qwlwTWkchrOt3IUpFpHFlVjjDlgZH5cc57idRxWQ==
X-Received: by 2002:a19:f009:: with SMTP id p9mr516594lfc.227.1629163827643;
 Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
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
Subject: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
Date: Tue, 17 Aug 2021 04:27:42 +0300
Message-Id: <20210817012754.8710-23-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183029_743558_F2BF5007 
X-CRM114-Status: GOOD (  18.72  )
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index deff16ba6d58..37cb15dc59f7 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -18,12 +18,15 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
+#include <soc/tegra/common.h>
+
 #define SLINK_COMMAND			0x000
 #define SLINK_BIT_LENGTH(x)		(((x) & 0x1f) << 0)
 #define SLINK_WORD_SIZE(x)		(((x) & 0x1f) << 5)
@@ -683,7 +686,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1054,6 +1057,10 @@ static int tegra_slink_probe(struct platform_device *pdev)
 		goto exit_free_master;
 	}
 
+	ret = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* disabled clock may cause interrupt storm upon request */
 	tspi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(tspi->clk)) {
@@ -1205,6 +1212,12 @@ static int tegra_slink_runtime_resume(struct device *dev)
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
 	int ret;
 
+	ret = dev_pm_opp_sync(dev);
+	if (ret) {
+		dev_err(dev, "failed to sync OPP: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(tspi->clk);
 	if (ret < 0) {
 		dev_err(tspi->dev, "clk_prepare failed: %d\n", ret);
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
