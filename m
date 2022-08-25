Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1466C04AA5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LKgh8ABY29LZxDpqjpBPfjrK+AuhGUMeKJW4oUAD+0=; b=2eEk561B0/LUfo
	fYMMIq2ua72ImxlN0fp0w49tw3Y6hHis5mHpC09jt2QOU4WTLmF8oRyU443q/QXOxyFQ1+zQ5EIAe
	zA8CgKIRADBPmMw2grD2JP0cl0R2lRTuLFegJDqS8cmMMI3SDf+gXxiAZh64tAaW8pk8K8UbUQhSH
	EmgtrdznME8ktLSNuMmW83OcHl20Aj9JNoEgKGmtZ1uIGxZxmkYry4R0WcVX+AFqHkI1uNcQIeXXq
	g9mFZLEyHFMmXjNPtzdiuN+DxAlG4Utps5Ui4hev10wdsqlmWzjnwZRtCQrFZadaGcyRp2pOV/wVo
	Xan76OlF7IAun96IiSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gu-009iLn-89; Thu, 25 Aug 2022 07:54:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gO-009gxS-JK
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 07:53:49 +0000
Received: by mail-ed1-x534.google.com with SMTP id w20so9259614edd.10
        for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2022 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=78LV1OFXn4kU+Li1Jo3v1pAvNQIAGmy0sk/6bF76fRQ=;
        b=Wd51wZvW5WFwaIoYN+lZ7WHoYz8LAT/LPsPSjAobWsPxeAy1SqWwSgQXNTbCFJEEFN
         dTuv8fiTkttDgJ+zDqXUQeTmFin9tS1kg3LomvI5oh0xcddf71DyXfveF39TixR4DFxu
         hRv+fJxhv+j9rRQqeUIqwJdFXp/gz2MKdQZ34HsnWsPDKV8Q8eHBxuC1P1GC5+3VcuO1
         V8j+cHHxip61cL0sUUkKKMjZn25Dy9eHrHWW2KQR3wVa/Gy0MXSsERnN8iNyTpYkxiTI
         7pzltRRgFUBUU2HudbKJ/l9Iz4WZwQhzAGhVZS8aqWN/dybO0mS+upWrof4DYmhTSpK8
         BxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=78LV1OFXn4kU+Li1Jo3v1pAvNQIAGmy0sk/6bF76fRQ=;
        b=2sInf2zNAQL2mKj81TyUTxScjNF2Deaul6rvRiF7cmCqqbtxgIAnVzGSSAR+EJ9z/C
         EPnaxVroH22TLXK91jV+zEd8E60istHYyCF8u5eDVRAhiP3UNJ0rQ574+80fYPt+154U
         Gq5NkQpcE8BE54xuo+gRXoIT4xH3/PNcRJTAnPsoUDzWBPTA+JSacvWo99Clc59F1mGw
         wFlj0YFaKMyuQTvi2DXa7k9M3D+ydTc+o0oWzGI6fNN+6qzt1H+BwjRb9rVC78s91/f/
         CNjBXBAZURChnj/gUw/+V3IVsBjNo4y9t06HyN6DCEm8jALZ+U8XKXm8U78/Oui94JMm
         X7PA==
X-Gm-Message-State: ACgBeo05vI310c5v9m4sz/cvmgUUTJByTp6PcWuwHnsIom9gpY7BhpM2
	M/z9TfNfCXAjNGJzfkC0/d/WVA==
X-Google-Smtp-Source: AA6agR5W9ulp4PdYSwLAp/6nQblVWJxOhoKk/OJmVAtEANwcbeTL0n2XJqbo+/Dr37lNINquqWbUNQ==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr2174857edd.255.1661414021084;
        Thu, 25 Aug 2022 00:53:41 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906b09600b0073dbfd33a8dsm1491736ejy.21.2022.08.25.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:53:40 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
Date: Thu, 25 Aug 2022 09:53:37 +0200
Message-Id: <20220825075338.35338-2-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825075338.35338-1-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_005344_708768_A9D7E08F 
X-CRM114-Status: GOOD (  14.07  )
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

dma_map_sg return 0 on error, in case of error return -EIO.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..a0c825af19fa 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -862,8 +862,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -893,8 +893,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
