Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44157EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnwqMt1XAOFtwXPvzusownIYshs/nr5pTZE11RrEris=; b=FAmJT03W3kB9Pf
	1fhQQxPpDf1rNH26Uj4c/2mNBWEbvFAMbLaHhCm8lMAIPbuM5/1ZxXtuyaNm5crb0bIZOOvOQdKka
	/z0T04SCRBIv/8vGF37EhQa9pVoM9o9GA+vXUF8CfeHWRJB8Hmb7Wu0KKxDsf6/C3XBtDS0WpTTwS
	MZF2sitYEFkW7FvPTJ/almPBSmyfnAOIY/GuVDeVI46dMhsvfMjYGv919gIfxLN3g0pSozCFrzbzq
	xEuV43hu/l7Ag232tC8+HR7K6V9jkaiSRn+DcZ0IaUD/YpqTDNzdfb5XaAbzTP68dfMBJpW6gzAw+
	SVCLTJmNm2j7vagjGOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AG-00GABK-36;
	Sat, 22 Jul 2023 08:40:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AD-00GA6D-24
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991fe70f21bso419175866b.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015225; x=1690620025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=qNT80/Zlbe9BshSZXck/Xh0cYZdvv5Txu9QfiqaRM0OaV0TyN1eWCa8DR4FNXw0Bzk
         fJxCkbz+H1Gkid78ipk/QXuZUvpUCpCaa9dL3muHd1I3wALxpV3PvGoDvM1Ig0RzwASD
         Szsr0WmCXw5IESDLkn7i+MG/zyMi4v74yEHZcHletcLGDKBgYSIHpX34KgZ/8C84xYMg
         uFz+clWz0GPwb1s8zzrwB/80inRUELrnHBlq3njTJzrItyGK4VWE+GXd7h6LtZV2JWoQ
         Krinqie3FbNbm/t72tN0qnrO4MjkLCz8HjOnr7foGSNb/89qeZVkjWR9okX977+WPjiE
         2lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015225; x=1690620025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=UIF3As3c0CCi2fc/+h8ifrYgmqEKWxMkZppS0+USnBjK7aXt6qxJtGWJAnMzbSh1YW
         9M3b6maTJ7klMpQod+ko71SMxaVhvCbHRlWdp1O5HIlEX6kRjaH1qxCIqDkLjIeMcfo0
         2fGdt0A7gL2f2N9AKpnmwvWJqrDGVs5ZoooL/LXzI9OYPnZwRy1YK6ieqPtF1SL4DXlr
         2Slh7ljCeRDUELo+QVRw98EUMqpryQDDQBzmvnRpLy/vTDtvfmtiM3RGmgDBVnEl4Kn/
         ekAOAmYBH1uLdE4OQdIlPRll0swL9yTPbh46MEvR3xi0UVIfOcphOt2G5/ffvG8kVjhZ
         rQbQ==
X-Gm-Message-State: ABy/qLYWpToqKdO7srVgvfRaVkSIeaWg6100q3MEl9PJeSO3Nu2caE9Y
	JNWrvt6Lqohg/8QAOmQu307Z/Q==
X-Google-Smtp-Source: APBJJlGWcymer2aN2fSpqQil9d9NKXD4YAk09ouGIhBw/NgkLPikpYhlNPp09K9CCXkQzEDUGzUW0Q==
X-Received: by 2002:a17:906:5306:b0:99b:49ce:b4cc with SMTP id h6-20020a170906530600b0099b49ceb4ccmr3493371ejo.64.1690015225489;
        Sat, 22 Jul 2023 01:40:25 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:21 -0700 (PDT)
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
Subject: [PATCH v3 03/11] mtd: spi-nor: spansion: prepare octal dtr methods for multi chip support
Date: Sat, 22 Jul 2023 11:39:58 +0300
Message-Id: <20230722084004.21857-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3820; i=tudor.ambarus@linaro.org; h=from:subject; bh=xpyv1UNUOm+7WUBWb0Vl59R+HvbIVKf4klrF0ttDcrA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XjcL1Tyl84sNIYkyBfq2rFtCaH7yjWfYS7u dc1OqqEJMiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6VEjB/9xLq3zCHc9dae1xMRtJ+ek/y0oBhA/OlFzbU3DSDM8M3BSj15Z5jy+OuKX79eSHhPkg7b +DAQj8eEAKtkL8X5aAObt93vrdcTTTrSOhJ7yrEVqzKdwvAEMmyzOOq7cQppJ4MQYi00ahEIWmr ou2XkFoaQ2yGZe35GFtndpo56HJj5BqJeKMKPijzlbksszGCa5O2jB2wYkVqJyBfGJtUc4rFow5 5HiuB6j3Sy69QsLaVsoddtyO3W0pd7B/wQEWdWAbGRw6AMM6Gn9XRVWvsKJ1T6j/gTn5AnwsuIj NnFWYLJV1UYVvUZsbmw6PKAKBRBOWEGdRGWIHQFtVz0GEwtB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014033_682910_C3E4A735 
X-CRM114-Status: GOOD (  11.37  )
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

Infineon's multi-chip package (MCP) devices require the octal DTR
configuration to be set for each die. Split common code in
dedicated methods to ease the octal DDR MCP support addition.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 50 +++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6460d2247bdf..51eabddf2b16 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+static int cypress_nor_set_memlat(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -164,8 +164,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0, buf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -176,8 +175,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	*buf |= FIELD_PREP(SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK,
 			   SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24);
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -185,13 +183,33 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 
 	nor->read_dummy = 24;
 
+	return 0;
+}
+
+static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+
 	/* Set the octal and DTR enable bits. */
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  addr, 1, buf);
 
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+}
+
+static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+	if (ret)
+		return ret;
+
+	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
@@ -209,11 +227,10 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	return 0;
 }
 
-static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
-	int ret;
 
 	/*
 	 * The register is 1-byte wide, but 1-byte transactions are not allowed
@@ -223,9 +240,16 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes, addr, 2, buf);
+	return spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+}
+
+static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
