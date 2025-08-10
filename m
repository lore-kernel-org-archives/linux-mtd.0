Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84CC87FDA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ds1B5RAOnMAxY1kFsHVSXdfgjIcvDYxSi9bh0xoq4/k=; b=bx9P7O3LgB7mxv
	zbiFJH+R/+QMlz+RNWGRm2FoV3cxTeTy3VeeqVgSNMY9RUwz1EM8GrtAi5w+aJXPtM75g69SkP7wb
	ocWE38mvnLh9wXtYI2iiZqwORCkUwkp/OUoP+CCw3oGog30c1ZKoyvdf1bYKGaHygK0MLDPMDc8xY
	fnGRWxb+vPy9EzOeLp3Mw8t0Ld1i236yS21FKFQFcUuiRy0T8VggBMQfODIQTRrO91CEmEHXKKuI7
	InCXxOE2mDs6I0GTbD/lDqpnVgl2P/Cl3pCKhGWXxzt9no1+cT0N7LV9QeZLU0taQCxMubBTMF3gJ
	Pk512CHzBru2aLqJs3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Cl-00000005hj2-0Olz;
	Sun, 10 Aug 2025 14:39:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Ci-00000005hhp-0bWM
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 14:39:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-458bece40fcso18006735e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754836758; x=1755441558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcmxIpPYdCpfPFBt8uKF7gd7DS2ROw7aJi4hs4RfP1Y=;
        b=VLAG6pHIj0Df8rKRUBIRbacoxuDcITWBR1LAzkx4SnbsxUDnNiWeR9jtBxlz5XdG5N
         TjOCiJHteHPN2b/2YcTBySqoIxoI3IETxDN2F2GdHsbhZI/y70q1d1KxS6YKlEM3UCd9
         /OO1sPBV1HX/AB5rwDi2a8r0ynuBB+6Vu7ZXVtyxveJcBqHWXDNq8Yuj9VywD378Ngob
         6jdVwKMIJZERLHji8hex89yMYtjpj+bVJPrRW8NJhQfM1/dvWDauV0RCRQMoKp3FJCU7
         IYB+szDD1sJ157ObeDm2ef0pHD1r/tLn9Gu28W4NUMQf1vqpnWrYg/BYEXKe5l5krjXC
         1bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754836758; x=1755441558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcmxIpPYdCpfPFBt8uKF7gd7DS2ROw7aJi4hs4RfP1Y=;
        b=DWWEDiLdnwFWgjy+CpIRoIGXVSgtGADrVU99p4eDV/E0CxGBPNvA8U2l71E9KyUpqi
         Yfn+aBa05ObiKvCXtQ70lFMbz+1ATghCzua5Hy+ATQEs2iKtDqljodgpfPbvXEgC62Bu
         peYxOKajHcoumslNiRhdV1pn7ivjqSKK8AIF4Vj09JD7QFcf2SH+ccjxT4pFc2ggTBOY
         ByjF2AlpEugBfkbfeZiHO/ET91LilSJdTmXLJ1/9x/HZT1nWG5smNvu/FjVY2Fwpw6R8
         HIXG2rJ65YB2mWe2IOJ82pMpXbtnEhcMRPFhcdPuJjoIeuuP7oI9GQJMNd6ZryM9cOqC
         SAQw==
X-Forwarded-Encrypted: i=1; AJvYcCWti1r4OxLvOhX9F704q8gC8tveJQtLFhAQAabIhSZtAa5dQL6dpqp/qU8ghNZZAj8584xIRWJ2v4w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIjyD5myBWsdx6sfYPmF9N9gepmRWfLcjH1/apd1COUkiZB+B5
	nKYYwOEJmyKTHID/TtN5d6bH3JsdIq6odVjY58pK3CqYouwGdHEQ3M2F6eqELA==
X-Gm-Gg: ASbGncse+muok7S0m9xfTe2VQqR3XpewOFYL6E/1VLk656VMefVxuOyl9mZlaSgEP6T
	HvHeghFdKqqyjrC0/IG8gEmu55+0LgePwzmQo++kbIJW1WmOyiBVMxFjV8yJR0TsG3Mmf7Dt6yr
	k4YTiFF7Miuv+u9+ugHxT3VL9gNPzs1jI6ogqSdwquo9lYSQcK077hfo5XZZ+igW6+0jGB3LxkY
	F8xyTGDPvoGbLfNSY7TYJWVJAn9GdbsHWnOkKj6Utd1/qmn5V9FxDT9JHyqUxWNcv69qSm6g3oy
	ViED3JiDc4mU2Pv+ljKncJWcfTa+iTXY6WXPgcrUnufkDqixm0O3l1LHCFJnWuN9jKx2jNIlSoK
	4hqvAS6WuEjHgzmB3C4OiMocKOJnX20ab/ihUtziDMjXi22SBwV8=
