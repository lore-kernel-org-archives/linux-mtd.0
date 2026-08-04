Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C44C55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvfa1NaQ+MC2vJ1seQOnJBNCWut8ugPbnFojKhDNe8o=; b=cw2JbiAx8yPZx5
	GJUE4xIAiiycj56YsfJ9maQAp+l6szD5SgcCJRvO7RyzFsjNy90MDX7uwOa9K6sS1MIEFQZQvMwl8
	yfNVPpKzUZcMchKMaI6jEsTF17tn7jJB3Dm2oOHCquNa/il5tg6pCFFiAmS427dxJGMRnIPTzPNyx
	NS8SRmjuaQlu48DC+IPMmSrvAiNii+W/RJQOa6smGqIcG0QEUDGZcVjERSU+ipUqOCAkhlPEiTEYw
	XWEpyWU0s5txo+qn0cBMd/RT9vsUbRNsadGL6FU/M/smv9cr1+ID+DkXjqzb5VmRK1p25sPonSWP7
	ALxd+q5fnYiUNgLdCEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlA-00000001zzm-2L9R;
	Tue, 04 Aug 2026 14:04:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl8-00000001zwN-1mQB
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L9X7UsI7IpXNBceZj9vA3jt5/zF98CUIbSi7P/uESNM=; b=b36Kl1mIdw8mvqh81rldSp7hkV
	M+9Zxe0+6TrlRrkidU+yl7g9LoEH+WA2VaXUrDhAsVBM/UmXvtMh8x0R3tdgTJPVpfk3eVzphgWaW
	3L4vg4w6gOJ7hKxIpp2Cne4FBm6Sf8LA2Z96pUAeZqjC95gEEFx4Rp0YefoGwv2sYdz8o90xZOkRK
	t1j28li22+jK5cDBf9U5ufyr+nP4KZNLFaH7dk18SX4qExn6Edml9SuRfITFd3XCm3KdD/K4ch9ft
	Zcx/KwwdVJizOejDNvdksWlQsKVLyNixaGUm2alj6Nuwk9H17tnGuF0DRYT92mopGJXqpqZKjK5/Y
	KA9liE6w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFl5-00000009yIn-1MLT
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B505B1A13FC;
	Tue,  4 Aug 2026 14:04:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8725F6029E;
	Tue,  4 Aug 2026 14:04:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A474B11C32D2D;
	Tue,  4 Aug 2026 16:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L9X7UsI7IpXNBceZj9vA3jt5/zF98CUIbSi7P/uESNM=;
	b=NkZIlBMD/l/vOTXxgLaTeZ1eq6YTMaI40LLd7VjKKJgSDg8NrIVefHa5zWyI14QY6q61AH
	HjGHBq78VPoKYB0b6MOieYUtxZUslw761Q4kJysPGgtQaTnuXHff1qzMRpaAuj+hMoY5UN
	5VePKYDxiBRSHqnCt5Oe2iZKNiyIWejDZWes+G7W/3VAoV6r50eTzDR9ZmlIX9UnQzicfp
	S7JBNKVrC/bRa8Rpl7fa5hSA/uWOEy710m1gZBuYFBN0lV4pbpjsSLULC6XPgnphtU1aP1
	RzMknrptWE6F63PXTogkuXROVhjTf7oxZgN1z/+gaOWcB1Qd9HeDTsSq2Empug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:31 +0200
Subject: [PATCH v4 09/28] mtd: spi-nor: winbond: Make the RDCR fixup
 Winbond wide
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-9-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150443_818669_2E25404C 
X-CRM114-Status: GOOD (  18.15  )
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
 drivers/mtd/spi-nor/winbond.c | 44 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3e8e89058b8c..04713ab04d01 100644
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
@@ -313,7 +293,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
@@ -399,7 +378,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
@@ -415,8 +393,13 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
-	},
+	}, {
+		/*
+		 * Catch all entry to make sure all chips solely relying
+		 * on SFDP still go through the manufacturer hooks.
+		 */
+		.id = SNOR_ID(0xef),
+	}
 };
 
 /**
@@ -508,6 +491,19 @@ static int winbond_nor_late_init(struct spi_nor *nor)
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
+	if (nor->id[1] > 0x30)
+		nor->flags &= ~SNOR_F_NO_READ_CR;
+
 	return 0;
 }
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
