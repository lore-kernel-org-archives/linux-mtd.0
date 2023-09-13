Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892FBEDEC49
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8j0BhvBwwPX9h+x5YlsocUmRtaTjYSsYyIFDpMMSTfM=; b=MQ6i6aufgLB77s
	L1F8VxEmGsD0k/gTroR7Cljm5EGVyPZtZQwbZm6wz06Z98KcehmE28aCXAPx7fy64y4BTz6bpTTMM
	FyCKUdUGimA1N1MYrtcut3xnVrJSAhWHCqB802gK7CvXEW8+J48TEuW62ITkkbT3usi+9kFlk3SnU
	QN/mPFYELr2LhCq8Dwqw/SRkeZvoILamq5YhvyLigSUKnVOReDP6Q7k/b6HT6lDC1rnndcb7wE2eF
	MWCARVB0GuHVxYikH0URLGGLizvpn4FihPew5MSyoZ6uTcIJ8fJSmK6pHY+QUJrd+Lzns8GB1A8bZ
	2yl7nExw52k9JGcw4Yuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgONz-005mUj-2z;
	Wed, 13 Sep 2023 11:50:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgONw-005mSy-2z
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31dca134c83so6775389f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605818; x=1695210618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE2ORVq287JLkcnuWpgymLTUjppVm5JnqXblhoOF+yE=;
        b=jFw27kKqb4ShprFCapclvVgbTOW+dPGEzUbDGXVG9K9NDgl1gFPmh0c9XHdk7WWpLm
         95FawTBwkn1mkOqdbfUZtuSqlEBtdUODII43ajsV/jfNIoJB8BdMPTZlHNzP6Mi4B2iC
         2sWt0XydgYDLH2SdjfZDZNPNQshk4sotToHKnGwD8RRaZQEmwoPlRUPaDm99zLkSzz1j
         ag29ZpfHAJpihN7B5PmbONlhQLq80KNQQ/TveHyzSI4SuXRhzeCTR3hey5M+Of8aLrDZ
         Lmtc09QwnvZkp6aHIkkixGE343zaJ1vWWn0CexpCIbsRjG3ftC9BbsNAaRflNggLojsx
         wXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605818; x=1695210618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE2ORVq287JLkcnuWpgymLTUjppVm5JnqXblhoOF+yE=;
        b=IEEy2PGSGzKFpAT9oFLgVH8hTUbJfQdkMT1Ct68oOdNw+1JNdRJvpV2m3gIJbFxxXz
         c0RolzmEWzWWoQR0Rp4iwrnbabNYJerHniJ18q/STBOw9QbF5wyNmoap3KCBk+nDPKuu
         E+e+Nr0bqJX0yRIClB+/XRan+fGyxpgRLxFR1uKp7MT7xphwjQ4KohniDuI1rudE8fI3
         knlFDjFXW5Hlf/TFiRTWOgEz5Kx4wYpcna+oz+X7erDyts7kQ6q6dgHeZL5xUhYmVDOe
         89oOJhYx7oKnpz3dXN+VRi0smC49HXMxkKdSX9H46g45ElC0tkFrhtUa109MZmdVCTzf
         39BQ==
X-Gm-Message-State: AOJu0YzjX46s9xKCo1E//73eWLrOvZGLD6AsSMmqeCAKmimdI8Xm++eJ
	F6dDM5zwAIgusp6CZ+250sjThA==
X-Google-Smtp-Source: AGHT+IFXSSuEq9wtyazcQ7l1hh+jAkGlzZwC0/98tI2tsHjMXKI3a8JB3xTIjBmtqjgeTD74oF6Sxg==
X-Received: by 2002:adf:fe47:0:b0:31a:b3aa:d19b with SMTP id m7-20020adffe47000000b0031ab3aad19bmr1937928wrs.23.1694605817854;
        Wed, 13 Sep 2023 04:50:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:17 -0700 (PDT)
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
Subject: [PATCH 0/5] gpio: remove gpiod_toggle_active_low()
Date: Wed, 13 Sep 2023 13:49:56 +0200
Message-Id: <20230913115001.23183-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045021_205115_6931FD2D 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

The semantics of gpiod_toggle_active_low() are just bad and in almost
all cases require users to check the current state anyway. Let's replace
it with something clearer and more useful.

For getting this upstream: I'm thinking that I should apply patch 1/5,
provide other subsystems with an immutable tag and then we can apply
patch 5/5 for the next release once first four are in master.

Bartosz Golaszewski (5):
  gpiolib: provide gpiod_set_active_[low/high]()
  mtd: rawnand: ingenic: use gpiod_set_active_high()
  mmc: slot-gpio: use gpiod_set_active_[low|high]()
  platform/x86: int3472/discrete: use gpiod_set_active_low()
  gpiolib: remove gpiod_toggle_active_low()

 drivers/gpio/gpiolib.c                        | 21 ++++++++++++++-----
 drivers/mmc/core/slot-gpio.c                  | 11 +++++-----
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  5 ++---
 .../x86/intel/int3472/clk_and_regulator.c     |  2 +-
 drivers/platform/x86/intel/int3472/led.c      |  2 +-
 include/linux/gpio/consumer.h                 | 11 ++++++++--
 6 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
