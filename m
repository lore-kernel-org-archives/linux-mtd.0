Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC2606A332
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lcb0NXW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T27uX+Mn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S3dQWJDscU7vemwmTRwC/5ueQb46UG17LxduRha8ooI=; b=4lcb0NXWlcvV222Jv/okgp/a5t
	xsNojPcoofJ/wVRs3lqviKZVaAcFKdEKCU829tnN+FS59WTPQSx3s/+jMgl1GaDg+Pnfyk8p8ycKN
	uJC2skeaDlxlUeMouC5TgsnoOPp+Hkot8X5IyHyTWyWQwkQeW3rafAwyCvViE1d1qTRXLiDTqtjZu
	Q6KBqzkOJjj9Zw/8n00YigqbxY1FlByDNzp64P2cn8Wna79QffpIBbqjpPc+3+uZJn/yq4mrYvc7D
	lAdMTlG10Y6SP9TKM3Ml8DZC6lXK9eZIH8ocrsxj2L6yx9EByyRDw/V4f5oB+XphNGk7ubyHPWySM
	CPL9wNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKH-0000000AvZC-2HRg;
	Wed, 25 Nov 2026 18:02:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKD-0000000AvRk-1Ja1
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A14A11A17FD;
	Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA2760480;
	Wed, 25 Nov 2026 18:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43BF911E6B0E1;
	Wed, 25 Nov 2026 19:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KTR0ygwIoRmaPIBtyiX7BsdvTJ5z0Oozx9s5oZ/qdZY=;
	b=T27uX+Mn8UOU9tXDuaK+KU/6KYJRU+av+lU9nCYfeKU0T+QrFPvz4qAXoDdtJBujWlBlln
	Ss5hkIY0KNaXEvPj5Xqq2oJcAqnpG88UTxcKc5DYITiujimmN2JXRROHLAv7ju94NKtb7l
	JLD197IJkm7YPbMzhoLYUtP1RecTLNIMZvDcl5xmUbGulkUDG91zMZNWlVVskBlcvJRaZx
	8piXZCm5mFRPMyJSxufapJx/tNH7Yh06lBvtTY3RYBn2XLyRAxXKso2uTVS2W7WTGZ2ky8
	1EjzFrt2mdR0r64wWK5sdIhcGX/N+SZgccJKouBg8Lg27ZZS71/fVSllIJDhNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:37 +0100
Subject: [PATCH 4/4] mtd: spi-nor: macronix: Describe locking support for
 MX25L51245G
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-4-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100233_501299_45E2CCD6 
X-CRM114-Status: GOOD (  18.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MX25L51245G, MX25L51273G and MX66L51235F share JEDEC ID 0xc2201a.
They have the same 4-bit block protection scheme as the MX25L12805D:
BP0-BP3 in the status register. Their Top/Bottom select bit is however
located in the configuration register (bit 3) and is OTP, which means
TB choice cannot be supported as-is and would anyway become
inconsistent once the TB bit set.

Read the configuration register in a fixup and enable locking iff TB is
cleared.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index bbc41af14882..87fdbd6c3800 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,7 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 #define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
+#define MXIC_NOR_CR_TB		BIT(3)		/* Top/Bottom select, OTP */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -86,6 +87,37 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l51245_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * Locking is optional, so leave locking disabled if the CR cannot be
+	 * read (e.g. the controller does not support the 0x15 opcode).
+	 */
+	if (spi_nor_read_sr2(nor, nor->bouncebuf))
+		return 0;
+
+	/*
+	 * MX25L51245G supports locking, but TB bit is OTP. Since a TB=1 bit
+	 * cannot be supported with the current software, prevent locking
+	 * entirely in this case. Also do not advertize the TB bit at all to
+	 * the capabilities set consistent.
+	 */
+	if (nor->bouncebuf[0] & MXIC_NOR_CR_TB)
+		dev_dbg(nor->dev, "TB is set, bottom protection not supported\n");
+	else
+		params->flags |= SNOR_F_HAS_LOCK | SNOR_F_HAS_4BIT_BP;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l51245_fixups = {
+	.late_init = mx25l51245_late_init,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
 static int
 mx25l3255e_late_init_fixups(struct spi_nor *nor)
 {
@@ -400,7 +432,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .id = SNOR_ID(0xc2, 0x28, 0x16), .fixups = &macronix_rdcr_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &mx25l51245_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
