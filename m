Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FE0D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaV8xj0veWYBHTFr6HQRPtmmleLu0HXe/wMbjKNon60=; b=t9x90r83+TuTE2
	zuESJhWTtlUU6+dR+cVnz1ty3fyhnELWX0uzU1dqLUlPpGU7NgXP2Oh5LisEOruidODxBmnKPWtM0
	WWOiwgPUlXoF1QW14fNdUZiRq8QPSy7EsplBJfE+LekZKdkQFpToiKQR909zG0VTEGs+bstmXAre2
	RbgTVqV0ATK5eLDKwaN+54oQOvnvq07321CejokI/qKHaUXyCTnLrxlW6623Cb5CbvWwUEP4JBE5+
	0inYoebeNh6qEdb4mBhSSuAB6kcAVnIi3aY9bdC1lGBXTP2msxsu5IAjB8/UVrpCsahZMnM6WdHIR
	hWDdz/uqtkbPIr3OQSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8E-00000002m3h-22k4;
	Fri, 09 Jan 2026 17:18:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8A-00000002luB-0kXv
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A00594E42029;
	Fri,  9 Jan 2026 17:18:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7557A606C6;
	Fri,  9 Jan 2026 17:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC50D103C89B4;
	Fri,  9 Jan 2026 18:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4zjmlLEWJ7QiWDqCO5iOkGGWDWg9nbW2A4ll6YCRUWA=;
	b=B/LGMcFRBzv6EB4j2c0orh3cOwxmyU5vLKT8cWE6pXSo3dOam9Qlmkxis31MCOFDMjOEWJ
	9Woy8QXW8qyBncApfqGJfJu5967gIV0WvoTChgzqGdrnk+QXJvjWh6PKIGobvtqWElc7zW
	kObxAOHcp+x4HYAT48VfE6sK1iVPr5SogSEAzu5fwdCnl+cLQ1dYjgBPVcy6JBZmGqOu7a
	alPc8/JLSj7WdeE5Hu9JDXjbMkh9OlrRJ46zQEWHek8zdmWQrHlwq8j5tgo8DuB7oqGbVv
	kMIfuZDYeTVLFE/LaYh98KDk6XeixcHTniEaTgI7Pl2wnyyI3FzQiFilf8llpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:09 +0100
Subject: [PATCH v2 11/27] mtd: spinand: macronix: Convert vendor specific
 operation to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-11-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091834_375767_B07504B5 
X-CRM114-Status: GOOD (  14.60  )
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

Macronix chips require a vendor specific operation to read the ECC
status register. Instead of defining this op only in the function that
needs it, hiding it from the core, make it a proper define like all
other spi-mem operations, and implement the necessary
spinand_fill_*_op() helper to make the SPINAND_OP() macro work. This way
we can use it from any function without any extra handling outside of
this helper when we will convert the core to support octal DDR busses.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 143cc120bdec..a847ea8f49a8 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -41,6 +41,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+#define SPINAND_MACRONIX_READ_ECCSR_1S_0_1S(buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x7c, 1),				\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_DUMMY(1, 1),				\
+		   SPI_MEM_OP_DATA_IN(1, buf, 1))
+
+static struct spi_mem_op
+spinand_fill_macronix_read_eccsr_op(struct spinand_device *spinand, void *valptr)
+{
+	return (struct spi_mem_op)SPINAND_MACRONIX_READ_ECCSR_1S_0_1S(valptr);
+}
+
 static int mx35lfxge4ab_ooblayout_ecc(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *region)
 {
@@ -67,12 +79,10 @@ static const struct mtd_ooblayout_ops mx35lfxge4ab_ooblayout = {
 static int macronix_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
 {
 	struct macronix_priv *priv = spinand->priv;
-	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0x7c, 1),
-					  SPI_MEM_OP_NO_ADDR,
-					  SPI_MEM_OP_DUMMY(1, 1),
-					  SPI_MEM_OP_DATA_IN(1, eccsr, 1));
+	struct spi_mem_op op = SPINAND_OP(spinand, macronix_read_eccsr, eccsr);
+	int ret;
 
-	int ret = spi_mem_exec_op(spinand->spimem, &op);
+	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
 		return ret;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
