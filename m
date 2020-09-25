Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B65C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:57:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D07221D91
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UpnyHVsT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJK4yI89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D07221D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wzAkVopUVEg7oRZcZWTzj8VnbOAUjPlEjR6U2OXyc9E=; b=UpnyHVsTGV45lPwd71pMMdbwt
	NdfXDos8u4DE29/bDwLLnmc8dqlnzkcc5bdNuKk1oxXSAJYKvIMDpWW8p26kMpIBVfAbRnMaoOzTD
	ijTSWiU+1CdPoTdghPJyuTv0LMWb1mi3A1TiU7uHPSWEefo3Zsy5TvdeEDISs/wZovERo0wtsPd2J
	Wm/Wk0VKCjuqXrl8Lu3ykebcjsZ2zrz6x9SONiCzFTJRKP1mB8a7o7HZts0OLdBZv5+dLYB2XGAU8
	Ku+WUfTPog0hKOAtThVzWyIRvrajUMFfr0hquMs9OXUeUI/1pC0bFJwEZ+RQTVsy4MPJsEeQlinEz
	3H69RJeHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLheV-0004Cx-TL; Fri, 25 Sep 2020 06:56:19 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcz-0003Uz-1F
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 06:54:52 +0000
Received: by mail-pj1-x1043.google.com with SMTP id mn7so1263988pjb.5
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CboFKNwfQHjhb2QqB27UjvOOEHxVAcEUNOkbldAZfwI=;
 b=XJK4yI89glmJ9fKvhrxq2YtfRKCPxksQhw7CNQzxtdpw9/v6aLqMzkoY4nbJ3cfT6f
 Tqv15pHhdxxOeWkYM3Pi3uMwqXQg1PsFubX0dT84Cmd9gEA4ALrRmanw545PMVAbU2N1
 KDJBVkvNdLcWlxvah4DZ5ULinhsFnBMJPBUnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CboFKNwfQHjhb2QqB27UjvOOEHxVAcEUNOkbldAZfwI=;
 b=V64Jus+h/0bhrXy2Actnbe3D03NB/1ZHWC0AwNkXllQYYlIR1FoXh04VMzB0lH0AaV
 lHARdp3ELFqkRvOuDTbMBTX8AA81JW5H2xyAUYbxXWsGWCNDv4wEg26Cd4gWWOYg78uP
 c2b2lD0lXE9NogNWAK4vSEKw6TGfwKtTrs1HU6FvJB1o+wZaHpYnztnTrg2vR2WMeXIn
 3Mjv6wM3ho7gdy3on5HUhh1pJAEZOncowfjldtqf5wy+0bQ1n/fvQZ5tcH9eDG0ovhzt
 tMuEJ9KdcsGJmBEZbN5piquDG/7ejbe+xO1rVhuiay6Q0Y7wnHqXwot+5DpOnr6QXNg+
 cesQ==
X-Gm-Message-State: AOAM532xVCWq+OZLXjG9YKv7HiH08CCQKGj1J6mFKrVEAmcpvsF84uJ2
 DCq4tr9z0cxf8HLGewSl/D2tCA==
X-Google-Smtp-Source: ABdhPJwIBJ1Mku0abGIDFapejo9O2GhaKmy5wuc7DpI6Wy767K/AMgPKvt0opUUPLWIcoXhqf3bg4A==
X-Received: by 2002:a17:90a:ea0c:: with SMTP id
 w12mr1329650pjy.65.1601016882432; 
 Thu, 24 Sep 2020 23:54:42 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:42 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 6/6] spi: spi-mtk-nor: Add power management support
Date: Fri, 25 Sep 2020 14:54:17 +0800
Message-Id: <20200925145255.v3.6.I68983b582d949a91866163bab588ff3c2a0d0275@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025445_164951_88AC480D 
X-CRM114-Status: GOOD (  21.74  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds dev_pm_ops to mtk-nor to support suspend/resume,
auto suspend delay is set to -1 by default.

Accessing registers are only permitted after its clock is enabled
to deal with unknown state of operating clk at probe time,

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

Changes in v3:
- Fix a bugfix of v2 in checking spi memory operation.
- split read_dma function into two (normal/bounce)
- Support 7bytes generic spi xfer

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

 drivers/spi/spi-mtk-nor.c | 98 ++++++++++++++++++++++++++++++---------
 1 file changed, 76 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 35205635ed42..bde4c846ce65 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/string.h>
@@ -592,22 +593,15 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 	return 0;
 }
 
