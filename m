Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151C1C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3EGk/p5g+HBgs5hchb1vuQEKI5au9Bf/+bH0XQ1UOI=; b=2ciB404Pf+ewyH
	BixuvXZ3paka2Up71ef8lX3gDzL1wuvNTvljnQz8SoFScgdtxbZEfzHLDN6p1UMJGwnFGJhJkgpXT
	2xtwveFOQA7+T3XOJg4NDZmu8EVesiw3wNc1EuZewvncJrQ7SoQjzP4ZQTDcKUlfeUoxQB4QPDhdF
	9RK3JvKUGdVtwUXey/T7zE2yWEyoCCvI85hwKtzI0xDstR5FgRUhPWk3+ysS8NAoBEpHOVdjLTkMI
	OybaKW/jjyJnJTesK+jUQpgXG4WMLKCjIgI6+qEhp+RZn0Y5ZBgt8IJIQNKMv/wGqNrQk8QbESuS/
	Igph1DMyPIX5TL+2nNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jdG-0041RK-0S;
	Wed, 08 Nov 2023 14:34:14 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd6-0041HV-0p
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507973f3b65so9460221e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454043; x=1700058843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aZ+kL6gh2ag7Dh1ER3v2H0746j7EioeKcGfv1Wufa4=;
        b=G1l8SunryAwxZzuDPjyRSGlJ8624chujB2hin0fqOxJ1PCeF6NlRC1gV3F4yo/2ylX
         IylXbHusjvOq6nnuSQSrsDU8yET9IzaCb1eE3jsteJTbabWzhllZp1RpnPSYT8LHApJw
         ihFlXj78jxcLFu2TDlmr7Ben1AcecQR4XFFZ5+ejaZn62g5Zf24whlgcD4PYjX0m1eRs
         sX6vqv70pkq64JonribK1vjXeQfdXYrKK3LzWbj9NyTNj3bZoueCaZUwO+FjLcRVaN3y
         o+iGQ4SJ+8O2v76UAcP5q3cTxi6+17EsCxKklVIwPWNowHkfCVCgV7FEtGkEfyJfi9GQ
         awPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454043; x=1700058843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aZ+kL6gh2ag7Dh1ER3v2H0746j7EioeKcGfv1Wufa4=;
        b=d1pqUrzQcDGjDdb/yB0i6XO1v7VJSIZ018TBEQTUzumGHR0Zw7ozDO/RDMqnxKv52O
         BQuxobXH4q7BXufy7v+dsEsVlkFe5KDVUC6jzlvm9J3t7MWwvkKKAhY1/JumF3hM6P7G
         h3l+WTpjnFj+2JJBd28p9tO1i6+7bhEQH5F6D3teugMC3Qt1i7TpkFLAkVjsVv3DophF
         KuCBNENhyEH1w+6M625xUU+YCAjBOm5mIZuDoVJoOoBylxu0yDeERkWnulLHrMwKGGha
         bk/lYV2yeKwmK2EKlbfcHhaukBX8CzBrdddtXZsji+m92MkMLTS5Cu+P+XFlqfDC6Xam
         XT+w==
X-Gm-Message-State: AOJu0YyPDgjDjKDyEt7+bp+JHwBwMmxB3Icj3NBZdNt5XzRP7zwWL3AP
	xiphe/t7Ix1Lq0BBxG4n95XJkg==
X-Google-Smtp-Source: AGHT+IGG1GNNGOjw1MatPyldmMpT70TP+Kp6b0nAZsqC2/4coTaU8ePyebqXK5jpMs6jLsR4nk0Clg==
X-Received: by 2002:a05:6512:3d8f:b0:500:a66b:b189 with SMTP id k15-20020a0565123d8f00b00500a66bb189mr1999537lfv.51.1699454042830;
        Wed, 08 Nov 2023 06:34:02 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Nov 2023 15:33:52 +0100
Subject: [PATCH 4/6] mtd: rawnand: gpio: Use device properties
MIME-Version: 1.0
Message-Id: <20231108-fix-mips-nand-v1-4-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063404_319468_BAAE3A6E 
X-CRM114-Status: GOOD (  28.77  )
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

The platform data (struct gpio_nand_platdata) isn't really used
in any boardfile in the kernel: the only probe path is from
device tree.

Convert the driver to not use the platform data header at all
and read out the device tree properties using device
properties so we don't need to have the driver be exclusively
device tree either: ACPI or software nodes work fine if
need be. Drop the ifdeffery around CONFIG_OF as a consequence.

The code reads "bank-width" to plat->options flags and passes
it directly to the NAND chip struct, so just assign this
directly to the chip instead.

