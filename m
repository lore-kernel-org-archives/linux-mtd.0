Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D56606A682
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=frbwE/wz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Dz7/791y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DOoaQwiSH17HWmd/GOvoWkNtL6q+KXKJ2WDekVg1cU8=; b=frbwE/wzCS1GkkMK+XpASM22C+
	xmM5icoRuanj7E5gzEH/CFHqHZTqkSSZBdkngaPapQKXn/P9nIq/63oDZCK6Bt4IAtLnUZzqvDH3e
	ASLwHhZxTNUl7i1DtX6BrzibiI2H+9CT1iDthVz1SihMByr0dP8ctAXa8lvJ3P56U6CRJmpZGGEY1
	Hl3sR2L6rXpRBefbR0gAgymhOnscdxExYUW69Rre/7+XwXS+kkF6ibvPo6q4WKjB8byudnX39i21n
	POqJBqrje6cY4Wvit9bG7I3xhtX+gc/PeYKEToO/sByPJEgQrA2L7P19L0uyF/4grD/rquz8kdUxB
	Udh6imYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKE-0000000AvTh-0tXM;
	Wed, 25 Nov 2026 18:02:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHKB-0000000AvPR-3GoM
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9AE24E4179B;
	Wed, 25 Nov 2026 18:02:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8FBC60480;
	Wed, 25 Nov 2026 18:02:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0916C11E6B0E0;
	Wed, 25 Nov 2026 19:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JZlnY/+8JJmnOxK7DEynKE5pye32jZM2rFINNsb4/44=;
	b=Dz7/791y6DOcsoJ6Xolq8A02fbHxxw1hGzWlHyUz7cMi/06D6uRh1Fhgl73/l/ScJDsBkx
	iaVamKA5R5H1ZWyfnlYuMAgO7XIBPPFLEtw3cDCOEu0ZRMS+I8WKR/vltxB01qIwy2+HJs
	2+L+Ji7x4PbYopITZJG9MzEkGWyD5fsehNXJIRiGKRIf3NGR6I0tKPhQsEvyWfXdWhomfs
	Wmr4dVc8q9H1LRAaPGxmLCba2p0P7Ph0oQ0zm5AlsuEJJDaiHIN+2ezdk62DJDK0VQh4de
	WzvtE/lnfftr2t4WYAgAeKjux1VYjwFDZBXZa4K+WHvPeHwhlYvWDT8R4tzSDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 19:01:36 +0100
Subject: [PATCH 3/4] mtd: spi-nor: macronix: Enable RDCR for the parts that
 support it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-3-0d1ab783fd8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_100232_112489_B833C2A7 
X-CRM114-Status: GOOD (  16.78  )
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

Some Macronix parts have support for reading SR2, in which case the
opcode 0x15 will be used. Since the opcode is now cleared by default,
opt-in for the parts whose datasheet documents RDCR.

Sometimes the JEDEC ID is not useful since Macronix has re-used IDs
across incompatible parts. In this case, another discriminant is used on
top (eg. SFDP support or 4B addressing capability):
- 128 Mbit variants (typically MX25L12805D) have no RDCR, but the
  MX25L12833F and MX25L12845G are SFDP-capable and have RDCR support.
  Use the SFDP presence to discriminate the RDCR capability.
- 256 Mbit variants have no RDCR support, except the MX25L25635F and
  MX25L25645G parts which happen to also be 4-byte-capable. Use that
  capability to discriminate RDCR support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0331f9f3f853..bbc41af14882 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -14,6 +14,7 @@
 #define MXIC_NOR_ADDR_CR2_DC	0x00000300	/* CR2 address for setting dummy cycles */
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
+#define MXIC_NOR_OP_RDCR	0x15		/* Read Configuration Register opcode */
 
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
@@ -25,6 +26,27 @@
 		   SPI_MEM_OP_NO_DUMMY,				\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+/*
+ * RDCR support is not tied to the presence of SFDP, but the SFDP
+ * presence is sometimes enough to discriminate parts with the same
+ * JEDEC ID wrt their RDCR support.
+ */
+static bool macronix_nor_has_sfdp(const struct spi_nor *nor)
+{
+	return nor->sfdp;
+}
+
+static int macronix_rdcr_late_init(struct spi_nor *nor)
+{
+	nor->params->opcodes.read_sr2 = MXIC_NOR_OP_RDCR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups macronix_rdcr_fixups = {
+	.late_init = macronix_rdcr_late_init,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -38,9 +60,15 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
 	 * seems that the F version advertises support for Fast Read 4-4-4 in
 	 * its BFPT table.
+	 *
+	 * The MX25L25635F and MX25L25645G variants also have a configuration
+	 * register readable with RDCR; the MX25L25635E does not. Use the same
+	 * Fast Read 4-4-4 bit to enable both.
 	 */
-	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
+	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4) {
 		nor->params->flags |= SNOR_F_4B_OPCODES;
+		nor->params->opcodes.read_sr2 = MXIC_NOR_OP_RDCR;
+	}
 
 	return 0;
 }
@@ -359,6 +387,17 @@ static const struct spi_nor_fixups macronix_nor_fixups = {
 
 static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .fixups = &macronix_nor_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .match = macronix_nor_has_sfdp,
+	  .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x23, 0x14), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3b), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3c), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x28, 0x15), .fixups = &macronix_rdcr_fixups },
+	{ .id = SNOR_ID(0xc2, 0x28, 0x16), .fixups = &macronix_rdcr_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
