Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD4C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjEtb/NtQGCWdQSe8UArZ6fWDi94XYriVaMhNyfcjvY=; b=03LduAcX/fV85W
	B6Dld/yfMVV6tBmZUdLJVVZB8aEnfReexaPjIyFvy1WKWzFnuFX8b62k3jmShiAM0V95v4WFHcp9I
	4J0djXXRPKHNv2VOfm4Cdb/JLo14TVApm7crWpbt0UiNdIUNeL1r/Hglnr9CW5tcYqmWEtYKiay0I
	GgxpPlGqK5csmmMDL/NX9aPnATMHahj8Y2x7/042ladZaimzNGWB2uslm2zB4k4izzY7O9mD/4oso
	Rf7JaiF6JRA6KOY4R+jTf6xyjQAqjSFSVOW7WL+aKtT9g5So8VGteejEf8MzmGvCSWRYF+dYbHnPP
	8ihqbIdxbWCcbVqVJzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgp-003CPF-1M;
	Mon, 24 Jul 2023 08:13:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgm-003CMz-2D
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9939fbb7191so855275366b.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186387; x=1690791187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zR/M8U1wHDKNH5FK18SqWQfcxUTegtHbVe9hHuhxRk=;
        b=gSFQ/HpK5N6H/8kytfRh2+IX2a3eYAbeGHw5wmyZ/Q4cegnjB7xhpYXGDLuZRjRA5X
         fsH3lktwBPTPkQQhnj508dZGvPlzSF3WqdRXM1IwjnuW/azppW2sJiLQeaGywEl7rX0C
         HpobsrPlf/jbuwR7c43IgxGuiT5ExiQRMevZxhnrdRTBxuKbE6FM8LueSHyNsATzxahX
         3x0IlzZfeMPVJQ9CdVH6gOxGmFs6+URZGyAitNvAMrgMUuMVL31Nkl75IYeB+8EjizNM
         vdHk2Ra4FRfqZH4rUbSOD7h/NeA/1Z4FGhD6XniVXhWCZSwlMPaCvdArYZrQo2m+i2bZ
         9CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186387; x=1690791187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zR/M8U1wHDKNH5FK18SqWQfcxUTegtHbVe9hHuhxRk=;
        b=JsUu2VySn7zuvNVuWlyRRInJea7ebOC4EyIAuD5l83lEI6+PGE3986iJ5qgmOk2/AE
         VLfJYAVYHYzt6IsusM1yZqIh9okWjRYXQu9umPPGv8fhqqjZ0SV9mANLGfqwFMBk0DJT
         A6SX4FBrR0yEzo3VNY1yRvqHdrGXjiY4xGG8h618nK1U98sAb9LFX4f0+AzIoNu6L0Jb
         rHQyX1bMep6ogWnP1Gw/cJPjPOcAZOuNq7za2XuKwaJhjXldaOi7p2GolV3xU8lFTowb
         sXtMzCDlvIS9m//KB+/MWAQOUBSh4G964aKnsi+1rpcEAt4VhjOW55GaZiX3QYESL5/u
         Zvqw==
X-Gm-Message-State: ABy/qLbIK7W4Uuu9dFWcGLOn+IkAF79UblOz+W9yxThEBxGJ0vTZ+77B
	YZ+6IBXVMvkY4dBeTsSrS7p3rw==
X-Google-Smtp-Source: APBJJlF2heJfl8MQDDlm7U5LJn0RmLJ7fM7Slrql6tkji5QwnlxEqIZI61hThIeekB1eqyZykKJMrw==
X-Received: by 2002:a17:907:75e2:b0:99b:4bab:2841 with SMTP id jz2-20020a17090775e200b0099b4bab2841mr9525489ejc.26.1690186387421;
        Mon, 24 Jul 2023 01:13:07 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:06 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [RESEND PATCH v3 06/11] mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
Date: Mon, 24 Jul 2023 11:12:42 +0300
Message-Id: <20230724081247.4779-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=tudor.ambarus@linaro.org; h=from:subject; bh=Wrd7TgCxXlMqnk/UDwQEgLVdRWdaYJRKC05Rf/3Xxx0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+6rh7ujEX5KOJrzAwohHe3MP6fhRRPEZAn HCFY1KuZRqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6bOzB/9ghK8NGTdi3IxM8Df5fdqtBbV5rzTB4CsDwL1WCLfQ09LY+dMOZpq3FoZpgwYwi3O/9Co nC4s1mzWjdxGCrY5XXgEUwu06zIvJqn4uhHm1frKCOByHs2LuvDh4BHsjnEXeaPzaJCf8o4xOcV 3VKswMoEvYd51FNnzQognRKtxlTr+2hAf7tqRciVUWQjk/MqfXM4011rfGRKXc1WLdgrNN+N9FQ QY++8UKrFkpJ1UifZoresZHuZUStoqYfGdZKY1Ar+s+0wgCg9Ib3yu/A/c2mRfQYW6b6l++2PrT PMYrBuwSBbfSoUceEHPA0ubhdk3drrFXomwplP/ggMXQDwf+
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011308_731904_5C6749CE 
X-CRM114-Status: GOOD (  13.60  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon multi-chip package (MCP) devices require the Octal DTR
configuraion to be set on each die. We can access to configuration
registers in each die by using params->n_dice and params->vreg_offset[]
populated from SFDP. Add MCP support in set_octal_dtr().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5b6f36b56e9f..28d0a995f3b9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -206,17 +206,19 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
-	ret = cypress_nor_set_memlat(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR2;
+		ret = cypress_nor_set_memlat(nor, addr);
+		if (ret)
+			return ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
-	if (ret)
-		return ret;
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_octal_dtr_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
@@ -251,14 +253,17 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_single_spi_bits(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_single_spi_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
