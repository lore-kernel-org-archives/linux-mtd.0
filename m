Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6916EDEC48
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wY9chJBZlF7g4xGrwId7QNHnlLp0zKzMM8sWo1lJ9Y=; b=AtP/OO9iABuJ8w
	pLDG7563ylx5aM87S/n2YulA/vLXT6ZKRunznwHbolBhsr1iT+YDtB8wcrS+8hZQIoBD2Bmjs+TPf
	UxMw7PK2ULPuYVb9zQ4wiUmh3vgdfKxkRvM/q3n0CcrH0wdQcXWX4hcl/z9/sGh2QUWj4lpLBHf9I
	Y66X3Y18cCqFzC91LRgo3lmSUvZF2T9h1Sx3Qa69oxcBFhrtEaEWEvBp1V98rmCVBV4YEORJJvC2k
	SW4ZaTVgO1Xam/EZry87eadf1M/O3ufFgBF97WcSbiJASGXtXb2XXLGzjJhG0g0J6iEIgOXT49KeC
	sdkmQlOPVt3zJb7nvJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO6-005mYN-0m;
	Wed, 13 Sep 2023 11:50:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO1-005mV1-18
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31dca134c83so6775562f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605823; x=1695210623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qakrc9HB1O5Iu/mhnl/aqGs6dWn+CSwn3hlAKhsYM7Q=;
        b=zFuIUh2EEeYJMLnZsJv3+aR2Vm7jNO3aFQsgI4pwxZvze/4zlBiL56n3AKBpf/6ipY
         WYxd32keoM9A17jMYIX+fAL7kOKCCbXBuVmIprwqKG0yugmEs5mzWPHT+fTE9hhYcjdG
         8eFnf3FwfKsRO9q8uPJueXpx7tCPfaLvo+ozhQijsPiX4kSbD4CNICrApoOlC1RQTH8L
         jnQ519AF3rS1wNtYRlTLcYd8BgZdDQkGqKIPtIPo/C2MZDs0Ya5/7ZcX6mCfDin9osWD
         Cj/WUtiZvH5EyttUGBIavmvfjerez9pwQZxhLQ3JWXmpY37DtsMZmzNxVuZ8T4Jfriy/
         9DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605823; x=1695210623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qakrc9HB1O5Iu/mhnl/aqGs6dWn+CSwn3hlAKhsYM7Q=;
        b=e5lgU7xBifxxTKz5qrk28s79SIjQBps1CpWg2tV/avYJkZbib+rPG8DzWa3yaMwd/p
         pbGyenDODx6e0hS4LlcP01WEur9afjNq2/DL3MYCLU2c22eyiaJX+UQ4hFGvr1MWJz1C
         wFSQHvZKj3Qav7JaP5FFxOBOy3MLABgkhP3KF4J4yBy/ZRUS2/MMvlxWdr0dfmyFMjAA
         YU5UM/SpwgkfmDf0TGE5dPVsXFZ2FpgPRwArpjN+qo8M6Mmba5OCFv2t3eir3WdUj/6N
         K6SKzAqAHSGb6p0jwFlCIxG39yDe1H623xvtatbO/R1iQFKdgTZe0HxvyLf4uyadd4mO
         siEg==
X-Gm-Message-State: AOJu0YypBrtAh+gttNEkPSddGErK/un16RPoA8iXRx3MET6d1oQwOxSH
	NTYmjA2xrGKXiaEeKfqB9U3/GQ==
X-Google-Smtp-Source: AGHT+IHSaGvQEu7p/aPUxTrIpzTkMdMiNylYl6uXXTnV4TP4nHCU3quUTmCv138dyfMb7wv/N8jbvw==
X-Received: by 2002:a5d:56ca:0:b0:311:1dba:ca65 with SMTP id m10-20020a5d56ca000000b003111dbaca65mr1878093wrw.51.1694605823533;
        Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
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
Subject: [PATCH 5/5] gpiolib: remove gpiod_toggle_active_low()
Date: Wed, 13 Sep 2023 13:50:01 +0200
Message-Id: <20230913115001.23183-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045025_401067_9EAF4ED7 
X-CRM114-Status: GOOD (  11.52  )
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

With all users now having switched to gpiod_set_active_[low|high](), we
can now remove gpiod_toggle_active_low().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 11 -----------
 include/linux/gpio/consumer.h |  7 -------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 131965814a7c..14b84bad93ea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2714,17 +2714,6 @@ int gpiod_is_active_low(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 
-/**
- * gpiod_toggle_active_low - toggle whether a GPIO is active-low or not
- * @desc: the gpio descriptor to change
- */
-void gpiod_toggle_active_low(struct gpio_desc *desc)
-{
-	VALIDATE_DESC_VOID(desc);
-	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
-}
-EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
-
 /**
  * gpiod_set_active_low() - set the GPIO as active-low
  * @desc: the GPIO descriptor to set the active-low setting for
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index ddbf0d8e4a75..395e1a67c4c8 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -159,7 +159,6 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce);
-void gpiod_toggle_active_low(struct gpio_desc *desc);
 void gpiod_set_active_low(struct gpio_desc *desc);
 void gpiod_set_active_high(struct gpio_desc *desc);
 
@@ -495,12 +494,6 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned int deboun
 	return -ENOSYS;
 }
 
-static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
-{
-	/* GPIO can never have been requested */
-	WARN_ON(desc);
-}
-
 static inline void gpiod_set_active_low(struct gpio_desc *desc
 {
 	/* GPIO can never have been requested */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
