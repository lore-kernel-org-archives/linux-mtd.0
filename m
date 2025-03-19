Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902EC36000
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC5SnaB+V9BMS27lOwU1vYwZXqNVuEUgSATrYwEl/Vo=; b=sjW89ZzBtEBMfY
	pBll/f6zYEsU6JGljHvkYeHLKZAAsAqfUzydVWvo4qUTHiuPAQ4L8QMYsku80xqIgnFscGA1LNaf5
	ePrJyV7po/L5j2Jm3mvR1C+ZdnDxTFOvjE5SMnExNnm7CfCQpu7l0HgNZlbLoOJtd16McrLgCOfsi
	An1KQBqCwhEewhIF+tyVnV1A37d7GfjwH4ib/Oya0bgT6Ca3QDhHSr7CMnIpOerKy1ous6CnnwdyK
	csl8Ubrz6DJvORD36x61putCMSH9nPfxl08pPbxX2/Sf4HgL0QM/1CDG44utU51lh+2xLQiCgkIq4
	XaD2a9iwNTqzP3gQTx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqBA-00000008aqf-3za6;
	Wed, 19 Mar 2025 09:57:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq1w-00000008Ykr-1rs6
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:48:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22398e09e39so141977365ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2025 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377688; x=1742982488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAPU6J8SAHBswu5KPS/clGE6GclHv6M2l/Gea+md2MI=;
        b=c3kqGmPhna5z9hu0E/uUn+27ZQQ8SJQ0Kkhn1zFlJIgu5umwgsHaXM1Yp4PWnsZU2w
         pD44Rzf4UfqvA/a5Ff3E7xB9Y9NJoUMHe2lVDxDlj3kEgSqXYbR1xat55z4rT5ob8j2R
         R/5/qDXQ3DhDLRynlEeZCzQULjKNZpJt9orpKBVcwLbk7H/u8lyPUEUU8ZEAwwWa5WTc
         7m0Dc4jy23WbJ7rLNYUD1lAa3XdANSBmTZrBIajiVXmrxAkckhvUu4Y2pEamdda0gBHp
         +mBHBDDKuD075wdImPmWm1Mz0DuAekAyckKwS0kBvvBdtezPgdSMpP/vfnUSea/vFegk
         6Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377688; x=1742982488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAPU6J8SAHBswu5KPS/clGE6GclHv6M2l/Gea+md2MI=;
        b=sJKYrKBX0RU9v44eRG8QT6OQoDGUDhVGcfGmvGTdUMlBQm4uALlrjWJD5hyO4jB640
         GN1n77QHtuGOJenk/uJdKf7fugQ+5o4DEpYuwHHM/llBf2zVhcis/Y+1xTJKb6l4uOlZ
         qI9ad89BooPfIFxeGpxXiWV3gQNwtJnWdNx3prM745eCeBd3jRVad3XB3+NMFlhdGLmI
         RB0imhA91XKfl+efzUOflmCNABpy5PVbiuvLyznlETDOXkQ7Ia+LW03DN3sW2XuLqEh9
         A1rkBWQX3JYTebfNLGDQRTqrlhJZQe8zYrPCkisGEWrvnGwe5w1POFNLdvhuw1DFbMvK
         SNiA==
X-Gm-Message-State: AOJu0YyCyh+5H7y+wpoH8UTj/w7pGOaDSE5Bo28jWaoupLTg+I3MHa/P
	djrYPsLv1+znoAp2W9kt4yJphF2VhY2p5muNt3D3XtFVHkJqpn7r
X-Gm-Gg: ASbGncsBwweqWyxELTpMoGL7Bq035yInkCtUPa0cn7akfx/Rt1uhLhtPwMikGidI0U2
	OEn0G42Cqj0Anpo52AzUW/pZJ1XEpfdvI3AJu6JqrZx43Hmij1BWaAb1HYqmCOIjr2bV9+9Jln+
	TDAC5D6FtvnJEbTNLAY2YSPCF16fzf5yS5MTDLOakIo+5sQwHDIoObKggSt6D5BYP2Gor2QalIJ
	Y9Nf854Qk9Gr4bs56q0cgEEou4UpLj87518JUJRdlnNwm3CPzNreqdah+OMTI0Hegxl6+TPpYHs
	eeJjQkQ+j/GupP+Xk04zDiuidgKYJX+QZZtqgA2U/fLLgT7I+urSLMZlT0oM4Z5D3yUu3qersXM
	MbVTNq3No8NzYZMondM+kLB+sJql8ZqVyfXPRlA==
X-Google-Smtp-Source: AGHT+IFwkCGCNCZFHxXbmd2VPJkFvQEuo4pfqxBeGBsinv3TRNIY+NeDJRgxareZ7PlpncQXBtU1wQ==
X-Received: by 2002:a17:902:d2cc:b0:223:33cb:335f with SMTP id d9443c01a7336-2264980c709mr32228935ad.3.1742377687888;
        Wed, 19 Mar 2025 02:48:07 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589bccsm1103483a91.11.2025.03.19.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:48:07 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 19 Mar 2025 18:47:44 +0900
Subject: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
MIME-Version: 1.0
Message-Id: <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
In-Reply-To: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bacem Daassi <Bacem.Daassi@infineon.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742377674; l=1784;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=ScfM3+8+EJIZU5+Lu3q329qWBAmdoTXsh4O0GU3+m3o=;
 b=DIk+3FpIU2asCn6le4wKHaawnoXw5LZpljxg+BE5i1X19lXI0j/ynzbqbU9cWWjzai5dqTp9S
 dboNWFSfmjgA28hk3MPHZcUKUHwe13V4P5xFxpWREkvnVbm4g044gaD
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_024808_485904_545F3AB5 
X-CRM114-Status: GOOD (  13.46  )
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

There are infineon flashes [1] that require 8 dummy cycles for the
1-1-1 Read ID command. Since the command is not covered by JESD216
or any other standard, get the number of dummy cycles from DT and use
them to correctly identify the flash.

Link: https://www.infineon.com/dgdl/Infineon-CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3 [1]
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd68210f41acd716635c02a8936678a385..6452ae6eecee3325b52cdcc2cc9703355951e0db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -16,6 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
@@ -2011,9 +2013,14 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
+	u32 ndummy = 0;
 	int ret;
 
-	ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
+	if (!of_property_read_u32(nor->dev->of_node, "rdid-dummy-ncycles",
+				  &ndummy))
+		ndummy /= BITS_PER_BYTE;
+
+	ret = spi_nor_read_id(nor, 0, ndummy, id, nor->reg_proto);
 	if (ret) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
 		return ERR_PTR(ret);

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
