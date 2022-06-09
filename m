Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF616C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dm0Sm8T9J2+OHI+e/+D4OQ1EKNkmws7Mc6KQUo8eWGA=; b=sypI+QXdGAH13U
	wUakV4VFeL6uW3QG9dmXV+UFEBhfdcATj1gY7LbgvY9/0YZigSe076t7vcb2v4/OHG0VXd4jYe65a
	tsdpYMZ268y24nJDHXqumsts2fzut7+4q4wdIFkVCng/gM64a6Aabmj/EtwcdTH4ZRkqahrW8h4Bj
	HKHhn0MYcQyMNgM0Yclj3FzKn+/kvsUr1GnyqtyqkuSL9ePNF2/3VHUnU3szZmHPbGVFTLPK6tgBS
	sjwRN5q6cN/UaiVTBinX2W9bPdgTtrZsbYx+JKm00MvATGFXw7ce1CxtxtfLghTZImngxqRf4i571
	5Chzk0/tEoT6FTA2OhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE54-000VtI-NC; Thu, 09 Jun 2022 09:03:55 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE17-000Tpx-0x
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id 129so21283447pgc.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VT5Q/jksF/xYptmI4oh4kThSWs4VHnNUSO60srmZnY=;
        b=HBOZjyZdwyoQ82iJAHRTHNQozmAAFNVT+oaUf0FfAZDl3r5WtomsQOgZ0E/O7GdkB0
         lNXYTpA4pDjjEUTDovDJxuw5iwQKq7xGuQ3JzxbILchIfloxzTxZElcjaUiE4W+9JKly
         TofrOTqHCypE9zdB5tCwg6f1aU8ltwBE7P9s8Qz1xeUlchDkLXZXsseC6UjN0rPuOuc6
         sSV4nGt0aUBm7eRBsMHEpBTO5LmwZuzqdjhCcdGCRvp6P6h74EC6LIRdk4TchKE89Zpm
         tKkPKwD68HmnQlRG0s9gjyfIvZ653WYRPxYv6EUlZTIBTDO3BQh8ogMknldDi1yT2Xhz
         ogHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VT5Q/jksF/xYptmI4oh4kThSWs4VHnNUSO60srmZnY=;
        b=1jBKySW0LPwlY1vJ8s4LN55NHBpJGMOVuUNz+loJI4D/0UF//8n9ECP9anceLcsJQb
         gSwgPZWnxa8/PeSo1lxWkPrC1mrnI6Rk+S9SpNMoM9zj29x7JFpOcuOE+eqAmSv/qx0e
         TNoesrfVJQoTMqDnLeINNujs6FQwQ1Mn2Aaefp2Bqxrjrx8zl8ZTm+wS6KcNBOnQhx4/
         BR+F9TcUfaZgFXf02eMxCuCEDYqmtYZo2Dx2daG9MMcau8g9UmaM89nmkQaBEkgwdRcq
         PZKNnG1X1xh8jEquNYpTI+TtQDJB5BfSd0SNG69Zl9RRv1iuEwUTw5B20Af2J2ZOg70C
         gkPw==
X-Gm-Message-State: AOAM532hxa947Z+GdXZWqgWz8OGxe9nTb781ReTNDfvmbKKoLxJPrnS8
	yts01EK6wAXzFfuZ4K2CTKYHXRm1DLs=
X-Google-Smtp-Source: ABdhPJw6EFT+nfcH744ZqwsFrG8WkAK/QPi/mcFhlFQ2wwJo/XUtl53H5fzHeTu4wgtk8W/OyZD91A==
X-Received: by 2002:a05:6a00:842:b0:51b:f289:7354 with SMTP id q2-20020a056a00084200b0051bf2897354mr27640899pfk.75.1654765187920;
        Thu, 09 Jun 2022 01:59:47 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:47 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 3/8] mtd: spi-nor: Do not change nor->addr_nbytes at SFDP  parsing time
Date: Thu,  9 Jun 2022 17:57:40 +0900
Message-Id: <af4b054714bbed2eba25b0a4d8a53a2811f1485a.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015949_132324_1948EE2C 
X-CRM114-Status: GOOD (  18.58  )
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

At the SFDP parsing time we should not change members of struct spi_nor,
but instead fill members of struct spi_nor_flash_parameters which could
later on be used by callers. The caller will then decide if SFDP params
should be used and more importantly when they should be used. Clean the
code flow and don't initialize nor->addr_nbytes at SFDP parsing time.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v16:
  - Stop restoring nor->addr_nbytes to uninitialized state

 drivers/mtd/spi-nor/core.c | 5 ++---
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/issi.c | 2 +-
 drivers/mtd/spi-nor/sfdp.c | 8 ++++----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 14b6b1f38b69..70a9570fc2d4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2251,8 +2251,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->addr_nbytes) {
-		/* already configured from SFDP */
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
@@ -2497,7 +2497,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5eff3f636416..972e54ecfda9 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -340,6 +340,7 @@ struct spi_nor_otp {
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @addr_nbytes:	number of address bytes to send.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -372,6 +373,7 @@ struct spi_nor_flash_parameter {
 	u64				size;
 	u32				writesize;
 	u32				page_size;
+	u8				addr_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
 
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 23e331cc42a9..4d44f2510889 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -20,7 +20,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
-		nor->addr_nbytes = 4;
+		nor->params->addr_nbytes = 4;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 61ae8c8c5237..3a48173a2d78 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
 	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
-		nor->addr_nbytes = 3;
+		params->addr_nbytes = 3;
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
-		nor->addr_nbytes = 4;
+		params->addr_nbytes = 4;
 		break;
 
 	default:
@@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_nbytes;
+		return nor->params->addr_nbytes;
 	}
 }
 
@@ -1098,7 +1098,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	nor->addr_nbytes = 4;
+	params->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
