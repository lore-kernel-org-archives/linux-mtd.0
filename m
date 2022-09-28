Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1828EC6FA82
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Sep 2022 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVzHVa4KioxKCs4UAyK/BBDf5yRCncUGLBxoLWhRPxs=; b=QZYzinxpSvh2kU
	7BExZQ8VF2wnAwc7GiOvUN16VqPKigU1DDyjZac8DwlNWLC3LbgIev8oL6EAXbEVkaDccAh3LCIej
	J9cMqiho3+2bWKvXpM7uDazKZmhIwe5K6toNgbWluNqD/mYrG7DvJ18uAHw++BlSlItidwD7Wado8
	2ysyYzrwG95izZBGX9u+2q3l6Tdwd2GKDubpJjkw413wkU0TW3crfBRG8YNxs1vHpCO1XGp1yv/YX
	lYO5urQlFYpNUy/6hD25AvK8sz67cqkaH5XoO1kj4vrB7p7S5zStiF5vBSswoeWevDNyOYmGWAapU
	myBj4iF5TwM+qGPrdaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odg2U-000bH0-Do; Wed, 28 Sep 2022 23:00:26 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odg2R-000bGL-JH
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2022 23:00:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id b75so13764923pfb.7
        for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2022 16:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=aRmvPLbVqyeYfR8jrKggHhDgI4BOBfgErJLYPQEf8zo=;
        b=jyY5Do7EG3BP4efMc0KAzEnwd6T7Lft+Gr75P0+BUGlg6osxxZnay+JA5t/1aYJiv2
         bPQW/lDElLZK8Mz1kceDbWikHaVO3JdVtGOK/1ohFlqx2fW0L8yzOiAYl+jk0rHxw72A
         mHWv66INXWtEguDbR4sZmvsCFi3oeiVlJF2W+Hc+YtbBLLo633/f6mPms2wzxgi7Pm+R
         Lc6j7+51w3gqMElDI0Cwx+CUKWTlcCVRTkaAGI507rG+ZC/JbEgBJJVH3fPxnbB8Symz
         yT8TmqzTDu3L57mFyLfkJ0aNQaqxNtG7+QG76/6dTN2LfIQx6Nc1dOE8koC8Jnr0STs7
         HMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=aRmvPLbVqyeYfR8jrKggHhDgI4BOBfgErJLYPQEf8zo=;
        b=TQf4NOojtdpEUrUGVnJ/bPCT7EntsAw07ZH4RV6oFMwMcTD2mlaFRd/pdP55vnnzdF
         nlrIaHutafmBB/P7a6YibsslC/n2L80S3aekTjHeHJ9bp+nxyf1VQzvUVknl2qqdVoJF
         K+KJY4+WKsExo0Qy9xIvOASww/ZEBPI+pGMZWkYYO3cXFjcjK/XLq4tOJNTWshWm2hlV
         sr/PWkmS+gXV32qcn0pWzU7xEfeDJssa0NgX+Eeu+Q0fwtdz8Q1sNIlebj3tKL2tmgE+
         z9u/wNsQKpwPvXf7+uOdb4BY8Jc6e0P2X+yLMbSn8kIbs22obfYfp/XNvafLTHGkcRLU
         hwSQ==
X-Gm-Message-State: ACrzQf0doLeQJjcmD034se6VXZ2fA3jjutMs32KtofgPzbyvkOpI2MDb
	w2P4EjxvL75mlEi7uL+grF8=
X-Google-Smtp-Source: AMsMyM672WkdpF+Fr+/dBERjTMv7DVJOVMorvKJjf9aWXck+J6sr7PTWpW333Sd/zP0ESJRe3lh7nA==
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id l16-20020a056a00141000b005285a5ad846mr229341pfu.9.1664406022342;
        Wed, 28 Sep 2022 16:00:22 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
        by smtp.gmail.com with ESMTPSA id 195-20020a6216cc000000b0055a9c9cfc63sm2737309pfw.201.2022.09.28.16.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:00:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: lpc32xx_mlc: switch to using gpiod API
