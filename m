Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29ECC83F05
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fT86+SLTwXA5STEPHi0Xrpo2cHTXm0bCwokjJtlCrM=; b=SSu73iBZIxDwkI
	45DNWiNm6a+kF1JUkmSAqNbu2ioPJRPXCLnE4qLg4CnfSdvtVX5apHTWcDq64iU4of15+cGMIcLCQ
	iQnHh87gRta4hHNutLuHeJCDxE2EaaOu93sZ1VPXCs2suv7sMp5u+P/fzf5kEQ8FTzKxSckqIy/vz
	5QpAR9i4onIjFIPTEpDVJbY/XD7nVBbtBBBcJjP8PE/tJueOF45kIJbAiTfeQBCFSGuH+86zshGwF
	WZvAEqXQkzMHMFvY2T5bqb49awjWyy2qOE6dU7Qja58o2KrmhhPlCF+SgompQSe2gAD5fHrzLObzM
	6nVjs4shVIzuV8ZLgQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxrl-00000008WpI-0xzZ;
	Wed, 02 Jul 2025 13:51:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwgq-00000008Kv9-1I6t
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 12:35:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2952623f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751459751; x=1752064551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cttIotqovrBsQ31YR3P9K0wovGk5FKC/4AwOXY6ILWA=;
        b=cB5RQ7oKS0DgVt+B2cn8mbMFqpFAkjKKa1Okhk9Xndb0PJejnkym8XrkR/g3jsPy8X
         xNPy1fHJYoC9bhVHcUH9sl0Ln9MaCk4KrlakcGxPZmjW3vcoQG+zF4+8RVmX5cTxvENH
         aEPt5htRJ7jiaHDObDJgSVWnTeMnOFLnjanpjFENRVfo9fmQjn2iUba04T7Lng/qPCzK
         mdc1p9Qh2KpLZ4L1KjdrzA9qe7NRd9o9SFYxrZcoRdFMBy7ociVWaigMjuad5bDw5XhT
         UmoDK/UtDhYI8csyDy1CenEhwks9nr7VMfdLqcw02GyAPqckfxXb4G59ocecnczyFLKq
         YdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459751; x=1752064551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cttIotqovrBsQ31YR3P9K0wovGk5FKC/4AwOXY6ILWA=;
        b=nq+l9U1EzAkOQaVj7ICZkCQPleygLCRI5rFO14I6iQlN/Zr75D7y/EjBK745d/uiw8
         69aEu7vOe6CjtbXT1f1+ibUanMXs/XBeD8acI0z9deQaIL2JtZlzH55CGn3+zOKoWHqJ
         sAkQKjaO5hYCyiWY8pQJ2Rz/02KK+uMH0jjG8Ra+O52RsqzMf1okZj54aVLUezLOGugJ
         aoM/LkrTryRQ9rJE9oJM0wUlqNOkNrjKYvzOBjWs8KHQ0G6TlOlucGRXGG8Rk5FVLhQZ
         RalD6P+Ib50gMqT9PzDZ4HrAd8H/nyXi3TVVQmlPxUHvwnRE9jJNjMvlA7nbr0K6wVzH
         v8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4hDVTqNtUmgptZSLz8d/O59345MYkXxuPMURCE2i9smjkGeVFJOGIZsWM03pAUUrnBkYOWLOwa5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWZwcujxLCkC0S6hdHfsBKlh+1Oqqu/iHulq+JOXNW6ZuPoW0r
	sWp8UqWB+Pd0eTCFGUrYn+gvenTq0/KDt4oT0duT5b71TT0EutjYOFAy
X-Gm-Gg: ASbGnct/Hmi8EX94ZdTXGBlD/BN+QMKVbChz+dn3zWqlXcVMBUtVx7/HyPox91SIFJ8
	puJt4SZMtXN9881Kjski9WHOaSInnDeuWxPIBr1cS8JISswldhpO0Zf5xmI251uTtAA0ZvQ1tKh
	taPKIuHaUXMOFTxATJYEgBV/FoLGTX4OvVU+JJU1VEvK9NOZGNbdfiXRjKgB+4rH/WA/5Ts1FnZ
	BvLkADojmqfrkCB+6rRwo5hfJTqcQI32GpQcov5KyiqKdCasWKq7lNHgE7cyGv+g/SUzwHu3/Ea
	junqNowHtdYui7FMj7XcaSAXmSDCSKK70ucpgDhSDkdjeQUop+RmuW/eR5tMT1UneGIMqG+aiYw
	Uyzw4xR32dbQFigY=
