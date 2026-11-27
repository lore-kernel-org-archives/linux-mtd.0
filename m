Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AB5606A32D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Go7e58ir;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dYd460X1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=q9gRR/Di
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ADfJBiyuMa4cU6Pi48DfAUYvUkhFVGMLD473Q5xF204=; b=Go7e58irTiff4Q9X1rmwtGfbqz
	iyGmeaSA4cMCQAl6Yu3975Yt6yYhudZT1AMeG5ZqxcrtpxRjiUl3I/uyOiT2ARHwJy3sjMNm45YxD
	KB7amBHSbHUBcw+/XYPxpTK7ZLmtpN6V7PKB0EUXUmDZVQ7/RYifGGijnxbdHlaHOF8xqGOuTigsw
	sicoJM9pBQwzWMgtEhH3r/zyoe6MHgej7JALUotSUMJ4Dw1B8p6etNaiWrJCdbrrvNpo7hrEc4NHV
	RolszwFgzLxgXSstYEEv2sWJyWfKvq7eO4IwALlS92XitV1BlYtS28Bs1bZT39P04wHwIPlVC8b61
	lmL9pm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxa-0000000GWkv-0OgR;
	Fri, 27 Nov 2026 14:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvs-0000000GV7L-0mKV;
	Fri, 27 Nov 2026 14:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1ksm5rI0TYNcSAX32Zl3ZasBQkQ/d034tzn09wMpZk=; b=dYd460X1Yp40WFTO9+D49P5KXb
	kcVM+AiWTBikEms+bCWtml89JbekJbv3xzB94jYs2ODzLVs71E2gz10xYSLGmAq8EpFw6UMFb36Ku
	GzYTahuLhvvUWuEHKbwCfre0FbnL3P55yLqdr9/mRoi2eqSlWPvF51ut9FJB1Y8DZepOC5oEy1vNG
	ekDwncxQL1A6FQ5aYDV0StCxnLPJu8w8HSGyXrX8IbsqhLQlC3mCRrAIfY9KKGVKA2rMkHUYaXG13
	zRndYkB1dgm+qprJTJB6Cm4HgeNjCUhyCg2X+3dtJ4lBI8vwi6HKHxu9ldlunUFCrHfdLxpjUVlNN
	c/1XNONQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvm-00000007oRS-2HTl;
	Fri, 27 Nov 2026 14:28:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A1221A1845;
	Fri, 27 Nov 2026 14:28:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 556406049C;
	Fri, 27 Nov 2026 14:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B01FE11E6900C;
	Fri, 27 Nov 2026 15:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P1ksm5rI0TYNcSAX32Zl3ZasBQkQ/d034tzn09wMpZk=;
	b=q9gRR/DipAlkzZaAOoO7aON6lkLm5LUtsiTFLw4bkr7AbtDLtZBTw2f10+JEkoxN5AIyZY
	2KGHhcGMgXKgHBnG1W/+BLgOSeC1XgW/VpGS0+XreEw36MHIEgE2ha9CDpHUeCfQ33+iMG
	GUlwP68VFcYzP+qr2i6QhHCKyA2UAdbDRS0nPBKYujFpKGYSBSKwJ/EBbmKEhf6Kt2X8Up
	oKvSU56vsP60gPwf5kdu8NJbys+NgNo76bcGhgqnoV4qKrJrrYXSYV2HbPuYd4IAErmlQI
	fINPL2RuIPgXkJUmq81xbS2LTYdICl3sMDRfKNw7CGuWaBaeNIM+PkGe+dhfGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:57 +0100
Subject: [PATCH RFC v2 35/35] mtd: spi-nor: Express the dummy phase in
 cycles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-35-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142806_535080_F29B7377 
X-CRM114-Status: GOOD (  18.58  )
X-Spam-Score: -0.2 (/)
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

SFDP tables and datasheets provide the number of dummy cycles, not the
number of dummy bytes. Set dummy.ncycles directly instead of converting
it to dummy.nbytes. Depending on controller capabilities, this may help
supporting more use cases (typically Macronix 1S-8S-8S 20 dummy cycles)
while performing less useless maths in the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c      | 36 ++++++++++--------------------------
 drivers/mtd/spi-nor/core.h      |  8 ++++----
 drivers/mtd/spi-nor/micron-st.c |  2 +-
 drivers/mtd/spi-nor/spansion.c  |  8 ++++----
 4 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..dcc36f532aaa 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -91,7 +91,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 	if (op->addr.nbytes)
 		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
 
-	if (op->dummy.nbytes)
+	if (op->dummy.nbytes || op->dummy.ncycles)
 		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
 
 	if (op->data.nbytes)
@@ -109,9 +109,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->dummy.dtr = true;
 		op->data.dtr = true;
 
-		/* 2 bytes per clock cycle in DTR mode. */
-		op->dummy.nbytes *= 2;
-
 		ext = spi_nor_get_cmd_ext(nor, op);
 		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
 		op->cmd.nbytes = 2;
@@ -205,7 +202,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
 	struct spi_mem_op op =
 		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
 			   SPI_MEM_OP_ADDR(nor->addr_nbytes, from, 0),
-			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
+			   SPI_MEM_OP_DUMMY_CYCLES(nor->read_dummy, 0),
 			   SPI_MEM_OP_DATA_IN(len, buf, 0));
 	bool usebouncebuf;
 	ssize_t nbytes;
