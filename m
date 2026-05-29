Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB295CD6E51
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha5Aa43wYpzwE8XcHuyhp0OE9u3GpSvcUp61WVJ/fqE=; b=DOq0V+oEaQYxRK
	nWfEfEgKxRNUe/k2ZD1y5Z0qmBfkHA82oEvKC2G9ji5XhTU4WZ1vo8g2AppZXv5E/x9/YmuEDbY7/
	gg4I8UNyynGG1zqNX+sGQ79rGrj0mxJmHrO881ddJYJ3BBv1j+GeUfN9+jutLKDiTEJ7VECyL3is1
	dxZNNVsEL2WY8dnHS9mVdbs2GLrjdSMtOArVcasU+nSi0h+bUpaLA94+hRPd/raGykUp0FLQsLgcG
	pZbTcpo2GYef+Ln4MjKeWyUM38C3cU737pDLLfd1fv90LClesHeGmyvrMtSBIrchOMHT8MLaHnXxh
	c4EebhgsVpI0IZ5Sm3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2y-00000007fEZ-0AwK;
	Fri, 29 May 2026 15:22:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2u-00000007fC2-3YA9
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72A651A373E;
	Fri, 29 May 2026 15:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 427C0601FA;
	Fri, 29 May 2026 15:22:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5200210888CC5;
	Fri, 29 May 2026 17:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zfcbHM1I+Z/L5dUZI06zqivIBztBH0ONPJKZ+7bVeME=;
	b=lOCqB7wE1j60fsyUmJVuC8kV5mJ0Ipw6kDUBIO5S6DRmrDft4wberfBXijZxP4C5LHPFNl
	Pj2joHdiTmzHCFCL2+2gZreGUlZWptkGh+dRAhX7FiJYaB8o4cssTvZ3wX/aVyr583tO6L
	MIggtdAFjgZxq/xDZiRlZ4rOHc1heWOmE32UVveKk7ke3Lo3IbAPRVOoYuEsa+1QJg51jn
	X5Y7iw1I6BQEIbApaw21OSe+vSFMA4ZAw501RXURNtjnu5pslBFXjX2iEih7mmRXG4yaPO
	nMrQL0LSVvT9MeT8l3k7fL9QhpCaWsMxa9XgVs2z9rI/XztT7LXuaBCdCHW1Gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:24 +0200
Subject: [PATCH 04/30] mtd: spi-nor: winbond: Make the RDCR fixup Winbond
 wide
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-4-87e5d3122244@bootlin.com>
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
X-CRM114-CacheID: sfid-20260529_082249_026008_3362E54D 
X-CRM114-Status: GOOD (  16.72  )
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

The top level paragraph of the QER field in the JESD216B mentions:

"In this standard, [...]  Status register 2 refers to the byte read
using instruction 35h. Status register 2 is the second byte transferred
in a Write Status (01h) command. [...]"

Value 100b, named in Linux BFPT_DWORD15_QER_SR2_BIT1_NO_RD, does not
mention anything about reads and only brings details about writes.

This has been interpreted in the spi-nor core by the absence of read
capability, but there is no explicit reason for that, except that there
were probably some very old chips which didn't support command 35h.

All quad capable Winbond chips carry a CMP SWP bit in SR2. SR2 is
readable with command 35h. In practice, all Winbond families but the
W25X family have support for this feature, so re-enable it Winbond-wide
in a late vendor fixup, except for the {EF, 30, xx} family.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index b4088fc5fde9..4300f0419f13 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -73,26 +73,6 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
-static int
-winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
-			     const struct sfdp_parameter_header *bfpt_header,
-			     const struct sfdp_bfpt *bfpt)
-{
-	/*
-	 * W25H02NW, unlike its W25H512NW nor W25H01NW cousins, improperly sets
-	 * the QE BFPT configuration bits, indicating a non readable CR. This is
-	 * both incorrect and impractical, as the chip features a CMP bit for its
-	 * locking scheme that lays in the Control Register, and needs to be read.
-	 */
-	nor->flags &= ~SNOR_F_NO_READ_CR;
-
-	return 0;
-}
-
-static const struct spi_nor_fixups winbond_rdcr_fixup = {
-	.post_bfpt = winbond_rdcr_post_bfpt_fixup,
-};
-
 /**
  * winbond_nor_select_die() - Set active die.
  * @nor:	pointer to 'struct spi_nor'.
@@ -305,7 +285,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
@@ -381,7 +360,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
@@ -397,7 +375,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	},
 };
 
@@ -490,6 +467,20 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 	 */
 	params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
 
+	/*
+	 * All W25Q/W25H chips do set the BFPT_DWORD15_QER_SR2_BIT1_NO_RD bit in
+	 * their SFDP tables. The historical spi-nor assumption in this case has
+	 * been to declare CR reads as unsupported, whereas the Jedec
+	 * specification doesn't clearly state that. In practice, all these
+	 * chips do support reading back the CR, which is needed for SWP support,
+	 * so make sure that capability remains enabled (needed for SWP).
+	 * In practice, only exclude the old W25X family (JEDEC ID: EF 30 xx)
+	 * which actually does not support this feature.
+	 */
+	if (nor->info->id->bytes[0] == 0xef &&
+	    nor->info->id->bytes[1] > 0x30)
+		nor->flags &= ~SNOR_F_NO_READ_CR;
+
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
