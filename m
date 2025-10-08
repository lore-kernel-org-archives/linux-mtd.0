Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC236CAC5BB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PSCL/8zkZ5wab1b9Do/36kumWWBHZ7pYxbGzh8OZySo=; b=dKrmImU2cWkb28
	7A44/pBv68/Q1C89inyWZgGeXZYi5rUBDAZ47x8SAJf8tbhRd05DCyc58/2PK3nFtBr5yHvl+3NYy
	HM1XU0Lx60PlTlqCv7pbOXQiiYg20uIiSeYr4QroXZOeyRktQH9pPSICVWF2DIL+SLkaREmZz+r+e
	Pr8djW2KkZ9l3IUfyAE1op5DghZdF3ge1ONpgK/61GBbrZV23vnSXOiWi9u03mnWJRh6VDzL3wbgX
	lO2aCuULql67AxrYSDEn1mVBT09tAx4v40NbMIFLd3MI1wLpFkA6WJdLNRcFCWhIeZIJjKof2Cha9
	iIV6GOTvRSOP9GOqgrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QlX-00000003aAv-2ZrV;
	Wed, 08 Oct 2025 09:47:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QlW-00000003aAp-2Xtt
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 09:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B229160010;
	Wed,  8 Oct 2025 09:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C89BC4CEF4;
	Wed,  8 Oct 2025 09:47:19 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: nand: MTD_NAND_ECC_REALTEK should depend on HAS_DMA
Date: Wed,  8 Oct 2025 11:47:15 +0200
Message-ID: <5109cd228940c246d2e1ef4ff01799315601c285.1759916792.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

If CONFIG_NO_DMA=y:

    ERROR: modpost: "dma_free_pages" [drivers/mtd/nand/ecc-realtek.ko] undefined!
    ERROR: modpost: "dma_alloc_pages" [drivers/mtd/nand/ecc-realtek.ko] undefined!

The driver cannot function without DMA, hence fix this by adding a
dependency on HAS_DMA.

Fixes: 3148d0e5b1c5733d ("mtd: nand: realtek-ecc: Add Realtek external ECC engine support")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4a17271076bc1c4a..1e57c8de857825d7 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -63,7 +63,7 @@ config MTD_NAND_ECC_MEDIATEK
 
 config MTD_NAND_ECC_REALTEK
         tristate "Realtek RTL93xx hardware ECC engine"
-        depends on HAS_IOMEM
+        depends on HAS_IOMEM && HAS_DMA
         depends on MACH_REALTEK_RTL || COMPILE_TEST
         select MTD_NAND_ECC
         help
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
