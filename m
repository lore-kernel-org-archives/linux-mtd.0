Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35908C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gutYQuq3ydAYZP6O14+avl4bxwZHjxBPduhdzCQtZXI=; b=xNSMcB5crZs07u
	xhLBjlPl73FVDhc1h1lrmcgL6J8xZFq62YjmW9AbsfdW6o/Z6MXjcajKeCi7wTmJ4Ph+0sVY/WV3W
	26UVnB0Tb8Up5QtdS4vHirHy+ut1GaCtZMix3R5DlFN+LkVo525feJJpz/yXjrqB0nvqqRf0RJUG8
	hKE1Yl23PTfBrzzAdt5j9jOMoVo0i6GR9keOom/GAQjpEsAqCkj2Lgs1trw0ZtwMGldaumV0UcyKu
	hE20bWMqMjA+kfPLy92A8aZhLl8vS3BMjx4GSGCRoq4BXXiLEUi9ZEWq843ZgWiR5vkExbZG/yHOT
	3S+mApfLVEAmz4yOdQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5A-00000003fnA-2gFw;
	Mon, 17 Mar 2025 18:21:00 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF58-00000003flu-1C9u
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 18:20:59 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5e6136633b1so4534988a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742235656; x=1742840456; darn=lists.infradead.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=78VRu6+9psP2tn8WejDwRNX+ffhQVxd9hB24F6U+zQI=;
        b=FfFrClaeIUqbw/flZsS+A1mTB1nYWvVYRZdUmv20OMUYa8JZn6U9TfymG+GnOa/fmq
         TcBRUdS2Zg1Gvbl3n7LAiWFmXzlv+L8f/dPetF/UxdD1InM6F+C0xk1eZ4PSpLaEibri
         imQW/2k8hjDcrjWDgJMsXIj4cnaKuzncJi2NRS7Yb3ZQPIfZCugYHpzRih4sbGjZG3N4
         k7AawqGQN1P/aJF0FnSB6aoooBG2xc5lnAkmpeG40tbMjul9DwdaVfeBo/cdljFrjP7i
         CTxfgKmAL4ZMDhmA3wSOOkYoGF5yj0yVBZnnuy6aivq5d+3d9A3lrMABDdpAMzhiq7HT
         dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235656; x=1742840456;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78VRu6+9psP2tn8WejDwRNX+ffhQVxd9hB24F6U+zQI=;
        b=r4Ihf2bHzqXCf2xyfx1y518kD5Ie8Yoy5yDkulJdekUta55XNskVggvU9rt21n1bjc
         8P4BQVnYzyelupn6sSAqra0Z9NO+iSjGl/B8ij65Xu8H4kjJgg1EjsqXt0KpwreDp+dU
         3q8GqyjBbvkYowvUgQMKYDkCkCFaz4OWrQ847EjD0Ug8TXq1an0suSMwSEsxKERZZjhA
         +tnAfPuXtgdg37TZQGBcHzD/UYVPxGUqQjdNraISt3ux7Fkf1D/RNe2R9Fr7qOIQMk9Q
         hzqt80/sj7h9Yl4X4gJ1Bd8Y8dwyL0TOk4dqwxrXcD5XZpFPYvvkyTz3x1Tt0LWuSaYy
         f7VA==
X-Forwarded-Encrypted: i=1; AJvYcCWTCk4oNzfTx3f/BfZvkCutHv/lZlwQz5wWoIoEIEHCPxU72U2+M7oDEURZUNQGPssRX74+wkjaG+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUaS6TyKnGFmbKwCOMzXrDS94+6guPqkHmfzYU51M6wLt58ZmL
	YmY3Rsysh1Il77Zp5Ak4nYchcV06v/nDsLlCq1DanZJ3JAv+Njpr12LRCg4TOmF7RqUfiih4xNK
	gSTRiYQ==
X-Google-Smtp-Source: AGHT+IESE69/iddcPk7ehPy7NsOJmNhG1D3/pIzqBBHE1LoGJdUPkmqYoQ6QIm5bo43o00RoxkTuy8sKiOiK
X-Received: from edbel4.prod.google.com ([2002:a05:6402:3604:b0:5ea:815a:c43c])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d4:b0:5e6:1838:e8c6
 with SMTP id 4fb4d7f45d1cf-5e8a032c2b4mr13262186a12.22.1742235656080; Mon, 17
 Mar 2025 11:20:56 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:20:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317182047.2060036-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: gigadevice: add lock flags for GD25Q128/256 and GD25LQ128D
From: Jakub Czapiga <czapiga@google.com>
Cc: Jakub Czapiga <czapiga@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112058_321051_19A497C2 
X-CRM114-Status: GOOD (  12.14  )
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

Set appropriate FLASH lock feature flags.
Set top-bottom protection configuration bit flags.

Modified chips:
- GD25Q128 (+lock, +tb)
- GD25Q256 (+lock)
- GD25Q256D, GD25Q256E (+tb)
- GD25LQ128D (+lock, +tb)

Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..8eec6557b036 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -16,6 +16,7 @@ gd25q256_post_bfpt(struct spi_nor *nor,
 	/*
 	 * GD25Q256C supports the first version of JESD216 which does not define
 	 * the Quad Enable methods. Overwrite the default Quad Enable method.
+	 * Otherwise set TB to SR(6).
 	 *
 	 * GD25Q256 GENERATION | SFDP MAJOR VERSION | SFDP MINOR VERSION
 	 *      GD25Q256C      | SFDP_JESD216_MAJOR | SFDP_JESD216_MINOR
@@ -25,6 +26,8 @@ gd25q256_post_bfpt(struct spi_nor *nor,
 	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
 	    bfpt_header->minor == SFDP_JESD216_MINOR)
 		nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	else
+		nor->flags |= SNOR_F_HAS_SR_TB | SNOR_F_HAS_SR_TB_BIT6;
 
 	return 0;
 }
@@ -56,12 +59,12 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x18),
 		.name = "gd25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_4BIT_BP,
 		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
@@ -80,7 +83,7 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x60, 0x18),
 		.name = "gd25lq128d",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
-- 
2.49.0.rc1.451.g8f38331e32-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
