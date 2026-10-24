Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50137606A325
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 00:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Odjr2+o+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KMEqnWLT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wm2/hS/85iKUwnDvK91QWGny+0EajVfbL7vCh/XSXEQ=; b=Odjr2+o+0GeCVfrUSkz3wnKizI
	rTcOFsLCY4XuWRTzuWTMlrBlcPqcSz5sH9OAQqpWoyDFotPGlGFUbW+1Qr3H/eZKCip9FTi1P3bQF
	v9trwaM6MgX8vgFVyQtjEyYVmk37MkZViCELfKwklPlfUbbPm5QsyMVpnE8R3ABsEey1KDgJ83egB
	UZ1G6y5W3gyYaAzjBcujxdN5amungUT8pvOXQ9huwL+EwjpNB/0VuZKEm2E0D0qp4oXmNBkndbnuG
	LfqrDiNNmi5mq+en4ZorDmOPkAcJY10Lb68k7KEaefNIZCOOO74PHBcbNkg36rPP7K6MB11ReCETC
	lY3Tiz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPRd-0000000HF20-4ASH;
	Sat, 24 Oct 2026 00:17:09 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPRc-0000000HF1Z-07yy
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 00:17:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBFAC1081B2;
	Sat, 24 Oct 2026 02:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792801022; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=j0wUcle1npmkLK5Xk/xsqVEnA1MWnCFJaMlzInyzSwY=;
	b=KMEqnWLTNF0iOTvV4SFEffEcIHTV9VMXGV8arzUHTrDoJ47xWbFhkJLdqwR0+PELEoE1IT
	t4mgTF/EPmIwW6ZoXrDxIzaJq2W8yKHrdMHM6f2LCh13Kf0FJRfFLs5caWOQQW4TTXztrS
	B4WDb23qgF5VDFQ16xRTuqCUhOUqnxv90u6mJZadiCjvujBEY60v9Huug37/ul6tXTGsU0
	eaXW9pIa2VPYhIFX45poBPBmwpBeIPcJ/MF6qGuG1BqvrVwnPoCs9Ol6kaCB9g4Uz8axhx
	3IrvrPlE8/RWuE3YYGgRW3MNnQsDFNbF3CTcVJqlfKeWLgcr+b6ioro07YGVCg==
From: Marek Vasut <marex@nabladev.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Sat, 24 Oct 2026 02:16:17 +0200
Message-ID: <20261024001658.222147-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_171708_216266_88EE593B 
X-CRM114-Status: GOOD (  15.87  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MX25L51245G part has similar 4-BP locking mechanism as MX25L12805D,
however, the TB bit on this part is OTP. Introduce support for Top-only
locking in case the TB bit is not set, and disable locking in case the
TB bit is fused i.e. set to Bottom mode.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
V2: Introduce .late_init callback which enables locking only in case
    the TB bit is not set
---
 drivers/mtd/spi-nor/macronix.c | 53 +++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1ca..11e71e254a54a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,9 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 
+#define MX25L51245G_OP_RDCR	0x15
+#define MX25L51245G_CR_TB	BIT(3)
+
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
 	((20 - (p)) >> 1)
@@ -25,6 +28,49 @@
 		   SPI_MEM_OP_NO_DUMMY,				\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+static int mx25l51245_read_cr(struct spi_nor *nor, u8 *cr)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(MX25L51245G_OP_RDCR, 0),
+						  SPI_MEM_OP_NO_ADDR, SPI_MEM_OP_NO_DUMMY,
+						  SPI_MEM_OP_DATA_IN(1, cr, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_read_reg(nor, MX25L51245G_OP_RDCR, cr, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading CR\n", ret);
+
+	return ret;
+}
+
+static int mx25l51245_late_init_fixups(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = mx25l51245_read_cr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	/*
+	 * MX25L51245G supports locking, but the CR register TB bit is OTP.
+	 * Enable locking only in case the TB bit is not programmed, or set
+	 * to 0.
+	 */
+	if (nor->bouncebuf[0] & MX25L51245G_CR_TB)
+		dev_dbg(nor->dev, "CR TB is set, bottom protection not supported\n");
+	else
+		nor->params->flags |= SNOR_F_HAS_LOCK | SNOR_F_HAS_4BIT_BP;
+
+	return 0;
+}
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -108,6 +154,11 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx25l51245_fixups = {
+	.late_init = mx25l51245_late_init_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
 static const struct spi_nor_fixups macronix_qpp4b_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
@@ -353,7 +404,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .fixups = &macronix_nor_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &mx25l51245_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
