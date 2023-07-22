Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593CDC001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjEtb/NtQGCWdQSe8UArZ6fWDi94XYriVaMhNyfcjvY=; b=oydFSmlCqN9CqE
	s3OFB8YClbUMGLMr5fhlUC5hUf1Nee6/kQBI/hamns10TsLoMQsOYaysf09lQsRAuVSoxkgbeskmH
	1ZEMhc9aQEDMfKM/L7fHglcCJrZgPEm+g4jXhWWHoEVlMrcz80G8G67NYaZs+yX31YNKMCLCwtz6v
	uMr1V3wOn1ca5LRxUT7PDwXpww+0nAKjrZqLJgLpnmvkV5Ol7WS5jTda+wRCe+kYyosT0ZLaqvyco
	7yamaNZe6ngk3wLHt1LoV++B5E/2svbw1GlMrTRsOROWWpk45Zrc+ZW7hdRjSIyASG+afjmwKRutX
	rVNJPrGs4yW8D2+ajn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AL-00GADZ-1B;
	Sat, 22 Jul 2023 08:40:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AG-00GAAE-18
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992ace062f3so433614566b.2
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015235; x=1690620035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zR/M8U1wHDKNH5FK18SqWQfcxUTegtHbVe9hHuhxRk=;
        b=Q8CDUX1g919ChNF1aXrbToRMtSAuo4l2fClsOX5A9ydH5K3MX+x0uEDUreGg61XcfB
         0OexDaywZdd8lWC6tOn03l8mAm/is66saBlUY7CHBgwVWaRBmAPF41E4SYUelMxeCS4h
         qzPpU4Z0NUecnH8BfjQ9sdHYImROoh1B2XpTgopDL+7gKjGa+9LMJD7/GJ40g1fQC2lX
         mRlTfWInp0HqYNBHScwezmMWfzH9UJxktF70q4yL+0QGB8GhEw/fBuC1eBQvEAhuEtNb
         b2MxBGKhTdk1dyy+XiihQ6C7Krl7+usdDOAyRECIh8/jz3tyKYrqQtOjx3hQBlYd078S
         DwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015235; x=1690620035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zR/M8U1wHDKNH5FK18SqWQfcxUTegtHbVe9hHuhxRk=;
        b=d/ViFXSF9d6s0o7d/OkNqEFJd+ESgoEVYNKQ4PgZC2LS7Rya4n+duJ2p9PjA1TF139
         UTCu5ZArKvhe3uorJY4NxND8vRS5p7r2/n+13L4zYwH92zSeCmEthjqg6wKbTx6MZ3cy
         AsQ920X+RluSEkGBtU262VFyyxCga4NjLGvSvQOnms7iDTRMP7BPb0NfhAy6PObw1omR
         bMGwf4ZbvEYrinId80ENB9Re3BlMx9EewtaRBcaelQFq3X36uy8LFPB31gixfVfD+BXH
         OtiSvtd8kvSPwLc4KiXZzKoz+Egq4FcoIIsPMIx+cINt04LauzUc0+VIks1KORje/MrS
         p8WA==
X-Gm-Message-State: ABy/qLY4YeStH4GHcUy3DfjXFU7QlP/yyldu4MI5Qrf3JkUEb9To0G0u
	Rt7Wacn7JwR6DpjBBGKnF2iCmw==
X-Google-Smtp-Source: APBJJlFLqt4xcTFAt2SORNGL+XlPD4TKMSXUYNLhF5LHkHtv5TWjMVJb4msGeL3AmaHBWHpP/Kp8Lg==
X-Received: by 2002:a17:907:a056:b0:994:5396:e322 with SMTP id gz22-20020a170907a05600b009945396e322mr3888825ejc.1.1690015235212;
        Sat, 22 Jul 2023 01:40:35 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:34 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 06/11] mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
Date: Sat, 22 Jul 2023 11:40:01 +0300
Message-Id: <20230722084004.21857-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=tudor.ambarus@linaro.org; h=from:subject; bh=Wrd7TgCxXlMqnk/UDwQEgLVdRWdaYJRKC05Rf/3Xxx0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5Xj6rh7ujEX5KOJrzAwohHe3MP6fhRRPEZAn HCFY1KuZRqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6eWOB/9+2h8aDbm4YrPkRSrcKUFhB5510QgyQbrAdkMp2QkSds+NKEyUPi3vT3ssN8FoWehS71q ritgg5fmEKWDSvD+vfkpvucWch3obftYa7XOBRbyyhCeQqzavdNktNYaW4TZ+CGHl2XR2hEbBro AfPzVsTdcrJirY+aWhPBEV4PeDg2Kg3hYXX4r7IuXEVYDcitDuhYV+NoQPLMZMvc4qA5sr8Od5N wohkPhYJW1GhiNdPFTvPKgqs+3dU7hZpyPbYGKT5qDQ/9Uqd+Vdfx342In8AI4akCJi1gN2/Tan Rf3vwiL5+MrIYOjkgahLZA71m4NPyRJgJFzk3r/j9JzHDn97
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014036_399672_B44377C2 
X-CRM114-Status: GOOD (  12.96  )
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

Infineon multi-chip package (MCP) devices require the Octal DTR
configuraion to be set on each die. We can access to configuration
registers in each die by using params->n_dice and params->vreg_offset[]
populated from SFDP. Add MCP support in set_octal_dtr().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5b6f36b56e9f..28d0a995f3b9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -206,17 +206,19 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
-	ret = cypress_nor_set_memlat(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR2;
+		ret = cypress_nor_set_memlat(nor, addr);
+		if (ret)
+			return ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
-	if (ret)
-		return ret;
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_octal_dtr_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
@@ -251,14 +253,17 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_single_spi_bits(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_single_spi_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
