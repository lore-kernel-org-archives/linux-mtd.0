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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A63C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB5260187
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CB5260187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=al5WmjRCeXmvGpj7u6YLABOjcA+zhiAD1jd1t7XJ2KA=; b=4Rtp9OZtFEXqPO
	N1tRLe+e6XBzrh0J43rREMGmWt0TVd9YxI+8R/t6afbxQEdQDUULlxzCuid5VBP5ZyjggBzazaETj
	RO+kIr9LRyHMOvtNV23HXQWHNU1hXn8eExSCOcLI2+hvkxeSuaVGivXpniIavBza22BXneZH5EMLV
	8RiDeXCIW7w7vAsaHn5TOHUgsXAD2dyXZaPOQ6fG+rQlHaa+TmrO8VC58Og49ZFe75vYZxUHCW51B
	/DRmDGuItNgjXoOFD/GCpLi73NuDg8hPsLHn63Ug1B3nfom5GeqMsNwvTriMNoT4XyghPF6j24Zcx
	NKiquzajNOF4P9l9wIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoOz-000m4R-Am; Tue, 17 Aug 2021 02:00:30 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvw-000gvJ-U3
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:34 +0000
Received: by mail-lj1-f181.google.com with SMTP id d16so12087831ljq.4
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9c3pXlUZE3QxicpsWxMCCwjm5+rb3zs6GNzqGPTQthE=;
 b=RztNfDzbIvxAnRB3yzbYk93bflaPz6eTReRM/HhZCQYog70rNbjtpCkiO3cr6p1np/
 6jAPuRASgq3XoJlHosp7asRmhcVnpUXZcm+rKrjptgYow/BkPWeWV3DRKH4UsaOBoRn1
 1WA/CWeEqqSEWI5ZYwwxOxQDas+ovqkhaaZh235W+V/dQayubcaQ6vKzf6nESbRfeZQK
 affRwg0A79JZb0ZOs2qUB3k0gRoMxizhMtf3qqIeGjj/sVSZr+PDKGQvPs+lsrIf/NHI
 PhPkksccGvBDfATdfRDMkrILmKJ6sGz2ghx571jNoENyvOgzMyzjbRoc/X7DFXhe8HMd
 qTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9c3pXlUZE3QxicpsWxMCCwjm5+rb3zs6GNzqGPTQthE=;
 b=km5SfbJktz2w1NWgnKd3LNr//dbMwB4hD5GpZsjRZV63K6MoP7TO2IiSzJS48Wb4nz
 qI008DwmEZRerbgY/tn1ud/EqgHYrTaUcnRZKz5g47EIYqhJYAuABu7MzPZ6f1fJpW/v
 Boo88+8pzWftGbx8P3XZPAHdLHH1xOQEN8LQPSVtvuO6je2SKervSoSO3rsIM8YQuQPM
 uOIb43ZQOkak29VKdsAi4FNfqGVsLgi2V20mmgTUDmo/J/D22dSvKlKIUF0aGgDERh3c
 e/HsP2y0/qDjfXXghGqjj7A8N8RlmQfA3/sXLmtKfInynWDR1Uo9ftlOuSIqjK1Urdki
 rkiQ==
X-Gm-Message-State: AOAM531019ZP379MHLkn1Wxvbj0buslAihnZf1f5xocexKd4g4Y7SK96
 8CkpATCDftAzYJlWpSPcaFE=
X-Google-Smtp-Source: ABdhPJweMEg2s12Z0eJTdsOjJiw/zavJFfbapxtPp0s3z4831bUnNlLTArTDAdaww+RcNKukL0r02w==
X-Received: by 2002:a2e:81c2:: with SMTP id s2mr853589ljg.48.1629163826504;
 Mon, 16 Aug 2021 18:30:26 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:26 -0700 (PDT)
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
Subject: [PATCH v8 21/34] mtd: rawnand: tegra: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:41 +0300
Message-Id: <20210817012754.8710-22-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183029_073087_6CA398D3 
X-CRM114-Status: GOOD (  21.23  )
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

The NAND on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now NAND must be resumed using
runtime PM API in order to initialize the NAND power state. Add runtime PM
and OPP support to the NAND driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 62 +++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index fbf67722a049..fa477cd380ab 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -17,8 +17,12 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define COMMAND					0x00
 #define   COMMAND_GO				BIT(31)
 #define   COMMAND_CLE				BIT(30)
@@ -1152,6 +1156,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctrl->dev = &pdev->dev;
+	platform_set_drvdata(pdev, ctrl);
 	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
@@ -1168,14 +1173,19 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->clk))
 		return PTR_ERR(ctrl->clk);
 
-	err = clk_prepare_enable(ctrl->clk);
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
 	if (err)
 		return err;
 
+	pm_runtime_enable(ctrl->dev);
+	err = pm_runtime_resume_and_get(ctrl->dev);
+	if (err)
+		goto err_disable_pm;
+
 	err = reset_control_reset(rst);
 	if (err) {
 		dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
-		goto err_disable_clk;
+		goto err_put_pm;
 	}
 
 	writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_CMD);
@@ -1190,21 +1200,21 @@ static int tegra_nand_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), ctrl);
 	if (err) {
 		dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
-		goto err_disable_clk;
+		goto err_put_pm;
 	}
 
 	writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CTRL);
 
 	err = tegra_nand_chips_init(ctrl->dev, ctrl);
 	if (err)
-		goto err_disable_clk;
-
-	platform_set_drvdata(pdev, ctrl);
+		goto err_put_pm;
 
 	return 0;
 
-err_disable_clk:
-	clk_disable_unprepare(ctrl->clk);
+err_put_pm:
+	pm_runtime_put(ctrl->dev);
+err_disable_pm:
+	pm_runtime_disable(ctrl->dev);
 	return err;
 }
 
@@ -1221,11 +1231,46 @@ static int tegra_nand_remove(struct platform_device *pdev)
 
 	nand_cleanup(chip);
 
+	pm_runtime_put(ctrl->dev);
+	pm_runtime_disable(ctrl->dev);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)
+{
+	struct tegra_nand_controller *ctrl = dev_get_drvdata(dev);
+	int err;
+
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "Failed to sync OPP: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(ctrl->clk);
+	if (err) {
+		dev_err(dev, "Failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_nand_runtime_suspend(struct device *dev)
+{
+	struct tegra_nand_controller *ctrl = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(ctrl->clk);
 
 	return 0;
 }
 
+static const struct dev_pm_ops tegra_nand_pm = {
+	SET_RUNTIME_PM_OPS(tegra_nand_runtime_suspend, tegra_nand_runtime_resume,
+			   NULL)
+};
+
 static const struct of_device_id tegra_nand_of_match[] = {
 	{ .compatible = "nvidia,tegra20-nand" },
 	{ /* sentinel */ }
@@ -1236,6 +1281,7 @@ static struct platform_driver tegra_nand_driver = {
 	.driver = {
 		.name = "tegra-nand",
 		.of_match_table = tegra_nand_of_match,
+		.pm = &tegra_nand_pm,
 	},
 	.probe = tegra_nand_probe,
 	.remove = tegra_nand_remove,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
