Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CB2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXPfz/f3qZZMuXl62lhkOA+ZfNxJ83AmLrHcCCftd4g=; b=AmsfbVhXauJ6cV
	ndR8BjeOjsjVyXr9K3fwLf1ciYh1oXGJiDmDzOkvZPHv+nVrKogud5pTa/08Srx3yzjlwxDut32qE
	vjchzE7au3B169rCofc7/UyMCSBlFEXMbY0xcrjhWrK8mAaxjSDorTozPirnAzMQJoZPX8Ln2xF38
	g3vGFsmznrUizHQMfR+fgknQRM4E2uPpAsdSND9I2LlZd2gE6IvlzXL7IzddXmFRjAhDULH7avNgK
	1+m6BT2zdsYSwX6VMPLD0VAePnkga5U9QqYB5xh/vEU63VaX1i6kx/f7cpZJkNZnBjuYuZngLJIpr
	k+j9rMJF+8M2fNcHf1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7uy-005gLv-Fm; Mon, 21 Feb 2022 12:35:53 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UV-005Xx7-Co
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:37 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6E9C3223F0;
 Mon, 21 Feb 2022 13:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+frplPwvZ0pn/P/SE5oAp882roU/y7+JgzJ/iefAoGg=;
 b=In29GfLAh40n0zQiKjO1TLE6ONGDHOd0aPB66RH6SjY9UhslOq4znnaQWMT37YbzGuqMFp
 Q7IZg98ujnwTbexwdCBUs2wf6qSZkevONnhHB1tEj1m5UxsZFSdHk13BlrgVfGbM8npPDk
 MFgZn3gYBk/norZK3rp5XWFBD6NKnW8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 22/32] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Date: Mon, 21 Feb 2022 13:07:59 +0100
Message-Id: <20220221120809.1531502-23-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040831_680064_A4C3414D 
X-CRM114-Status: GOOD (  14.41  )
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
 drivers/mtd/spi-nor/xilinx.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 05c7fe843a7d..ffd5579d45cb 100644
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
@@ -60,20 +60,20 @@ static u32 s3an_nor_convert_addr(struct spi_nor *nor, u32 addr)
 }
 
 /**
- * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
+ * xilinx_nor_read_sr() - Read the Status Register on S3AN flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @sr:		pointer to a DMA-able buffer where the value of the
  *              Status Register will be written.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
+static int xilinx_nor_read_sr(struct spi_nor *nor, u8 *sr)
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
 
@@ -93,17 +93,17 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 }
 
 /**
- * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
- * the flash is ready for new commands.
+ * xilinx_nor_sr_ready() - Query the Status Register of the S3AN flash to see
+ * if the flash is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_xsr_ready(struct spi_nor *nor)
+static int xilinx_nor_sr_ready(struct spi_nor *nor)
 {
 	int ret;
 
-	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
+	ret = xilinx_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -116,12 +116,12 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	u32 page_size;
 	int ret;
 
-	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
+	ret = xilinx_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-	nor->erase_opcode = SPINOR_OP_XSE;
-	nor->program_opcode = SPINOR_OP_XPP;
+	nor->erase_opcode = XILINX_OP_SE;
+	nor->program_opcode = XILINX_OP_PP;
 	nor->read_opcode = SPINOR_OP_READ;
 	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
@@ -155,7 +155,7 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 static void xilinx_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
-	nor->params->ready = spi_nor_xsr_ready;
+	nor->params->ready = xilinx_nor_sr_ready;
 }
 
 static const struct spi_nor_fixups xilinx_nor_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
