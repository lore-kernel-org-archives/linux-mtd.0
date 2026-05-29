Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD5ACD6E55
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MqO5dHgigm40eyEwTZHXSkynu8C8lBrj8jrIXZPFqo=; b=TlcjfuPXmSDakZ
	wXWfViFP+PnfpQc3fHjAWr8b3LaxC0QvVMYn6vrfGY1/RM6J3BE4I9vNnD3/gV6L1Hd70Jz1qEwUK
	sxEXL55WO9bQR5FyEi7hciVmueC3U/3zR3ZoYaqJb76gGj2+A/o2r+JOgoLD7wD/HIckz8/PXH7Qo
	IGwggi3ELxjEA9ZmmoZGBfEjvGMHOcEKiVcpOWhuU+jEf08einx2MDnF8OmNHYWLiBknsQjs6MBc2
	Vv3B4pRjA0iI/7UsLuPyQBB2afqnXs6mHBwxAZhGUDcRNganl7c2RsfE9U2oO8uTB7rZwMbPrQrSu
	u8NA3RtFvLCdTnvSLWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2x-00000007fED-3waY;
	Fri, 29 May 2026 15:22:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2t-00000007fAU-2hFE
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67B374E42D90;
	Fri, 29 May 2026 15:22:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37F1B601FA;
	Fri, 29 May 2026 15:22:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4444E10888CCE;
	Fri, 29 May 2026 17:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Y9TlqfU0Z0fyu+XO5hTI39zjYuD6nXwQm3tYZOcRa4=;
	b=IyST4XObi+yOrdnSEpIdkGlPl/IUy2ocERGMgSUI+ua2IysKfpoYDnqCZMjJ+zjGlpIsGI
	7jk1glsUJu5sNnQjv3GOrAADiZgTg3gplRYLd0JXcigFarz2NSFJuOY7Jdnpo8ScUk7CJS
	Dxcvwp9XFhC8m+oXl5NQ8FDxzs3HYi4drAtRxjyOZT57koT0jGv54EY9iV5Ta+uYvZ9K0U
	BJ4RhqMffE1YuN8cryrxjIBaZ9wCZxX0baHbCQFGGWL0hIf0vHurgdheMHM29knzZ00iJi
	asD4IKzOHQyzh/4hxP1WegD/a1QFfn0mv/42V9QRlwpfXF/LCunxdmNa3/lIHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:22 +0200
Subject: [PATCH 02/30] mtd: spi-nor: winbond: Normalize names
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082247_845826_F1014F37 
X-CRM114-Status: GOOD (  11.37  )
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

Winbond chips cannot just be named eg. "W25Q02JV". There are always more
letters after that name, some of them matter.

- W is the Winbond prefix
- 25Q is the type of device
  -> 25Q indicates a quad capable SPI NOR
  -> 25H indicates an automotive grade chip
- 02J is the density
  -> in this case 2Gib
- V is the voltage
  -> V means 3.3V
  -> W means 1.8V
- The next letters (either 2 or 3 letters) are completely irrelevant for
  the software and purely indicate the hardware package.
- The penultimate letter is the temperature grade
  -> I for Industrial grade
  -> J means "above" industrial
- Q, N or M indicate factory states (like QE=1) and also the DTR
  capability.
  -> Q and N typically have the same IDs
  -> M chips typically have a different ID

As a result, W25Q01NWxxIQ is irrelevant and would better be named
W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
etc.

Make that list uniform before adding more IDs/names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 662a022d36e7..03e59ff3228f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -301,7 +301,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIQ */
+		/* W25Q01NW-Q */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
-		/* W25Q02JV */
+		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -372,28 +372,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIM */
+		/* W25Q01NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q02NWxxIM */
+		/* W25Q02NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
-		/* W25H512NWxxAM */
+		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H01NWxxAM */
+		/* W25H01NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H02NWxxAM */
+		/* W25H02NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
