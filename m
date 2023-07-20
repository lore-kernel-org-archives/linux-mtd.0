Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A7EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4hHHCZyoPu7/uJqjPKM/yv9AksuO2X7vxsqwMYMkzM=; b=tnZOX1f50LBm7R
	DjoxJOW+qfjQqWQq4yJUXHg0dYj6XEuVdvKzjqfSHXGs6KMFqb10jfo7IHQZiIR8ygyUAL/BcxF6/
	9vyb1T3zK4/ZW/8YBYEWjaoO2wBJuVJycQC95XtHlbcpDZsc6Ggd8o5P34xRTCiHXM8a9ywad3DKL
	uhLIBvSLfLCk4B3tcKs8BQj10VcNBa0AQtaRUUrqrBfsRbx6gUcvt50mV40d5IjylJFXz2WitA9Xt
	G14jlLTvME+mMt/rYkKVA4zwoDD0ILPdwB14zsuTEZYCkrZNGb0LY/AZviE3KQC9IWH1xDjdldUfK
	Go+4ecvmuhdJsHnnq1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoV-00A4v0-0X;
	Thu, 20 Jul 2023 07:11:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoI-00A4kL-2K
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b89bc52cd1so2457615ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837050; x=1690441850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vx+hmkgUTtUAGj4aPSGPmBvTnoo9eBPpr4nqnTlJT3s=;
        b=pATHeI9IkYkKdTtaPszNzcx7KDvBqabTLAFXHwkGiqDRQPrCeybdfHK0btCd9A0rrp
         V/HB/ngw/OpPxko51ak3INGgkPtIQYBHMvLTw8OOC3dwvPjAzACd9cANr+Vj+ipzZeRH
         tEqHtc9aFoMuDELjL+0lMQ45+q1nX5nKGUCymNysncgKZkejj51GMh3BaIrdWZBFqI5X
         FzhXZkQtAzM8Gu4rDhNwoEhQxVhXOi/YyoMAKfvqdIuvnvAyKxr9MHQXcFdht1OMRE3r
         kSf4BBAe5gqUrP4X6KYi3FWXvCiemeLG7u7Z6rXPDM0epO/MBT62i27tEOr3x64For5m
         1VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837050; x=1690441850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx+hmkgUTtUAGj4aPSGPmBvTnoo9eBPpr4nqnTlJT3s=;
        b=Tw4YiaYZh05DNzt5mA9dK+7E3YMDnu3gZBqwYAA2hY1tu9CZ0Mu38iyW4BVyW665x6
         MPNF/emF/a4LP2UX/KRLDYXM5xOzVoUCWrSy0d+tAU0/pvEZmO7ql1f2d6J3jcL4YIeS
         amsqM0NMyN4B0TNX0lYrRXz/Y73cVSF619UqlmjdSqxFRTYwc7hEqExmPZOAbxNJFvLO
         NUE7unvhU26xqIPMSTOBX+qn0d+e+cx540WLNlsKZQKyRT1sDoHxJQldEijvq1+tzNHy
         IRVVhxxXXpt6oMFT7tyFfodJWBWbmyfK2qIUC4KjnvOBS4GVY0h0ooF4Y8bqh15wEQ8k
         INdQ==
X-Gm-Message-State: ABy/qLbD6kDy+y7WOEMfQK9lhiHg6MXqSOuFvJM9HDwA386wnb3lUVda
	b1hdMqypcdglLZAQ/5D7L4uF7Z6omvw=
X-Google-Smtp-Source: APBJJlG7PcIaC5jJXj6TXDk+2UaY+2COoceyZbo/DglaUF9fXz9UJINmP56Tas4pw4U1jPZ7+1o4tA==
X-Received: by 2002:a17:902:8d94:b0:1b8:94e9:e7cb with SMTP id v20-20020a1709028d9400b001b894e9e7cbmr15540632plo.21.1689837049835;
        Thu, 20 Jul 2023 00:10:49 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:49 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 8/8] mtd: spi-nor: spansion: add support for S28HS02GT
Date: Thu, 20 Jul 2023 16:10:03 +0900
Message-Id: <8ec7e7728487db791a8e1a8a22c1d0802b3b572c.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001050_774888_15FCB76C 
X-CRM114-Status: GOOD (  17.01  )
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

Add support for S28HS02GT. Infineon S28HS02GT is a 2Gb,
multi-chip package, Octal SPI Flash.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index dbf19580c3c3..ae8f9fd766f3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -700,22 +700,23 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
 static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
 	 * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
 	 */
-	if (nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
-		nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
+	if (params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
+		params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
 			SPINOR_OP_CYPRESS_RD_FAST;
 
 	/* This flash is also missing the 4-byte Page Program opcode bit. */
-	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
 				SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
 	/*
 	 * Since xSPI Page Program opcode is backward compatible with
 	 * Legacy SPI, use Legacy SPI opcode there as well.
 	 */
-	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
 				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
 
 	/*
@@ -723,7 +724,11 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 * address bytes needed for Read Status Register command as 0 but the
 	 * actual value for that is 4.
 	 */
-	nor->params->rdsr_addr_nbytes = 4;
+	params->rdsr_addr_nbytes = 4;
+
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (params->size == SZ_256M)
+		params->n_dice = 2;
 
 	return cypress_nor_get_page_size(nor);
 }
@@ -926,6 +931,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
+	{ "s28hs02gt",   INFO(0x345b1c,      0, 0, 0)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
+		.fixups = &s28hx_t_fixups,
+	},
 };
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
