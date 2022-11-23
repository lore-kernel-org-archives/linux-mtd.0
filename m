Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55F9C3A59F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNqsewnWK+3yvteoOCK9u3C4kcHqFbr1AXC3FR1RvFw=; b=sA3CYjyi92SDoF
	CcROHdVk6BoU0vPQj+IzkhB+EwhMMCVTZ1nJ9tiljiQ5qDMYc6U0v3e/eXnJ8QkMs9I37ywH6jdLK
	6br2bfx3j0Em2tB71GGpO6m9FbYfWcolXB3Ue2+kFtN2x/5rIn66LKG1xnwsFnpr3Wp3g10tpYC1v
	gtRJBDK+6fimeTyE3EwRDy5cwThMCZWInt4fbqGMLi3N8ecGGX1P2EzkiSIah3MdMtyuTZgj+WqHP
	sRG14iWpQCqWwKdcomYl9KgywI9kN17kL+I8MK6Sd/kE2GBsqBAW1tNEJBK/G9kwVxAATzRfznHdH
	BXxScSnkY+LMwDQMjgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxx43-002TA6-Qg; Wed, 23 Nov 2022 21:13:51 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxx3y-002T92-C7
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 21:13:47 +0000
Received: by mail-qt1-x832.google.com with SMTP id w9so12053054qtv.13
        for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2022 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZJAARPx2SHtSQhuKCHJQqr1weKMEsXAzSQ/wjEgP/A=;
        b=2VLnkaozanxm/fqmdEy2NgJX+Vj307RM4OQqji23uaPYoksKrOM2UdlD19T40yFoll
         uoQJPjDBKAzXNPDhnl3i+7WhBNOCN7c4QrcQp1+L4y8PyVyqcHlUhxdfiWt8+037NBAv
         PTlPCRNXD45gQ4HNoQKAO/42mHAKfZiFa6Ifx9Kfc6bym0b/NRvTK8pORQbxn0Eo3pGu
         vNPrkxh880ysqwq2KaOsWZMcAABAaVjjmmK5lPLxmGwMx0JedI5gthVBfN8gvsGSNC+B
         eXCG1AN+EXggie2hc72e4AO9ykHncfZD/w2/z0SiZC3LXInA8jdcSjLlL9rLP1APjJCn
         0hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZJAARPx2SHtSQhuKCHJQqr1weKMEsXAzSQ/wjEgP/A=;
        b=tY9O7WbJcrkv7o+XjIfnSkqbTqzFqESFcp78HqQlHHn3M/kNm2iXJXfIA7O68ScV8l
         flof04MXcoQiCfsKlr40yjoDVHYNYl5ecNE+l48X+4+YFhuZGyYNPwYf0PWxQDsHB6Ya
         7Y6uI1X6pKEJIONM12xj/Vk1CeC+SZVKY+mKE+oDcv5JnwofhLk/m61hRhb3jpBSk3Nn
         T8dEX744dlF7o94Pge7Acn9vpOas9Keg1x7bobe8ET+OBNp0c69nMqybXbwJfiQu9kwH
         /ua1KnBIb7KMO1kfKwUdsCiWSWDRQC426C3WKvfmKAu885j4onYVBnPtb6xkUnWdUIKl
         d31w==
X-Gm-Message-State: ANoB5pmTVnOHRkRNCIrSXEucGMzZ/9r87/znDsbqqQtfw/YOXVm34ZJ1
	x/ADPbXEu5Pn90W69fTYdpAbNw==
X-Google-Smtp-Source: AA0mqf6F0KbifRkIynWdRMtfuohUIrzqVZNQBhRwWVinUpmKtcemXQlxh/QyUTKv/ZPWIYVT1hpOIg==
X-Received: by 2002:ac8:67c5:0:b0:3a4:f665:7791 with SMTP id r5-20020ac867c5000000b003a4f6657791mr28900709qtp.380.1669238025276;
        Wed, 23 Nov 2022 13:13:45 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id cf11-20020a05622a400b00b0039ee562799csm10222928qtb.59.2022.11.23.13.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:13:45 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] mtd: spi-nore: core: Add in framework for 8S-8S-8S Octal STR mode
