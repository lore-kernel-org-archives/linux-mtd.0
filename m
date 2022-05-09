Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD7AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4soBzv9TnB89ZiBtlWE30Vf7tWcrbe+KXrrnZYBFLkA=; b=Ji+NPW1hBks4Pr
	BCQQopUdJI20Sv/C1KYEeZ5fxOBLNQHKK56I9JkJeEVTrkeiutaN+vf+g8YntypY2uM2dqmUEHdAJ
	9VFZuCxTW/jIyNT9kGcl19HRM+nZa6fOB8EKDp/lseX/WsWQGzaNZUYold6SYrF666VEHUpHUjahp
	JyBNJFPZGEpPTrtPvrHR9EyXIJ18/W9jsBXjQHFyt5Mu7kELtpykWwZb+XKhbReSPbICupJ5vtl1o
	RfUIzwcN6EuSE3Fl38JmTM36MAzdz9SXd1/sztlsN9MP+EVrJ/svjA4TmIKKDs1ltCXCm5vvGqcUG
	9F+fT7ap7Pff7MMLILEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBac-00GVbf-JE; Mon, 09 May 2022 22:10:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaW-00GVYm-G4
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id i1so15129908plg.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7HKKBFOcD4MUwoJ4y1a6WCtfS1tCYpkpKK9VvMZzuIA=;
 b=JeUDau7li5Yy/KWv5XyNvPcGwzQWp9sxYQ7BL0fJ36JHkzncmMUkIdZMp7X0NfN90T
 m7LiVoDjuwkGrxp+Ddiz9RwzxLCIkKyIucHbDCVoQTvsgRKLe9VtzcX/N0VbqQJ45yse
 7gDCE8emUud0H8kyctPYT5EwghS6IpvxTDf8flrFeb93dkBrrcM1j/kJlL0CSF4Efban
 4OdC66k8hETndiMq4yjC5cOuzLH2hj+SjudMVAISiBTcpSWo0VoWc+ggkHeJlUhSKhSi
 97g9Av6ViKBG6e+KRDdknBZiOjukpw91R+mhszKvFY9MEOIXw5vaWGySUcC6x7ktrICx
 m06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7HKKBFOcD4MUwoJ4y1a6WCtfS1tCYpkpKK9VvMZzuIA=;
 b=3pz0Jeu2CR7XXAue3d38sXu1t50ttpGJmaozQYQ3S2KDNt+qSxeJS62AMRhkyuQI0R
 LSRqUw95EdqN8x+Lnyo4rlNGdxhOUVL+byr9NG9DaNxSN7mtYsMLh2zvdrmLqdOwzWaB
 hYfxx+Dcxh/CFFSh/QmWh9hOwt6DyhAQYMK/DiqtFyr7kCsWXvLAyfZjbQZS5rW3xIa9
 EJ2/zi2IW0LWmFfHFXlS8SGIxNLoQJbBLSzaqxd7VAQWhOGUNeo9KV4gG1OhwVAhq6XI
 EnBSLeevZpmeNvp9bCEh2zcGzXIdkNNnHfQeP5oaUWAvfdlhO1AJ67Cioq9YiukaBNDD
 JW8g==
X-Gm-Message-State: AOAM532BQRuQujfISfzLEmwNPU8eEiNejz4ozo1E3A4HqTEQLChiTpoj
 jzF8p54nrM88gwKcqsnxHSO2yx4m4sg=
X-Google-Smtp-Source: ABdhPJwonpV8P7eRl8+gQYLEQIUtiIvi6433VEA3OGYgzkT6BFer5QHnqU9FM6/MyGhLbybeSwQaOw==
X-Received: by 2002:a17:902:ec88:b0:15e:c17d:b092 with SMTP id
 x8-20020a170902ec8800b0015ec17db092mr18084594plg.88.1652134243101; 
 Mon, 09 May 2022 15:10:43 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:42 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at SFDP
 parsing time
Date: Tue, 10 May 2022 07:10:05 +0900
Message-Id: <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151044_581414_ECD34481 
X-CRM114-Status: GOOD (  19.22  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

At the SFDP parsing time we should not change members of struct spi_nor,
but instead fill members of struct spi_nor_flash_parameters which could
leter on be used by callers. The caller will then decide if SFDP params
should be used and more importantly when they should be used. Clean the
code flow and don't initialize nor->addr_nbytes at SFDP parsing time.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c |  5 ++---
 drivers/mtd/spi-nor/core.h |  2 ++
 drivers/mtd/spi-nor/sfdp.c | 18 ++++++------------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7db6b41d7c30..dd71deba9f11 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2272,8 +2272,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->addr_nbytes) {
-		/* already configured from SFDP */
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
@@ -2518,7 +2518,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index fe7683fe1b4d..41df8bc8e008 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -345,6 +345,7 @@ struct spi_nor_otp {
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @addr_nbytes:	number of address bytes to send.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -377,6 +378,7 @@ struct spi_nor_flash_parameter {
 	u64				size;
 	u32				writesize;
 	u32				page_size;
+	u8				addr_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 058ce218d2af..90d7c25f7281 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -178,19 +178,16 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 			     size_t len, void *buf)
 {
-	u8 addr_nbytes;
 	int ret;
 
-	addr_nbytes = nor->addr_nbytes;
-
 	nor->read_opcode = SPINOR_OP_RDSFDP;
 	nor->addr_nbytes = 3;
 	nor->read_dummy = 8;
 
 	ret = spi_nor_read_raw(nor, addr, len, buf);
 
-	nor->addr_nbytes = addr_nbytes;
 	/* Restore setup to its uninitialized state. */
+	nor->addr_nbytes = 0;
 	nor->read_opcode = 0;
 	nor->read_dummy = 0;
 
@@ -461,11 +458,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
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
@@ -652,7 +649,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_nbytes;
+		return nor->params->addr_nbytes;
 	}
 }
 
@@ -689,7 +686,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	u32 addr;
 	int err;
 	u8 i;
-	u8 addr_nbytes;
 	u8 read_data_mask, map_id;
 
 	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
@@ -697,8 +693,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	addr_nbytes = nor->addr_nbytes;
-
 	map_id = 0;
 	/* Determine if there are any optional Detection Command Descriptors */
 	for (i = 0; i < smpt_len; i += 2) {
@@ -753,8 +747,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	/* fall through */
 out:
 	kfree(buf);
-	nor->addr_nbytes = addr_nbytes;
 	/* Restore setup to its uninitialized state. */
+	nor->addr_nbytes = 0;
 	nor->read_dummy = 0;
 	nor->read_opcode = 0;
 	return ret;
@@ -1096,7 +1090,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
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
