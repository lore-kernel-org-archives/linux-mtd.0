Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80420C0018A
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuUdm/Dv+1Myi0W7IjPugLoVAMp8I/cau00XN6gLRvk=; b=UBQlkg26Bxn2cC
	e6GFN1h3JlnLYngydNjXr/ay5nds09m18vkENUAzBUyTIxbnwP58WCdv3kXoIaLyGmO4aVqFyfea2
	I7A4MVjOwHX26ZrKIUL7J+ANikSOvqyf5z9I1/c922EbweobumAM3x6x2cGIomrp4SIoqGq+CfKi+
	OMajIgRVZ4aa55fk5CeooyTdPMl+kspRllbYzFuNhxZ4GIS5ooknh5GBDKXN5Gh5H8laAESRdcJzW
	xwqNiNAIuBbCMAQPs+EJDzGIywhijHQ0dlhVOYqaSKj4lpkVZLsmbaeqqBNO6mBarHi4d5beHaoGy
	sqS4vviAXG8828d72wOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCge-007gkX-2H;
	Wed, 01 Nov 2023 14:59:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgU-007gfP-2q
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d8d3b65a67so91382666b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850745; x=1699455545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AreOz513apIKgSX7yxcLMNB3mQeH4jejqLS8mho2UN8=;
        b=hhDdmKQMesgSRHk9M0qIn9eErTJRhIff7f4C8bOZ0LvYv1JRkdnmdeb0Et+wi0Dbwk
         5QpiR3GHOj64kNZEAr9vQvsn43FTAIsILj20r0qPm0KL8oSpmxQs3gY8/l+t2un7xG83
         uOZagpJP3aVeHWjZqQjrEh/K79vc+mrzjlAuFqEzznMjc68C569cq/TezDvhpTUiGQiL
         IQUWiY5PlPm0eSC1vLJkAZI1qDlIOKGkfsnAQMI7YHLTAxdMuoQkMpU15iIdLDNNsyaV
         ELK83MI0dpcrKXr/fyclhZqyknGoxYonBz6gHv6d03I9McK8o6C+F+nnMpa6I2UXowGl
         QlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850745; x=1699455545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AreOz513apIKgSX7yxcLMNB3mQeH4jejqLS8mho2UN8=;
        b=r6Ia820UoUb4k7HBlBprFCc3NVTW/aeV4yviKkMdE0pQrC22h8ADlNW1LPBK4ghPDi
         8cHn/VHwDDcEYz1rg0qKQd1t9oE4qPa+rOALOXrQ5vXnleSOuyB5DoHRP0OkJao66D4P
         Y/KKjIuCJ5DRytbEg2U7qydUK+4UkFDFzAPzbP12VLHyUODVLGxQpb3tRAsP1K2Xqiz/
         37+842Orprflg3X8TV9vpQeQROaKx/S8AbEc1XDbYSsuz4X5+GI2ENsJoxFxtXMcDo/p
         vWwHpfcfAR8/pQzq0yCvSLs6pkUnchJAlbusTadmAFo39a5EMFNMKGhJUU2fiY+O9oJb
         06aA==
X-Gm-Message-State: AOJu0YziLZxHp/XMNrce1k/XmA3dj2OT4nL/WtIfqtUEYNlEHRncfE+W
	QGpl/ZwdXRNLSDNRz7hVI5cqlw==
X-Google-Smtp-Source: AGHT+IGLBqDAENsbfx2hnYk/H7r4yocREQG2lYOF6Bhdp3ECspGPpIVw0IsQQg81a5zNi+pT/mZkoA==
X-Received: by 2002:a17:907:7b9f:b0:9c2:a072:78bf with SMTP id ne31-20020a1709077b9f00b009c2a07278bfmr2308631ejc.26.1698850745585;
        Wed, 01 Nov 2023 07:59:05 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:59:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 5/6] mtd: spi-nor: remove NO_CHIP_ERASE flag
Date: Wed,  1 Nov 2023 14:58:52 +0000
Message-ID: <20231101145853.524045-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075906_921942_3E14372D 
X-CRM114-Status: GOOD (  11.95  )
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
index ac2651e76285..af8f3fc30256 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2886,9 +2886,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (flags & NO_CHIP_ERASE)
-		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b43ea2d49e74..29ed67725b18 100644
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
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
