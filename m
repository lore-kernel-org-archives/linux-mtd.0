Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9760BD26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jI367HiH0bRBCOkA3MIYya0tSPqElChYHV73/Wed50=; b=AutYBSCwE/5J7C
	jnGoebLdGGl5eScbCiWVnq6GIICsS9lXgQ1tHNQeYTZwAefTKzMGI69QQxCLauQOjwALbm2KCnpoy
	nLPiCpzprV0zFHL/9yOmUO8UjmIT3c1tiS05JLE6H0NEm/l583Vy6vWkp8SfUsR8xWdlM/vqrVTsW
	r6jQQRjn8t9krKeflUga4qBRn0HoPt7qfSwX8N7A8+hjTwHzie24a9MHo8FDwhWrGYKSFAzukxk9a
	FBl6X4a7jQBTfzRfbH1TSCGpGgjWTwOp7w+rbIxwP3kjwFnBl1jWcZsPXEqf72pD9zzUy7MutfwBZ
	v0WnUdWQiQnVrzSAcYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8F-00000002m5F-1VTF;
	Fri, 09 Jan 2026 17:18:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8C-00000002lxh-1G2r
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68A73C1F6E4;
	Fri,  9 Jan 2026 17:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1DD6606C6;
	Fri,  9 Jan 2026 17:18:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A784103C89B6;
	Fri,  9 Jan 2026 18:18:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ByaYUaNaJV4Ff78T5l6xTtVf1Fq+ywBCL3Mu7MTdSkQ=;
	b=UdsMaNcoXXLblizSSEA94E3C9P1gYOwOG3Vz5eSmiqJHjG5wg6BwLbw8AesjWv6FfCZVdy
	MJWXpNP5Y2g1QFUXsAOKSy81FE+msf1OCh1zcmjrOBTC6p5EuO8i9z5T7SwzQ8Qotnre56
	DkwcD5Uql3fcEqo9TV9KN9IC+68+4whP6QJw+XRHDijyQxyLKFjSO8BdnHf34tn1ZEadJi
	Loj5px3PcU+6lDYLHlzIEqqdZz423KFusUKE7TeNS/SseFaydMgk2PttoEXKB73M8X/E7r
	nBWITkh/C0maqJiWF9GauvknVG5/lFc7iJBRbASjgrn5fCCSEb7hBLwVAMnyDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:11 +0100
Subject: [PATCH v2 13/27] mtd: spinand: winbond: Convert W35N specific
 operation to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-13-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091836_494963_43F945D1 
X-CRM114-Status: GOOD (  12.39  )
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

Winbond W35N* chips require a vendor specific operation to write their
VCR register (a configuration register, typically used for tuning the
number of dummy cycles and switching to a different bus
interface). Instead of defining this op only in the function that needs
it, hiding it from the core, make it a proper define like all other
spi-mem operations, and implement the necessary spinand_fill_*_op()
helper to make the SPINAND_OP() macro work. This way we can use it from
any function without any extra handling outside of this helper when we
will convert the core to support octal DDR busses.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index dde59f8f63f5..3003ad7e83ee 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -87,6 +87,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+#define SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x81, 1),				\
+		   SPI_MEM_OP_ADDR(3, reg, 1),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
+
+static struct spi_mem_op
+spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *valptr)
+{
+	return (struct spi_mem_op)SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, valptr);
+}
+
 #define SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(buf)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xc2, 1),				\
 		   SPI_MEM_OP_NO_ADDR,					\
@@ -329,11 +341,8 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand)
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(0x81, 1),
-			   SPI_MEM_OP_ADDR(3, reg, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(1, spinand->scratchbuf, 1));
+	struct spi_mem_op op = SPINAND_OP(spinand, winbond_write_vcr,
+					  reg, spinand->scratchbuf);
 	int ret;
 
 	*spinand->scratchbuf = val;

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
