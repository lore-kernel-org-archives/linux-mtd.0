Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD24ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmKY+9R5+0kOCeV/bG32l0z1ePI71/bN20DE7TOFuv8=; b=mIIfWfrQN+0M/9
	NhbC0RFAeyMNTVfPvkGgSGE1W+xBaxLwQ4yI/z0xV5UXj+FP1u4y6ilbVPd1DqVdpEjGs6o8gjE8B
	Dpx6Mwd7unFb2FD+zUnk0DBz5V/6Q333Vsf4iOG8CC4Jz2VYo50/bFrgDM+sR4kdf2mcZixW/NAAb
	Skuw6y5yCgLqTcmd+60E7K+SUuIaPrONzBc3kVXiC5Ye34mrf+ATpiupjZhYmNqHK+lU3t4DyQGKD
	5eClzPztm/msWRqgcsvGhjhpeJdZlQIRdr07ef9wQ9eEXv5SSN2ICidx+eaLV623w9yvHO3S3MPON
	hL0sRrdLupwfq52n64TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5mX-00CQjT-UH; Mon, 05 Sep 2022 06:40:30 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dt-00CGEm-FM; Mon, 05 Sep 2022 06:31:36 +0000
Received: by mail-pj1-f52.google.com with SMTP id fs14so2717793pjb.5;
        Sun, 04 Sep 2022 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zVe7w76eC6bgTDoVT05JO9xbEs/H8FGbqX7haQWgZL4=;
        b=kACI45UuEBwpfjjyassFNG0U98Hr0eJu20A/vSxogzN+vfXjugJ8KzkYn5wwKX5gbB
         uJeLI0QAz/+xelvX3OGbdcJTSgu2dNpdrSGSQg4famb7eeB/AbL7WHoZEDiXHjg2hnUR
         4PSFIifn7lLM+A5nAaRKBTzgdAw7qg0BfzTpJ86cTaNvjX02vYPt0RebiXWe/iwHmm8q
         zGwFv8Qb/Nc0B3WMsCOQ/E4dqsgR2yN3yxu1FOcDO2Kb6oKm+SyvVHxf73Na21XGjNsa
         qHG58A2uebJOTkVIVHXCa9lAAMCpYNCKRv84xKCdiCS3bEdL5OBKRFVk2atPS95mlJqb
         +oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zVe7w76eC6bgTDoVT05JO9xbEs/H8FGbqX7haQWgZL4=;
        b=7XMUqw6LD/GHzcc6yHDPPJ20xpq/GDfSWJx8CsDybrErVkJCwUZLZZJxmAAX3SWOhd
         vsPfrDlDqRauWzyIS8EMIETKKTRKWsp4bDcsevObGaZFXTOTMk/nsixjS8PrOtpa4Fmy
         0VksxV+LkLnyT28SkqSrTlklUwYFuY13GmkrXhiSCHe6Lcabc7QevlNS9R6yC0GzozgZ
         uhZGQdKzTIZer0TfNWgoWKfXB/xSNBt3Di9gag6+U2Eq6Mpq2tV6BT1sYEBtoB2RfpMB
         PJa/stRqJ1c6CRk9UEInPTVI7JQflAucbRTvSuwNQGC0N9Zu/gtR142voNmdWn/lsQ9y
         Oogw==
X-Gm-Message-State: ACgBeo1bIRkBTDWTummgrheYL63kbIQdcQUj1yd7UIvA6GrmtaBQPXQs
	2lEwKvrn88e2y7VTLUNXfGQ=
X-Google-Smtp-Source: AA6agR41wNIiOLemySzBG0aXdzuGwcXJzGb1vIFW9PWKwOZh9QVyUeHaIw4+NjnqDzJgWjv579LMTw==
X-Received: by 2002:a17:902:b581:b0:172:a34e:18fd with SMTP id a1-20020a170902b58100b00172a34e18fdmr46918225pls.163.1662359491466;
        Sun, 04 Sep 2022 23:31:31 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:31 -0700 (PDT)
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
Subject: [PATCH v1 09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
Date: Sun,  4 Sep 2022 23:31:01 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233133_594984_9E12FD4E 
X-CRM114-Status: GOOD (  13.91  )
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
bd957x_probe() to the generic device property API as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index aa42da4d141e..393c8693b327 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
@@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
 	}
 
 	ic_data->regmap = regmap;
-	vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
-					 "rohm,vout1-en-low");
+	vout_mode = device_property_read_bool(pdev->dev.parent,
+					      "rohm,vout1-en-low");
 	if (vout_mode) {
 		struct gpio_desc *en;
 
@@ -948,10 +949,10 @@ static int bd957x_probe(struct platform_device *pdev)
 
 		/* VOUT1 enable state judged by VOUT1_EN pin */
 		/* See if we have GPIO defined */
-		en = devm_gpiod_get_from_of_node(&pdev->dev,
-						 pdev->dev.parent->of_node,
-						 "rohm,vout1-en-gpios", 0,
-						 GPIOD_OUT_LOW, "vout1-en");
+		en = devm_fwnode_gpiod_get(&pdev->dev,
+					   dev_fwnode(pdev->dev.parent),
+					   "rohm,vout1-en", GPIOD_OUT_LOW,
+					   "vout1-en");
 		if (!IS_ERR(en)) {
 			/* VOUT1_OPS gpio ctrl */
 			/*
@@ -986,8 +987,8 @@ static int bd957x_probe(struct platform_device *pdev)
 	 * like DDR voltage selection.
 	 */
 	platform_set_drvdata(pdev, ic_data);
-	ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
-					 "rohm,ddr-sel-low");
+	ddr_sel = device_property_read_bool(pdev->dev.parent,
+					    "rohm,ddr-sel-low");
 	if (ddr_sel)
 		ic_data->regulator_data[2].desc.fixed_uV = 1350000;
 	else

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
