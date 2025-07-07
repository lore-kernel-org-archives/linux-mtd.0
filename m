Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B656C83F0A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jul 2025 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3/sBwQcweTTcBQAcOFvqBacYw8XM+NYu/Q9iGaFlMJc=; b=jLc569EogFqlNW
	53vVmuSSxA5dNiT2oq6/Vcy/z/cNzv8/Uvj74MIDMC9KjTRHdHfpmzuwvfde2V/w7sT6wuC8edtT5
	Osu9GOySjQ16A3eMxF8PXRr1sbEFDUNS6gJ6FrOQNwFhtNt4D7MMxURx18tXUV7yG4VnuHqj0OWBX
	a2G+9I6swlGnG/BK7XyRSZVsIovg7KGBPhBdxKfMvFAR9IVV13lMBUyAYHqxh7JcUyAFvfUI9Vtgu
	aWJyRERP6ng8VFSADjjkWY8e0sYoqdubmdNHpfMu2T4INCp/cg0IQBksgMjbTMrNlmd5XjKcz0QZL
	T9F9ZJwopvExA5U4BMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgO6-00000001i5r-0orn;
	Mon, 07 Jul 2025 07:35:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgI0-00000001gZs-2M22;
	Mon, 07 Jul 2025 07:29:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a524caf77eso401313f8f.3;
        Mon, 07 Jul 2025 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751873362; x=1752478162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7BZqFkfOFsbvgNq/dMOXUdgZS94yQFfuDJDCmTrvc8=;
        b=gTApZrtvQ0duJdvXEKQZICgFyVeHopPU5tW4oJq7JwkG8pGasTueAlFtNbNIsGlDD8
         +ce68mCf8QIscDizJPXANUlxHgy5klmrCLOGZxpAuiQ19IjrxUJdUxK30VFXCGiQ+7dP
         T52oD8DFZDm7ONH+dD3iSPBBFOk0f4PfDPY8ejJD9lnA/llLYXHPrOD5Yy2/6MIrRG6X
         K882cD2JiCLZsZjPsUsCwYcnjh8oAJnMWyIXaIlQ8hir1qUjlBUk/UW1h14dqwe0LKUB
         NUy+nKeayIOqS1eWya4QXbaM9AJI8LG7q3bfm9X6Yj5fYhDtZluU80XsJPTuwZ3YDsuh
         3dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873362; x=1752478162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7BZqFkfOFsbvgNq/dMOXUdgZS94yQFfuDJDCmTrvc8=;
        b=BMeibVRrBpVdVZ0ukqBIH2wUcOX2C1ng4DoSPrMW97ce9/ZyUHpSjPJjdEQoD8/AvX
         0/urrQ9CjiGbNfpU06Y/Xva1R5cltlD/4bAtdQvnYv0OTLJJQMYX3+I+P6mqV/mxL0tH
         maThs6jPuWnXBv3MmGjvARW0J98JuYYslGPZvySMbR+9NAPG48aJM1Y/orewKzgQ0wdZ
         FIBudzwFTFOfIL6reWGwGZYPpZ5238IERNzbbv241n5hC7VV+Sjv8cUlwS/yLwSGihRM
         xUV6a6nGH07/DgBAZioi87f86SWhu35e0Jq/2VA8LqZWlkAGHt6aNqXkAMx3Bm4uGToq
         BXww==
X-Forwarded-Encrypted: i=1; AJvYcCV6paq2Vz8MfKT+6nPXjk/GCpYaHiAxD9+Ph6eDL18E1e7zNYLIhv8llYMbNxziiPir+4rFZ9Ji6i9pGINId28=@lists.infradead.org, AJvYcCVpIJ2yNXIz4+wn5IHcU+qmhuF4JLIP5thmMqFwaUznxCA7jw/D4Sty8Lv89P8bYtF11f3fqqdJfAyifd8IbzW7@lists.infradead.org, AJvYcCXvcv1mCQZ6GcrABpnJbiP+j+uEbpknl76nuRiocAXTiv3UVVXEAe/yDwll6pN4zUlhR9kC6Xzm82Ir@lists.infradead.org
X-Gm-Message-State: AOJu0YwTsptziWM2u36EAmpWF/sZ+5N0UubzK06Apl6ttyn8tpZxTqKZ
	0ZhXTBnP2Bih1GgRrZm9+74eQ/lmhQ1ANHg4oK5wWHU9fYQO5qNj0S8D
X-Gm-Gg: ASbGncvCZql0xEGvDQXtG3A8tyYJdtTBuJhaJ9TIazl2S9kXrMG7ODXxMoWQz3uJkFX
	520QjiRwHkY64/1fwbqyOPCnSQ86Ugz565gpVqFfcrneUuQXM2QXh7WOIQzaWb1fFGv637XWaOZ
	45gEKvcrxn8nkXz7ra4vKwcOb6s1rhrkTQB8DCqt+4BiNuJ1JawPA3cIrpVUe9RljXmwyC4gOnu
	zQsVqjsl97Bp/e8pwL5LjO06OA1z3zzQJdympDK47VzVZYhu+Q25ttgPmFR0z95iyxbQenPINvB
	KOvEXuJJZGnQMIukHVyOYImTBAYGOOmQ6gkXK+i+mWTcVd5CbEksDrd8agBbg8l5IeRhPaeduLy
	cyq3s9rkiswLPKSY=
X-Google-Smtp-Source: AGHT+IHji7PN/GJFmbMU9res4F6B0DmJU3BUQZ93VGwv1mxSzlZuoVKlPVnXhlUOtz7ZsOT9N7jXRA==
X-Received: by 2002:a05:6000:4007:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3b496604c59mr3115795f8f.12.1751873362269;
        Mon, 07 Jul 2025 00:29:22 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:ef01:c9dd:1349:ddcf])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b471b97f10sm9478350f8f.57.2025.07.07.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:29:21 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: rockchip:  Add missing check after DMA map
Date: Mon,  7 Jul 2025 09:15:50 +0200
Message-ID: <20250707071555.17704-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_002924_601573_4169AE73 
X-CRM114-Status: GOOD (  10.34  )
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

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 63e7b9e39a5a..c5d7cd8a6cab 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -656,9 +656,16 @@ static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
 
 	dma_data = dma_map_single(nfc->dev, (void *)nfc->page_buf,
 				  mtd->writesize, DMA_TO_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_data))
+		return -ENOMEM;
+
 	dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
 				 ecc->steps * oob_step,
 				 DMA_TO_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_oob)) {
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
 
 	reinit_completion(&nfc->done);
 	writel(INT_DMA, nfc->regs + nfc->cfg->int_en_off);
@@ -772,9 +779,17 @@ static int rk_nfc_read_page_hwecc(struct nand_chip *chip, u8 *buf, int oob_on,
 	dma_data = dma_map_single(nfc->dev, nfc->page_buf,
 				  mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_data))
+		return -ENOMEM;
+
 	dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
 				 ecc->steps * oob_step,
 				 DMA_FROM_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_oob)) {
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize,
+				 DMA_FROM_DEVICE);
+		return -ENOMEM;
+	}
 
 	/*
 	 * The first blocks (4, 8 or 16 depending on the device)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
