Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DEBC001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwFlSSRDCxxfvTUiUQcFcHiO8+m/gmfYN22ywjABCeA=; b=bMmWhZJA/5uDaR
	mi+sGk7IgXISft3cQuJkXbx/GO6P4HE0ospRgQ+/ZatGPyyQ9U6jTveF81LLVqFlGz+SyK/W5p4hI
	zOnEJkYzWYfS4Ae5uY05eWshysHGfrTEg/rjlcUZVS3LqA0hOBYhhJ+UyuEofH7pqk5SYQOeEPGsc
	A53Xeec92viKmcXFrH7G0Vfm1ne/Wy/hcI/bqFBMPcCFz7bf+5spJI8pWqznNHCFaSBgn2wuuk7hS
	fCU15+DZedw8hS69m9wxbdPwhvRK9qGytKYxUQo8zXtqG4f32BdrF4C/gMB2Vkw25hBTgQ/Z7FpSR
	bM3BkTpt6pTpaLg/VsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh1-003CXU-03;
	Mon, 24 Jul 2023 08:13:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgu-003CS0-0q
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:22 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5221cf2bb8cso2773613a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186395; x=1690791195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVktBm6sJYLsfwDSxkCEMzdAYO9ly2+TwdXhkfjytSk=;
        b=sGq3JK8o46jSpuHPepL1m9b3U5faB2dCmQuUcMqsm9ZY4m0Kx5d+MkS9CbuncxZBBn
         rGfVVPh8hI0m4aVPpAmW2Wbn8m23gJpTLuhy15OY3vjJ6KbQCQcvhrtJ6S1B3O8/Q+P5
         U7YGLc97db1/5/vcvlEnZwP+D1wE/w2p6OB6WzjZDzW9n7WrXUCOm0uta40++euYzURw
         t63Io3sgEOMT3SvyYwcQyrs/x7r15XHfvTWJU9F0OIoNSAg+yY6DzfBacrXnNdmJ4zwq
         harQtGHM/ptRmIA2c2eAuWwqOUKoRP7Ss1+hrYIS5dPsTwCVif7mOqKsiUb62+cGsBMr
         TyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186395; x=1690791195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVktBm6sJYLsfwDSxkCEMzdAYO9ly2+TwdXhkfjytSk=;
        b=eWfgRUUy3KkaWz78utAPNq8L+EghkMD47KbJsyFSEMWG6CcujfVGZnIM5NpePhXEpz
         gLPtuqgFo3lkmc0j7uMgi+D+45E450IftwhZRz9vBwhLHLQb886PV7E1HYJNT7xxJbaj
         FuBB/7NifAUKCOxpQBt2rr1IfiArxPOzX32Gm9/vWgGbJHsMdFPj2LuTg3oTYqCxz1ds
         BDc65i23FVm9WQfSoMIGBNjM5RKzF7tarYdNYjoYaKFRImqY69qCD0H/IEfZKKRQ2Pwv
         Z2E+5Ev/vrC7VMEpuWojjbjls97JHna8oBjYap8DC5cjZpGBeDwOxY5JLf6ScngvDZ5J
         f+Hw==
X-Gm-Message-State: ABy/qLZWEymWgtilgYe2UM8SUPSlAfkt24APcZq0t3F1vh4ZXlDGLC5I
	UNoTxInCaXiWtRuTYOe4MZtyBQ==
X-Google-Smtp-Source: APBJJlExAx+HV8ZAaCKyf2Qp7rDblH1XsgOcs5UU9eKDTe7YZDFVoX9leKmqYV0UXmOvE0Zl0WliSA==
X-Received: by 2002:a17:907:2e0d:b0:969:93f2:259a with SMTP id ig13-20020a1709072e0d00b0096993f2259amr9076158ejc.73.1690186395027;
        Mon, 24 Jul 2023 01:13:15 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:12 -0700 (PDT)
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
Subject: [RESEND PATCH v3 08/11] mtd: spi-nor: spansion: add support for S28HS02GT
Date: Mon, 24 Jul 2023 11:12:44 +0300
Message-Id: <20230724081247.4779-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496; i=tudor.ambarus@linaro.org; h=from:subject; bh=42jO3KEj6TPMriTkqWSNGWStki92z6JnENZKEl1DzBQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+3DJLbcgDJ/Bnw8XTtxSY3c8EYXmtEi73A UxghPLI3sKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6W47CACKy1GhVpCclmoAAJYiRpqVPkMcBm58dTZrbpSQ5BzjyW3k/+/u9kNK8cbHzDLP2GFtUIe B+U/vNTce/C7jYROWAfo+DveIyQBzf/T26CrY097wYMKT6LihvmSvt/3PRYwsjfiIPGTXZupjgF bNF32zD1zZc8NVPhzqu1gxy6Lqi589iq/QWaE/CqJn3B8Wo9BeZR2FzusgZWsr+EwOLfNRH/00j riPSj2Cq2coFjjLjbaQhG7ncvxO+4cF9pClsBfFx6p1zgF8h5/Yl2wAT9RemB0IletkvaYy/tLu peI+CFd1c+a5LB2PrVL9YVNtmOcL7az/G8a3N0bikC85dz9j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011316_353975_BE0B33DB 
X-CRM114-Status: GOOD (  16.16  )
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
