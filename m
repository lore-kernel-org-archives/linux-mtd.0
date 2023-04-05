Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E840C7619A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 06:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zj0X0czonLeBN8rpyvCCHYnz31qt1aZzroVKMbS87rI=; b=cSylTK4XQjKANz
	ndOGEmB7dFV9lGlBTu1kV3460H2dAgkQ8cGhZO1ROpi+gr78c6a4xldKjVxtSlg95AwbYQadGPFCt
	2T5zyj+pJ5YoAzQhrUTV5ErVdeb0n1A2N6exzSV7OFNImCHWE22Ro4FQ6mQEz21cs5NDpDsp8yY+l
	eA57sU3o1dvIaA0qworRQjlz4rWyRrkfUkLc1sPfE62uept4wLhen+d7Yot412n8+aqgZWX3W7bbD
	5f4zvuzNonYMGVOfcYAK3dllINrXn7IgaRvHWginggI6920Y7+LDK/SsfUTv1hejrxxPbbM4ynBaj
	kJ8i1k+IW8P3BiuOKt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwJL-003T1D-0a;
	Wed, 05 Apr 2023 06:07:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwJI-003T0c-27
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 06:07:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id fi11so14874937edb.10
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 23:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680674875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BHxYcSmsdjoKvPYhhFPBgDYaSzif9TBy2RIlw+xR3w=;
        b=ThEh6HAPISb2wLc9Sx4yFvAueYbPTH0h77e0SlM0Z/x3obM29K4FVfmghpQ/SMyyvL
         r9pobgWAxb+4z26PnPCW+YFcnhKkf4LB+TJP8BnbWfzCuDg7CQE+gM5Q9xuRtabb6esz
         AdWu1CKHw4BdiBdDvF9uBYoYA8lZqMjNIfoHJphDzTIpZxQWquJZWiLJJqM++4PkvvFg
         r6huZENycnBrrLBvhPU4fkbF+pAvBKfYNNr2vMaUWp3qMxziZ82zCy2EoDkSiBLevXcn
         NOr3EYp8xBf+JyM59aWHpKYyQbcnGMLJtpbgN1ejyKFxRSvT/Lzs2GDR1De508S2Ywso
         Nthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680674875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BHxYcSmsdjoKvPYhhFPBgDYaSzif9TBy2RIlw+xR3w=;
        b=c6KYROPCBIT2esJvZCSPMpvwocPLEeMgG5b/pS+RjEqbR9ckS1J/yK01Pw8M+v9Ty8
         Vrr4HQ2jd/Q2VbiAxcA4dUj5/z+qWnpeDM6twT17DXkwWni/egbUpIBgLQ+sfDbj8JDu
         kPWEn8gUL1OIXKNUVYPVPHDNK1rGE7xG7lb4CRJxHaKk7U5bgPcuO3+vtPt7Flq+XjdZ
         jf5WO/0E0QHA5y2+kZRsaB+nRk/A5grMUym7HuF5c/FEhb+j6+i+ybGi6R/4xifQjtN+
         a7jMzkWg4QPKT1pJEh+sicolKttBhCScEVHmLUoJp2mTYYoOqsA16OerjdnqdPW/FJMU
         fPow==
X-Gm-Message-State: AAQBX9cAQnbfrhFmKYXRJ66PNb+nSbc8CdTq84/pJO/9x27ABJjqLKV1
	KeQKNZ9I0gAc5ZXlqc70q4SvMg==
X-Google-Smtp-Source: AKy350aXu3R3xsZi/r0NAlh78FPuXCC/tpxJGrVt1VjeZ/eTbD+yktSuM4gqIcQlNgYSAmoxYMUjsQ==
X-Received: by 2002:a17:906:9be0:b0:945:5510:2b9f with SMTP id de32-20020a1709069be000b0094555102b9fmr2106467ejc.54.1680674875179;
        Tue, 04 Apr 2023 23:07:55 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id k26-20020a1709062a5a00b009331450d04esm7019747eje.178.2023.04.04.23.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:07:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	michael@walle.cc
Cc: bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: Allow post_sfdp hook to return errors
Date: Wed,  5 Apr 2023 09:07:51 +0300
Message-Id: <20230405060751.49056-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4909; i=tudor.ambarus@linaro.org; h=from:subject; bh=C7xAwS3xNT+nbz1gYj7adnaTZ3v1W+GxPhefMM7+lHM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkLRA36CpucueVT640rYvuimhI/+AWkhRH1jOqh Ajx6QYUJyeJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZC0QNwAKCRBLVU9HpY0U 6TlWB/wNMDlRKpoLkoAQnGe+b4UDyXMumrV6zV/yKycxjjviTal6z5Bw6pZksVK07xjhdGLIXv9 Fh0EK4rz95UWZE92r122A4thhoaBk2Y2A4z3k6QNNODs88rmvgkmJ0vovdl7SMkwb51jA8hm+KA tG3wMivExk0wIJ8KwncG99YLNmbbev0qxBh5XnCcm0o8CIkxNkF1adza0LXSa724EPrE2KpbZX3 PrYRIUmLx7yG/dxjHiFjjYOnTEg0YdJxOALxl/OEHz4U/1dWl6YUx8/0hcn/P4pkwt7Wf3DKiNo wmfzjh2Mgd6vOLMOPiVQco3aBQOjf+X4LRW4iC0VCDcRgzft
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_230756_700180_22ED01CC 
X-CRM114-Status: GOOD (  15.74  )
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
 drivers/mtd/spi-nor/sfdp.c      | 10 ++++++----
 drivers/mtd/spi-nor/spansion.c  | 12 +++++++++---
 4 files changed, 19 insertions(+), 9 deletions(-)

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
index 69e47c9778a2..e501686a6dc3 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1260,14 +1260,16 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
  * Used to tweak various flash parameters when information provided by the SFDP
  * tables are wrong.
  */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
 	if (nor->manufacturer && nor->manufacturer->fixups &&
 	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
+		return nor->manufacturer->fixups->post_sfdp(nor);
 
 	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
+		return nor->info->fixups->post_sfdp(nor);
+
+	return 0;
 }
 
 /**
@@ -1477,7 +1479,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
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
