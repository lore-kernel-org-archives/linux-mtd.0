Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EA606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BmGFxUIQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1AOuqAUb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N/veDTXdhwEaCR91bX/wE6ksaKACiQ2Q2YufMyhPL44=; b=BmGFxUIQSUwhp6kbW9aBx6FCHQ
	cOJZi74foVIfISc+DJyfTEvpLy4qiaFYUN1SRyMQ4IhO4EHaHmS/8qli+86fE7CgnMkxcwi70BqAI
	ucSlt3TUqn/S8xgaPBEwprxrpuo3qStuf2v0bF8F5O7ajPA/L26rHHfNoBNQ5WQD3uXzCZ0JSh/qR
	fg7HCFrpM/BygWOvbQmxACHlprTJ55IWuPBlNLxbc5GloIN1oklDogamp1FJpbWsR26mMu5cilw76
	PuJxw6vRIvBP+95NIWqx17bCapuGH4HNKV10lKAKU0Mw0JLIqoBXbXIfqheOfpMPMF4Z2wLbP78DT
	5v6HWzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkS-0000000DPwA-0ezm;
	Thu, 26 Nov 2026 13:42:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkP-0000000DPr4-1R8E
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:42:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0C561A1815;
	Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E370604ED;
	Thu, 26 Nov 2026 13:42:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0ED211E68018;
	Thu, 26 Nov 2026 14:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+zlYm8XOv9lDruCz8zt6yvmvSgz2YtAFpzwlSl9RtA=;
	b=1AOuqAUbUzkHOVUrXbC8OuNdgZdmdkNzmQmub8NURF5O6JAA4bj//5a7UhOyP3FT1azVmr
	4gAfa1qTKY/6HcQ/vhBsxgxzHuCwZJNYYGuRE8zdCb1upVV/1pEgxNoNB01M0JkSTegYIm
	sXSirqozCMgaT4nMPn1gz8TRUaChU0gf/w2rV78BZHDiUMfVpx42xkJoLB5r2Q6QP7Pcrb
	ftKotuGpcVL3kpKRmFYpA9xvxmop5zK/oM+vMkldgt8d4tAAW3L4EJvsRnt4MCPdxZc1cs
	WX78Yn0UtfBHADdwg4nvcFGZZEU4n8t0MjZfI59fuPDWNZwXv0o+d87j8JADoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:29 +0100
Subject: [PATCH v2 4/4] mtd: spi-nor: macronix: Describe locking support
 for MX25L51245G
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-4-672a59abed62@bootlin.com>
References: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_054249_666068_4E1BE603 
X-CRM114-Status: GOOD (  18.31  )
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
 drivers/mtd/spi-nor/macronix.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9a40c2b14cb4..06ebd5482bc8 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,7 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 #define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
+#define MXIC_NOR_CR_TB		BIT(3)		/* Top/Bottom select, OTP */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -86,6 +87,38 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l51245_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u8 cr;
+
+	/*
+	 * Locking is optional, so leave locking disabled if the CR cannot be
+	 * read (e.g. the controller does not support the 0x15 opcode).
+	 */
+	if (spi_nor_read_sr2(nor, &cr))
+		return 0;
+
+	/*
+	 * MX25L51245G supports locking, but TB bit is OTP. Since a TB=1 bit
+	 * cannot be supported with the current software, prevent locking
+	 * entirely in this case. Also do not advertize the TB bit at all to
+	 * the capabilities set consistent.
+	 */
+	if (cr & MXIC_NOR_CR_TB)
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
@@ -406,7 +439,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
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
