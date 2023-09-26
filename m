Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684CEE7D26B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vU4jX7mL8spmD/uEzWEC835MI7ZcYhWn/mOIrQal5u4=; b=VjUvxbpHCeJ3Hc
	dDFcdCi3mbexhQVUeZSkuxQ+4pIuA8aLFpAdq98zp8gjH0i8KLtGNu9mVSPoDWA/thQJo8oCWDLp4
	/BZ/CzYT3QGYrBG4BYNgSbOx/QzZvL/yfsddaf53E5s31w+DFTZma9AQi/2nZ9or/LV6YmhxgHTWK
	2hpjAf3WVQoORNDH0WY0H7MLPesBoUjcO1bhzNbtglaiFKhIQka2xfXEXJ88M1C+aVHhUmVsFIA/6
	FwzrwIPcxboglGEXmqndKbOVWUE5w2flJam0OmfpkF44VecNsr602Rkk9ipUo7ONBUMPMGtZoJRAS
	XpBANzRyNqxRjvK495+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql41l-00Fvp6-1U;
	Tue, 26 Sep 2023 09:06:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql41i-00FvnZ-25
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 09:06:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405524e6740so61666715e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695719192; x=1696323992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYPORNOx4NuRhf6WfJUJoSr5UgLUFNvcuKhQTL+JrnY=;
        b=TLIJ2T9cUtaBH3iTEoKA0jNQXFDXvQrM36OpB4slEyHbfn54/oePN5Pc400bGjCRGJ
         5buhriTliOC5xxaR2jIiOWMxkcB4hhyb9cvzb32nECPQb9LnmYySWj7aODQpC6OPgLvQ
         roprqmcgqBy8gfCa8efjdQIB6NBUcCtD1QYkcOjHM6vtGLf0jfR2CohWzkNGripvWfZ4
         iUrBE+fjA84HRphIzg6vspxlyxJ5Ws9fmK/Cf2ScV5Aq3UfUh03a+htRQbkFJWL5NBIw
         pOVM2DrHk+igv9lY6UdVOCSpt8Zni+Qc8MhBvpyYfqtlhNKXDJkMzXOwpDYrRl9Ug45f
         TBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695719192; x=1696323992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYPORNOx4NuRhf6WfJUJoSr5UgLUFNvcuKhQTL+JrnY=;
        b=MN5Li0nYe+79z+UxJSCGMsCORRdC4OExAOmoPHMbqP+LaYZIaLNi3RfZsBE+7sstmy
         TrptZwbTP4LY3siqM56V1buFD3zQT1tbatQbcLBegaNzZNnWRWjPn89cJocAHgFDalXF
         RxTNzUhX8L2/kb4AyPMUKHrwpteJy0LCm2bsnAMwx2VM5V9+0xYkFeMeMi5fHMGJOjZt
         nEfO+oCdQyg6IfwkNqhYOV2dg+aGmy89H6G/3jmTaR1sC9wGtKAOuC2oDf43TulLBLcO
         rqcGBnCeNGsgUp8I2qrJzFKdBBEuF1ZpzU5FOH5mDDdMbiG//pyDkmdN5BNP4z+Cxyoq
         VvBg==
X-Gm-Message-State: AOJu0Yz0o5Z7A0KqkhWMTCAyL4QAy1Lug+49SaraMOzoyC+MnXYGyOge
	J7efNeQlJ3QoJXDhHwqCyVP1kA==
X-Google-Smtp-Source: AGHT+IHECvSMOxEXPR/Wch2K8u8yhXgBh2SGThdb3d5Y/uoLHNyMF9X2ZGAX1MvecWbgmJnLQpviVw==
X-Received: by 2002:a05:600c:2050:b0:401:906b:7e9d with SMTP id p16-20020a05600c205000b00401906b7e9dmr8005516wmg.18.1695719191864;
        Tue, 26 Sep 2023 02:06:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:686:c497:30b1:d2b9])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c230e00b00402f7b50517sm14686841wmo.40.2023.09.26.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 02:06:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c
Date: Tue, 26 Sep 2023 11:06:23 +0200
Message-Id: <20230926090623.35595-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_020642_682716_B023B0E8 
X-CRM114-Status: GOOD (  15.24  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a special place for OF polarity quirks in gpiolib-of.c. Let's
move this over there so that it doesn't pollute the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is an alternative to the previous patch that instead of replacing
one active-low setter with another, just moves the quirk over to
gpiolib-of.c

 drivers/gpio/gpiolib-of.c                       |  9 +++++++++
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 12 ------------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 5515f32cf19b..58c0bbe9d569 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -192,6 +192,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "himax,hx8357",	"gpios-reset",	false },
 		{ "himax,hx8369",	"gpios-reset",	false },
+		/*
+		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
+		 * the ingenic driver) got it wrong. The active state encodes the
+		 * NAND ready state, which is high level. Since there's no signal
+		 * inverter on this board, it should be active-high. Let's fix that
+		 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
+		 * helper, and be consistent with what other drivers do.
+		 */
+		{ "qi,lb60",		"rb-gpios",	true },
 #endif
 	};
 	unsigned int i;
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 6748226b8bd1..c816dc137245 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -380,18 +380,6 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * The rb-gpios semantics was undocumented and qi,lb60 (along with
-	 * the ingenic driver) got it wrong. The active state encodes the
-	 * NAND ready state, which is high level. Since there's no signal
-	 * inverter on this board, it should be active-high. Let's fix that
-	 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
-	 * helper, and be consistent with what other drivers do.
-	 */
-	if (of_machine_is_compatible("qi,lb60") &&
-	    gpiod_is_active_low(nand->busy_gpio))
-		gpiod_toggle_active_low(nand->busy_gpio);
-
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
 
 	if (IS_ERR(nand->wp_gpio)) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
