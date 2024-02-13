Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5213C48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gLphGWB/Z1Pn/quU/1MpTzJI5SLRHOL1g9dxC+zF8VQ=; b=t4acNIQWNYbXKU
	IJRF3EFkLJp2N12HF/uPpBQxZs1k9KXmrsUtHeTT/ZO+ZcNRk2eHQXfGKdtea19m+7pJbfXMDtUIF
	b+WaANKgQtrgAK6YDyKfOlIEXOUi7HnwnTRJLSZ+LFENsvHxm0DWieco/LwBi0DufG6e3ZmwsxReR
	LoGXvDmmjpBU/szG+GXQI6LA7OFEfMNyw27MZxKnexA4Uyfn86cGTTlGswRH4pbuyV5xoUOOPIPlM
	jvGfkeLudB8ThyHIJ/Hyn4VFNHxigfuaJDhzYBtG+DSlbyOlFmf1O0mmRyrfZZX23iVIizt1SMV5V
	KNpt4AO+hghUsb9TEukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpc1-00000008kCS-2rkh;
	Tue, 13 Feb 2024 10:02:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpbx-00000008k9e-2BzR;
	Tue, 13 Feb 2024 10:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DDADDCE1AAC;
	Tue, 13 Feb 2024 10:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAECC433F1;
	Tue, 13 Feb 2024 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707818515;
	bh=UU+zpA7I6z15NuI2JwEPZ/xh+eLMAyrqwwsqp31LEJg=;
	h=From:To:Cc:Subject:Date:From;
	b=Czb4jvH3IBvNqc4VVgfDnGhlWAHmrbg0er9XeuGRTRJyBYbX1aLruGawaJ/efSjbN
	 hvx3wypXmh45CQpK34csnhnhCrGdyiVZ5watoCo/kn1e8vUUhAPsI3NPdZqkhsqPFR
	 8LjDk5B483FVmf6LNZ3ctHxF2AwjQ6F4cgKbjl1YUdRG1KKMLi2rHQQFpxbv/lK121
	 qZUlVKOoNld+fAIHMdg1qe/44wJjux8c1gsbpy6uIVATHgdLsb8aIDVSext6PzV/rB
	 A/JqmINItFaOMmStnFRpOTMhI+s5xGAvrZUaZ5g6Alg0yCBFdWEjiwqnqj/hJSYd18
	 SfSeF0dZ3x38Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Roland Stigge <stigge@antcom.de>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
Date: Tue, 13 Feb 2024 11:00:09 +0100
Message-Id: <20240213100146.455811-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_020157_780033_757D172C 
X-CRM114-Status: GOOD (  12.57  )
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

From: Arnd Bergmann <arnd@arndb.de>

clang-16 warns about mismatched function prototypes:

drivers/mtd/nand/raw/lpc32xx_mlc.c:783:29: error: cast from 'irqreturn_t (*)(int, struct lpc32xx_nand_host *)' (aka 'enum irqreturn (*)(int, struct lpc32xx_nand_host *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]

Change the interrupt handler to the normal way of just passing
a void* pointer and converting it inside the function..

Fixes: 70f7cb78ec53 ("mtd: add LPC32xx MLC NAND driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 488fd452611a..677fcb03f9be 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -303,8 +303,9 @@ static int lpc32xx_nand_device_ready(struct nand_chip *nand_chip)
 	return 0;
 }
 
-static irqreturn_t lpc3xxx_nand_irq(int irq, struct lpc32xx_nand_host *host)
+static irqreturn_t lpc3xxx_nand_irq(int irq, void *data)
 {
+	struct lpc32xx_nand_host *host = data;
 	uint8_t sr;
 
 	/* Clear interrupt flag by reading status */
@@ -780,7 +781,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma_chan;
 	}
 
-	if (request_irq(host->irq, (irq_handler_t)&lpc3xxx_nand_irq,
+	if (request_irq(host->irq, &lpc3xxx_nand_irq,
 			IRQF_TRIGGER_HIGH, DRV_NAME, host)) {
 		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
 		res = -ENXIO;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
