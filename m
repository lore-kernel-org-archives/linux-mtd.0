Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB65C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QXjYkHLs2rIM/E4cLbm5B2zdDIpsCE40Czhj1jp5A4U=; b=b54dj2PaEcyhfV
	E88yiQpK8Cm/Dht8q4Kp1WDU69INUm757t96t2lY0oJg6+QIzZ08UM4/JTyk6WKVsmW/Lex1a2tV5
	8ARtaP6I9fqGD7J0X6qBoXcfF1glRnnbskLQQ5K9PXVSx4e0cejIyjj3pcfeRaZBAoo1Ipk+0OgVo
	U4imSQWaDi4cZkkbzEhNMGoxMQfU/GgyJe16BTh1ISQDh1okghwb9dKQo7hFB1jsvP0qaMkdwtSbG
	Oxdm6NywbkdAsJOykup3TAF9Pa54roL3i28rxdGzXkEU1Wn9FFif96TlXxqUtCjuwzaWplpSa7+5W
	QtQOKEG9jJgSvpcMtRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDzO-003s3C-1s;
	Wed, 16 Aug 2023 10:42:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDzL-003s1R-0m
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 10:42:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bdeb022738so17485575ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182572; x=1692787372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PnvIFrpSGnja4bvJtTn8bJ0Kfic4a2Wxy3t2tdxXRU=;
        b=CoAp7Fc1Cacsc2lmTyKEL5Lgy0D1mtYvNUWh/lzpXdMqI76zMeZUv1o3cpEgTmRLP/
         kQ3Leidt/qHEmucA2U/DXSpGAbR1wh7SMHtLueY98tqpRiXqKsul9R38jTyghIwV4Bez
         ZLQZnBLtq0Fiv4ucAAh1wbSGG1XqddS8CIm7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182572; x=1692787372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PnvIFrpSGnja4bvJtTn8bJ0Kfic4a2Wxy3t2tdxXRU=;
        b=Aq5hOFjDhK2yQW/4FJfxFrLwRSaENJVVD3XF3XuY2HSc5xo24rPLYnhp3EcDYoqCh+
         PhkqpaJfNjTuVXDBh9piDnr6/UNnby9/E7ukVr2RiZyPsM2V1e+EOBS/x0NDxuDn/CI/
         dnfz8FEzQzjOyLGaSY74PKoCWZNWMqauKKQynyx83ygK9CcHvHfB02KOJ8Y1Bldqygj4
         Pobr2PBNxoN7dIRTD0N2X+ymKh4XXsir/+QqmOXm+S79l/T6KnRiBfjaqXqOLkDWw8QZ
         26GTbhkkV3DmNB/XUeKOvU4/9u9y27QVAhu0d54KyAYP6BYAM+E+nhJgL9R1Eq6313WN
         dDtA==
X-Gm-Message-State: AOJu0Yz5lFCH2xGqKm9XT1Gimr4yjm20G0iDs7yq/uorXwiqCNkhpnFD
	9D/SUiBIGsfTKyLxux4xeaahRQ==
X-Google-Smtp-Source: AGHT+IFPXnWFX4zJxPA3lPUtxu59Q9sGZo/xVnTX67kYXuB7P1GInWKjqj/biOIS/1y+wH4+4gntTQ==
X-Received: by 2002:a17:902:c70c:b0:1bd:f69e:a407 with SMTP id p12-20020a170902c70c00b001bdf69ea407mr4771921plp.8.1692182572401;
        Wed, 16 Aug 2023 03:42:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001b8a3dd5a4asm2899270plb.283.2023.08.16.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:42:52 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode according to bus width
Date: Wed, 16 Aug 2023 18:38:32 +0800
Message-ID: <20230816104245.2676965-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034255_303001_2FDC0E64 
X-CRM114-Status: GOOD (  16.44  )
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

gd25lq64c has Quad Enable Requirement flag parsed as
BFPT_DWORD15_QER_SR2_BIT1_BUGGY in BFPT, even if spi-{rx/tx}-bus-width
set as non QUAD, eg. 0, 1, 2... Thus quad_enable will not be NULL and
quad enable (QE) bit will be set to 1 by default. According to
datasheet[1], if QE bit is enabled, WP pin will become IO pin and the
system can't use write protection feature, and it's also not recommended
to set QE bit to 1[1].

Add a post_bfpt fixup that reads spi-rx-bus-width to remove quad_enable
if the width is set to below QUAD mode.

[1]
https://www.gigadevice.com.cn/Public/Uploads/uploadfile/files/20220714/DS-00012-GD25LQ64C-Rev3.4.pdf
page 13

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/mtd/spi-nor/gigadevice.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index d57ddaf1525b3..8ea89e1858f9b 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,31 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static int
+gd25lq64c_post_bfpt(struct spi_nor *nor,
+		    const struct sfdp_parameter_header *bfpt_header,
+		    const struct sfdp_bfpt *bfpt)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	u32 value;
+
+	/*
+	 * Even if spi-{tx,rx}-bus-width is set to DUAL mode, due to the QER
+	 * flag parsed from BFPT is BFPT_DWORD15_QER_SR2_BIT1_BUGGY, so the
+	 * quad_enable will be set and QE bit set to 1.
+	 */
+	if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
+		if (value <= 2)
+			nor->params->quad_enable = NULL;
+	}
+
+	return 0;
+}
+
+static struct spi_nor_fixups gd25lq64c_fixups = {
+	.post_bfpt = gd25lq64c_post_bfpt,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
@@ -53,7 +78,8 @@ static const struct flash_info gigadevice_nor_parts[] = {
 	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ)
+		.fixups = &gd25lq64c_fixups },
 	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
