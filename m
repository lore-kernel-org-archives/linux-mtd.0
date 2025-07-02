Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCB2C8303F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SRcmCOk8PrGo/uKKoTgWNaHt0fFWPADludOGMts/lnk=; b=wxYi1XxAQq5FUp
	9UchxV4PjzFcDXAW0jXkmcJAWd3tVdL07wWYXeBM9EUher2z6tMSzMw9B4eKuAKVZUuH4Iv9wbOSy
	4HHHv0sLt/HqoViGv2BIEb+CRmIHOAV9n8+v29KXjjkShTNu+Rpbg4HcTL79IHRv03Z4ZzFpJ7baS
	s0SgfdNb+oJI8TTtMc3xXJwhc+N8nUkYVVM/obcc96UbaWFbnT5x0ThhSm2H8odOHJjai/Mv7pyt+
	kyoEInx2BMLhRUUXoBD0tejqsaD1iH0JGhKzhTKgOWFYiB+Ofz0lXXVtJkVFEfStfBU4unU4JYGzQ
	Zh19/qbjbfEYUOX8E5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtsw-00000007n0W-3X7G;
	Wed, 02 Jul 2025 09:36:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrkz-00000007U1u-0Usa
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 07:19:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a577f164c8so885703f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751440787; x=1752045587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29Ak/ncEpBZr7ANmY5PCAbSSEdsdCcghSMWZ9aad75g=;
        b=fRwhddJn1MQtt31ZM9AwYEXYFT327M0ipLdZlwvR6GI0PC3Qgav9Lcg8a2HcD8jYhm
         wJAPknjiGA34JbPSHVOSW4277QDnxm/xaMdJokvtHFa6s3UDGP0CvKkbv2myQs3CPBfx
         OMuSqPDjM3xnyata494381VbhH6VMd5I1gYhUov6Ux3N5A5fhvN9KY1VlGMZ39WpWvBm
         8Vxrx5diudLEdcidXSdYhCcpXYe1qGi+yy0ENhhvDqiAqauRcZAwKICZgfYh5rEUUsFl
         zN4WwFsjRrp9Y7ceva9rooufSyQZbffuUhg2EL/XlscP8RQjvoQDHYB7WvsC0BFxN9dW
         EDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440787; x=1752045587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29Ak/ncEpBZr7ANmY5PCAbSSEdsdCcghSMWZ9aad75g=;
        b=c+CAlnMJib1gPxmDoeYIjSLamotcmF34wLBn3KR55CYY464iJUG7JwNagevIxIg1Lc
         ZNhZPwuFKjxGrbkPP+dCxd8PEbep92FiX4Z8OrqYBpKCdcZqUcgtm3lLrzRFqsPqn3+C
         w8mg2QzobN2e92yfeD4sXo2/5wpE3PfEZBjvMYvAPgdeWfKXjGNlJJJIufqNhrOcFh7d
         DQr0TBtoXzKye5fZ2c6K43ygsvB9rVSynfdnx8e986fWlHSPpOpdL/U3aRh6kaQf9yZ/
         H47wWH2Yg/5KWqq7JIs6eygnAHgiJWBOT1PDZVeR2AHNV5oa8cG7ZJuh4CpUN6fXeXXG
         Tk5w==
X-Forwarded-Encrypted: i=1; AJvYcCX5QGtX8MrVJTZirpOo1p9uGtNurqrON380UGLQNKauLL1q8WlYWvOvQzQ/D3p2yRQdi3Pah1jfeUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzluODPtUeorsoyiGgfbvolWwQI3owmBMlVabdP9ya9IzfAFLou
	lCSYGF+4Gt+Hk6EKBM40WH+TiVYYPQ4sMvqAqywzjHQv8E/HkcSvqlEV
X-Gm-Gg: ASbGnctzLVcpPHTL4CCm091Nw5BYrFKNaB6aXYR9Yz8QQuFCbw3asM+mzd0Rb3zea/G
	ngQeoVCdBLbu4Gk2lb9HslYclsT0AISRZ+CVpavi4L06nnIwYNpzNo63feN5tPbrHlxqZqUsmy/
	aOsPaz/J1agL5VcgGhYV6RMEOvz4vyfUFdMaKeJFFbjv1QKBnmAe352nESXsFnFoc3BuWcyRDgU
	wvr2JZ/R4aOAUdBSmRiAqlsX6ABaiBv/3uUkdNfYiA7qruIMLelu//deLUA6+SRd6X6NZpKdp56
	38+I8dsCkPZFr7/qdFt1i+ZUBNAp8xgOoVoakVcErWOPFhogRirHV26S8mhXLbXAvx8O4ECtGbS
	K3Fbw1LOSRQnO
X-Google-Smtp-Source: AGHT+IFvEc/YQH0iMY9kuno2iXyUVs1TvRbucMzr5iCCWzoq4QGjRiP5liXmGKiCZcU1DHEwPw2+Hg==
X-Received: by 2002:a05:600c:358f:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-454a370c4d7mr6204995e9.4.1751440787221;
        Wed, 02 Jul 2025 00:19:47 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9d5:215:761c:daff])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823ad0f3sm223424525e9.19.2025.07.02.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:19:46 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: renesas: Add missing check after DMA map
Date: Wed,  2 Jul 2025 09:17:22 +0200
Message-ID: <20250702071722.24921-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_001949_154189_C28AA013 
X-CRM114-Status: GOOD (  10.30  )
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

The DMA map functions can fail and should be tested for errors.

Fixes: d8701fe890ec ("mtd: rawnand: renesas: Add new NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 44f6603736d1..f4a775571733 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -426,6 +426,10 @@ static int rnandc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, rnandc->buf, mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr)) {
+		dev_err(rnandc->dev, "DMA mapping failed.\n");
+		return -ENOMEM;
+	}
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
@@ -606,6 +610,10 @@ static int rnandc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, (void *)rnandc->buf, mtd->writesize,
 				  DMA_TO_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr)) {
+		dev_err(rnandc->dev, "DMA mapping failed.\n");
+		return -ENOMEM;
+	}
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