-static int mtk_nor_init(struct mtk_nor *sp)
+static void mtk_nor_init(struct mtk_nor *sp)
 {
-	int ret;
-
-	ret = mtk_nor_enable_clk(sp);
-	if (ret)
-		return ret;
-
-	sp->spi_freq = clk_get_rate(sp->spi_clk);
+	writel(0, sp->base + MTK_NOR_REG_IRQ_EN);
+	writel(MTK_NOR_IRQ_MASK, sp->base + MTK_NOR_REG_IRQ_STAT);
 
 	writel(MTK_NOR_ENABLE_SF_CMD, sp->base + MTK_NOR_REG_WP);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG2, MTK_NOR_WR_CUSTOM_OP_EN, 0);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG3,
 		    MTK_NOR_DISABLE_WREN | MTK_NOR_DISABLE_SR_POLL, 0);
-
-	return ret;
 }
 
 static irqreturn_t mtk_nor_irq_handler(int irq, void *data)
@@ -690,6 +684,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	ctlr->num_chipselect = 1;
 	ctlr->setup = mtk_nor_setup;
 	ctlr->transfer_one_message = mtk_nor_transfer_one_message;
+	ctlr->auto_runtime_pm = true;
 
 	dev_set_drvdata(&pdev->dev, ctlr);
 
@@ -712,12 +707,19 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = mtk_nor_enable_clk(sp);
+	if (ret < 0)
+		return ret;
+
+	sp->spi_freq = clk_get_rate(sp->spi_clk);
+
+	mtk_nor_init(sp);
+
 	irq = platform_get_irq_optional(pdev, 0);
+
 	if (irq < 0) {
 		dev_warn(sp->dev, "IRQ not available.");
 	} else {
-		writel(MTK_NOR_IRQ_MASK, base + MTK_NOR_REG_IRQ_STAT);
-		writel(0, base + MTK_NOR_REG_IRQ_EN);
 		ret = devm_request_irq(sp->dev, irq, mtk_nor_irq_handler, 0,
 				       pdev->name, sp);
 		if (ret < 0) {
@@ -728,34 +730,86 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = mtk_nor_init(sp);
-	if (ret < 0) {
-		kfree(ctlr);
-		return ret;
-	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
+	if (ret < 0)
+		goto err_probe;
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(&pdev->dev, "spi frequency: %d Hz\n", sp->spi_freq);
 
-	return devm_spi_register_controller(&pdev->dev, ctlr);
+	return 0;
+
+err_probe:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	mtk_nor_disable_clk(sp);
+
+	return ret;
 }
 
 static int mtk_nor_remove(struct platform_device *pdev)
 {
-	struct spi_controller *ctlr;
-	struct mtk_nor *sp;
+	struct spi_controller *ctlr = dev_get_drvdata(&pdev->dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
 
-	ctlr = dev_get_drvdata(&pdev->dev);
-	sp = spi_controller_get_devdata(ctlr);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	mtk_nor_disable_clk(sp);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_nor_runtime_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
 
 	mtk_nor_disable_clk(sp);
 
 	return 0;
 }
 
+static int __maybe_unused mtk_nor_runtime_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
+
+	return mtk_nor_enable_clk(sp);
+}
+
+static int __maybe_unused mtk_nor_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused mtk_nor_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_nor_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_nor_runtime_suspend,
+			   mtk_nor_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_nor_suspend, mtk_nor_resume)
+};
+
 static struct platform_driver mtk_nor_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mtk_nor_match,
+		.pm = &mtk_nor_pm_ops,
 	},
 	.probe = mtk_nor_probe,
 	.remove = mtk_nor_remove,
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