The code reads one property "chip-delay" that it stores
in pdata->delay and never use, so drop this altogether.
If timings should be supported this can probably be done in
a more detailed way using the new elaborate timings structs
that exist for NAND.

The platform data contains a callback to augment partitions,
but since there are no board files using this platform
data to define a gpio NAND device, this is never used so
the code handling it can be deleted.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/gpio.c | 72 ++++++++-------------------------------------
 1 file changed, 12 insertions(+), 60 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index df6facf0ec9a..5553101c709c 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -22,9 +22,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand-gpio.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/property.h>
 #include <linux/delay.h>
 
 struct gpiomtd {
@@ -32,7 +30,6 @@ struct gpiomtd {
 	void __iomem		*io;
 	void __iomem		*io_sync;
 	struct nand_chip	nand_chip;
-	struct gpio_nand_platdata plat;
 	struct gpio_desc *ce; /* Optional chip enable */
 	struct gpio_desc *cle;
 	struct gpio_desc *ale;
@@ -175,46 +172,38 @@ static const struct nand_controller_ops gpio_nand_ops = {
 	.attach_chip = gpio_nand_attach_chip,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_id_table[] = {
 	{ .compatible = "gpio-control-nand" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
 
-static int gpio_nand_get_config_of(const struct device *dev,
-				   struct gpio_nand_platdata *plat)
+static int gpio_nand_get_config(struct device *dev,
+				struct nand_chip *chip)
 {
 	u32 val;
 
-	if (!dev->of_node)
-		return -ENODEV;
-
-	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
+	if (!device_property_read_u32(dev, "bank-width", &val)) {
 		if (val == 2) {
-			plat->options |= NAND_BUSWIDTH_16;
+			chip->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
 	}
 
-	if (!of_property_read_u32(dev->of_node, "chip-delay", &val))
-		plat->chip_delay = val;
-
 	return 0;
 }
 
-static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
+static struct resource *gpio_nand_get_io_sync_prop(struct device *dev)
 {
 	struct resource *r;
 	u64 addr;
 
-	if (of_property_read_u64(pdev->dev.of_node,
-				       "gpio-control-nand,io-sync-reg", &addr))
+	if (device_property_read_u64(dev, "gpio-control-nand,io-sync-reg", &addr))
 		return NULL;
 
-	r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
+	r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
 	if (!r)
 		return NULL;
 
@@ -224,40 +213,11 @@ static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
 
 	return r;
 }
-#else /* CONFIG_OF */
-static inline int gpio_nand_get_config_of(const struct device *dev,
-					  struct gpio_nand_platdata *plat)
-{
-	return -ENOSYS;
-}
-
-static inline struct resource *
-gpio_nand_get_io_sync_of(struct platform_device *pdev)
-{
-	return NULL;
-}
-#endif /* CONFIG_OF */
-
-static inline int gpio_nand_get_config(const struct device *dev,
-				       struct gpio_nand_platdata *plat)
-{
-	int ret = gpio_nand_get_config_of(dev, plat);
-
-	if (!ret)
-		return ret;
-
-	if (dev_get_platdata(dev)) {
-		memcpy(plat, dev_get_platdata(dev), sizeof(*plat));
-		return 0;
-	}
-
-	return -EINVAL;
-}
 
 static inline struct resource *
 gpio_nand_get_io_sync(struct platform_device *pdev)
 {
-	struct resource *r = gpio_nand_get_io_sync_of(pdev);
+	struct resource *r = gpio_nand_get_io_sync_prop(&pdev->dev);
 
 	if (r)
 		return r;
@@ -291,9 +251,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret = 0;
 
-	if (!dev->of_node && !dev_get_platdata(dev))
-		return -EINVAL;
-
 	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
 	if (!gpiomtd)
 		return -ENOMEM;
@@ -311,7 +268,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(dev, &gpiomtd->plat);
+	ret = gpio_nand_get_config(dev, chip);
 	if (ret)
 		return ret;
 
@@ -349,7 +306,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	chip->options		= gpiomtd->plat.options;
 	chip->controller	= &gpiomtd->base;
 
 	mtd			= nand_to_mtd(chip);
@@ -372,11 +328,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp;
 
-	if (gpiomtd->plat.adjust_parts)
-		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
-
-	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
-				  gpiomtd->plat.num_parts);
+	ret = mtd_device_register(mtd, NULL, 0);
 	if (!ret)
 		return 0;
 
@@ -395,7 +347,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove_new	= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
-		.of_match_table = of_match_ptr(gpio_nand_id_table),
+		.of_match_table = gpio_nand_id_table,
 	},
 };
 

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
