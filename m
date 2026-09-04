Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDD4C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOeJqCQK1/eTkO+wIx1QQVG1/YzL2CQrqPcnmDGBHdI=; b=T+sOMOQny5JfrH
	/PCs/TVM0d9V7t2UrUEPFR1m23Uc2jiuLZ7DWCu8B6OZo7Xf8r3vz+vAa0QhWo6v7jYHgmRLYEkA/
	aVGadc8q9VVy4MRKxx5lYWEd455RXKpVBvCsQ45vyTuX0WCaxHF/MmNCVfB6R0CqYCFNLQVxEZzpW
	WfJ3v3gefitpCtfgu11aCRSDY/Uu4mVOjQsM5XWZ2pdAdiECogVQg0SlrSjGgihBpukCwIc/8q2SG
	we8MX7hMbvtdK0F04SbKjbMljO7bR3DpHHsrKPQr22rqDKdnoNpK1z5o9tjOelyZUo+q17zl3P4Sp
	Oe/o57tpv+bh+T98JwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZa-00000002qrh-426v;
	Fri, 04 Sep 2026 17:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZX-00000002qn2-3cqH
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Ce20Jfpvb9YhNbBbIHNXF9lv/kpDC0mkSZLA1+S3ks=; b=eoEnxkSsgMpISQnc3RUdgL3uNt
	WjlNXE0gxMiytojy5TimJUQHSRVjLXGfCTftOrdddnq+wF8+nkt9sEcaotJgfEDtsDI0fkRVPZVxY
	UiC4tFE9wfJVGLXSNI5RlsXh1DuW+fuAMz3yEunyFUh/XD0JBwWBQbjc5ntdWhVBkP1HrZbi6fHty
	XYBz9SbZN4UAwWDsGL0MW4jf+VIewthaAKMly82QwMeUEXlB+XpxmuxP1MazKZGr5SUGfQYgxqO+l
	3WYR4Dyph4XfdOQMgX0Z2OfqSlU2OA3e+XLS+GrpAlBJyMgim9Ol9xkJC1NPldoCcJohdO+Fl5vDu
	9XE0L3sA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZU-0000000EKrx-2SL2
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 047F81A19B0;
	Fri,  4 Sep 2026 17:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD5146057F;
	Fri,  4 Sep 2026 17:19:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07D0811C78767;
	Fri,  4 Sep 2026 19:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Ce20Jfpvb9YhNbBbIHNXF9lv/kpDC0mkSZLA1+S3ks=;
	b=o6IivGG92hP8fUYcAiVo15f9FVagdtynTs0OlAxJ0hfQ0AK/P0r/Iycd9/IVMHKcuCg26L
	hq0oA64AUsLL/U1b+0TrcDKJtGh/DjwjB5s7yR13IBFF0s/obHkOdVoD1yxcZegk3ytsY3
	1pV4mHb1KWzDnJCa06Bvz1ID/jWNA/pYFl1wzhS90P7BRilx2f5oBXMHgd8Pi0najrzLJr
	Jng+V+PMroNw7sQ1JLOYPZqdw1DFw4XCWtcY5HUxqbmLn1c7SEbM+fEmQqyFeTndm2aBUy
	kGOY0rpJqzAeV1Y3y8w6XOJzB3A7268YROXZbj3NdCyujfNBOXk3LJXKMnz2yA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:00 +0200
Subject: [PATCH v6 07/26] mtd: spi-nor: winbond: Make the RDCR fixup
 Winbond wide
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-7-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181924_930218_CAD3AB0F 
X-CRM114-Status: GOOD (  17.75  )
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
index 1fd05a3f743d..acd3c38ca2f4 100644
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
-	nor->params->flags &= ~SNOR_F_NO_READ_CR;
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
+		nor->params->flags &= ~SNOR_F_NO_READ_CR;
+
 	return 0;
 }
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
