Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D8DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQWSBHn9aW5QTTZeq3JjtzdIxTVRwUaAK8WWIxv5m2s=; b=jJ4RZpBqRb1sPK
	PUz9oeBNfYJCw1mC0GD556F8/PZUe0HyE7u+r8wPUPTEJ5ZDdwljdF/LseNqneuzPK5L9YlgGN3w2
	h+zC9J0QW5DaI5naauW8cSsuJ+vPXxCsJFzTVhpfyHHKblhJgcf6BzzGBIIeV5OdCqd+Eey+wBPI7
	HAxPKjP2wFO3ZRVzuYgpb6MknyY5YdU9fWfc88O7wTcHzr3W+rihZj0wIDCY7OHx0I+sucOWxCKwJ
	z4jSJnfDec+9HGy8AtKgFP++mtPspxWonudrelEhvHCccR09oL7U3ZXOd30q6ZiRYXQOlVf+DyBuR
	n/OIgIpApO8PIlVAp5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHIZ-00FvWy-LT; Wed, 02 Feb 2022 15:11:55 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH6C-00FrWl-VQ
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:12 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DF802223F6;
 Wed,  2 Feb 2022 15:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Mb7Hw57gwlsZsvaib7xEeRanv0buA9g96Lty7UwaOw=;
 b=lsIhkBAJku+V9hddMsy4XsCV4J5o7+uMMQvfL0vlcy+4QAdehLB1Lge7z8l0dDgYmYZeZP
 znNaSz8J5cKtjRYL85Lu+GyQQUMiRRqX6a6872/CvAKbJt87ljn/J0R3f+0N0LHuzU8l1v
 OF2BURVC8bytFjnN51LkuUzgaMDO/Bc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Date: Wed,  2 Feb 2022 15:58:44 +0100
Message-Id: <20220202145853.4187726-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065909_262435_A9834857 
X-CRM114-Status: GOOD (  13.06  )
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

Drop the generic spi_nor prefix for all the xilinx functions.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/xilinx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index a865dadc2e5d..3e85530df1e4 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -8,9 +8,9 @@
 
 #include "core.h"
 
-#define SPINOR_OP_XSE		0x50	/* Sector erase */
-#define SPINOR_OP_XPP		0x82	/* Page program */
-#define SPINOR_OP_XRDSR		0xd7	/* Read status register */
+#define XILINX_OP_SE		0x50	/* Sector erase */
+#define XILINX_OP_PP		0x82	/* Page program */
+#define XILINX_OP_RDSR		0xd7	/* Read status register */
 
 #define XSR_PAGESIZE		BIT(0)	/* Page size in Po2 or Linear */
 #define XSR_RDY			BIT(7)	/* Ready */
@@ -60,20 +60,20 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 }
 
 /**
- * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
+ * xilinx_read_sr() - Read the Status Register on S3AN flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @sr:		pointer to a DMA-able buffer where the value of the
  *              Status Register will be written.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
+static int xilinx_read_sr(struct spi_nor *nor, u8 *sr)
 {
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
+			SPI_MEM_OP(SPI_MEM_OP_CMD(XILINX_OP_RDSR, 0),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, sr, 0));
@@ -82,7 +82,7 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
+		ret = spi_nor_controller_ops_read_reg(nor, XILINX_OP_RDSR, sr,
 						      1);
 	}
 
@@ -99,11 +99,11 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_xsr_ready(struct spi_nor *nor)
+static int xilinx_sr_ready(struct spi_nor *nor)
 {
 	int ret;
 
-	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
+	ret = xilinx_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -116,12 +116,12 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	u32 page_size;
 	int ret;
 
-	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
+	ret = xilinx_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-	nor->erase_opcode = SPINOR_OP_XSE;
-	nor->program_opcode = SPINOR_OP_XPP;
+	nor->erase_opcode = XILINX_OP_SE;
+	nor->program_opcode = XILINX_OP_PP;
 	nor->read_opcode = SPINOR_OP_READ;
 	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
@@ -155,7 +155,7 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 static void xilinx_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
-	nor->params->ready = spi_nor_xsr_ready;
+	nor->params->ready = xilinx_sr_ready;
 }
 
 static const struct spi_nor_fixups xilinx_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