X-Google-Smtp-Source: AGHT+IGR/3U2PrV0fZwpL++zLcvwjw8uCr43X0znjDNfx3e1SB2u86cqFDFQ4duQb8GFpcH12OUDaA==
X-Received: by 2002:a5d:5f56:0:b0:3a4:edf5:b952 with SMTP id ffacd0b85a97d-3b20095d1e3mr1845002f8f.36.1751459750630;
        Wed, 02 Jul 2025 05:35:50 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8a0sm16208688f8f.96.2025.07.02.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:35:50 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 02 Jul 2025 14:35:23 +0200
Subject: [PATCH v2 1/2] mtd: nand: qpic-common: add defines for ECC_MODE
 values
MIME-Version: 1.0
Message-Id: <20250702-qpic-snand-8bit-ecc-v2-1-ae2c17a30bb7@gmail.com>
References: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
In-Reply-To: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_053552_352274_3069780A 
X-CRM114-Status: GOOD (  17.34  )
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

Add defines for the values of the ECC_MODE field of the NAND_DEV0_ECC_CFG
register and change both the 'qcom-nandc' and 'spi-qpic-snand' drivers to
use those instead of magic numbers.

No functional changes. This is in preparation for adding 8 bit ECC strength
support for the 'spi-qpic-snand' driver.

Reviewed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - rebase on tip of spi/for-6.17
  - add 'Reviewed-by' tag from Alam
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 6 +++---
 drivers/spi/spi-qpic-snand.c         | 2 +-
 include/linux/mtd/nand-qpic-common.h | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1003cf118c01b8403c9a0f275f7fa1ba2ba597d6..4dd6f1a4e797857471ea57386dfed715f5b3019d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1379,7 +1379,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int cwperpage, bad_block_byte, ret;
 	bool wide_bus;
-	int ecc_mode = 1;
+	int ecc_mode = ECC_MODE_8BIT;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
@@ -1400,7 +1400,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	if (ecc->strength >= 8) {
 		/* 8 bit ECC defaults to BCH ECC on all platforms */
 		host->bch_enabled = true;
-		ecc_mode = 1;
+		ecc_mode = ECC_MODE_8BIT;
 
 		if (wide_bus) {
 			host->ecc_bytes_hw = 14;
@@ -1420,7 +1420,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 		if (nandc->props->ecc_modes & ECC_BCH_4BIT) {
 			/* BCH */
 			host->bch_enabled = true;
-			ecc_mode = 0;
+			ecc_mode = ECC_MODE_4BIT;
 
 			if (wide_bus) {
 				host->ecc_bytes_hw = 8;
diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index ca55f9bcd17b4556ffd413c11d6d5aa900c67f85..7219bcaf4055aaa46ee1016ca9bc77aaeef191e4 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -343,7 +343,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 			       FIELD_PREP(ECC_SW_RESET, 0) |
 			       FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, ecc_cfg->cw_data) |
 			       FIELD_PREP(ECC_FORCE_CLK_OPEN, 1) |
-			       FIELD_PREP(ECC_MODE_MASK, 0) |
+			       FIELD_PREP(ECC_MODE_MASK, ECC_MODE_4BIT) |
 			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
 
 	ecc_cfg->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8462deda6dbf61f99bbcb39e7cb12cdf66898fd..0d944db363cd249ad13cabcd6d0e1b4c7bc81d92 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -101,6 +101,8 @@
 #define	ECC_SW_RESET			BIT(1)
 #define	ECC_MODE			4
 #define	ECC_MODE_MASK			GENMASK(5, 4)
+#define	ECC_MODE_4BIT			0
+#define	ECC_MODE_8BIT			1
 #define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
 #define	ECC_NUM_DATA_BYTES		16

-- 
2.50.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
