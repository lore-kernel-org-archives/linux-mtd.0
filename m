Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFE6C531DF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2024 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrEPCBo36mQr9S76z/dE8h1ZZ1pygDU892Dhu1UHllU=; b=WsQtyUT8Jc1pj9
	1/8YiyvFBz7zglmeducQQBOCAbOHJY+CS3AuQQX5JFgRu6kTdMKT43YqWldM8K1zldj3uWYh6PDOO
	YmvbOB8ON4ukND3eNCsPZp6006iZb3rHWrpHcB9stttjm58bcW1qu+EDSOZDBrhMICcJU8l4nNzMR
	4vESpwhVVRgBCuydZtIpze+G9XwvZ5ipQ8IZ9Iz1LBgPXbrSr4p/jelT7B3sr4JsXX9nEocWIJNUB
	H6UWJV1KX3ntBeVlmjPHU3TrB3F8U2VCYuJJimPh335sz1QsAg0FzDa0aDdYSm0xoEWz9UdGgxjvt
	1n9f0izjaeWyurI33WlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfIrN-0000000FDTw-1Pur;
	Sat, 17 Aug 2024 12:48:45 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfIrJ-0000000FDSB-2EVo
	for linux-mtd@lists.infradead.org;
	Sat, 17 Aug 2024 12:48:43 +0000
Received: from localhost.localdomain (ip1f10f85d.dynamic.kabel-deutschland.de [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4WmJQt4GGlzMQvZ;
	Sat, 17 Aug 2024 12:42:14 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v3 2/4] mtd: spi-nor: core: add generic functions
Date: Sat, 17 Aug 2024 14:41:38 +0200
Message-Id: <20240817124140.800637-3-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240817124140.800637-1-erezgeva@nwtime.org>
References: <20240817124140.800637-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_054841_579417_606C2061 
X-CRM114-Status: GOOD (  14.82  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Create a new internal function, spi_nor_send_cmd_internal()
 to reduce duplicate code.

Add generic functions for use by vendor callbacks.
The functions contain dispatching for using SPIMEM
 or using an SPI controller.
It is better to leave this kind of dispatcher,
 out side of vendor specific code.

In this patch series we use the new functions in
 Macronix new OTP callbacks.

The new added functions:

 - Send an opcode without address or data.

 - Read a register value.

 - Write a register value.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 130 +++++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/core.h |  27 +-------
 2 files changed, 99 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index af522c426ac9..647c843c165d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -354,53 +354,134 @@ int spi_nor_write_any_volatile_reg(struct spi_nor *nor, struct spi_mem_op *op,
 }
 
 /**
- * spi_nor_write_enable() - Set write enable latch with Write Enable command.
+ * spi_nor_send_cmd_internal() - Send instruction without address or data to the chip.
  * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	Command to send
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_write_enable(struct spi_nor *nor)
+static inline int spi_nor_send_cmd_internal(struct spi_nor *nor, u8 opcode)
 {
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_WREN_OP;
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
+					   SPI_MEM_OP_NO_ADDR,
+					   SPI_MEM_OP_NO_DUMMY,
+					   SPI_MEM_OP_NO_DATA);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREN,
-						       NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor, opcode, NULL, 0);
 	}
 
-	if (ret)
-		dev_dbg(nor->dev, "error %d on Write Enable\n", ret);
+	return ret;
+}
+
+/**
+ * spi_nor_send_cmd() - Send instruction without address or data to the chip.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	Command to send
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_send_cmd(struct spi_nor *nor, u8 opcode)
+{
+	int ret;
+
+	ret = spi_nor_send_cmd_internal(nor, opcode);
 
 	return ret;
 }
 
 /**
- * spi_nor_write_disable() - Send Write Disable instruction to the chip.
+ * spi_nor_read_reg() - Send instruction without address or data to the chip.
  * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	Command to send
+ * @len:	register value length
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_write_disable(struct spi_nor *nor)
+int spi_nor_read_reg(struct spi_nor *nor, u8 opcode, size_t len)
 {
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_WRDI_OP;
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
+					   SPI_MEM_OP_NO_ADDR,
+					   SPI_MEM_OP_NO_DUMMY,
+					   SPI_MEM_OP_DATA_IN(len, nor->bouncebuf, 0));
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRDI,
-						       NULL, 0);
+		ret = spi_nor_controller_ops_read_reg(nor, opcode, nor->bouncebuf, len);
 	}
 
+	return ret;
+}
+
+/*
+ * spi_nor_write_reg() - Send instruction without address or data to the chip.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	Command to send
+ * @len:	register value length
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_reg(struct spi_nor *nor, u8 opcode, size_t len)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
+					   SPI_MEM_OP_NO_ADDR,
+					   SPI_MEM_OP_NO_DUMMY,
+					   SPI_MEM_OP_DATA_OUT(len, nor->bouncebuf, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, opcode, nor->bouncebuf, len);
+	}
+
+	return ret;
+}
+
+/**
+ * spi_nor_write_enable() - Set write enable latch with Write Enable command.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_enable(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_send_cmd_internal(nor, SPINOR_OP_WREN);
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d on Write Enable\n", ret);
+
+	return ret;
+}
+
+/**
+ * spi_nor_write_disable() - Send Write Disable instruction to the chip.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_disable(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_send_cmd_internal(nor, SPINOR_OP_WRDI);
+
 	if (ret)
 		dev_dbg(nor->dev, "error %d on Write Disable\n", ret);
 
@@ -521,18 +602,8 @@ int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_EN4B_EX4B_OP(enable);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor,
-						       enable ? SPINOR_OP_EN4B :
-								SPINOR_OP_EX4B,
-						       NULL, 0);
-	}
+	ret = spi_nor_send_cmd_internal(nor, enable ? SPINOR_OP_EN4B :
+						SPINOR_OP_EX4B);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
@@ -765,16 +836,7 @@ int spi_nor_global_block_unlock(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_GBULK_OP;
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_GBULK,
-						       NULL, 0);
-	}
+	ret = spi_nor_send_cmd_internal(nor, SPINOR_OP_GBULK);
 
 	if (ret) {
 		dev_dbg(nor->dev, "error %d on Global Block Unlock\n", ret);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 237196b908dd..f546bebf6ffc 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -25,18 +25,6 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 0))
 
-#define SPI_NOR_WREN_OP							\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_NO_DATA)
-
-#define SPI_NOR_WRDI_OP							\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_NO_DATA)
-
 #define SPI_NOR_RDSR_OP(buf)						\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),			\
 		   SPI_MEM_OP_NO_ADDR,					\
@@ -67,24 +55,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
-#define SPI_NOR_EN4B_EX4B_OP(enable)					\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B, 0),	\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_NO_DATA)
-
 #define SPI_NOR_BRWR_OP(buf)						\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 0),			\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
-#define SPI_NOR_GBULK_OP						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_NO_DATA)
-
 #define SPI_NOR_DIE_ERASE_OP(opcode, addr_nbytes, addr, dice)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_ADDR(dice ? addr_nbytes : 0, addr, 0),	\
@@ -604,6 +580,9 @@ extern const struct attribute_group *spi_nor_sysfs_groups[];
 void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
 			     const enum spi_nor_protocol proto);
+int spi_nor_send_cmd(struct spi_nor *nor, u8 opcode);
+int spi_nor_read_reg(struct spi_nor *nor, u8 opcode, size_t len);
+int spi_nor_write_reg(struct spi_nor *nor, u8 opcode, size_t len);
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