Date: Wed, 23 Nov 2022 16:13:34 -0500
Message-Id: <20221123211335.126417-2-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123211335.126417-1-nathan.morrison@timesys.com>
References: <20221123211335.126417-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_131346_431420_7E7DCAB0 
X-CRM114-Status: GOOD (  19.00  )
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

While trying to bring up an Octal SPI device in STR mode, I found
that there is currently no support for 8S-8S-8S.  This patch adds
the necessary, additional logic for doing so.

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/core.c | 57 ++++++++++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/core.h |  5 +++-
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bee8fc4c9f07..66665c1bebd7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2253,7 +2253,8 @@ static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
 	if (nor->params->addr_nbytes) {
 		nor->addr_nbytes = nor->params->addr_nbytes;
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR ||
+		   nor->read_proto == SNOR_PROTO_8_8_8) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
 		 * in this protocol an odd addr_nbytes cannot be used because
@@ -2335,7 +2336,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
@@ -2359,6 +2360,13 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_1_1_8);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_OCTAL_STR_READ) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8;
+		spi_nor_set_read_settings(&params->reads[SNOR_HWCAPS_READ_8_8_8],
+					  0, 20, SPINOR_OP_READ_FAST,
+					  SNOR_PROTO_8_8_8);
+	}
+
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
@@ -2366,6 +2374,12 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_OCTAL_STR_PP) {
+		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8;
+		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8],
+					SPINOR_OP_PP, SNOR_PROTO_8_8_8);
+	}
+
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
@@ -2631,6 +2645,38 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	return 0;
 }
 
+/** spi_nor_octal_str_enable() - enable Octal STR I/O if needed
+ * @nor:                 pointer to a 'struct spi_nor'
+ * @enable:              whether to enable or disable Octal STR
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_octal_str_enable(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	if (!nor->params->octal_str_enable)
+		return 0;
+
+	if (!(nor->read_proto == SNOR_PROTO_8_8_8 &&
+	      nor->write_proto == SNOR_PROTO_8_8_8))
+		return 0;
+
+	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
+		return 0;
+
+	ret = nor->params->octal_str_enable(nor, enable);
+	if (ret)
+		return ret;
+
+	if (enable)
+		nor->reg_proto = SNOR_PROTO_8_8_8;
+	else
+		nor->reg_proto = SNOR_PROTO_1_1_1;
+
+	return 0;
+}
+
 /** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
  * @nor:                 pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
@@ -2691,6 +2737,12 @@ static int spi_nor_init(struct spi_nor *nor)
 		return err;
 	}
 
+	err = spi_nor_octal_str_enable(nor, true);
+	if (err) {
+		dev_dbg(nor->dev, "octal STR mode not supported\n");
+		return err;
+	}
+
 	err = spi_nor_quad_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "quad mode not supported\n");
@@ -2714,6 +2766,7 @@ static int spi_nor_init(struct spi_nor *nor)
 
 	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    nor->read_proto != SNOR_PROTO_8_8_8 &&
 	    !(nor->flags & SNOR_F_4B_OPCODES)) {
 		/*
 		 * If the RESET# pin isn't hooked up properly, or the system
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..56795db872c2 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -359,6 +359,7 @@ struct spi_nor_otp {
  *                      Table.
  * @otp:		SPI NOR OTP info.
  * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
+ * @octal_str_enable:	enables SPI NOR octal STR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
  * @convert_addr:	converts an absolute address into something the flash
@@ -508,7 +509,7 @@ struct flash_info {
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_DUAL_READ		BIT(3)
@@ -516,6 +517,8 @@ struct flash_info {
 #define SPI_NOR_OCTAL_READ		BIT(5)
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_OCTAL_STR_READ		BIT(8)
+#define SPI_NOR_OCTAL_STR_PP		BIT(9)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
