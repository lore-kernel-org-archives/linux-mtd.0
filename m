Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D99ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HORi8vcCE5kqHmU4BYxWZHlqsuWD6WdvUALIqE+6Wdk=; b=PfQlgM+ueDRYsg
	epBru8Qn/YVlWG2jT9olcOBIFH+vanOWbknTHPysDUa0OCQSrR1qF6LpCWE22GtlAmtH4qN3m2/SZ
	9MNWtj7YtyK8Nze3zt/o3IYBzjKiNzOkmLa/ddxST3EFpDx86dJlGOAVVRW2peWxWyka/7NXBBs4m
	6qriAZrRO5596l45i+5aNuRJBtmYedhJxi6KQqFl8g0KyxOChFLS/tm/aPwySV2sWZ4/Lvz1660kF
	qHK54eJcfxwF2aK1HS35AfrfvL52aOQtBfVhCoDx2lAfUczJOuiATeujVqTGyxnlYd+Tzi+i5gynD
	gZRsLiSalyZ7PtMPLnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5h1-00CJvh-Fz; Mon, 05 Sep 2022 06:34:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dd-00CFxS-S4; Mon, 05 Sep 2022 06:31:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id b144so2941795pfb.7;
        Sun, 04 Sep 2022 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
        b=DxvplDrIsh+KijXXFdPyzxvt874fwO8Mrl8/8AeOKCJE+XbHxvUZFRKCE2GWxXKh/D
         umFYRihOe+jne0ztML2y6mc0jbRPpGBhC1g0NvUfpp6EeLk7jk01cUaRoaJOQGKx5afd
         lMrQqjCzBLO0lmmWRuQTMiLdS80KFr2EMlRBbDQ43Cvwei0LgWRjAJ8gs1Hh7H+I8nL+
         T7StbBazi7jgrWFhxeXo3Gac0AKQAJdX41kNsF1jErc6zj3GvAoSXS8rPqIvQoiy9CfD
         STWwhnuDN61n/ngUeJ4+XMum2eLhXHNuROQUxZWikj/bqGNqJIg0uK7dakXt3T7vhKRj
         +Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
        b=46NJ66d3sYm6jivjTQPQUidK/wVRqcrGWjoRf6IYZ1lfVYJ1EXujpgTUB4KSqdZorI
         RwBipDx7bBgBGnyJSSWrNenl12OPpgyyzQZc1A/s9ui1TBsgt/h2XYZtR8kuAS7Z38T4
         JH8iIlZQcbltvnlBBFnwW7CPqwC7xGc/BeJ4EOBWsgKZ8NwDPNk6CjqxGpaFDM7iA2bR
         NvhehAMbllOpx9xlw7qB9Dq2KK9DVsoSOPWH3NbsvvoKjm0TCJOR1AfX85m/RLafUoBQ
         ZqZXXZfNIbzlvhN2mC/zhrG0hOlD3OzBkNrbZnrf5saYtFdXp23mpV4j17Xp8HIPtvHF
         zMOw==
X-Gm-Message-State: ACgBeo0aVEpxw0a6U0b9eMEuEOMKo4RWZnqVpuUBdi67nPK76ybQ3ZbB
	WDPMvcxbWdxbslNSl7zb8YQ=
X-Google-Smtp-Source: AA6agR7ElJwXFJbXTWS13gywL0+xg7ynmUWpG94uiTchE1mDeAqtJvkeWg4KKm6lqy6WE6s/yuBdHA==
X-Received: by 2002:a63:fc11:0:b0:430:41b4:acf5 with SMTP id j17-20020a63fc11000000b0043041b4acf5mr19872386pgi.408.1662359476546;
        Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
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
Subject: [PATCH v1 03/11] mtd: rawnand: stm32_fmc2: switch to using devm_fwnode_gpiod_get()
Date: Sun,  4 Sep 2022 23:30:55 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-3-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233118_089796_F44DBAF2 
X-CRM114-Status: GOOD (  10.50  )
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..7e466b840368 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1799,9 +1799,8 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 		nand->cs_used[i] = cs;
 	}
 
-	nand->wp_gpio = devm_gpiod_get_from_of_node(nfc->dev, dn,
-						    "wp-gpios", 0,
-						    GPIOD_OUT_HIGH, "wp");
+	nand->wp_gpio = devm_fwnode_gpiod_get(nfc->dev, of_fwnode_handle(dn),
+					      "wp", GPIOD_OUT_HIGH, "wp");
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		if (ret != -ENOENT)

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
