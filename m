Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7639FEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwFlSSRDCxxfvTUiUQcFcHiO8+m/gmfYN22ywjABCeA=; b=G/gny02iEZJJWy
	uQ1k3PBaUul/68Uz3WL9g3Nl0w9AKJ1ThS/tDtXiFRziqYOCxu1qwup/uOsRtQCev0OySYLKWSbxw
	nhm/RygxtFaymIsVwNmZnsJ3p76OdQvrv6a1jJikLmLJoJwdZub2NyQxuHVCM0Xt7fHBWbQOh6P6F
	E42WEZyMLUw7w2xo1Z92ltmGDRI0Iu/KALlNNqTHJvL2ePkOK3zR2gO/G8FIgHkkoKM5JWYr1SE8b
	U7YD9xnd6eX/UlrVlvYDpa/bLY4q4ga6fHMPIPrd5erZy4+N3panzuGaT8SWFSdAKtk/yi4OINeLi
	kt895bVFjd7HuEbThtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AS-00GAII-0P;
	Sat, 22 Jul 2023 08:40:48 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AM-00GADu-1V
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9939fbb7191so570946366b.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015241; x=1690620041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVktBm6sJYLsfwDSxkCEMzdAYO9ly2+TwdXhkfjytSk=;
        b=SzThPkjg9NB1hgiSL/XY0aeozTViHtDiMzgk6m8y62uFtX/p8iTCQR2WiRGHgwdNZ3
         E5uPAYH8vgEPDYXktpPM3Eh52K9/7Of30DA2uDeSFQuAkzeaDktdPJF5wiUMbiw/2VoS
         wDRt5123bsdXN22c+stKVzYXlV9vOrmqnTKIteZwRqsHLN4Oh/pHbzohuBqtAN9CFmpj
         cRLU3He8/UgNLOrBlNDT+b4ymtEkkVNQQolRDeYDF5eR+4WvnWbl35R5KaQoi4gBh7r+
         rJywtQgMYAvunDcQHCuWC1389rE2y7ageQitVzUs2NMNabY9YVmi1wr+W0j9jUOHDOfm
         8vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015241; x=1690620041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVktBm6sJYLsfwDSxkCEMzdAYO9ly2+TwdXhkfjytSk=;
        b=fY37MnN4K/Ioq70d9y+ekOG2HKK/Zb2AfAZ926PkKZCfCEFsIhEL9ht8RAMNL4SImP
         2nfS6LlofgD0sKvrW3t1CGkdR9Alv3F5ZLKGRMui0ndt70Icfo4IHbkzPcm5p9xAqcKV
         GFkvzQZLBI8Vi/2+lWMG5wJbwJUjjj6CDwGN9cVfy0owb3SxAdIeRmyCOHggxXbMSmLp
         pVjy8f1aYGC72Y3fmGyomtDbwsQyfm591BC+UABqRasvKa3LiKaO3+A3g+gFcCmyF64D
         a0HIaklpoSZqOGztol3RRm4rscRo9Dc8dgeumeSQ6bwAZ1pwBZaU0zw5rwzLdrbzTz60
         sz4A==
X-Gm-Message-State: ABy/qLb3wwYGzwM8PI1KUTcQqJNwpfuCxTv1UQKNJZj6lluZMVL9N72v
	Ws5vP0r8Q6yfLJsnZ1tGJb3PDA==
X-Google-Smtp-Source: APBJJlHU0CfoCkcOmzfRkFAyT2mQNIckuAtLZFMmLl36+XJaWeiOCFD8H29VITnRkpx8wyrwK/2pBQ==
X-Received: by 2002:a17:907:b10:b0:99b:50ea:2f96 with SMTP id h16-20020a1709070b1000b0099b50ea2f96mr4785505ejl.12.1690015241120;
        Sat, 22 Jul 2023 01:40:41 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:39 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 08/11] mtd: spi-nor: spansion: add support for S28HS02GT
Date: Sat, 22 Jul 2023 11:40:03 +0300
Message-Id: <20230722084004.21857-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496; i=tudor.ambarus@linaro.org; h=from:subject; bh=42jO3KEj6TPMriTkqWSNGWStki92z6JnENZKEl1DzBQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5Xj3DJLbcgDJ/Bnw8XTtxSY3c8EYXmtEi73A UxghPLI3sKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6ZTCCACwegMt4CAnc55Yg1eWhGLbJFiFLIVUd4tS6jNoWZgzrfKuFPaWQsPEDa1HgniljW/UQCP G5x/yw/RVzMTjNiQiSs+ZVF9zvUZodyN/+k5LLIbifTnQGTDuDkCl0QuGPEnj1VBrf34vMIiVd9 lX4UR7CjmURnuqpRGn7mDYbqp19oi72/46pz7xmhTLAQxqeW+k2Q9rz8pdlJ2d8G28Cw6cVzDPu dhaKYLnr+6S8nRZ1se1J5QE4cxVAHBQ8XTM5j2n3Yhim4jZ4f0+EFCjswGaM1HJNzcNVSGCCinI hl5OK7ThJWT8A33V8tvQlNR8WH9SoGDoBzdqtIQBAP7Xs9YH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014042_521217_7CDD614D 
X-CRM114-Status: GOOD (  15.52  )
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
index 2fc3e65686b3..1f2b4a469719 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -695,22 +695,23 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
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
@@ -718,7 +719,11 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
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
@@ -918,6 +923,11 @@ static const struct flash_info spansion_nor_parts[] = {
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
