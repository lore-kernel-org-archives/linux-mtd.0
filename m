Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D5DC4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZIs0yO5LhgQZ54APxvAQEHmZENcqTrwAfRdXC67On4=; b=J8Iw29H8di6PqP
	luFsJ1nQ8VbwkKiF3a65GxwQhUAW4GtDqQ/q+Yop8WzJLt0qC9ZQyhQr7Toh7w8qVe57M9UXlvdaa
	q8OHeooG5xY4x96Ki+VuHhMda9BgjyRSjtyCkqj0TxM+ykbNHzdUgiGjrMsYi5622btdjmEbtiaSq
	5Q69t97FwYMmi+OG0ZiWeN2AhiPl0b+EwA9XCCHgo7VHhOljVUPPiwOuaGYlvKFeGEpn3xw4xUIZO
	jMkRpAU4cMSpktaapUUehoepVzqpGbYpLF5G7pbLDn0Sc2HcUMXR75YQw6UaPW5qdj181pAzDv0Om
	gxYW+RKo0iG6OyqlwC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lH-006yBG-25;
	Wed, 01 Nov 2023 09:43:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lB-006y7K-1C
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9c5b313b3ffso983648266b.0
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831814; x=1699436614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maW71W19w3xZ4uRCg1NKsmw29lE5F0o2RqhV9nKvSw8=;
        b=sSWHgjVZRAItsRk2r0lqvRgsLpPYWd79gZpgpa/L5QabEk4TiiVHrx0bJM26Cmxwbi
         1vF7efeZEE+JZyM5a5/62QxF9YFcTitCqaLtUD+RfNIVvqXStYhuQRkl2KG4wo9ZOwpK
         MaoSC4nxnsrwzHKjqCeHOBLjb9qbcMxHosVxANyR+NckQNtyeQOgA/Hk258K+qlBuIb0
         A3toLjOSelGwCCbyay7/kNSR4l4MF8T4ES01c+Kb+8ZeUn9uFWY8vsZfpeiRYjNDQN27
         LL6hHZgMSeuIXba3BRFp/cgTUSt5xBJ/1/FgznZPCKQVyz8wdNaJD6dy/TkPxOORMSGM
         k38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831814; x=1699436614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maW71W19w3xZ4uRCg1NKsmw29lE5F0o2RqhV9nKvSw8=;
        b=DBJqrbj0lz00Yky7F4QzSKgl6tEHFV1SKzQ15uFlAsg7LSgd3Y8mllmAx9W6u1QfyX
         5eP9UTmIrdVIGShJWym3jbg2IANzHdxcSvkSddJyPnACQvGE7c/TWnVwGVtaOGjtjBC/
         SvhDLQTQg3ag7aG/LBB7r/bqNxcEClbXfW8aX8O6KLg6pc66wGibOBnqmRXS6xuCpikO
         o3jnJRZqek0GopQG9BfdEN+XiEbMfgwW+vBfVBlvCad6MQ/l5hVbCFM304RqHnaZMopW
         CzpWBQrK0AU3gLYpKoYUF3t4aS/wuSL09FFfc2UpywYI2yKJC18yayjcTrtrUHGdvkuz
         G2qQ==
X-Gm-Message-State: AOJu0YwnrRW+G47YfbhNppJSNdaIVrlFytPEXciBfVuQBJy8TIOwgu5P
	S4bkwtdzvg9dNEVjPYV105XHQg==
X-Google-Smtp-Source: AGHT+IFs5FigSHxj/VtvU7igiUS4RhgAVrcRqjd/9bdAqr2gmAZbvn8NIaLBvkVnX2Y4/eTCo3HMGg==
X-Received: by 2002:a17:906:bc93:b0:9bd:bbc1:1c5f with SMTP id lv19-20020a170906bc9300b009bdbbc11c5fmr1230099ejb.35.1698831814515;
        Wed, 01 Nov 2023 02:43:34 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/6] mtd: spi-nor: spansion: enable die erase for multi die flashes
Date: Wed,  1 Nov 2023 11:43:22 +0200
Message-Id: <20231101094325.95851-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=tudor.ambarus@linaro.org; h=from:subject; bh=ksJwE4YNAWP5lDJN39g2w4IJ+ATJr3tJ8N06/D7QgCo=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh29x0fHhXSE9JgafvLMA7XLeUNqtp8nSiGwM MWM5Xo2miKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvQAKCRBLVU9HpY0U 6S5/B/0Tb8vjNOpLBZJsjrfnZCUiwUvh4rGCxYaCrSoWEjeQpJvYpWilXERjy6NuNK3bmbH8y2y oERzO4TcCKCMRXSzteea1uskFLfzcdPfHJMsCh4UXH1RSNN4aIWKueDILtA8zsAnHfQt+j2WZKA TueCERkx93HOy2zLVasdBNIsddcM4IzY3Ujr9K0bdSrPUzan4EObuZn2yMjdjoLV5KJRkm/BV86 BZAA+gzZ1WNh2JomKxOC34g++wASRsv4rOXfbFg6mLpElKhIZVwZSvROBMO6bEza3XXPd9ydAfM nuJVh+hiNIJpbkXAfXFdhfsnBNxVYMSvr69lucnF+l0DF4KV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024337_408512_5AAAB0D2 
X-CRM114-Status: GOOD (  13.20  )
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
index 12921344373d..1c052786127a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -17,6 +17,7 @@
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
+#define SPINOR_OP_CYPRESS_CHIP_ERASE		0x61	/* Chip (die) erase */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_VREG			0x00800000
@@ -644,6 +645,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	params->chip_erase_opcode = SPINOR_OP_CYPRESS_CHIP_ERASE;
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