X-Google-Smtp-Source: AGHT+IGnnqxXALeugOVFPoFTxC2pIiR+d5jk8lpEovJ2tb6XVsxkdrVtmSfFxdJSHhTjsHQA9RZzsQ==
X-Received: by 2002:a05:600c:3b87:b0:459:db80:c2d0 with SMTP id 5b1f17b1804b1-45a0a90d9cbmr42735e9.7.1754836758214;
        Sun, 10 Aug 2025 07:39:18 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459dbba5210sm287721715e9.2.2025.08.10.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 07:39:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 10 Aug 2025 16:38:51 +0200
Subject: [PATCH 2/2] spi: spi-qpic-snand: remove 'clr*status' members of
 struct 'qpic_ecc'
MIME-Version: 1.0
Message-Id: <20250810-qpic-snand-qpic_ecc-cleanup-v1-2-33a6b2bcbc67@gmail.com>
References: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
In-Reply-To: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_073920_210570_D1CCF556 
X-CRM114-Status: GOOD (  12.48  )
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

In the qcom_spi_ecc_init_ctx_pipelined() function, the 'clrflashstatus'
and the 'clrreadstatus' members of the ECC context gets initialized with
constant values. Then these values are used by several functions to set
the corresponding members in the register cache.

Because the values are never modified, change the code to set the those
directly in the register cache by the qcom_spi_ecc_init_ctx_pipelined()
function, and remove the repetitive code from the other functions to
reduce code duplication.

Also, remove the respective members from the 'qpic_ecc' structure as
those became unused due to the change.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index bc2158e560be3b0ab1b26882e4de524ecf662d14..01f16f49d4cafa608373a176cd1bd88bd00d2a99 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -94,8 +94,6 @@ struct qpic_ecc {
 	u32 cfg1_raw;
 	u32 ecc_buf_cfg;
 	u32 ecc_bch_cfg;
-	u32 clrflashstatus;
-	u32 clrreadstatus;
 	bool bch_enabled;
 };
 
@@ -381,12 +379,12 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
 
 	ecc_cfg->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
-	ecc_cfg->clrflashstatus = FS_READY_BSY_N;
-	ecc_cfg->clrreadstatus = 0xc0;
 
 	conf->step_size = ecc_cfg->step_size;
 	conf->strength = ecc_cfg->strength;
 
+	snandc->regs->clrflashstatus = cpu_to_le32(FS_READY_BSY_N);
+	snandc->regs->clrreadstatus = cpu_to_le32(0xc0);
 	snandc->regs->erased_cw_detect_cfg_clr = cpu_to_le32(CLR_ERASED_PAGE_DET);
 	snandc->regs->erased_cw_detect_cfg_set = cpu_to_le32(SET_ERASED_PAGE_DET);
 
@@ -598,8 +596,6 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->clrflashstatus = cpu_to_le32(ecc_cfg->clrflashstatus);
-	snandc->regs->clrreadstatus = cpu_to_le32(ecc_cfg->clrreadstatus);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, num_cw - 1, 0, 0, ecc_cfg->cw_size, 1);
@@ -733,8 +729,6 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->clrflashstatus = cpu_to_le32(ecc_cfg->clrflashstatus);
-	snandc->regs->clrreadstatus = cpu_to_le32(ecc_cfg->clrreadstatus);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, raw_cw, 0, 0, ecc_cfg->cw_size, 1);
@@ -849,8 +843,6 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->clrflashstatus = cpu_to_le32(ecc_cfg->clrflashstatus);
-	snandc->regs->clrreadstatus = cpu_to_le32(ecc_cfg->clrreadstatus);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
@@ -942,8 +934,6 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->clrflashstatus = cpu_to_le32(ecc_cfg->clrflashstatus);
-	snandc->regs->clrreadstatus = cpu_to_le32(ecc_cfg->clrreadstatus);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
@@ -1063,8 +1053,6 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
 	snandc->regs->cfg1 = cpu_to_le32(cfg1);
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
-	snandc->regs->clrflashstatus = cpu_to_le32(ecc_cfg->clrflashstatus);
-	snandc->regs->clrreadstatus = cpu_to_le32(ecc_cfg->clrreadstatus);
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_config_page_write(snandc);

-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
