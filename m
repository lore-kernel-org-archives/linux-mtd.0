Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6668EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9S4diEvNrXFCbZXdeNy0MVkrtO19xpF8MS5uwa8g12I=; b=gRRytc0LkwnIsP
	8d9Yf1JtjPpd1keybm970UJm4pyjiVqS+McIQxWUf+ZIeAzMo6qMCvhRpBDafUZ4m9ED2CsSbQ6Xc
	fzBaARlX0I2ogFcqN2D+yQ7qEHPBYVrgZU6cJiAMJrPd96zc3GFroZTBc8MKyzbaCUEX0VnWH5tn+
	g8yWvuwCAhpSSCNsP/OAd8M9yPxMeiCwmzwFE4Sk2xB9ba0XE7q4HTBUzzKEPk/T9p/pU95RF5/1j
	shos1rjoPQ1XRO2cmJHNLaQyerWrMy1VwVXqUDtEjU0UFf/40iZh/lE5ZmLSax1tsSA0IWyEeCsdR
	xym47V62SWbH/P6bZx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4id-00Fpwg-0n;
	Sat, 22 Jul 2023 04:59:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4ia-00Fpvr-2k
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 04:59:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-521dbe5e09bso3341431a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 21:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690001986; x=1690606786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPPZJ6eh59MfiIUBA8Mfsk7fKsGGjDRF4wsTV+SRVQc=;
        b=uSB1iES7m/scCF5hmNjX2Rs5Sr1hJnPulXIDgDliHq1OqlQxlnpKdr7fntCHbEZSyu
         0zxmYjJgtaI6KpFiZ0I2ZXwRtV3ewfk8p3/yOlA7C0QKzXV5U8SdY5RQ6xVgU5vegJbD
         yT8c14H+sTqg6m6rLkmsoTeBddMynSMxPW3r7XFcx8liuu5yJxVzLh6DdIbWpj/sggeW
         zWMUx11abf7XWeya3bndXosewik2StrFP846RhI3h2hXNOAA0Oq+nVlKCOWCX9OUzJQ9
         jZE+M9A8zhMfNwsWtTYWTfvoKnQCheFOXhdgq5w6NGHAA2/l1zxfbeEO04YYpe8RaDUK
         XMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690001986; x=1690606786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPPZJ6eh59MfiIUBA8Mfsk7fKsGGjDRF4wsTV+SRVQc=;
        b=APlV0Mp96vsexSjfdMa6R/zA+4OEFKZrFGv5Mad+3419umJhL29ny+Fo4b2dSBbBOQ
         zZ1RcG2VJbdV6t9uA0vrNZipeZa4ifrLskQJJ9U+Lbn/dia8eB0q8uHHDeFqmLiswxfU
         oaEWpJ7Qg/elY/RcoNxYmGK2HEwdP0eG9rC0Vytip/jXw9pBjDxzIsEwdjIlyjrXZi+k
         WPWmDcoPIBjKs+8yksT1J1EX9xngxrHgzcsBSsAJL+0+IatkqYZKzprEa3NeLJgW3nMf
         ENHUPnXvJVmcJIR9WvOtFlwqByn1haQ83g8mZlvIIIOpGBbJPQpHFuByGVEwb0XtGsK+
         VpLg==
X-Gm-Message-State: ABy/qLYjNVcrtjd3PfZXyv6VGk3aJpj8u8fdiZo7rXdir5XW/Zyc3KnR
	AVD4+IBOyS8UDijpwibwjEhNhw==
X-Google-Smtp-Source: APBJJlGSmwWCv19wKWY7+rUTWGLB8hqxBZd+bl/5PamQUQPbNzTouOAc0RH8zpEzJopVRkSoNGvbVg==
X-Received: by 2002:a17:906:5a4f:b0:994:569b:61b4 with SMTP id my15-20020a1709065a4f00b00994569b61b4mr3367092ejc.28.1690001986336;
        Fri, 21 Jul 2023 21:59:46 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id u20-20020a170906c41400b00993928e4d1bsm2969834ejz.24.2023.07.21.21.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 21:59:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc,
	pratyush@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: let SFDP determine the flash and sector size
Date: Sat, 22 Jul 2023 07:59:01 +0300
Message-Id: <20230722045901.9872-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=tudor.ambarus@linaro.org; h=from:subject; bh=s09x/ZFTcPaBJaM7nguyytIOWp4AAa76VraRBrhiDGU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku2IVn1Wn3GArG5rp0WYzGxoMlZxyXiPN6QukI 1vsF3uHXqiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLtiFQAKCRBLVU9HpY0U 6QvRB/4vUD3tnpebh3iQ86MCnarZJscI1rQWWi3o1PeCBrvqIb11mEeHDJ8JokjQG0DweEGY1ZO sZsDc9oY4LDw9v9ho2WR8AN2wwUmitLSUPmIQeugP/e7yLhNaVvHvATaVkSmM3NjrgF86ftaflX tgLLNUGJ9RVf72gHwEkfiKens1alkXjJxlBoTLHHba/7GgengbvINl+C7UuZDlnwSCTHLWDo/01 uNwiVhoUc6ak6uwIMvGxB6YmLdZKDyRhrQfjcjV+o1xCuNDtGI8R/NdYGVyH7yjjAYcpKgLioNK guDgx7DpibvsW3+K0nJ55HCm8H9s9gGD+K+YDPbdY4MZjalU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_215948_907402_EDF1E241 
X-CRM114-Status: GOOD (  10.14  )
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

sector_size is used to determine the flash size and the erase size in
case of uniform erase. n_sectors is used to determine the flash_size.
But the flash size and the erase sizes are determined when parsing SFDP,
let SFDP determine them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6b199112a533..5f2a76969c76 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -878,11 +878,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25fs256t_fixups },
-	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -891,11 +891,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -906,22 +906,22 @@ static const struct flash_info spansion_nor_parts[] = {
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
-	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
+	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
+	{ "s28hl01gt",   INFO(0x345a1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
+	{ "s28hs512t",   INFO(0x345b1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
+	{ "s28hs01gt",   INFO(0x345b1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
