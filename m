Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D24C6FA86
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/N8ssU5TR9rTeWszOBciq4bQ37HW2rcaHwb5PieS70=; b=A/0mMoUsw5XKeV
	yDLLqgVJznOT870mRYetpXoXPaiMYZjuZE/y5ScBFagYz1f5ZYxCkJKJjKWku3XSendIlAkhvSkgP
	Blnz0yWI6ufF4VTD/iSYVHzioqL1Rk4nJ51hEKZvyd+bPwVQ7i0m+qOPTgyzhzM81LUUhX6HoLk0I
	lK0iH6zseNycO7Qk4SIRefaEC+gFZbka81XRpbj9p00gg0MmBdjBj2mJD8xg6ycrIGDMW2qfRULSB
	LcI12R48NTj12t3/BOCZWvyTXt5Tiex34H4jfFGL+DRLFpM43BqYexrmq+rC3adKxETtNSff9wQqa
	XZ7e2gthsSH47z7ba1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5mn-00CR9N-GY; Mon, 05 Sep 2022 06:40:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5du-00CG0c-I7; Mon, 05 Sep 2022 06:31:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y127so7745618pfy.5;
        Sun, 04 Sep 2022 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pAKqmxhI+oYn9rP6tb2/SpDfiCBIbZJKyeH2Ncx9Utw=;
        b=CHUpPUJQaZbtMHqPTyL16aZuu5dGfpUKyuTqpooxvmLk7vBdmb+3IZJQADg9TyuoAE
         0cG8hAWaahDZkANpgUlWjfY5/vdmfKu1XvftcF1vV0Zw4fcd3kAN8/tSHuaMoO0zpNBm
         YXE0wZKHC9zPU4U9Xl7Yhd25Z9ZuxlTB5qduXGsQAWvctKwUZPCTxgudnP1CsA9Z4aVZ
         +tauvc8nl8DqsSgMpx3Neo+dDGPXdFjpkpvztqgpLzbV9vhTRQcq+q2v4AIEPo0McvJX
         Ku8OCbM6x0lGXNoU5zr7539SBCdoAztESfRlg7+222oUU+VMgGHfb3EsA6bKMFDi8B5B
         6xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pAKqmxhI+oYn9rP6tb2/SpDfiCBIbZJKyeH2Ncx9Utw=;
        b=gRNVJgIQJkgV6V6ngF/88ganoVkOWd0rV7Jgx94pbfXIdtl+khk2n1rA9Ch1L2AqJ9
         cheDs7Vh/yM3rk09W9Cf1qH105YW0GukzbFgP5P+dQZ/CPfD+XGLyd/0cgMSkXahH47x
         IBaMjnip8ZVby39KhtmMK0F1GcnvmgH22+vsqrL91UHE8sIbO2UGxfER6HudMPHHptcT
         /SAAYbdt4HBL+5SR/OR9jdh5qoYEFFfVZ8cWZ5Ty0IztgHIN5azk9F83dBQZ+x/+QFW7
         j3Y1a+9e0R4bAu+DNB95G2aXiU9NAMzXveUPjQtyoQBnnfeqhtihGZGrP1NeIOVTeWJc
         pc5w==
X-Gm-Message-State: ACgBeo3uOFMzAOw2O5Zyh56nK3/4mQ5WElz+mU0Jig+8sMlCyQEa73x3
	UghZT9HFVrG/3QnbcRHwClY=
X-Google-Smtp-Source: AA6agR5nG0upukGr31j35s6QedIco+3RyHqtesjnmbs5inKKkFPhSexvscm/vPmPhr8DelSSovnwog==
X-Received: by 2002:a63:4c4f:0:b0:430:41b4:bfc3 with SMTP id m15-20020a634c4f000000b0043041b4bfc3mr19959819pgl.457.1662359493913;
        Sun, 04 Sep 2022 23:31:33 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
Date: Sun,  4 Sep 2022 23:31:02 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233134_694167_276B53DC 
X-CRM114-Status: GOOD (  18.14  )
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

I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

While at it switch the rest of the calls to read properties in
bd9576_wdt_probe() to the generic device property API as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/watchdog/bd9576_wdt.c b/drivers/watchdog/bd9576_wdt.c
index 0b6999f3b6e8..4a20e07fbb69 100644
--- a/drivers/watchdog/bd9576_wdt.c
+++ b/drivers/watchdog/bd9576_wdt.c
@@ -9,8 +9,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/rohm-bd957x.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
 
@@ -202,10 +202,10 @@ static int bd957x_set_wdt_mode(struct bd9576_wdt_priv *priv, int hw_margin,
 static int bd9576_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->parent->of_node;
 	struct bd9576_wdt_priv *priv;
 	u32 hw_margin[2];
 	u32 hw_margin_max = BD957X_WDT_DEFAULT_MARGIN, hw_margin_min = 0;
+	int count;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -221,40 +221,51 @@ static int bd9576_wdt_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	priv->gpiod_en = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
-						     "rohm,watchdog-enable-gpios",
-						     0, GPIOD_OUT_LOW,
-						     "watchdog-enable");
+	priv->gpiod_en = devm_fwnode_gpiod_get(dev, dev_fwnode(dev->parent),
+					       "rohm,watchdog-enable",
+					       GPIOD_OUT_LOW,
+					       "watchdog-enable");
 	if (IS_ERR(priv->gpiod_en))
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_en),
 			      "getting watchdog-enable GPIO failed\n");
 
-	priv->gpiod_ping = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
-						     "rohm,watchdog-ping-gpios",
-						     0, GPIOD_OUT_LOW,
-						     "watchdog-ping");
+	priv->gpiod_ping = devm_fwnode_gpiod_get(dev, dev_fwnode(dev->parent),
+						 "rohm,watchdog-ping",
+						 GPIOD_OUT_LOW,
+						 "watchdog-ping");
 	if (IS_ERR(priv->gpiod_ping))
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_ping),
 				     "getting watchdog-ping GPIO failed\n");
 
-	ret = of_property_read_variable_u32_array(np, "rohm,hw-timeout-ms",
-						  &hw_margin[0], 1, 2);
-	if (ret < 0 && ret != -EINVAL)
-		return ret;
+	count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
+	if (count < 0 && count != -EINVAL)
+		return count;
+
+	if (count > 0) {
+		if (count > ARRAY_SIZE(hw_margin))
+			return -EINVAL;
 
-	if (ret == 1)
-		hw_margin_max = hw_margin[0];
+		ret = device_property_read_u32_array(dev->parent,
+						     "rohm,hw-timeout-ms",
+						     hw_margin, count);
+		if (ret < 0)
+			return ret;
 
-	if (ret == 2) {
-		hw_margin_max = hw_margin[1];
-		hw_margin_min = hw_margin[0];
+		if (count == 1)
+			hw_margin_max = hw_margin[0];
+
+		if (count == 2) {
+			hw_margin_max = hw_margin[1];
+			hw_margin_min = hw_margin[0];
+		}
 	}
 
 	ret = bd957x_set_wdt_mode(priv, hw_margin_max, hw_margin_min);
 	if (ret)
 		return ret;
 
-	priv->always_running = of_property_read_bool(np, "always-running");
+	priv->always_running = device_property_read_bool(dev->parent,
+							 "always-running");
 
 	watchdog_set_drvdata(&priv->wdd, priv);
 

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
