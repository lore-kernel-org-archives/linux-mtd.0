Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6683C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRQt+Y27dd6AfzS2hChSO2MZjKXjAlyfWP3VjP8ErVY=; b=IJsDLzsuIcIudx
	nnogVArHOelY6ccTJ3pdJbe5fe+kEwsExZAVryQjILmIlMdOucm86CteZhy7wPEPSnnmG/oNvLSE1
	b1w51JSkdlAcAOnDZhqusMez93nsikrBhmW7AJkAsNLc4nDrfbCiBBYGUL52RBM4Hm2QfSi/ceX0T
	k2mGp/ufzpoe6Mx0gNv5n7qgQLLXStQKUeuVndk6FAqwfGhS2zMkt6UAeMBJ4U6uYuGcDQTbP9PLY
	YFmlk2q12DWfW74feDwCP6r4dY70Rktozg8EeW9GmUYuYg+02SFz6mRcqxQu8GxgPTONsNuMeXzOX
	BjBRuW3iZm1RRrRFyNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cO6-004jgu-R8; Fri, 23 Dec 2022 07:22:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNo-004jXo-SI
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:22:22 +0000
Received: by mail-pj1-x1033.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so4264685pjd.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvJLJGQ2+eUycs0JdQsDhAaSY0fQVq/fpPoAcsC0c5s=;
        b=O4ELEroPenmE97rLiA4Y9GDa9J2NjCGgQTt+pWUDkkFRvbxBIqJz4JkJhgCxfg/Znx
         VQn8n6Yqbnx9EbOvZMEKa5D57cHAjIQiGybEvNp+p4V4fvZQ29udOfRTVV0R1q/XbyRP
         SQ7KBFGaOSt5L2fGfpTOpgRTx0lc0vnjd5gIzT57QqfyJNTrVTbmeVankq4gwRkmYA0g
         5Gg7Ean7BgFgavXLmU2CAAo/+rAwS3ByAxqnG4GyuPYLzo1Q3eTpKzdeytqX7EynDS4O
         ZHeraL9iCh8WHLfXXBLSXIbANN+2gxxP4oQwRU2h5qOLJaGDvuvL1o7EVRkGy4hPGbqy
         p5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvJLJGQ2+eUycs0JdQsDhAaSY0fQVq/fpPoAcsC0c5s=;
        b=hvuPN/jwz3eL5McpCcNOXfrZWbbS9qFeIXhRXixiV7GyjpPUPzOOu+wsDyK+42lhGO
         HIJqfRcHD5rQHefJTGyd+qAMj3VWSp4hA6t9FgMCgCuuC6B9MjfQ106MRpKRMZW1TqYp
         lZJYwZ0gGP+qE3XPt+jcB0/9wkyJEbGl68Hj5t+rHCSGZXTgVeneWYK6A7Ggyk/C6hVc
         RNu1CdVgijoUfCRacyTe4IZkCyTZNHIJRIj+KFG3Q421cLKzgOok17q5b6mf7Xr5quy5
         YmnptajcBVouCwD2I6L6/ZQsEJXBVrjbLlmg/Jw0GU8QkdZTnAVmpKiBg3ZOU+2iq1fY
         fAoA==
X-Gm-Message-State: AFqh2kojsoghkIjSTSsIX4ITARlEYajZyJvlxInLcSmP+IYyxFbsKXmA
	pIAHktGUkUrUxmLWRPdfripcsYp587Y=
X-Google-Smtp-Source: AMrXdXuYoMeFh2RN8G1cqzzlSbJr7UwVfJb6mnlbUN0YJP4TqO6baQLJKx1sbmYj+OV2zEnHafszXg==
X-Received: by 2002:a05:6a21:3949:b0:a7:9022:5d5e with SMTP id ac9-20020a056a21394900b000a790225d5emr10761804pzc.2.1671780137729;
        Thu, 22 Dec 2022 23:22:17 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a24-20020aa795b8000000b00576ce9ed31csm1848146pfk.56.2022.12.22.23.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 23:22:17 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 3/3] mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter tables
Date: Fri, 23 Dec 2022 16:21:41 +0900
Message-Id: <84bd91b96d6824e0c1b3f8a5e33e3e392e7113e7.1671684805.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_232221_203290_C6A1CABB 
X-CRM114-Status: GOOD (  12.49  )
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

Change 0-based indexing values of parameter tables to 1-based ones by
SFDP_DWORD() macro.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5c2ab868707b..3acc01c3a900 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1004,7 +1004,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 
 		discard_hwcaps |= read->hwcaps;
 		if ((params->hwcaps.mask & read->hwcaps) &&
-		    (dwords[0] & read->supported_bit))
+		    (dwords[SFDP_DWORD(1)] & read->supported_bit))
 			read_hwcaps |= read->hwcaps;
 	}
 
@@ -1023,7 +1023,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		 * authority for specifying Page Program support.
 		 */
 		discard_hwcaps |= program->hwcaps;
-		if (dwords[0] & program->supported_bit)
+		if (dwords[SFDP_DWORD(1)] & program->supported_bit)
 			pp_hwcaps |= program->hwcaps;
 	}
 
@@ -1035,7 +1035,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		const struct sfdp_4bait *erase = &erases[i];
 
-		if (dwords[0] & erase->supported_bit)
+		if (dwords[SFDP_DWORD(1)] & erase->supported_bit)
 			erase_mask |= BIT(i);
 	}
 
@@ -1086,7 +1086,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		if (erase_mask & BIT(i))
-			erase_type[i].opcode = (dwords[1] >>
+			erase_type[i].opcode = (dwords[SFDP_DWORD(2)] >>
 						erase_type[i].idx * 8) & 0xFF;
 		else
 			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
@@ -1145,15 +1145,15 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, profile1_header->length);
 
 	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
-	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
+	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[SFDP_DWORD(1)]);
 
 	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
-	if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
+	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_DUMMY)
 		nor->params->rdsr_dummy = 8;
 	else
 		nor->params->rdsr_dummy = 4;
 
-	if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
+	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
 		nor->params->rdsr_addr_nbytes = 4;
 	else
 		nor->params->rdsr_addr_nbytes = 0;
@@ -1167,13 +1167,16 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
 	 * flashes set the correct value if needed in their fixup hooks.
 	 */
-	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
+	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[SFDP_DWORD(4)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
 		dev_dbg(nor->dev,
 			"Can't find dummy cycles from Profile 1.0 table\n");
@@ -1228,7 +1231,8 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
+		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
