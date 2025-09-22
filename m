Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B5CAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLzMhXHR1e8fa/iwcjBt+HtBszYG+BekijRAgmQXpkY=; b=TXTgnIb+ts25Cs
	kg6G0eirP5w1qrgef9iIBPv1MijdxIW5e87nAwEg8K83wa08eOZcbrBK7SLiXGx/yOwGFRD/CsTKm
	YYiYHOUCJlGmI7MLR8QbxpwJIlm5yN7nmX13Qoc89QmdxeX909tpaoy5zR0+Kw9bJGw2zcfgBrx7J
	vedK3NWKu9x6D8FZ77tQK65EeZaPndFosnLmq/lU7kcG8p0Kbsn7EKJOnspnEgq9OmLTEJ9A4G3og
	0jlXWk5CKUgw2KRG+Ow8cFzVX6ct4jWFhVNfauUMfjvqEQeeQo3wYv+oiKQsbX4pcaWPJUeJjqxYZ
	am3Bh2EiVxLf2iSWrkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ivN-0000000Auc1-26Kg;
	Mon, 22 Sep 2025 15:57:57 +0000
Received: from smtp15.bhosted.nl ([94.124.121.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ivK-0000000AubQ-3cwN
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=gluDp5vbGgiV/wuQkAXOB8YAjopU7SBxzSEGFDygyC4=;
	b=ghAnVNKNkZ9q6Hiag00nqu5VTxSAlfIndUVOZUfzIFXbAoNortAMD0J+Ikoi1db5umLDJYPZ35OZX
	 mYQq3z9zcsUKBk795+ZUKQGHHX+7t+Acg2IDlfwSfenHPYqfJm2UwnxtL7tbaQ0+RZy0ed35T7liFz
	 yln/ooh/1zNV7dyvo/DRTeMXmAuz+2BaAyC3s/xv6lEdvfsuS0LBs7VHs0hov0ad221tLHerXlKSeu
	 mfgNeLNBn0/TiTvuZQhgBIgaDFoSvrO0WRPyfHVF3OFuY7KtMeWOq9MIMiNnHu/UgqrsiXpS6L2lt2
	 0GnjuBUa9licRnXYM8OnwpyJ+a8jazQ==
X-MSG-ID: c17b4109-97cc-11f0-9d69-00505681446f
From: Maarten Zanders <maarten@zanders.be>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: Maarten Zanders <maarten@zanders.be>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: add configurable RDCR opcode
Date: Mon, 22 Sep 2025 17:56:32 +0200
Message-ID: <20250922155635.749975-2-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922155635.749975-1-maarten@zanders.be>
References: <20250922155635.749975-1-maarten@zanders.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_085755_034972_87010560 
X-CRM114-Status: GOOD (  14.25  )
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

Introduce a new flash parameter to hold the read configuration register
(RDCR) opcode. Default to 0x35, which is the JEDEC standard.

This change does not alter existing behavior but prepares the driver
to support flashes that use a different opcode to read the CR.

Fixes: 10526d85e4c6 ("mtd: spi-nor: Move Macronix bits out of core.c")
Signed-off-by: Maarten Zanders <maarten@zanders.be>
---
 drivers/mtd/spi-nor/core.c | 12 +++++++++---
 drivers/mtd/spi-nor/core.h |  6 ++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..ff537bdad401 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -484,7 +484,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 
 /**
  * spi_nor_read_cr() - Read the Configuration Register using the
- * SPINOR_OP_RDCR (35h) command.
+ * SPINOR_OP_RDCR command.
  * @nor:	pointer to 'struct spi_nor'
  * @cr:		pointer to a DMA-able buffer where the value of the
  *              Configuration Register will be written.
@@ -496,13 +496,16 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_RDCR_OP(cr);
+		struct spi_mem_op op = SPI_NOR_RDCR_OP(nor->params->rdcr_opcode,
+						       cr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDCR, cr,
+		ret = spi_nor_controller_ops_read_reg(nor,
+						      nor->params->rdcr_opcode,
+						      cr,
 						      1);
 	}
 
@@ -2893,6 +2896,9 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
+	/* Default to 0x35 to read configuration register */
+	params->rdcr_opcode = SPINOR_OP_RDCR;
+
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
 	params->size = info->size;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ceff412f7d65..abac5fc45ca8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -61,8 +61,8 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
-#define SPI_NOR_RDCR_OP(buf)						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),			\
+#define SPI_NOR_RDCR_OP(opcode, buf)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
@@ -351,6 +351,7 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @rdcr_opcode:	opcode needed to read the Configuration Register
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
  * @die_erase_opcode:	die erase opcode. Defaults to SPINOR_OP_CHIP_ERASE.
@@ -384,6 +385,7 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
+	u8				rdcr_opcode;
 	u8				die_erase_opcode;
 	u32				*vreg_offset;
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
