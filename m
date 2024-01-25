Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B62C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJesQZA3wPdY/TCCE86/TXpUjFX+pJ0JDLlQYmabGnQ=; b=yx8HU2BP+BEP0W
	PErmpklY6+rhuPcmQSXgAQADrgHXA2L+hxMpz0827SaMZJ8L96sjaTsnoaHF36iZmkZk6NEI4xHbv
	/w3JfGZGy/NexrGJUUg24kV2uoBv5Z4e+b/ID16Ht53Uk2bDeCQvSpo5GqEGxqrhIGXPFr6VGbNra
	+HX3R3Z+Q5HfHkVhyUuud36sONdfnPMvSLtX1swaEXUdrogKfq6urc6QG9oJdlDBJAj1gKkiWW1ca
	tieL6bQX0g7n+VnE+QOAUOmKnkJ0xabwMvh8VLQWHzg5LF4vQnG9lsvuPLbnaQ5VdOys9MbYRSXAC
	mH5PghMqjPXrNT6xr8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5ui-00000001h8z-1i5P;
	Thu, 25 Jan 2024 20:01:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5ue-00000001h6j-4A2L
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 20:01:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a34a1790041so2310166b.1
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 12:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1706212881; x=1706817681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI2TUBrWsibpggLWuO+Eog4ByDUTome4h9IXAkq4JHg=;
        b=h/V9KP0jRc1O11YNUJEn6IlplDhaTN67WRI5dAE9VWLUCk+lasGEl0Tts1SntHCvsk
         TT3vXOXGwn0P9uTKxyMf4rytDxQYA+CS+QHIuA/BDJKWM/CJFjcSdfG1Dtvh2UWlRCOU
         mwnuyIhnN/RTm+UblYvoh9GZAO+2FzNWvjDvmB4v9UTJxqB74DD6j/G3m8zO4wJU1uqt
         /vceHMBXmAH+lQzlUeB4VIq0NAzCpzEENy/whpEUf/vRm/zLvk8fhUkYQqa5Edj4oShs
         wfJjLH3cCNF69+8JPcCJVS2QHCPlKcWAAgLLkJywNi58r9Sm6qsM2LGYU+WumWTFa87s
         sVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212881; x=1706817681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nI2TUBrWsibpggLWuO+Eog4ByDUTome4h9IXAkq4JHg=;
        b=XIAViGAGzllsBETdd5osrNFuKQLZfakj+H/uULmfuh/wa36yZKXsF4lbK1HRDMbDXF
         oY76X89wQx5g03alo5nbMExovcDG1Lde9rIGtv0YSyS/CrBfjq36NXlU6CcWWiART3ic
         HzEx65xUkDoh9kZcQdv9UgvGnKb62BUnb5L+Zw36kNvbQ+FUH7aIV94M62dLWnp1eWwG
         Kl/7BVTxLaEHBe5dBMbdyjXzSzgJnee6G/VYYCT2VTgkRLgCoYylkrv//j2SaX239NaK
         05q9Q51ncKIjn/jK6hzXbCX3CbL0D5Pe0CZG2cTMhugD3TzXg/ANEDFgMDZeKho9JJeF
         Yrbw==
X-Gm-Message-State: AOJu0YyLIzeVuBmqFpb9wAue1El2K+TFhn36RefyyY61ud88sX/qugnL
	LQOu+Z9cOU1mPHsK8zGGLtFm7iVKSbbCCDL410YeijdtzQ3Xjm+rg/KZ33+zeJn1/RvU6HQv8WT
	H
X-Google-Smtp-Source: AGHT+IH2rF8eHuhiaQIwI/Xc+DXpK654R/gK9VQE4TxudoFLQcJX4ThR2HuNQxMZHhNWur8zy1OTlw==
X-Received: by 2002:a17:906:80c9:b0:a34:95ac:65b4 with SMTP id a9-20020a17090680c900b00a3495ac65b4mr132618ejx.1.1706212881683;
        Thu, 25 Jan 2024 12:01:21 -0800 (PST)
Received: from pikachu.. ([105.225.45.176])
        by smtp.gmail.com with ESMTPSA id ss17-20020a170907c01100b00a3496fa1f7fsm195577ejc.91.2024.01.25.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 12:01:21 -0800 (PST)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: spinand: esmt: Extend IDs to 5 bytes
Date: Thu, 25 Jan 2024 22:01:08 +0200
Message-ID: <20240125200108.24374-3-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125200108.24374-1-ezra@easyb.ch>
References: <20240125200108.24374-1-ezra@easyb.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_120125_185097_09303DF7 
X-CRM114-Status: GOOD (  12.00  )
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

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

According to the datasheets, the ESMT chips in question will return a 5
byte long identification code where the last 3 bytes are the JEDEC
continuation codes (7Fh). Although, I would have expected 4 continuation
codes as Powerchip Semiconductor (C8h, corresponding to the parameter
page data) is located in bank 5 of the JEDEC database.

By matching the full 5 bytes we can avoid clashes with GigaDevice NAND
flashes.

This fix allows the MT7688-based GARDENA smart Gateway to boot again.

Fixes: aa08bf187f32 ("mtd: spinand: esmt: add support for F50D2G41KA")
Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 drivers/mtd/nand/spi/esmt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 31c439a557b1..4597a82de23a 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -104,7 +104,8 @@ static const struct mtd_ooblayout_ops f50l1g41lb_ooblayout = {
 
 static const struct spinand_info esmt_c8_spinand_table[] = {
 	SPINAND_INFO("F50L1G41LB",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01, 0x7f,
+				0x7f, 0x7f),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -113,7 +114,8 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
 	SPINAND_INFO("F50D1G41LB",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
+				0x7f, 0x7f),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -122,7 +124,8 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
 	SPINAND_INFO("F50D2G41KA",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51, 0x7f,
+				0x7f, 0x7f),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
