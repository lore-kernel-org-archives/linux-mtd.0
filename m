Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF90ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2Wp25P7tLwaSltAOmqR/tLA1Df8Obg0K7B8KzECYRA=; b=tOPC74rOUzHkTY
	bWoa5EE05g+Ypo0Ubf0z5DgrU5PIBrfzzMBhx3zt9mrPuUWg3SoYYYfZq3lYzZEsCtpdn162+IqL2
	y/YDOEAnXJAGCKZQ9axeqmWlEGN+mrk2OqPmUoNo2EbqAge1Y4C9rhFqqHuqg/T3dWFxviZZhAyxz
	vUEVhDx873KHZj05Ehtc2KUKT2SNTflfulBaHbBEwLxuQf2vwLEuHt4jqHi8GBHL403rWQGmynJ8v
	xG9GqmgzOHfgeb/Ll9eLgXYTudAMmPpwueAu2ohU4qli/7RIccQ56OV3dd53M+EI1sGpHvyzWp7ur
	RiMyXbZz8zmjAgGgU4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5hg-00CKel-Uj; Mon, 05 Sep 2022 06:35:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5di-00CG2I-SD; Mon, 05 Sep 2022 06:31:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id 197so2184813pfy.6;
        Sun, 04 Sep 2022 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
        b=pdli+4eCvdWbxLZpx0O/e5Ud3wuQ5WWZPs7wxvLZ8aWyeshw5o3oRO/WG8ev2Aaq1m
         BX/Fr0/H0104qGs68GxhCwuFDG+PdZ2DrBRO+OPQVwRTpp7rdrBwbaXxSj0nC7vBM+b5
         GXjvKR+R9YSnP5K560kQKQaswuG1HWEF9p6rBSHyfMHnnKCObj/NMkW/0nwlLU7coaJN
         lMlGTVarp6ddLZqLDpTSWdUVPPyTlQJyHZXKdGvmnZujDf4OJXr1QpZ4olhMYA2SJhx8
         m53y0aRnHgIB7peKEuEd6JQIyv+D3WxGZ668VhcUTC58GT5LurfYxI/+Of47FfV3GuNG
         TzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
        b=rt5qhU23D2dWxThSItEpziHEIjx6oXMXeAevatmWt76zIVvRg9RWNlKiy5ktXw/lNE
         y88WoF+uzMSFmwCn5Wp7/9iItl7NzDqbw9YgHVud1KHoP6C7dpalWSm4IyZLLEV2cP/R
         T/l6aYz7Y2BTI4uwjVWs6WRHOA2C6o/dD6AUiP+SKsf8ZyiUVtC5AmQQ/T7bWjLSWEKX
         OwGWTCpGXfN+eazuCjMMM24iANfPkx+4wBDtTANC2NEL8Kni76gATUwy7kjsZPM22s6I
         kPfEMvstCYrp7exc3KeGQfuWJ0DJgX3u1R3k205jUtHUQc+TIGVdzXq1OZWv1EYzIZLt
         hcfQ==
X-Gm-Message-State: ACgBeo0HZ8kuCazU8M0PTNGk6r480s81sJweITPaISB4ueaUOZ63nYj1
	pDJgXRKnzA4l/GlGkaOWPA4=
X-Google-Smtp-Source: AA6agR5cvvg/UZg1XV6YqtMeu4gBydqn31I2YyYPcH2GdlFOcXWs2FB6+oFFKzKdNcI+NqL1V/14Sg==
X-Received: by 2002:aa7:978c:0:b0:537:d68e:3a27 with SMTP id o12-20020aa7978c000000b00537d68e3a27mr28251047pfp.71.1662359481595;
        Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
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
Subject: [PATCH v1 05/11] usb: gadget: udc: at91: switch to using fwnode_gpiod_get_index()
Date: Sun,  4 Sep 2022 23:30:57 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-5-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233123_094685_10656442 
X-CRM114-Status: GOOD (  10.86  )
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

I would like to stop exporting OF-specific gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 728987280373..1db1dbbab79a 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1779,12 +1779,14 @@ static void at91udc_of_init(struct at91_udc *udc, struct device_node *np)
 	if (of_property_read_u32(np, "atmel,vbus-polled", &val) == 0)
 		board->vbus_polled = 1;
 
-	board->vbus_pin = gpiod_get_from_of_node(np, "atmel,vbus-gpio", 0,
-						 GPIOD_IN, "udc_vbus");
+	board->vbus_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						 "atmel,vbus", 0, GPIOD_IN,
+						 "udc_vbus");
 	if (IS_ERR(board->vbus_pin))
 		board->vbus_pin = NULL;
 
-	board->pullup_pin = gpiod_get_from_of_node(np, "atmel,pullup-gpio", 0,
+	board->pullup_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						   "atmel,pullup", 0,
 						   GPIOD_ASIS, "udc_pullup");
 	if (IS_ERR(board->pullup_pin))
 		board->pullup_pin = NULL;

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
