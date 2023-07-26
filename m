Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C26C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+qaVQxtzmb8yOd/cHc8ieG8KlnnzXTPqS16amdJSlU=; b=wK7gR/Kk/xWl3u
	xW27zKKiNtzq5ousvQLgBehMkSHFccEq5/8T5sdxL7otgCVWxkt5WaVmCQTsYFU2xH/ayNLIhGA6h
	kuIVT/+9v93q8E6BihyKztmIbds7VIICP8jtLutbtyXlDYC8PQkcxn7IhO/lKe+a6/NicKntznaAu
	wpAOASulDbMfnC6fLsBgqfgXXG1WT7odgWealVvUwRD15bd6aK+vMrmU21L6nGA7v2hOwje3myH1v
	ZIR+Ii7fGfWjZMHvR6nOYUOJ8lPEa9vv320if9CI/NsgSAg/isO0Gj/9CLIUIUzUaLkU963pBXvGp
	/EHUhZ9fB7lWllXDaqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKn-009V6f-0s;
	Wed, 26 Jul 2023 07:53:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKh-009Uya-0X
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fde57684d7so20785875e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357994; x=1690962794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRwCsCVO3o3aM9vhw4WDE//m6gXQY0sVfiQwqyQBByI=;
        b=YXxVeyvyh2kk+2npRszeRvUdhL2tu2M+9pz5dYrvUt3W7dIX7I+BLUZ2D6DZh58eAu
         X+byLqf53pdHS5MUQgXg87+w48KYO4dt5Io4LhL/u15dIYbx0bNXkFbL0rpmN+VkQ9U4
         2Iw6dUen4pZA4/SM/xIvBvo2CAmeCAjQyRKtrY7in5jHPob2qD6w6hD9r0qINF9Fv12Y
         ygV6Yq3Kl5Ow1+T2WcoZ3C4641u0Z7qls+13hZjZ9VuQZFjv1Z9/zh3j0J4CQVXHvabc
         zreB7HebJ/y5/5aDBV0KbOqX/1ObTYS7lcuC/z8USf9h71Js4kSGYKiR4H0zr6j8izYa
         yKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357994; x=1690962794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRwCsCVO3o3aM9vhw4WDE//m6gXQY0sVfiQwqyQBByI=;
        b=iqRC23iMZegQjbHUtW71vhXCQM4w7OGyG+iHCK2ZM73KudDd7k/rmpv1DSjKXX/t/q
         CMJhU1Y0lsbPScv+Q5g2UUp36/hk0YOsNg9ewx23Hwlw2GPMiWqWPs47XHXTPX2ywQyk
         idXfQvUiRgo3BEqvF2egAXlcNvniK2ManzDusrzWiix45nACA/fHEqhyaES737J1U4UV
         rYA+4PulnjcsfZOjLm6FQldPJSpwgA9XQ/ttlJLVmVrYYb6jvElCJ0NOw3fBnViHGoVs
         DGumWJAov6GwkdsiEE3zYhsgbuEbCUhJk64JOqdzD2SgLmhv8iadQe3S8FwWgsk8HPb5
         n7sw==
X-Gm-Message-State: ABy/qLazU1sksLgFjftns6z+eqTKTdqWf485Qy9QNEOgBYXDL24Pw7Aw
	7cDK9zZRLJN9b6sq1v7bCtJGWg==
X-Google-Smtp-Source: APBJJlF8IgGEtSvq2AwcZD4JVeCePRGhSZj99SgDX4tKedd8NAOTK9iVdemTe03ZncVNXZe13rGCeg==
X-Received: by 2002:a1c:ed04:0:b0:3fc:586:ccb4 with SMTP id l4-20020a1ced04000000b003fc0586ccb4mr759069wmh.36.1690357994753;
        Wed, 26 Jul 2023 00:53:14 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:14 -0700 (PDT)
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
Subject: [PATCH v4 08/11] mtd: spi-nor: spansion: add support for S28HS02GT
Date: Wed, 26 Jul 2023 10:52:54 +0300
Message-Id: <20230726075257.12985-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496; i=tudor.ambarus@linaro.org; h=from:subject; bh=BGQp+yPvPvQ1vo1DVawT4hLAY/tUideX2TLncpyul4o=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYcqZvVLq6lYHgbxnZoNm+XYaMiaT00ViYF o/ZctOKx1OJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6fxICACCwpHJXaHk90+tNOaqFRWA3xj6/36wYT8q1V+U0IXxgHz3ON+5UrMyETEx/KPSHVUDGKm IH/lUMAlKmLTGB4j6OGN+DAS3EHu/kULd7bJo8sBWoj2D7hPLZPMXEdUPRjeiH0HsXNcrmJTx9Q AbPodOoikjjeHmXbjn6BoZvIX96vkZLVgFOeeKniSmXkaK07uOKfj/7qujbGHBeTBa7SstGLZp9 QZ25iwAnT8q1uIswcAh6zLM2clJ6H+p58W59v4Lc7nL5grhRDT7ptZsQRi339j9sp0djHUx1p9k r0iKd8kyL/3iAYvK9KoiZVPvroW0kyDpZOqHUrfdALB6l28k
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005319_206798_8F20A38F 
X-CRM114-Status: GOOD (  16.74  )
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
index d7aa0a90949a..1c5671a3751a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -693,22 +693,23 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
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
@@ -716,7 +717,11 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
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
@@ -916,6 +921,11 @@ static const struct flash_info spansion_nor_parts[] = {
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
