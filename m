Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C473CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eO22P+u1mqka1SKS/M131/lz2RiEc7LqiEEejKOmOgE=; b=K+Eo9Oenl3rkW2
	eZD0cS3oFqNcFoA9ntklzHkJL5ODI8ZnhqmflQp0ZGuRXLVWLMSQG+2HWEg66MqD7K+k037MMU7F5
	6z9WtP+XLHW8zt/CblcgX+YquH3mRGDa3uf5fZbXfOUpEWVk10shu/QlXRuSEyABB/29C+HYz6IzR
	3nwa+KlKBOt0KkWyNTVsPXKWRO8rFHAkRAMyEOJfGD1ENunaeEZAXLSsLJu5BubgB+ljuMtRmS6Ym
	hne5YbZ18MN9gUO3+Qlr8Xva5E43JtsN+xcoSKZYsWVZ3d7SzaSCJJ2ZiniOCoWG3mfKm4WMgxkyE
	p2yHVffiVI1z/GgKpdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsva-00000006UYm-22cG;
	Fri, 31 Oct 2025 17:28:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvG-00000006UAf-2cbr
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 812AAC0E958;
	Fri, 31 Oct 2025 17:28:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12B7F60704;
	Fri, 31 Oct 2025 17:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C31511818007;
	Fri, 31 Oct 2025 18:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PvBKutAwa1m2PL4YRCKjf/u7MU2Ov+gYd6bI20RerpY=;
	b=s1KgbqGz4/ZSWyUN1Ji1Eg3iiyiO0nzxSSzCF4nggAHM01fvofsP1WXeqebUI7C6nxl6KE
	0PALXDANdgKDBzIz1+sL+x1DYlkZvlSm1QBDeVdX2CBQe52BjZoXyVqSUdMAXfBD6kXZEi
	KzsdYPJblUz0fZy1YcypChw+Wo9ME3E8XLYCeyS/ID1xsgqBmD3+4Qdk4qp+szp9vKB5KK
	b19sQmsrbyKo4MA41tF2I0+uiphGi1CuGjKEq3nzPE892nq9a+e3yDdWHlAOWiM8iBtxQ6
	Ay/pYSOZ8FoPVSm5GHhjARc9bCLpDL0VQ6QnrYkjE3+xzPMnqOBH74d1X/Y70w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:52 +0100
Subject: [PATCH 08/28] mtd: spinand: Decouple write enable and write
 disable operations
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-8-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102822_977102_3690F496 
X-CRM114-Status: GOOD (  10.25  )
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c   |  2 +-
 drivers/mtd/nand/spi/esmt.c   |  2 +-
 drivers/mtd/nand/spi/micron.c |  2 +-
 include/linux/mtd/spinand.h   | 10 ++++++++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e6ff5706a65bdd300ce5945846749afa59b2f12a..d215cefcba3f37057a2ba036d86ae6638885a7f3 100644
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
index 9a9325c0bc49726b0421d77680684ae07560bf2e..f880c3b15ceab14676ab65f3d9e8530c713528c8 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -137,7 +137,7 @@ static int f50l1g41lb_user_otp_info(struct spinand_device *spinand, size_t len,
 static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
 			       size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_1S_0_0_OP(true);
+	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
 	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
 	u8 status;
 	int ret;
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index a49d7cb6a96da701ee981e677f414c57eabb2cec..b8130e04e8e798519ad38c58b5569935c1a447a2 100644
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
index 731a3156b2577032e1f9a767044f94aa262c3ec0..8c490a03b2e000bc18d692d72cfd20b151db023c 100644
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
