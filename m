Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDA8C41535
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRCUB0sgzZXx5m5N/tOGV6TNF0wO/DeWs5Pz67VDwD8=; b=qK3RlLi2sXk2hQ
	dhdnCFsrxTvegZYu9TM5CQyX9OyL8hWPNcQ6wfLAbXPQdggPjAAmfCEMA0C7Ib5HwybXKAYeSKK+Z
	cUxTnz3irOzU7kerLVNxYjBTWBKeJ6BziwHf042MhN88zMoRFaU2JVvm2+cidBI7S3JVxLlPUFNjf
	6I9/Pu1By76IePiyDwsxMPEzsr/QRY1Q+M6PEvlpwRnc2ufevi07NZzIUqLUZyZDvgqZY6IQGMA3n
	bBOlmPYZypLnLjt1+nTIfWx53pWnTtCrp2HwyGVR41SREFHCc2kqqAk9IGo0mi0A7TDbnOaUz/L3O
	GfCkDuhJqGXWDCMBOsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgg-007glu-2M;
	Wed, 01 Nov 2023 14:59:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgW-007gdP-2l
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9c773ac9b15so1027278766b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850742; x=1699455542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONuosEbnLZ1tPZuBFPTx9Yzln1hf9IkS1/qIj5roSRc=;
        b=senej+frpeh8KWMYhlehHBjf40b5JdtROP6oYYR9CiTlpqv2IkFgclXoo+3FFeLE6O
         TuyLV8znKQGL501yTXGnpJPRo8fNAQSJPNs3B6iMS9qkQrw65HNenDyLC1io4Uc7R5vP
         IDhZGWcK7c9O3lL3s7Kj15W3rU5ZP0RWoc5gsI+UFRNVpuBwvPCeCMIY/a0QxeaNeaO8
         ycbUFcX4FVj+y4KGrkWIjDXZi/LZoAZW9Mae0p0zumu2Q8U0ViL9DAt7LnwTb+lH/pIl
         ePnSLzZoi+FgVjfGku8srLpC4S+1P8FPSuD2FDN7J83FYtjvkrnhxEY32vGVl/LUCe9s
         /CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850742; x=1699455542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONuosEbnLZ1tPZuBFPTx9Yzln1hf9IkS1/qIj5roSRc=;
        b=G0uZkr5uPGjdyw7TrY2BQ0KPwwYaYcud0NetQHPbWSFSCOAhH3W6f0HtdvJKVr69Yj
         vlyeIT2Nb/+sJwxlnKJhqwumK+d8R/RUbRfjx1ouR7DMxVDW4Xa8Mp3JBHuWk1cVxDMY
         M25XApjGlNkuTXXq/hCB0hg25uqPfpelD6xESZxfHdW5B3qSkJQslWhhs2qDBRs0XbL/
         CvEO3v58WYICtDphEQL5gWsnLAckyhtvbAFdE/dYfPRVsJRljd+l2EdUcuFkGCpnfH7d
         F3v2SxekyT96NzaoJlAVoJ0dQ9aTX8igq9aR2kL625reCmUSvzMHuDuA59FpmdtgJtJu
         PDKw==
X-Gm-Message-State: AOJu0YwwVl2ag2fwhWNVT4dcGHpUkYmgNKYBbviAlIZ64WmqVqOsImiI
	7zfmwUM1GtR66hQS2slv/2PNfA==
X-Google-Smtp-Source: AGHT+IHzEdY4U7xwj2/PYKQtwgxUY11nL7vsa7XXb5Sh6zSeW24LIPh2B2gKcwpU9pSYvp5lN4D8jg==
X-Received: by 2002:a17:907:9306:b0:9c7:5667:5643 with SMTP id bu6-20020a170907930600b009c756675643mr2266070ejc.72.1698850742306;
        Wed, 01 Nov 2023 07:59:02 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:59:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 3/6] mtd: spi-nor: spansion: enable die erase for multi die flashes
Date: Wed,  1 Nov 2023 14:58:50 +0000
Message-ID: <20231101145853.524045-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075908_906158_662710EF 
X-CRM114-Status: GOOD (  12.98  )
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

Enable die erase for spansion multi die flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12921344373d..6cc237c24e07 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -17,6 +17,7 @@
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
+#define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_VREG			0x00800000
@@ -644,6 +645,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
 	return 0;
 }
 
@@ -933,7 +935,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hl02gt",
 		.mfr_flags = USE_CLPEF,
-		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
@@ -954,7 +955,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hs02gt",
 		.mfr_flags = USE_CLPEF,
-		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1a),
-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
