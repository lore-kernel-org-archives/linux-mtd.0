Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B78ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CMxmXtmuekI6JTYpo8Uxr/yjCxntubeoR5zq/bwYQjU=; b=P0bhKybDQBHKA9
	tu+2J2/2XPCJKsWKwhjiAq4YbUlYrYd7pU6eFIZAmhRapTtmsTVpBXtSY1aVve0HSSVXJNcE2eqMe
	pKDQTIXzyZCGYakWtEkGAFwNrUef1wYbUxOYprDA3rAQ2tJbtuOhGHFREDfYFQMED9yN7MTbUAI2L
	oYl1gaFhd5IwOQSpU26iT/5Mg/VfBmW1mI49xCb3lz/7fYomIsRn54u9/sXm9vEHRMoJ7n/ZZaBgQ
	HyqoY3VQQ7T5sLHPx5ZlG8WMGODkhCbdUsGDkt6PsDObQlY18g1wXI1YyswkJ7b/GxGlsMD6YyyZU
	eUmHaPMDoKrXBHowY09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dq-00CGAq-DA; Mon, 05 Sep 2022 06:31:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dW-00CFp9-SI; Mon, 05 Sep 2022 06:31:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id l65so7729975pfl.8;
        Sun, 04 Sep 2022 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=s5BObB/DFF43Zpjz+AxwbAQA1wE3EC6yd1PYO1tpkJ0=;
        b=eLC8Rb8Jtj6ohqIsxli11sh5mg6/lRM2jJY189w3rlTxUvSnPyQEKwgiFzri16qznK
         8Q1UK6BI5arOWJOW0tj1AFole4eAGnwtpWLBlNUo5DLvXjDf2L6w22Ztu0jF9lQM7v6B
         Mgw/mw3etr4vw1HQQFCWIU3BlD77SGHudPuPuFK4F9ujodYtIFvp6WmYCo+o/G/rhDel
         cW0w+zf7/RP7Nz0D6/Vjgje6fNrs1I/PeMd47xU/8sAWlLKDTbXsIi2Op/DBjE+aLmmC
         MAF22o/KivEly0jsBjH1TXScPbJfn9X2BkKRRH0cKrk4wP42LwxdMHRse73eSv3HS6NH
         jCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=s5BObB/DFF43Zpjz+AxwbAQA1wE3EC6yd1PYO1tpkJ0=;
        b=OouJwmt02tWoioBB0jyCIt0AgWU74bGN78sONnjeH6T5MpWvcMF/adOu/6p6TkdKpU
         iCM1fPYCctVMzWvuOp2drdetPm/je2hESC/QjDXsqV2vL4BajXya8Y+hy5QeJZqa1+di
         AeSqE6S7srJR9j08f1SJzdkn6t94Pxx5ya5zMO+kLY6bQO/wMakIqBcEQad2oA189kgA
         ksqsUNS/LeSa4kOxGTNIJZE45qZYZKMpY85iim8axHBq6ursCWttAui+WpK8kk+A64pk
         r84C/S0NQmPoIwKZsbY4KKe4GCcCOimEqa83TONuhTxZceK5PYCpxk4MvZR2zh2tciKa
         9RgQ==
X-Gm-Message-State: ACgBeo1KCL0JTgEThhm0HMRmYOqp6473oKtq0zNmIzwDH/shnATl4wLz
	iWYfYWKWY1McHm/4TjZ88ws=
X-Google-Smtp-Source: AA6agR6MPvi6YNNmbiAwPTRGnWV1I0ziWOWrr545AIf0+R4zt3mu9zZID4cCyo19DCCSuxN6bYnKJg==
X-Received: by 2002:a63:4566:0:b0:41d:353:46b4 with SMTP id u38-20020a634566000000b0041d035346b4mr41713619pgk.316.1662359468624;
        Sun, 04 Sep 2022 23:31:08 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:07 -0700 (PDT)
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
Subject: [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node() public APIs
Date: Sun,  4 Sep 2022 23:30:52 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233110_999753_5B0FFB82 
X-CRM114-Status: GOOD (  13.56  )
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

I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit. We can do that by switching drivers
to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
the door to augmenting device tree and ACPI information through secondary
software properties (once we teach gpiolib how to handle those).

I hope that relevant maintainers will take patches through their trees and
then we could merge the last one some time after -rc1.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
Dmitry Torokhov (11):
      PCI: tegra: switch to using devm_fwnode_gpiod_get
      drm/tegra: switch to using devm_fwnode_gpiod_get
      mtd: rawnand: stm32_fmc2: switch to using devm_fwnode_gpiod_get()
      usb: phy: tegra: switch to using devm_gpiod_get()
      usb: gadget: udc: at91: switch to using fwnode_gpiod_get_index()
      PCI: aardvark: switch to using devm_gpiod_get_optional()
      PCI: apple: switch to using fwnode_gpiod_get_index()
      regulator: bd71815: switch to using devm_fwnode_gpiod_get()
      regulator: bd9576: switch to using devm_fwnode_gpiod_get()
      watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
      gpiolib: of: remove [devm_]gpiod_get_from_of_node() APIs

 drivers/gpio/gpiolib-devres.c          | 55 ----------------------------------
 drivers/gpio/gpiolib-of.c              |  1 -
 drivers/gpio/gpiolib-of.h              | 13 ++++++++
 drivers/gpu/drm/tegra/output.c         | 10 +++----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  5 ++--
 drivers/pci/controller/pci-aardvark.c  | 23 +++++++-------
 drivers/pci/controller/pci-tegra.c     |  9 +++---
 drivers/pci/controller/pcie-apple.c    |  4 +--
 drivers/regulator/bd71815-regulator.c  |  7 ++---
 drivers/regulator/bd9576-regulator.c   | 17 ++++++-----
 drivers/usb/gadget/udc/at91_udc.c      |  8 +++--
 drivers/usb/phy/phy-tegra-usb.c        | 14 ++++++---
 drivers/watchdog/bd9576_wdt.c          | 51 ++++++++++++++++++-------------
 include/linux/gpio/consumer.h          | 48 -----------------------------
 14 files changed, 96 insertions(+), 169 deletions(-)
---
base-commit: 7fd22855300e693668c3397771b3a2b3948f827a
change-id: 20220903-gpiod_get_from_of_node-remove-de3032fc01de

Best regards,
-- 
Dmitry


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
