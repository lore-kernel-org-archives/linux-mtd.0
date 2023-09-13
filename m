Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0155EDEC4A
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hS54qmF4Z4ixfx48pOLBe27LftP2f4YrcXN+UGAHnPE=; b=mknhr96Glcklaa
	hTk3VlZv0zwzQ8JCDPVjBxJSnGSYXr91M36Js3F80EtkAXlAVjuxXRbWi66esM8Rr6gC69DutLf5m
	Dp6/MiWA4kdK5rn1TK0aMn81Sdt8JSNzhZAsf8SLVpt72PspSo5S3kccwdNGl8CNp7P4n2lgcpkTE
	5Q49Q1llMBs2hl80W0eRxIVyVijeFABH+xFZmIS9b6EyBZtMAd9vpTiReMfdjuB6t/0OBuUWAMWQ4
	21Li5Fu/e6biC5yEXqSTHHvmhQcSguXrR9mdDLd7bh3icbbLpJWJAT3AUG4IvUE7Z0BCLDHVgT55g
	0khJcLmt3JkmGCEujZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOO3-005mXG-1d;
	Wed, 13 Sep 2023 11:50:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgONz-005mTd-10
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 11:50:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f7638be6eso5938926f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605821; x=1695210621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VygHWUUTxJcwgk20gKLWHe+YEMHPQx8FheNmwIckcQ=;
        b=loxJOOd2HYI/sVJmERlqRt9qRDiCUu0pbW8N1eBnb66RUl0iwgLeDUPowBD2DYWAhI
         cxPwsLZ90aR9arnsFlA6eRVC/b+V4J50hnbmuHD1I/6jA2C68vmUiWGYatDEbGIYtSr4
         QtFJZ5f1/Mrj5F6wzg+YLLR7rQAwdEjEhnAFdo17aCcKc90Jzw59DYzYtM2+TlKuOB76
         D/NmB/AinlwJ/+X0ce2ewCVajVAzA8V0C5m6TsqK/KXFE4xd2Co/xsgpJOK84I6u9dGa
         hD2CCj09Z5jjZ68gtVFGv+VPRxLBZ0WlMMbvCDZHtgapSE1CLc2YlfSgL0L1ppVN4eZq
         vpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605821; x=1695210621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VygHWUUTxJcwgk20gKLWHe+YEMHPQx8FheNmwIckcQ=;
        b=NUB7D5af3+l3mffuacwA/mvOTmrmJeL2tcIjGPaKsOCEYy2lrzpjHIF0g3ZF6/MmzZ
         emw7LpVMrnfV35s+FdXAEcZtfMEZRelWZHeC/1mUli/fNzWh+f6/djS4/mj4hUnDLinx
         qquQKJEdZsVphBt0VqjvCd5jt4LXNLgOwPqS0XQSJ2hHcZlzYnWqPdTVOiyApBqWBNWB
         f5HYq5KqV6sEEfNfOBhhzrzB5ue99bx52s9gpIQC4nhyUO4G8M6HreqbX/OYEAj90vqX
         KW9WRcCQDAexjRVild3X6ILdKf6PcduKKnxmEG58syqcd0r0YA3wFOuuQtiHBmI1JCGH
         IUSg==
X-Gm-Message-State: AOJu0YybdGrpJPsOrdTxX4+SLuwxZx3cK9B4/HCO/svLebwFCNPXcY0R
	R+dRfa9O5buUHLcMN0DNj51phw==
X-Google-Smtp-Source: AGHT+IE8/xUMx2CxEG3cqDJgSjbSA2NWMS00vPEgINZ0yvChOcoxgNUbEbPflHzcyEJln62XxJ5Bpg==
X-Received: by 2002:a5d:5957:0:b0:314:12c:4322 with SMTP id e23-20020a5d5957000000b00314012c4322mr1948005wri.4.1694605821222;
        Wed, 13 Sep 2023 04:50:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:20 -0700 (PDT)
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
Subject: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
Date: Wed, 13 Sep 2023 13:49:59 +0200
Message-Id: <20230913115001.23183-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_045023_397952_07584551 
X-CRM114-Status: GOOD (  11.51  )
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

We have new, less cumbersome and clearer interfaces for controlling GPIO
polarity. Use them in the MMC code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mmc/core/slot-gpio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 2a2d949a9344..a6fea6559a5e 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -204,12 +204,11 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 	}
 
 	/* override forces default (active-low) polarity ... */
-	if (override_active_level && !gpiod_is_active_low(desc))
-		gpiod_toggle_active_low(desc);
-
+	if (override_active_level)
+		gpiod_set_active_low(desc);
 	/* ... or active-high */
-	if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
-		gpiod_toggle_active_low(desc);
+	else if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
+		gpiod_set_active_high(desc);
 
 	ctx->cd_gpio = desc;
 
@@ -256,7 +255,7 @@ int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 	}
 
 	if (host->caps2 & MMC_CAP2_RO_ACTIVE_HIGH)
-		gpiod_toggle_active_low(desc);
+		gpiod_set_active_high(desc);
 
 	ctx->ro_gpio = desc;
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
