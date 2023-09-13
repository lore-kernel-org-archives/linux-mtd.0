Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21267EDEC46
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P72YnbHG277V28NmKzgEKK0LlAUPoVLvCPTcL5fKXi0=; b=A3xTs8N+TfgEuj
	VetKGe1/xXNwJdLxkL9ig87HYoMeYftGr2vQUWOMGQ/PxP2PTcaSyjAZytu4McTRNjF86WYx/gONg
	p78lJqoXYI5r52DYSJ3mo5SliW4Dj5gpD8Q34nXoXtYRswUZ1AhQ5z9D+0XN1ld4tMjfMvmYTAUB5
	krj/E1xtElBLFSLMNfj06BhkFK5BsSG5HBJvb3va2w1ishfvId2oEiC+Cn510PXqiKlO0Kg2HyYn+
	IeeJxzHldDl3tl33MMbMJcA32ZMJhJ98UiBLchzGLMC+oJrW4ZXodDVMCwwq3HTYUzcCyGkZKSyos
	ghbmtZ+UUiGg5oOzpPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO2-005mWx-1a;
	Wed, 13 Sep 2023 11:50:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgONy-005mTD-0S
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso5430845e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605820; x=1695210620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfIOoxhDAqFwndjqT4NZlTiK/Oyr/4kFj6yAfQvO5X0=;
        b=JgrKBtTuqUSmEwBGpw6sFEn3zm9ldo/H3BxMvd0X100l7LlYeYgjKl9vRZ0OkBg7fM
         7a3SJvRUe1HCz8m1Gi7bid9afH1wRUKRqSmidObGxNljCMsvf402/eebk2333XTxZa7Y
         qlag+Ykzak43G801B9gI8h89vYRsh7POx+p9f3TALTnRFWgNYQj7vxQhmx1yuHr3tvsg
         4Lyo9ShSv9PeJpZ2B1Dvpv5xshUmbwwhQo0QtDJy6yAUpOBeZle5o+c6WVtGcTKiIUTT
         KKY3FSnb2jnxKBR7IOrpbXv42xfPhKDB20UlOE1zZd9pKVd1Xad3gH6PwsJdS+UNp9/d
         Eztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605820; x=1695210620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfIOoxhDAqFwndjqT4NZlTiK/Oyr/4kFj6yAfQvO5X0=;
        b=wDpJE6Dn8CDoxquUHmBV1QXCKFr1C/hHAF/NlKrCdYZCH3TBuAWbLiPeyHR7sChE95
         1r3SLNVCo1Y/SHaD9LFz8zi4W29Zxc/MjgrHZ0JpQavC2LQLvfpQ+IYUp/lsxchDCEer
         TEsudPd6jHqekxbd8Oob/0WSPS+ILlXf+ls4/Jdt0PxBUlUf7TUbnG4F3vSqd2wv5hbT
         dhWvlMiC70h8WgRQoM/PoB2yON5chl/oCE5lQgsxjH0VQVNyWKI9gB8OoCADQfm93kg/
         Ld51NPw6qmfVvAvYsmFaa5TLBhvLethZJ8NgVWIfzYOnOhuII94Vx2PImtSUL+K0bLv1
         2wZA==
X-Gm-Message-State: AOJu0Yy2QYtVN01MH70dwW88tYFl1DOLc1QmRqit6aOHpJF7Pj0YKw6O
	eX01FeZjJwbNQYE3nmDTi3wWQQ==
X-Google-Smtp-Source: AGHT+IG+tXi5eOBKUfSbBaQCtatc0omt4sm58mllw94JLePpeq53xP2hYKGlGG+xCKfpc+HJfdMuUQ==
X-Received: by 2002:a5d:5b18:0:b0:31f:cc46:3db9 with SMTP id bx24-20020a5d5b18000000b0031fcc463db9mr1114110wrb.26.1694605820092;
        Wed, 13 Sep 2023 04:50:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:19 -0700 (PDT)
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
Subject: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
Date: Wed, 13 Sep 2023 13:49:58 +0200
Message-Id: <20230913115001.23183-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045022_214763_279FCD3A 
X-CRM114-Status: GOOD (  11.65  )
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

Use the new, less cumbersome interface for setting the GPIO as
active-high that doesn't require first checking the current state.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 6748226b8bd1..c055133c45fe 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -388,9 +388,8 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
 	 * helper, and be consistent with what other drivers do.
 	 */
-	if (of_machine_is_compatible("qi,lb60") &&
-	    gpiod_is_active_low(nand->busy_gpio))
-		gpiod_toggle_active_low(nand->busy_gpio);
+	if (of_machine_is_compatible("qi,lb60"))
+		gpiod_set_active_high(nand->busy_gpio);
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
