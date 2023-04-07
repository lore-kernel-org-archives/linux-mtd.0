Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCBC76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ld1bkxfLMsvfPKoLy9St95h50l+PN93ar1iXiTU8274=; b=Ov96fqnCmgDhUM
	LzX0aQEK63cPcC9VRWnmsn5sZgHdy8RpI2jPYgsjjTCQIixRTWJKYRsoAxvhWAi4cPdaL7pwsMfBM
	blQZii4gotlYnGqGMtLVoztN31hVHFTeCjfX4eqH85+ZxZFGRK3DXLDC/76AB70mIFZewktD4S74v
	nY6mnxGDbnSa/1GFGPMkrLhVkTvdvWcNuFZu025VdHuRE6MFYF7E/WTRnb+nJPfpQwxFo4y1C6Bbg
	u7S/dgFa9jAJf3LnnqldYPEmymqWbENYGIJ6ypw5id4yXMvnDX2n2s7DqcLLXwPP1BFbqzX5WQeMS
	etwRSgctAf41Ww3Z3rxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfmz-009I4m-1f;
	Fri, 07 Apr 2023 06:41:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfmw-009I3o-35
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so42654002pjb.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBHyCJOU/UP6+q56hd9fFYGkU8/9335UL5tR847cfdc=;
        b=f2qBLfQJOtb+ucffPmizvQGQT93W4zv+16HNK04Jz7oQm5A5lu9cTEQEQPj16uSRzz
         mD4Lsyx+1aIVM0SKvgef2RE3YCx5iFARxlhMzpMxN7fYzWjOg/PIMZVQpE6KOuusLFyb
         +GfvNVgrfrLIvbr1pXz9SveDoqc0guVYYyOLHZI2RiZrSqSx9bR3ORLw5sakjetLV9rv
         dB/PHtAEQyHRJx0n9cR9NvJoCQ5H8eIt+pFwBCpV+upibVy38hMjCgkCJTfv7IV4uDth
         GJTPyEZGDMJ4ohU0esMPmeVsRX1QUdTXrevAPA/sIXh0aOM6tE0Woj6/hpVI8ELxd+nf
         gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBHyCJOU/UP6+q56hd9fFYGkU8/9335UL5tR847cfdc=;
        b=y7u4Vp7z+5c4L9WMxgqw7o2dPxvOOyBYfzIwgGptcGvzZqalX2OJAFeNxPqlWsoGiW
         3iDFh4SlaYHb5+9UFnSZzlYHjb5GwdOBsFga1AHgbdiFS1BjAhjBp9+ym9jXiHswmqyz
         04hVPZ5qSFNHaMfPknwETVnABELc1SQYfcKNWyDX3EZfQeYBtzzNrg9C04wxmDPbb6/O
         s6hBFPjDH4Cqzd9oxPKBpixUEqLbsUM8Nr3S8jn45o0G/dp1Pmt0HuWrvvRuB8QPTQV0
         CJFalk+xH4GinP0jidfuULqdaSm/MdGSqBw9UaGEHvd6rt7PRx2Pwc9EsCn88Die4Rd1
         ZaLw==
X-Gm-Message-State: AAQBX9fHS3V6k//R9fhFeHCYO+JOJSOqO6ndnUChZKabTcRwfpkHaA7x
	UB4tanGbuC25MjLlEt9Gnb8u34G1jqo=
X-Google-Smtp-Source: AKy350YrK8Sr44mfXHYRy08vbPFHiFq16CkcdQCgon2YPAkeQb4Mu9jYn0qNGX3FBmmiecoN0RR/iw==
X-Received: by 2002:a05:6a20:47dc:b0:d6:a0a1:6c6c with SMTP id ey28-20020a056a2047dc00b000d6a0a16c6cmr1984105pzb.8.1680849693309;
        Thu, 06 Apr 2023 23:41:33 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:33 -0700 (PDT)
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
	Bacem.Daassi@infineon.com
Subject: [PATCH v4 2/8] mtd: spi-nor: Allow post_sfdp hook to return errors
Date: Fri,  7 Apr 2023 15:40:58 +0900
Message-Id: <924ab710f128448ec62537cfbb377336e390043c.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234135_000140_27B92B8E 
X-CRM114-Status: GOOD (  15.87  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Multi die flashes like s25hl02gt need to determine the page_size at
run-time by querying a configuration register for each die. Since the
number of dice is determined in an optional SFDP table, SCCR MC, the
page size configuration must be done in the post_sfdp hook. Allow
post_sfdp to return errors, as reading the configuration register might
return errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.h      |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  4 +++-
 drivers/mtd/spi-nor/sfdp.c      | 17 ++++++++++++-----
 drivers/mtd/spi-nor/spansion.c  | 12 +++++++++---
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8cfa82ed06c7..a9e5e091547d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -426,7 +426,7 @@ struct spi_nor_fixups {
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
-	void (*post_sfdp)(struct spi_nor *nor);
+	int (*post_sfdp)(struct spi_nor *nor);
 	void (*late_init)(struct spi_nor *nor);
 };
 
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index a6f080112a51..4b919756a205 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -131,7 +131,7 @@ static void mt35xu512aba_default_init(struct spi_nor *nor)
 	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
 }
 
-static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
+static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/* Set the Fast Read settings. */
 	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
@@ -149,6 +149,8 @@ static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 	 * disable it.
 	 */
 	nor->params->quad_enable = NULL;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups mt35xu512aba_fixups = {
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 69e47c9778a2..e184b67f3c9f 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1260,14 +1260,21 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
  * Used to tweak various flash parameters when information provided by the SFDP
  * tables are wrong.
  */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
+	    nor->manufacturer->fixups->post_sfdp) {
+		ret = nor->manufacturer->fixups->post_sfdp(nor);
+		if (ret)
+			return ret;
+	}
 
 	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
+		return nor->info->fixups->post_sfdp(nor);
+
+	return 0;
 }
 
 /**
@@ -1477,7 +1484,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		}
 	}
 
-	spi_nor_post_sfdp_fixups(nor);
+	err = spi_nor_post_sfdp_fixups(nor);
 exit:
 	kfree(param_headers);
 	return err;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c937f0ac61de..519fdad79a19 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -370,7 +370,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_get_page_size(nor);
 }
 
-static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
+static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
@@ -379,6 +379,8 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
 				SPINOR_OP_PP_1_1_4_4B,
 				SNOR_PROTO_1_1_4);
+
+	return 0;
 }
 
 static void s25fs256t_late_init(struct spi_nor *nor)
@@ -409,7 +411,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_get_page_size(nor);
 }
 
-static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
+static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_erase_type *erase_type =
 					nor->params->erase_map.erase_type;
@@ -431,6 +433,8 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static void s25hx_t_late_init(struct spi_nor *nor)
@@ -463,7 +467,7 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 			cypress_nor_octal_dtr_dis(nor);
 }
 
-static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
+static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
@@ -489,6 +493,8 @@ static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 * actual value for that is 4.
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
+
+	return 0;
 }
 
 static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
