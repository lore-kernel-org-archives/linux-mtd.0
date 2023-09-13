Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04175EDEC4B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3tC6ozwkwkLasmd5i54u9e2+zQszeVilQMa5mtp9DI=; b=j0Odtll7+LLtIe
	af7ZqpHNMxB+ZYTjyk3D6NK16pxf+0ZuwLr+ZHn53khR8a2rUlEmlakEBSc5FCD/D4RjNcfm7Keus
	AKGwGOkclgoOeXU45q97TuVaCQdg5l6sc0iwv1SlduKkJ8qUEgGqvE0qKPzYjhPti2FNtVlXHVaPh
	zgv9/NcUC1YFlYTEtI52mdq4qRWjdZNqU7xWcyjpGHsUsO7RwNBX+Z96NiDhum1J9B8/LCItByqgO
	It1+OFRaeAoqzaD64UmU1ImZI7MKv0T91z6GTu3Bl86IkI0mD4YXhNqHOT/i0ZQKzUPF9xaadVA84
	wv4GgBAoLgvO1m/7rv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO0-005mVt-22;
	Wed, 13 Sep 2023 11:50:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgONx-005mT2-03
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so4516821f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605819; x=1695210619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzyriHXDyGfsqSRGhB6U9l6fcpz9mRdaLbPmEard1K0=;
        b=diykgQNHslJlYxO1/+kmE+xqjB+SOm+RBHSgI+7Tj2KIJO7Zc4U7ThKnyN7kUlj//l
         DHKIDL9gyFwv83WGbOEjfeRL2moV24vk74C3imua/EgIYHkx7/dn7nciD0s0YOPB8ZYk
         WVu6vwfNNjN5fTeHQY+/S7+PDpzZd/NP0C8+v1+gUfkXZAS96b1DR2mq6jjfn3L082y4
         fQwRQQtgDDkQr4AKDn9BDhzgiUbZssPnF4ZrKMc93QCWiJPRmx7BTTKNcXeukG9QrSqJ
         KxbAVcuA5g0TS9+Xurc8bn5FUy5S8IXdA++Dyh41n9ni3REcpCIxddUghX1K0N6+q9m9
         ztHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605819; x=1695210619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzyriHXDyGfsqSRGhB6U9l6fcpz9mRdaLbPmEard1K0=;
        b=xRIpMFdIZbT0N2NzqNgnvzdzKIQV9/WtLSPSjKP2zI4dJV5DkUB1GmsyihrX6XFUss
         D5WLCzmBXBtlno4lQvncQjkt6BKi/Ks03/4s0IroAU8fyFLEMJxuMDd/csyX5HoVK3dZ
         NCTericRDcTgVmJSRIa9ooQm8z1mH38XRn5s4LWlhzNj5tc1CnXvq8hRq8KgLspBDRl4
         PqqsJ7gt+Sj1KtTu7j4H87F65cnpKg5P5uiEajoSVjMGcGrXTp9aFy5cS61ys1JwFl8R
         TRIa6dcseDTqaMvBnnTIWJqdWb6+9/n6Gg6ziuKEPJ4TVXu/OENCfrZfaV35ovMlxsiW
         upPQ==
X-Gm-Message-State: AOJu0YyRtOcgJ4l5Hf6KuebVS0JimwonK+L95nJWe3A5uittljiwes4I
	TiQ5uoc3V+uiL2XrLfIHhXnC9Q==
X-Google-Smtp-Source: AGHT+IHc3Nnqh7FxXn5j82zlMwGGyFk0UEacPknUOdO1EfjviMuMeXi35mpFtRpdkqCvV2719fQtUA==
X-Received: by 2002:a5d:620a:0:b0:313:f61c:42ab with SMTP id y10-20020a5d620a000000b00313f61c42abmr1731997wru.56.1694605818963;
        Wed, 13 Sep 2023 04:50:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:18 -0700 (PDT)
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
Subject: [PATCH 1/5] gpiolib: provide gpiod_set_active_[low/high]()
Date: Wed, 13 Sep 2023 13:49:57 +0200
Message-Id: <20230913115001.23183-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045021_205871_A94A7F2A 
X-CRM114-Status: GOOD (  12.79  )
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

Out current interface for changing line polarity is quite cumbersome to
use as it only "toggles" the current state instead of deterministically
setting it. Because of that all but one user in the kernel first need
check the current state anyway. Let's provide two new functions that
allow users to set this value explicitly with the aim of removing the
existing function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 include/linux/gpio/consumer.h | 14 ++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index edffa0d2acaa..131965814a7c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2725,6 +2725,28 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
+/**
+ * gpiod_set_active_low() - set the GPIO as active-low
+ * @desc: the GPIO descriptor to set the active-low setting for
+ */
+void gpiod_set_active_low(struct gpio_desc *desc)
+{
+	VALIDATE_DESC_VOID(desc);
+	set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_active_low);
+
+/**
+ * gpiod_set_active_high() - set the GPIO as active-high
+ * @desc: the GPIO descriptor to set the active-low setting for
+ */
+void gpiod_set_active_high(struct gpio_desc *desc)
+{
+	VALIDATE_DESC_VOID(desc);
+	clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_active_high);
+
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
 	return gc->get ? gc->get(gc, gpio_chip_hwgpio(desc)) : -EIO;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 6cc345440a5b..ddbf0d8e4a75 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -160,6 +160,8 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce);
 void gpiod_toggle_active_low(struct gpio_desc *desc);
+void gpiod_set_active_low(struct gpio_desc *desc);
+void gpiod_set_active_high(struct gpio_desc *desc);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
@@ -499,6 +501,18 @@ static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
 	WARN_ON(desc);
 }
 
+static inline void gpiod_set_active_low(struct gpio_desc *desc
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+}
+
+static inline void gpiod_set_active_high(struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+}
+
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