Date: Wed, 28 Sep 2022 16:00:18 -0700
Message-Id: <20220928230019.2140896-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_160023_657888_489DA5C3 
X-CRM114-Status: GOOD (  17.09  )
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

This switches the driver from legacy gpio API to a newer gpiod API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 36 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 452ecaf7775a..306e2c216501 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -25,7 +25,7 @@
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -122,7 +122,6 @@ struct lpc32xx_nand_cfg_mlc {
 	uint32_t rd_low;
 	uint32_t wr_high;
 	uint32_t wr_low;
-	int wp_gpio;
 	struct mtd_partition *parts;
 	unsigned num_parts;
 };
@@ -177,6 +176,7 @@ struct lpc32xx_nand_host {
 	struct nand_chip	nand_chip;
 	struct lpc32xx_mlc_platform_data *pdata;
 	struct clk		*clk;
+	struct gpio_desc	*wp_gpio;
 	void __iomem		*io_base;
 	int			irq;
 	struct lpc32xx_nand_cfg_mlc	*ncfg;
@@ -370,8 +370,8 @@ static int lpc32xx_waitfunc(struct nand_chip *chip)
  */
 static void lpc32xx_wp_enable(struct lpc32xx_nand_host *host)
 {
-	if (gpio_is_valid(host->ncfg->wp_gpio))
-		gpio_set_value(host->ncfg->wp_gpio, 0);
+	if (host->wp_gpio)
+		gpiod_set_value_cansleep(host->wp_gpio, 1);
 }
 
 /*
@@ -379,8 +379,8 @@ static void lpc32xx_wp_enable(struct lpc32xx_nand_host *host)
  */
 static void lpc32xx_wp_disable(struct lpc32xx_nand_host *host)
 {
-	if (gpio_is_valid(host->ncfg->wp_gpio))
-		gpio_set_value(host->ncfg->wp_gpio, 1);
+	if (host->wp_gpio)
+		gpiod_set_value_cansleep(host->wp_gpio, 0);
 }
 
 static void lpc32xx_dma_complete_func(void *completion)
@@ -636,8 +636,6 @@ static struct lpc32xx_nand_cfg_mlc *lpc32xx_parse_dt(struct device *dev)
 		return NULL;
 	}
 
-	ncfg->wp_gpio = of_get_named_gpio(np, "gpios", 0);
-
 	return ncfg;
 }
 
@@ -713,14 +711,18 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 			"Missing or bad NAND config from device tree\n");
 		return -ENOENT;
 	}
-	if (host->ncfg->wp_gpio == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(host->ncfg->wp_gpio) &&
-			gpio_request(host->ncfg->wp_gpio, "NAND WP")) {
-		dev_err(&pdev->dev, "GPIO not available\n");
-		return -EBUSY;
+
+	/* Start with WP disabled, if available */
+	host->wp_gpio = gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
+	res = PTR_ERR_OR_ZERO(host->wp_gpio);
+	if (res) {
+		if (res != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "WP GPIO is not available: %d\n",
+				res);
+		return res;
 	}
-	lpc32xx_wp_disable(host);
+
+	gpiod_set_consumer_name(host->wp_gpio, "NAND WP");
 
 	host->pdata = dev_get_platdata(&pdev->dev);
 
@@ -817,7 +819,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	clk_put(host->clk);
 free_gpio:
 	lpc32xx_wp_enable(host);
-	gpio_free(host->ncfg->wp_gpio);
+	gpiod_put(host->wp_gpio);
 
 	return res;
 }
@@ -843,7 +845,7 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 	clk_put(host->clk);
 
 	lpc32xx_wp_enable(host);
-	gpio_free(host->ncfg->wp_gpio);
+	gpiod_put(host->wp_gpio);
 
 	return 0;
 }
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
