Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A5D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imQbu4/70JC7jWKgW1KfwCVS0GiTYxzqeJZ/bkFWvHQ=; b=r5Y+Qr9TxcEnqe
	SPz60Osuo7pxmqZjpgESdrnMdre1JbVO1IQYOoHd3XZqDF+BY8H1CGh/0ej2qzvNDPxYeCVBKucmK
	j/hqH0SbchrTXu2lAKf0YgI2KRP6T5cYhrFq/gQH/KzbR7ZzFD14efYCts0a+6vbMCxjBtk1hzq8O
	WXTTbf0USI3r7CalN6bU4aMvLCwNnaR5FARk9ApvyBnZtsyo3L5DCtSXHUsXpcafagAaA0gXD9mHM
	pq5lwy4mldMM3OUkCiuMusAU/5sQltwrFHHK1uAftnGoX7VpTYO6wIdxpzlbWqKFhCp9pq9JGE34p
	dCq3Nd0+S9ZqTKUkTxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG88-00000002lu0-3S3H;
	Fri, 09 Jan 2026 17:18:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG86-00000002lql-1F8P
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E332B1A2752;
	Fri,  9 Jan 2026 17:18:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8A2D606C6;
	Fri,  9 Jan 2026 17:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23A93103C89B0;
	Fri,  9 Jan 2026 18:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+jxMeS1xeb2E/hPVCFWCVOrKjIjBVGxQ/ROrL992r1Q=;
	b=anUYVoSF/XEgcDp6AyMCYYU4XpfSBdPg8hGKre023w+RWt7yJh0T0Nd3i3Kr5jrdQta2v4
	WT+2Dk3YY0Wboj3L4MyE5Cm2Jb/9YwErd6zxfLmhN9VtXuEd9awgxsAZ3gwieFmbRWih5t
	Es1nOOTSXTrZl7ySmeGZjK7/EjVyn2PpFyUgudVh76nTzgKeDBYWy/1ZNEkhHaCDlHCHcE
	XdxgTiVJQlt0ONb3wwDPi43vIShbeXHyxRIEmJTMDv2A/Npvx36Gem/YWTZ13ESZdwW34c
	RXvo2YVvlIelwY8Rc8M9YP6Yi2CDBouoenRzxJrPhlpU4kgBqzksa/i1q+iAog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:06 +0100
Subject: [PATCH v2 08/27] mtd: spinand: Decouple write enable and write
 disable operations
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-8-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091830_482979_90C50E42 
X-CRM114-Status: GOOD (  10.78  )
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

In order to introduce templates for all operations and not only for page
helpers (in order to introduce octal DDR support), decouple the WR_EN
and WR_DIS operations into two separate macros.

Adapt the callers accordingly.

There is no functional change.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c   |  2 +-
 drivers/mtd/nand/spi/esmt.c   |  2 +-
 drivers/mtd/nand/spi/micron.c |  2 +-
 include/linux/mtd/spinand.h   | 10 ++++++++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 3abc56e4d23f..b6613f2651bd 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -362,7 +362,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 
 int spinand_write_enable_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_WR_EN_DIS_1S_0_0_OP(true);
+	struct spi_mem_op op = SPINAND_WR_EN_1S_0_0_OP;
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index e60e4ac1fd6f..adadc01e8f2f 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -138,7 +138,7 @@ static int f50l1g41lb_user_otp_info(struct spinand_device *spinand, size_t len,
 static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
 			       size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_1S_0_0_OP(true);
+	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
 	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
 	u8 status;
 	int ret;
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index a49d7cb6a96d..b8130e04e8e7 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -251,7 +251,7 @@ static int mt29f2g01abagd_user_otp_info(struct spinand_device *spinand,
 static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
 				   size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_1S_0_0_OP(true);
+	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
 	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
 	u8 status;
 	int ret;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ad2773f1f963..f7621b47b28f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -26,8 +26,14 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_WR_EN_DIS_1S_0_0_OP(enable)					\
-	SPI_MEM_OP(SPI_MEM_OP_CMD((enable) ? 0x06 : 0x04, 1),		\
+#define SPINAND_WR_EN_1S_0_0_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x06, 1),				\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINAND_WR_DIS_1S_0_0_OP					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x04, 1),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
