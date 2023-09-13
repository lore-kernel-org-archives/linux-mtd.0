Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82344EDEC47
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKiDIycOrKfl559tBxpHQ6xaCvzzw5ims5QNM4cK1rU=; b=zK+q4PADoqy3BP
	rZRGrAgrWHFjpXVRPPyThNKu7vYiduM//MOI2WpgHiEbtDNUhXaAbzjAvvx+u9DMbeTEO5boyz6Hj
	VxCLnFp+/buZSms4IEW9YR5n/Xq90HmdzFSlH5qDhROHSORPkTKSsj8DwHX65TCFabExS+nOvXux5
	GJ9E1ZgrqCCsaN94X3twhyPWp2EcEinFl65XXWquwLPDIsZsipZ/+j9giV92Wkyj6BdbECdmvds9Y
	idFzWBakVcKeEmQa0UBbmNXvR7y6vMmtMGahL2x4qoyYMo4mks+c63Wh5/dcOExKxXRf4WOMK8qOb
	qyPcmLoyPLvz/DA2m0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO4-005mXW-12;
	Wed, 13 Sep 2023 11:50:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO0-005mUN-1E
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31c8321c48fso540401f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605822; x=1695210622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSDvgG/AlTocCbtsh72PpLY+FqxqCYIc4jmjYno6s+Q=;
        b=txXe7C2o7Hetsi8O/2Lgm9+O8EQm/DUNT2eyyeHofZNSqE4AfhN/k34ogZ6yS75+nz
         9/gVVZWBuFCW2hemzpD7sUazwgbFVYrIMxJxlLQ3HKCSeG6R6rOZYfpmvLKc0U2s8Drq
         /N77NSyGXVN9UI0eUeGXn7oeM257S8+W9sDLDhY5x3mPZ0AMBBlB1mtKOH7ESbN92UZi
         1XeLZV15E4czUwrgX7v0KWuHLoc1UcOhmVJH/M16Yi7TEn0u56dIrNoa6tpffp2zCTAK
         vPOVc0oRBiGd7sj2DH/5adCdZFIFJBQzE9Uw7llMYb+1zwQWJq4aw6dx38jFVGE8UdAz
         Jd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605822; x=1695210622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSDvgG/AlTocCbtsh72PpLY+FqxqCYIc4jmjYno6s+Q=;
        b=d+s8gU3RkcPuguzx1ohYbRlo9XwpxWQ5LQ0dQkw6cfyoZ9uC5bEcwAgOZy+mXLNqe+
         KKNqCTuO9ot1d4f7h2rGN8iaLNlJFRb6qMwGpR3HvHkGWM5jMDsM+lmtRcgfp4ukvCqI
         +T3RNYYyK+S6XeyzyBJJaOymPVg0IBuphGHlysCBjFqhlSjjvyeAtUzz8uvmhq3NcXQR
         l29KCVkmhq+/JSLlYHh2gyMXMFVTT+Ih1lOkZ5QwDcLlSdgX+s51F+nrCUgyhU+Ksg5c
         1bNwqzypEKq3Tt1P5nMbkBacvJymT26yvYn8aPlvuamHac2eSKptekheKA7qBBgwCoh1
         o9pQ==
X-Gm-Message-State: AOJu0YwyJMpfn/jHsVTxoEAW8lV1G13RIbROgs7iZlENc8XbVrrBPoU7
	LGAziz3PLlGlL2eTlX00CJu8sg==
X-Google-Smtp-Source: AGHT+IESxmTjjKwZ3Mmhzu2vYwbPTXYIyEeB82mrbgAnbchaF/ankGu50kRqPiQDLeOH4+3ZF+l1XA==
X-Received: by 2002:adf:e885:0:b0:31f:9bd6:e8c3 with SMTP id d5-20020adfe885000000b0031f9bd6e8c3mr1744751wrm.22.1694605822422;
        Wed, 13 Sep 2023 04:50:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 4/5] platform/x86: int3472/discrete: use gpiod_set_active_low()
Date: Wed, 13 Sep 2023 13:50:00 +0200
Message-Id: <20230913115001.23183-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045024_443517_E5DB1CE2 
X-CRM114-Status: GOOD (  11.77  )
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

Use the new polarity setter instead of the more cumbersome toggle
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
 drivers/platform/x86/intel/int3472/led.c               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index ef4b3141efcd..31e520838b95 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -183,7 +183,7 @@ int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 	}
 
 	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->clock.ena_gpio);
+		gpiod_set_active_low(int3472->clock.ena_gpio);
 
 	/* Ensure the pin is in output mode and non-active state */
 	gpiod_direction_output(int3472->clock.ena_gpio, 0);
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index bca1ce7d0d0c..46c9c569df5e 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -32,7 +32,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
 				     "getting privacy LED GPIO\n");
 
 	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->pled.gpio);
+		gpiod_set_active_low(int3472->pled.gpio);
 
 	/* Ensure the pin is in output mode and non-active state */
 	gpiod_direction_output(int3472->pled.gpio, 0);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