@@ -213,11 +210,6 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
 
 	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
 
-	/* convert the dummy cycles to the number of bytes */
-	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
-	if (spi_nor_protocol_is_dtr(nor->read_proto))
-		op.dummy.nbytes *= 2;
-
 	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
 
 	if (nor->dirmap.rdesc) {
@@ -418,22 +410,23 @@ int spi_nor_write_disable(struct spi_nor *nor)
  * @nor:	pointer to 'struct spi_nor'.
  * @naddr:	number of address bytes to send. Can be zero if the operation
  *		does not need to send an address.
- * @ndummy:	number of dummy bytes to send after an opcode or address. Can
- *		be zero if the operation does not require dummy bytes.
+ * @ncycles:	number of dummy clock cycles to insert after an opcode or
+ *		address. Can be zero if the operation does not require dummy
+ *		cycles.
  * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
  *		will be written.
  * @proto:	the SPI protocol for register operation.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ncycles, u8 *id,
 		    enum spi_nor_protocol proto)
 {
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
+			SPI_NOR_READID_OP(naddr, ncycles, id, SPI_NOR_MAX_ID_LEN);
 
 		spi_nor_spimem_setup_op(nor, &op, proto);
 		ret = spi_mem_exec_op(nor->spimem, &op);
@@ -741,7 +734,7 @@ int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
+			op.dummy.ncycles = nor->params->rdsr_dummy;
 			/*
 			 * We don't want to read only one byte in DTR mode. So,
 			 * read 2 and then discard the second byte.
@@ -2247,11 +2240,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 
 	spi_nor_spimem_setup_op(nor, &op, read->proto);
 
-	/* convert the dummy cycles to the number of bytes */
-	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
-			  op.dummy.buswidth / 8;
-	if (spi_nor_protocol_is_dtr(read->proto))
-		op.dummy.nbytes *= 2;
+	op.dummy.ncycles = read->num_mode_clocks + read->num_wait_states;
 
 	return spi_nor_spimem_check_read_pp_op(nor, &op);
 }
@@ -3492,7 +3481,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 		.op_tmpl = &info.primary_op_tmpl,
 		.primary_op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
 					      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
-					      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
+					      SPI_MEM_OP_DUMMY_CYCLES(nor->read_dummy, 0),
 					      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
 		.length = nor->params->size,
@@ -3501,11 +3490,6 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 
 	spi_nor_spimem_setup_op(nor, op, nor->read_proto);
 
-	/* convert the dummy cycles to the number of bytes */
-	op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
-	if (spi_nor_protocol_is_dtr(nor->read_proto))
-		op->dummy.nbytes *= 2;
-
 	/*
 	 * Since spi_nor_spimem_setup_op() only sets buswidth when the number
 	 * of data bytes is non-zero, the data buswidth won't be set here. So,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 670182b3c2ad..11817280f650 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -19,10 +19,10 @@
 #define SPI_NOR_DEFAULT_SECTOR_SIZE SZ_64K
 
 /* Standard SPI NOR flash operations. */
-#define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
+#define SPI_NOR_READID_OP(naddr, ncycles, buf, len)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 0),			\
 		   SPI_MEM_OP_ADDR(naddr, 0, 0),			\
-		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DUMMY_CYCLES(ncycles, 0),			\
 		   SPI_MEM_OP_DATA_IN(len, buf, 0))
 
 #define SPI_NOR_WREN_OP							\
@@ -82,7 +82,7 @@
 #define SPI_NOR_READ_OP(opcode)						\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_ADDR(3, 0, 0),				\
-		   SPI_MEM_OP_DUMMY(1, 0),				\
+		   SPI_MEM_OP_DUMMY_CYCLES(1, 0),			\
 		   SPI_MEM_OP_DATA_IN(2, NULL, 0))
 
 #define SPI_NOR_PP_OP(opcode)						\
@@ -652,7 +652,7 @@ int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
-int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ncycles, u8 *id,
 		    enum spi_nor_protocol reg_proto);
 int spi_nor_sr_ready(struct spi_nor *nor);
 int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f97f2dead8c2..34eb15c7d3b3 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -525,7 +525,7 @@ static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
+			op.dummy.ncycles = nor->params->rdsr_dummy;
 			/*
 			 * We don't want to read only one byte in DTR mode. So,
 			 * read 2 and then discard the second byte.
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b1b14ed0fd46..96bb2383448c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -53,10 +53,10 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
-#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ndummy, buf)		\
+#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ncycles, buf)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
-		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DUMMY_CYCLES(ncycles, 0),			\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
 #define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
@@ -115,7 +115,7 @@ static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 
 	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 		op.addr.nbytes = nor->addr_nbytes;
-		op.dummy.nbytes = params->rdsr_dummy;
+		op.dummy.ncycles = params->rdsr_dummy;
 		op.data.nbytes = 2;
 	}
 
@@ -591,7 +591,7 @@ static int s25fs256t_late_init(struct spi_nor *nor)
 	/* Read Architecture Configuration Register (ARCFN) */
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_ARCFN, 1,
+					  SPINOR_REG_CYPRESS_ARCFN, 8,
 					  nor->bouncebuf);
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
