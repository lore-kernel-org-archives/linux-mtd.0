Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4047C4708E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtDBvQDHbbnkdpbbWlNEKmSmtfJxeqJRsQ8+JZE/1CQ=; b=ee2NvciMKI8Ddp
	hgdRZad/V3r7LJY0mB3Tn4i3HdaL2j0kJK7oEB3HfBBbCE00RQtkYfscC9iHa4HJDixqY8lZAPi7D
	lPwUdmXRbdBdrS4qCRRFwsfQBQ6sCcUfnrayyQAunjv/kKZ6F7X0fTXeU98pwfVLDCbdXAS39BIXZ
	vwqBuOpVf9GO5ANRhmKNRUoYHtCQAtkmNyDwgH8oQz1abICjRSfqMCzte1a+M3B1qc2UaRE/J33XF
	hFQfSMpOT/kMDWhOmPms4L0UQFMK0UFk5KI6mgi4TFk9uPd38cvu0OVLJxPuWwBTbLKWE2chscUuw
	smQOGRgs+fihWu5AILHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lM-006yDl-06;
	Wed, 01 Nov 2023 09:43:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lC-006y8U-26
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d465d1c86bso422320766b.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831817; x=1699436617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDR0ucJhVVuq53zIrv2mpmfodayVbn2I0B3QzedSSeU=;
        b=T+KSwwWH+kTbCAEVKNcYMV4ZrOKGcnup/rOIV+bKt6ExzOWTB6vdodPAOUCtPpW3PB
         nmfajCuavOacralTEg70jjNSgdggZA5ieU9WQhrMaPstfucBBVimTgCil/H0o5rH88xj
         Ohm7c2AlyAHeLKU3Usx9yPPr3tWQHlaKYu+bHl/0rfR6QYUYmPuiLHzy/xqeZhLVly+8
         3bSQ1cAZl5PK6T+FO33/BOc0IQ444SFBPYfQr83+0wmqv6KGatwEyK4RgS0SKrCcg/n9
         rljyDufQvsS/V9UPJ6GzEORhOJwyqM8TDGZdrVo+V9t7PU6ok8J2VAZjsjVt9ta+wEW/
         bhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831817; x=1699436617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDR0ucJhVVuq53zIrv2mpmfodayVbn2I0B3QzedSSeU=;
        b=fZ8PrZVvBe+0toy9GcGsqCGKfVPOLkw4xrvHXKzpJtQQNJ0h37IAf8wns1XZAlPNPP
         R/MqNhVtt3Kp6YLqxP69yd/lC5bb+vGWo1BPHx1GS4Qx+VKbJsECQHJgk5oMrgF58uWS
         6wvnO68u6bKaEr8JZGX04UHtg0YJrui/KF5F7kRgGua/nNH5sIUJyKwFO1AyOOXwn7VZ
         OLBfDS/QWtaTJeLZlXkgaGdbjAmWBHw6YQ8kAJABe2HAa6FcbM21xGCbOe9D8ZMkKiuV
         9dMxh2CIeD2qtpREacm43XNo1wScQ8zGlHzk2dok/aVTG10QYsQ6+Y+H178PvoNWGy9M
         QkjA==
X-Gm-Message-State: AOJu0Yy2hXnqw+sQXAmil31p3gyMxJ9rBBMsmNMUMVoD7vun2AJJ3cnh
	ERwL2UTMAjHZHmX1gihqEGlKQg==
X-Google-Smtp-Source: AGHT+IFAWwL++jKR1NzBS2I7XPts6yQsu0ZkL6ojrEDrHQJjsdtFSm+cFmyOF2qAmtKStTOVGO4cpA==
X-Received: by 2002:a17:907:961c:b0:9ae:5370:81d5 with SMTP id gb28-20020a170907961c00b009ae537081d5mr1666197ejc.41.1698831817498;
        Wed, 01 Nov 2023 02:43:37 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:37 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 5/6] mtd: spi-nor: remove NO_CHIP_ERASE flag
Date: Wed,  1 Nov 2023 11:43:24 +0200
Message-Id: <20231101094325.95851-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=tudor.ambarus@linaro.org; h=from:subject; bh=qodvSZkEdT/igPH1EKd80cKPj1l48lT2Qmj2i6tTMmA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh297pYvrWy0+J/XmGtkqJPAYiJOikqbF8ux0 v76yx1hSdWJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvQAKCRBLVU9HpY0U 6cqOB/4z7qYxEy4qgfj3OB5uYfKpxaXci8KkLPIv8SXh8MBTaeIQcqrhHfcQAx4L2STdEPIt6rv j6Kw0HI8qJZUKNyJVKoljSkhMxdhgypg9+9CTa5uQgqpl51xrligCV81y67MqV8qKrk5Xex7yWO h21H2PhNAuHpufFxU90FoT3sPsAXtaNfdML3zEAJHvmMLFBBgJtYWd7c3bkxPI9un0yJXozBraT KXSuH+e6OgVf3n/QEjFZROVuwWs4gjRZULyvJXWFzeqIjNfTzSmj8j4H9d9djzSeBalkXef+/tP gTTOLUtreXgu6KE4MWUsJlNEMiqYLOhHEqw2TaM1sBI15siU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024338_697975_8686A75D 
X-CRM114-Status: GOOD (  12.26  )
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

There's no flash using it and we'd like to rely instead on SFDP data,
thus remove it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 3 ---
 drivers/mtd/spi-nor/core.h | 8 +++-----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 360fce7ffe82..b9829a1ed192 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2862,9 +2862,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (flags & NO_CHIP_ERASE)
-		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f681a139772f..65207c83b751 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -489,7 +489,6 @@ struct spi_nor_id {
  *                            Usually these will power-up in a write-protected
  *                            state.
  *   SPI_NOR_NO_ERASE:        no erase command needed.
- *   NO_CHIP_ERASE:           chip does not support chip erase.
  *   SPI_NOR_NO_FR:           can't do fastread.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
@@ -539,10 +538,9 @@ struct flash_info {
 #define SPI_NOR_BP3_SR_BIT6		BIT(4)
 #define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
 #define SPI_NOR_NO_ERASE		BIT(6)
-#define NO_CHIP_ERASE			BIT(7)
-#define SPI_NOR_NO_FR			BIT(8)
-#define SPI_NOR_QUAD_PP			BIT(9)
-#define SPI_NOR_RWW			BIT(10)
+#define SPI_NOR_NO_FR			BIT(7)
+#define SPI_NOR_QUAD_PP			BIT(8)
+#define SPI_NOR_RWW			BIT(9)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
