Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA2C7EE30
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EWvnel9BE2Y2BRX/9Q5fUMVGUzBDzQuzUZz78PtsDio=; b=UMSeJAKaHBnw4S
	kYB5KeAFJA/ZP77knj6UMhaIYTXg6zqoo91pmRv3kBTlQWbk76vgIkIrjurA7c8MD19MdtlPuxu/f
	Iq4eLTr6Gb6DCjxCam2qiE1yd8Y4c5NItR3qnDuTVlGInbgnIfJHoRtEQxaWG87jcw+vC6F7z/FYr
	14I77+4vmUPm5TIuhxp+SXr451HXQ7LyH9sJ09x5wolN24SKG7buWdrGSkEz2xDfqsXAUR3IWjVBc
	jxGrVik2EwQnEHKZtJa6uWLCEEfCGOTrCG5FH5gnCdGfTkqGB56QKrYz3HNJcqvV/4yTbtwJMo66K
	07/Y63ZDHjd1x+jiMZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtPu-00000007gva-2PMw;
	Wed, 02 Jul 2025 09:06:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsQr-00000007ZdB-3ORM
	for linux-mtd@bombadil.infradead.org;
	Wed, 02 Jul 2025 08:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OgFaDugDrTNr1qllBEB2czmYTDrkllakFBrtkgwbdUg=; b=U6iYiJ+vQEM3gSGbZ3IckPBNlU
	t3kfkHeRTncOl9TFoIPN7Bu42i4Kud9mnl9FgPWyKt+zvUws3ZuFAsNVaLOTBwdMHubneQioGPt8J
	g2heilF7/fki/Vk+qcGI9SUyUlJn6SBjSz4wz0NjVh2dempKjcU4ceAXk9CIWbIMZ1QWl2huV3p0J
	iyCIohh2lrEQNi/wmEacHa9L6BTDIMA0XrwItBSYksPklQZutG6sRU77uc6jigFRapIkj8cYaiH5L
	vLownfotR6u7Bb0BMVk6f6jxpi6WGz6eGD05/g+8BDy/ZeeQnzDjBi8g35QPP/B1U44gzyoDRvI+F
	pegee8YA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsQo-00000007Ito-29cb
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 08:03:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450ddb35583so8435975e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751443380; x=1752048180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgFaDugDrTNr1qllBEB2czmYTDrkllakFBrtkgwbdUg=;
        b=YEpQ+0f8rFbXmipdxfI92vyjkp6tPdoNRk+phx39sMEPL+DBqqJmlX3dC5DvOvqE8E
         wEWwWwgYIyPOfn5XeD4GERdCjWRqO+EsU+Cr13gWYguRZMKaCDOEqbh7dEqHIi8CzhSY
         Ws0F1dE5wYKPk79D/U593NXyc+rXOy02GSQJ9AMsjMDRq0LPxKJGcFbQDhTZ7aX4B3BS
         sXvbw+UeV7D/8ThItXeH/rX0zwfjlGWiZFKxZty9khph1J3gjo9SH9dbPSYtcSEWb8GW
         ngVIP0D3pfWax2sPeMgT2vgtjDwt+WCAbljkgcvOQ9QxqIMkjNyNxBbFaS94IBulu5gL
         LtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443380; x=1752048180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgFaDugDrTNr1qllBEB2czmYTDrkllakFBrtkgwbdUg=;
        b=CyFo4jRvAJrX0CKhiHw6Jl9VhLd2xbva7s60p16Cq6mMLPvv/bUrUX2cBSyrd2erZT
         YAUDD5Zz1I8Lvlw5N6IdGudubrDBJ6b1xsyHTc739wf2Fqi44siAiqEmF/Wh662oc5DG
         HM9bMcS+6q1iEx87xWNmDc3/wdqXBMVS9mqC7KJnyu2gdz4FARFcYyGMCH9VBikzDRIE
         pTiS+4Jlj/rwx8Uv9fqmjhIBe4PbSMUTTvO+2UWOk6n5mYpfhRxbHo+nXpK3u6AccIS9
         +OcQsEARQXUU1erJsQhI7mxjhGCBs2w+wEAtpGSlKZrDncPNPs/qquu/eybtNUtO9JVA
         SpVA==
X-Forwarded-Encrypted: i=1; AJvYcCWZC5fP8lorG9JePb4UyOagv+z4nt5YFdLL4uDHSsTLTqQP49FrXX9Se5r305ERwAm4e11zhoKakYw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTv22cRaGfhP63+1DXwj+nq0Lyr8aZ4337F47IomfYfUIQNj3t
	RYat4BCPKxSoZTSBIvD4ef3AuZ5KYPkW1McpIMSwWR2dghthZT77niFbXjb/0gDY
X-Gm-Gg: ASbGnct3GZj59RL75axJNnbTbLrNe4S1GZ5nDntpGF85BmlwL4V/GwKObaxyLwEUfqK
	kDwgCYVuZweSgjH1lzUnV4khBPLj6cbkuvUBa0OD+HFq8zpKZNpRyMulJBdPJ4EabyiW1p87HtX
	A8XIz0FJRQi7+oqWU685lH+ZsI40SbciM1jJ+tyHTGw796oXdbVJ9sA0LacL1iLd6StCetVsn9y
	eK4W/5t6vIEzasrCGPmRP5iR2R644NZESY/GEk0EGiGLx9HQtKHiHStgCX0sNuv4ZAqRpeLPlk+
	QaBY+mn5aslac2XGQyk+SbNkG7ocUm5ErDSk2kRYKZcaXKO6XgKuWzR+JGCoTp86eCUaaklf8a6
	vJZWdt3zL+arUaXKYh+qvrMgrynaHgF+A
X-Google-Smtp-Source: AGHT+IHi4NOn49y7I9xWwftMlzal3wazSY9a434KghFoZe3qNhO3D7IEhjD0ok5Edxe7Zzc5jQUaPg==
X-Received: by 2002:a05:600c:c0c4:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-454a372ece2mr5565635e9.8.1751443379899;
        Wed, 02 Jul 2025 01:02:59 -0700 (PDT)
Received: from thomas-precision3591.. (eduroam-109159.grenet.fr. [130.190.109.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm194032485e9.13.2025.07.02.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:02:59 -0700 (PDT)
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
Subject: [PATCH v2] mtd: rawnand: renesas: Add missing check after DMA map
Date: Wed,  2 Jul 2025 10:01:06 +0200
Message-ID: <20250702080110.46839-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_090302_691154_EAFC28CA 
X-CRM114-Status: GOOD (  10.15  )
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
 drivers/mtd/nand/raw/renesas-nand-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 44f6603736d1..ac8c1b80d7be 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -426,6 +426,9 @@ static int rnandc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, rnandc->buf, mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr))
+		return -ENOMEM;
+
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
@@ -606,6 +609,9 @@ static int rnandc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, (void *)rnandc->buf, mtd->writesize,
 				  DMA_TO_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr))
+		return -ENOMEM;
+
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
