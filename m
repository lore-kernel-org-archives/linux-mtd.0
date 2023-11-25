Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298CEC636D3
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ppj19Soi1ISgDcLO/HVyZBY+KcO1BwywsJtrni9fGY=; b=gNxmOYMA4dus8O
	kC/j1QRTQvKA2KeK4Vb/6DNzFwdnIYbISI6eujGpeY07tTlnOIOIfHioaU7vDbhJCrBj9aLDlTqmX
	9oL+plbswCLzhl/ashNkP201iN25HLkqb22vHoBlHj+Y3dR5gsgj2fObyYQrMSg3hOgFLDS8gERkX
	QbHmDEhZqGQxwyktng8TnDefBOiKrXob2+RV670euipgzGXvAfBFlSLA/wwDSQKAu+J8Vm+YsQXrS
	rAXeEWSwq42ec4c486Q/IDwGGCJwKfOYi2wpuThvF4FIMwXDyv4cApIEzl3Tc5plyjyItijar9OwW
	NuB5/3bx0EmEsdWfmFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt8-009EhU-0a;
	Sat, 25 Nov 2023 12:35:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt4-009Efd-0M
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a00c200782dso401308666b.1
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915752; x=1701520552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txTWULb3qOMaVJaVM0srxekYyIAj97clVpD1wkCUdRs=;
        b=NNwq/D5S9U6PBOFPZ34YUL54vdSEsS94UEydcse4cV9nGXZED253SN4foStsCM/PS8
         KKqNfkj4zlXv2ChA0JnUYLgt+r1QmNlOBXpsx7O4MH8+sTQ0F0VaqYnXZqHOWHak0IVr
         m0H2xWq36/TKbWmsSBB7EQRreEFuQopfEWgCA+xVwjl22SWW+GEesyRDC53CJKRWlB9n
         B/+koF1SHC4uOfPDnX9dwzENnO3oTW+YlhKcDqbfuQGfribv7Oqr2c5FQsvB9z7NY1qX
         FC4xFHCgUpbaxp7n6ltqxDEYXDwdiedUzhbjsB/IeX2j0BjS7QUR6Ixycq9mvPUhfEfw
         iZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915752; x=1701520552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txTWULb3qOMaVJaVM0srxekYyIAj97clVpD1wkCUdRs=;
        b=MDYmn7KfwFgY0VmkIC+3xcuKXVhb171jkKqi4ZhL5FAj0SoFOPFI4kBDdQ14YI5zRX
         92AG3XVlLA+pZ+Q41J5400oc8WBXqV/EL9exJ0XtSZEQj3MyNTSz89XX9lT5vOCfxwYm
         TSQfIbG87j4wWmee8Z4ImnEtVYs9W1IVw6o+MLS2I7Ug3Ii5OmvrX0q21gngmWp/rLkP
         oWVV+lQmLwR3t5WS0kWHpmNzjkpocDX+nt2zb0OcK+aNlF7YglPBnpTc73+5XkQuJLcF
         GgfRRkXmcamg8fh0meakslqVsn2eJm7Eu3z95JI//MUpP32E+5FsdwDY0lid/pfhQSRy
         qVEw==
X-Gm-Message-State: AOJu0YwrySUMb/dfUN22RXjO1iDgmbqlMoL7g/m4eKbovy8e7poHNnf9
	vmiqxqScpbLwsg0AQTuPF7DHYQ==
X-Google-Smtp-Source: AGHT+IHjGaQJjZMvJEp2O+E3VbE3I7/oZ2yVxz1hpulXF7qjWb1sTM6BVp4MjQScsWOTjZslEF2t5g==
X-Received: by 2002:a17:906:d2:b0:9e2:af56:c380 with SMTP id 18-20020a17090600d200b009e2af56c380mr4056526eji.6.1700915752219;
        Sat, 25 Nov 2023 04:35:52 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 4/5] mtd: spi-nor: remove NO_CHIP_ERASE flag
Date: Sat, 25 Nov 2023 14:35:28 +0200
Message-Id: <20231125123529.55686-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=tudor.ambarus@linaro.org; h=from:subject; bh=CCp3s597dd2N34pcvWqlxQ50V8OYh2tnaQCvSzFKDOc=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoRHtkHuEy/gG4P7KkUgLRNHmTbUGbxJBrYu JpjuIMIeFqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEQAKCRBLVU9HpY0U 6U8EB/4isL9ZPOAlY3kE68x1LosSOh7Ai80yt+wDjJVDB5heW0xOuYMbkEfIwfpIYuDCHR+GYnd XgA5CiKFrqLiHwBMwRJWKYVHby+AfwdlgJ1D8m+gCeW/8a1KAeBHGDYm3Wt85AoEV+yiFFvDEV+ b+PQX+WSWDVPCX9DrygJ+S5Wy5ddhid7ZoZXrrI84jOjOgC50BUQqEiCRoMLN3GI/L6WSvCeHgp 827qSsTa2taSWG8HocFv0Q/I257SwmQzNUJxGEUPTL8drbtu6if3yd49etgNoooeQiVn/hfS7zK iDgH8EbbhaZDpYO9+qKUoKhnFSDuV2LhYd3AD6zPqPXutGN6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043554_151534_B9311216 
X-CRM114-Status: GOOD (  11.35  )
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
index 52e5b569ddfd..503fed90c2fa 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2888,9 +2888,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
