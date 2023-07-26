Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B253C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PBGsYUZJBGZtRidB4gmfkDjQEN2xzQ3ifXwVqx7KF4=; b=THZlIgAT3Qic2H
	JO90Z8ZMiRUkawX0qGV418QWeY7RrTj9/8xDp2rYkmLX9Q9Hv6v1bpP4ZvT/PmurGDZZmRsgoai6z
	YsuuYeG3njuW1QIOaoTuypaaQBQQXSXV+68d7GTb5GtyCVx4mRAG/OBvyJRvJtsSGf1sruS2X/avJ
	RTjbWHSFXWAyqJeC8BtAqLsNqmNspY6xNORoXGY5x5wvIDN6yqkRawsVgwdNqqPmOxInXU7A9iC65
	1YA57Gc6biOzRa0Fv7nWSryKokg/YNEOjSCFZ/nYCJEbit1Kea2W7kVM4x3HaNdW41HItpDEqNCOc
	2+N2qJJvzVcOcmjIDnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKt-009VAr-0N;
	Wed, 26 Jul 2023 07:53:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKj-009V0u-1U
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso64403775e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357998; x=1690962798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OR4WatIj1vDPYbZVDclfDkYALtpmV2GorGc4TguZ9g=;
        b=Jz3uDiHidmkOdHqQ4A15ozND+FenOh0akWPvH168WQkS1ulMaER6nfRl9L/yUu/yT8
         tm+X3r56QMEYUzaioEswopvrQaqqBZNVgeUtcZH99wMcv/YKJMp39Co3F97ewaUjxYQs
         FW6uAgjTV8NUw1k8wmQBJkE2XwtRIqmgtykRdgDMZtp1Wrj410nKRm0SslzYC29aabKg
         5XRMz02kdUXh7MMWRZ9ngTjTnfkxU4Nr8+9kPzITZmHXORgKG6P0wT65gOphuHcU4NjJ
         XcNL98mIpfocURNFsJEzpplNEmKGzzqvQOyyFUP3XO6Yuncft9yPKVJMvbm775ob8FjX
         ZYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357998; x=1690962798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OR4WatIj1vDPYbZVDclfDkYALtpmV2GorGc4TguZ9g=;
        b=GpCBTOiahm+U2j5nLGER9TNnZCbRUwBEThVFhejNvP1UmM4Cm/4gvqC+yd+TFMfuwc
         xyp4bhZqlj0EKF2PK5ydp/6kpqpfW8y9sqVxuICgEZifqXdAItoZlWqFczlTCVM7jZAP
         Yif1iCztD8P9nnAAK68XujD8cuV2cpjA87YZEbRF+qU11BdY1/CtkE+TUzbif3lwd+/y
         OjZE5sVSvJInHFdTQZam546YxHDaVGTpfvuKgpb86tUDD5/+/4l0GPOoeyFKyt7L8JKS
         lsSf5yAGZQ2C+cLLp0x8Q0AOEClufZ5/yM1TT+nlbwSXM3KmS+pYau/HmWXQZACREs6C
         aDvg==
X-Gm-Message-State: ABy/qLbckjotyV2X92xSL9dANoHVJGKJJAcrcmusJmFMqpDQB4/3Lrbj
	8aRYh8dS27o5VyE7gC5/niC7Mw==
X-Google-Smtp-Source: APBJJlHbavuz0p8nucrQuOaoL5YFpD5cb/Psc+qFF06gSLSvyRwttFangsg+w898wdRx7yDfaLeK7Q==
X-Received: by 2002:a7b:c407:0:b0:3fb:ef86:e2e with SMTP id k7-20020a7bc407000000b003fbef860e2emr785798wmi.19.1690357997872;
        Wed, 26 Jul 2023 00:53:17 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 10/11] mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for quad_enable()
Date: Wed, 26 Jul 2023 10:52:56 +0300
Message-Id: <20230726075257.12985-11-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=tudor.ambarus@linaro.org; h=from:subject; bh=QdB1CqYeo+E0vRmCT5AKj+737qFOif1g4DSnqlL1Z6o=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYWzzJw8YDhGmjAHNiDSE8hUDVOK83EN137 yf6F7ibY/aJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6TaBB/9OD4NAVj0Ze+yCwu+WLSTy9opP6fNQcZ6JV8WDN5h11aIzOo2vW3Lt1VPTKpL8Fxpr/7U 7syEMtg2iTm3aBOjM/4B73+vwAxFd4xon9PDcZ2f8YOOgiuOhKeyhA+r4JK/qFmEE1usbf6ssof wtXJast8GMQqjx8rD6jO0KDx6CZeG5vnw4XvpO+SWb361znYdbRxFtmWFJ5jCMaawhh12k4z9au Bw6QnJz1PO5u05Jzwi0sD4gBX5dGBFm9/cWWspuSFT8hpiq3B+2gkZ+wt34v7dcUpPnsH8LHzmG ixoMeoAoLpMMtAlETLwlXqiO1JV6JhWpwv6PqPdqFzlLkjXV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005321_527455_281437C2 
X-CRM114-Status: GOOD (  14.07  )
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

All s25hx_t flashes have single or multi chip flavors and already use
n_dice and vreg_offset in cypress_nor_sr_ready_and_clear. Switch s25hx_t
to always use vreg_offset for the quad_enable() method, so that we use
the same code base for both single and multi chip package flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 30a3ffbfa381..6abef5b515a1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -24,8 +24,6 @@
 #define SPINOR_REG_CYPRESS_STR1V					\
 	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_STR1)
 #define SPINOR_REG_CYPRESS_CFR1			0x2
-#define SPINOR_REG_CYPRESS_CFR1V					\
-	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR1)
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2			0x3
 #define SPINOR_REG_CYPRESS_CFR2V					\
@@ -348,10 +346,6 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	u8 i;
 	int ret;
 
-	if (!params->n_dice)
-		return cypress_nor_quad_enable_volatile_reg(nor,
-						SPINOR_REG_CYPRESS_CFR1V);
-
 	for (i = 0; i < params->n_dice; i++) {
 		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
 		ret = cypress_nor_quad_enable_volatile_reg(nor, addr);
@@ -657,15 +651,17 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
 	/* Fast Read 4B requires mode cycles */
 	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
-
+	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
-	/* Replace ready() with multi die version */
-	if (params->n_dice)
-		params->ready = cypress_nor_sr_ready_and_clear;
-
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
