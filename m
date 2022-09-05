Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89F7ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVKyBOSJfq2mpD6CgYFONgESPsQNCitkcre5TdFfezY=; b=Jg8itcrwacHtJV
	B6N3lKKEJXgixhpnmINdFAwLZIHkESyMTcj8PhfB+PorCcM6iR7wLaTC5H8HY+2ak2K3838g7LON3
	9tp1wF2wPJlTzhq3LmTyvLiaCW5SOxRvHkMTbC/c3AacoSL5xolJBUFMzzxdNYsb7Sx9oBpufSEdn
	VwNiTAFN0e03pcPZDsgqQ9QiBexP2BB2YtLGk1+b9TdAQ+veMfXOXZPHRGwNLzsC26SGUVEBLUhcV
	0B/OwAN0XULxKxaqvpw3J5I9gO/WOoIoLO7I9aSdrzlPlHsYYbGdjPFVrSt+kgToqGdjxyqn5mRj4
	UUpf82LJ0f45/FDjgorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5hE-00CKEw-81; Mon, 05 Sep 2022 06:35:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dg-00CG0c-IK; Mon, 05 Sep 2022 06:31:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y127so7745128pfy.5;
        Sun, 04 Sep 2022 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nEbjUfr7fwqueSmjAsD0W8GSCJGEGPrp4ULUwjjyEJA=;
        b=BwhSxhJHuNZubY5udVF0benef1V78QThc+I+5pdGaAhS9f7czmXQ0+lX6fLemCXOdl
         3fHYh5mFxmh6vXpEgGgoJfSt54Hg8m+uS1Wxx8zGEMMd3IMEilC7XzLCelQyUpIGADDa
         eHrlp4RIUpSke6IDMjI2wRpqP3Xcu9nVikuwws6JGbz1bpaNy+xlA1aWhyGXSVM8Bgez
         rR7uraO+M+9xWjLBH/xW3NfDDpH5H4xC8AhL1rqmFoqQ1YQUTwU9vSojevfdF4bc76Qh
         TW0gqThzNTQaw7vPqkwkLSNXzYRvK/UJpAMinaSHE472WQuIkYWNlxKNX/l2rblcn6fr
         t2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nEbjUfr7fwqueSmjAsD0W8GSCJGEGPrp4ULUwjjyEJA=;
        b=M+4xx+jh/wDfMPTBQVoZtWDKT228i+Q57vg54Vx5TiSdVP0okrtA3BtAMtOg2AYt/U
         jLSEInP9VAND6pz+s/QbR+JI8HgfZoilhXUIlDr4sA5zhtPSfCTtYsdenOvVubQHqN0B
         /nHVLW3AMyEl4CZS5dr4HI3UPZ8Yw9G/56d/jCkpsWhrCm3gThPqNYVbVRG6jX66+4RL
         94CUnh2IpzQpvtrZe3WEMJ0qJ9aqCStgbh330mLPDseWrPqG3VrmBYLGlITUTnfAzT2B
         wr5BOzn0RguQJ8nX+MlPIHjZhkDga9MT7QrTMNRmY4rYQXnQzmSCw16Bn1sn5MYba0Lx
         WIpw==
X-Gm-Message-State: ACgBeo1jU4/znb+a+s6qVCg+efz2m5ZuC5azEzybP9Li5NzEOZyCYTO+
	q1HrWBmQt/vnlnsTy5RanlV33t3Dgm8=
X-Google-Smtp-Source: AA6agR7O3xsaJm3PXWVEz8pTAeV7SFmhqqPNXXBFz2iOIaqf7IbZO/oITkU5Ekfa+HSas+vh7tCo8A==
X-Received: by 2002:a05:6a00:2293:b0:53b:93ec:1dc1 with SMTP id f19-20020a056a00229300b0053b93ec1dc1mr8858576pfe.62.1662359479124;
        Sun, 04 Sep 2022 23:31:19 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:18 -0700 (PDT)
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
Subject: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
Date: Sun,  4 Sep 2022 23:30:56 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233120_686082_60E42C0D 
X-CRM114-Status: GOOD (  13.94  )
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
device property API.

I believe that the only reason the driver, instead of the standard
devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
wanted to set up a pretty consumer name for the GPIO, and we now have
a special API for that.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 68cd4b68e3a2..f0240107edb1 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1440,16 +1440,22 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 			return err;
 		}
 
-		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
-						    "nvidia,phy-reset-gpio",
-						    0, GPIOD_OUT_HIGH,
-						    "ulpi_phy_reset_b");
+		gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
+				       GPIOD_OUT_HIGH);
 		err = PTR_ERR_OR_ZERO(gpiod);
 		if (err) {
 			dev_err(&pdev->dev,
 				"Request failed for reset GPIO: %d\n", err);
 			return err;
 		}
+
+		err = gpiod_set_consumer_name(gpiod, "ulpi_phy_reset_b");
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to set up reset GPIO name: %d\n", err);
+			return err;
+		}
+
 		tegra_phy->reset_gpio = gpiod;
 
 		phy = devm_otg_ulpi_create(&pdev->dev,

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
