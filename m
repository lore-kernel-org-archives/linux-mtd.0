Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB21C04A95
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Sep 2022 23:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8P5fom6NJC3uuKCj4tbuwlsJIT9oqmRwVVUl7AAy78=; b=uyDN7PXS/F6dwi
	oYC7dz/+EeqPytWWak6nWJJYZOxZejINc85fK1aIO4xcfi/mexfTumfep1QnNfnGkI/zDsA3RKEKm
	sjKllwwZHwufbG+5Wt0o2tNbUdU7KyxUadJhpUsZwzdcWXg5Fs2grGNmvKki4GswedkG7d28Wr9Ng
	rf4IOqMB/cUqM/BYDCcoDCTA4I1V7cUIo3kF/eTcJO2HUSOGGBgT/7YSnx6UJGTfA7bXIpWiymcmZ
	o+cOb2IGqh0SPGNRvbK6vtOAxPevC6WtnxaP7R4OLjJNbo7mCTvoLNcS90S1Su8hDvTC/4DVDaILL
	+lH6oDCAD0ektwL+zQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odg2X-000bHG-3V; Wed, 28 Sep 2022 23:00:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odg2T-000bGb-PD
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2022 23:00:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso4229481pjk.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2022 16:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xyqBAfgMbKsG1bS9uEwWZcTc5tk+jlmU9fHypf3OEa8=;
        b=qMlo9j6pwVeIXEkAqDxCLVfOQMlsJyt9JqKdiPj4tVyYOukDxmo7KPJTVSOVb3Ct5/
         b9SeT7Tkpj0kN2nTqKhl9LXmHDkh+dzst1c39jqqISYEncYKk4kcsEAuhYkfKu4lqz9T
         uQNxzE6MCKbyitvpyqhtAYC3XcitXtuaU3YnXt6aPFn9vrT+ayQlcavjLD+BAwCk30aW
         Des3aeC/VmClpav5U1vm3DGda5wrtA8EGIIwZ+HTSc2bMIJvzOr2hJwb9TjFKYd833eN
         gBhkvevEiaww9GmFBM9EhdUNWEL3Bail3KjZ6YTkmIWBruhQwmnN4dD7+ZuwzO9qiOr1
         m6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xyqBAfgMbKsG1bS9uEwWZcTc5tk+jlmU9fHypf3OEa8=;
        b=hO5LKfx0qZGwlhuJ8pS7ufKfVAM32V/F0m+vb9WywTAZ8iGF3Hc2PeWi8oOqqk6HC0
         5W39ezXUsB6wECyg3t9Uh8MQR8sawlBNQ9RXtzisTB2U2k9f+DpjXGC1NEqYC1mLnYhT
         oS3t2qZtwYAA93tt2dRKAn5RQxDrmRn7tuK4P+qDpBDTgCeYHq02GEABqdDt/I21RXej
         glg5x54izCR6zTz12biVOTI9eZai/WqWx5YoAj5oUHdx6VKnQ274Im9P3mBFbrDq+fMy
         tv+v67Cf10pX6UrO5AqF6lJ+8WKPakRFA+Wlksf36DDO66pQSY5pfO0TB3dH1GE9cmu3
         88vQ==
X-Gm-Message-State: ACrzQf1kwA4F8934xe1bQQZ4gVdxK3rlzOzWbXXlfQAGkiP9VKN+5SKp
	bglgnwcwRLvi0w5OCYzqHso=
X-Google-Smtp-Source: AMsMyM4K00C1K9/RwNv26xbu6eFrQCL0UdWQJ9PWWJc0wRHtpsPsuIVgcMdBqNA7IUd7lckZty0ebA==
X-Received: by 2002:a17:90b:3ec2:b0:202:b123:29cc with SMTP id rm2-20020a17090b3ec200b00202b12329ccmr13094369pjb.167.1664406023559;
        Wed, 28 Sep 2022 16:00:23 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
        by smtp.gmail.com with ESMTPSA id 195-20020a6216cc000000b0055a9c9cfc63sm2737309pfw.201.2022.09.28.16.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:00:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: lpc32xx_slc: switch to using gpiod API
Date: Wed, 28 Sep 2022 16:00:19 -0700
Message-Id: <20220928230019.2140896-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20220928230019.2140896-1-dmitry.torokhov@gmail.com>
References: <20220928230019.2140896-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_160025_837523_32EDF8F0 
X-CRM114-Status: GOOD (  17.42  )
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
 drivers/mtd/nand/raw/lpc32xx_slc.c | 33 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6b7269cfb7d8..4702577f74e5 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -23,9 +23,8 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/mtd/lpc32xx_slc.h>
 
 #define LPC32XX_MODNAME		"lpc32xx-nand"
@@ -208,7 +207,6 @@ struct lpc32xx_nand_cfg_slc {
 	uint32_t rwidth;
 	uint32_t rhold;
 	uint32_t rsetup;
-	int wp_gpio;
 	struct mtd_partition *parts;
 	unsigned num_parts;
 };
@@ -217,6 +215,7 @@ struct lpc32xx_nand_host {
 	struct nand_chip	nand_chip;
 	struct lpc32xx_slc_platform_data *pdata;
 	struct clk		*clk;
+	struct gpio_desc	*wp_gpio;
 	void __iomem		*io_base;
 	struct lpc32xx_nand_cfg_slc *ncfg;
 
@@ -309,8 +308,8 @@ static int lpc32xx_nand_device_ready(struct nand_chip *chip)
  */
 static void lpc32xx_wp_enable(struct lpc32xx_nand_host *host)
 {
-	if (gpio_is_valid(host->ncfg->wp_gpio))
-		gpio_set_value(host->ncfg->wp_gpio, 0);
+	if (host->wp_gpio)
+		gpiod_set_value_cansleep(host->wp_gpio, 1);
 }
 
 /*
@@ -318,8 +317,8 @@ static void lpc32xx_wp_enable(struct lpc32xx_nand_host *host)
  */
 static void lpc32xx_wp_disable(struct lpc32xx_nand_host *host)
 {
-	if (gpio_is_valid(host->ncfg->wp_gpio))
-		gpio_set_value(host->ncfg->wp_gpio, 1);
+	if (host->wp_gpio)
+		gpiod_set_value_cansleep(host->wp_gpio, 0);
 }
 
 /*
@@ -764,8 +763,6 @@ static struct lpc32xx_nand_cfg_slc *lpc32xx_parse_dt(struct device *dev)
 		return NULL;
 	}
 
-	ncfg->wp_gpio = of_get_named_gpio(np, "gpios", 0);
-
 	return ncfg;
 }
 
@@ -852,14 +849,18 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 			"Missing or bad NAND config from device tree\n");
 		return -ENOENT;
 	}
-	if (host->ncfg->wp_gpio == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(host->ncfg->wp_gpio) && devm_gpio_request(&pdev->dev,
-			host->ncfg->wp_gpio, "NAND WP")) {
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
 
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
