Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83E606A329
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1fm5eP6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OlWCnKpt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5CGmgTl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZzFRwRNXSAmYq/jDRG9Kh58+dSP6EnC0YzNDXlXm0Vc=; b=r1fm5eP6yE1vK85r5XJAd0gbuM
	oQucvRWiamZfveWzxq5jJ/RoBQi0S/Yxvp8E045pcef0kUPqlNHoPazTMbfEyvaNVzBAM1mDkPW4t
	ZqVLsrOQ2JdJzx7ShMgKo3Jlkzf3iEJ/cy414dfd63lGmeXkr7F+rv6LmIs/xzcxAIPKGYaEsXMcH
	f/2w3g3Ptv0PLvjBGcfJ4h4VHsxRvzIDFuKTRBE+kj3IlT/3U6CwwMYs3UeKCMJAf7V1AYymyTFJB
	YzhACa01ROf8GTOwSVCMrrecEqERFgO5cx+olzSWcsbLkxqHHALhbDtUGJE21BjC43+0HfGcUvis1
	Qfw6s2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxW-0000000GWcx-2xKZ;
	Fri, 27 Nov 2026 14:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvl-0000000GUzI-2g1h;
	Fri, 27 Nov 2026 14:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t8xaCGkapw3XVy4Hw7CV1emEcGQK7H2PmWY00ef3WO0=; b=OlWCnKpthARKIZlz5YAypdEBjk
	AXh1Cy68tk1n0SnF7O8X8dmI9f/G54Fa8z+XzXdToBxOMy2Di02NOvUoE9UxrYYTc/b8Ez5XyoGSX
	n9wSl2fmdAfc5QV4X7qMs3PXtzR7xGtfC9FUj2i/wQlrlDW1M15gzfrnRW8WD7Ms89ujMujTTQR8d
	Dw3V984Y0fU8oUXFo+y4P1XgKBxzbaD+pvUjzLamw2JBGHaYGW9xFafhABFSPwNA+HbKbrpvhLh63
	2a50Bnpa/gh1Y4SK46gKIE00JI8kyBmci3NFBYTPogYLI3Hri016XX7oDO8YJ04BqFOdgCFET7zJ5
	CMQGujZQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvg-00000007oNT-0QHb;
	Fri, 27 Nov 2026 14:28:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EDFDCC2AC52;
	Fri, 27 Nov 2026 14:28:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E54A6049C;
	Fri, 27 Nov 2026 14:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50A7611E68FDF;
	Fri, 27 Nov 2026 15:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t8xaCGkapw3XVy4Hw7CV1emEcGQK7H2PmWY00ef3WO0=;
	b=E5CGmgTl43LUv/Wxw0p2JNyzgHt6z+dpetXd2kS2qL+rL3snuzvIp+P3rbNz+oyk3fu7hU
	TreJNAyLrcFBm0ugH5RPSeM0g9U79sBAo6XOxTA0gykC687ycVdJNNS8Omz1uj7z0kNkMj
	ptomlmpr0rgl6yiczbLUuJ0sCh9qWzEjbvJpVGx3HrxQZmFyOInGk/ho6nHCOJrDnNMGKQ
	/ffnWqCFriCA1995pfJqfSAshYk3zJkoF0AyX/et/5qq9IVuqHC+Wx+beqi9s7hknfy5a3
	XVhD4IsrEdp1utYqalbP0yCtkNQrPGdfvYa4RkylmyJh+fe3smtIk4rCrLocDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:56 +0100
Subject: [PATCH RFC v2 34/35] spi: zynqmp-gqspi: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-34-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142800_062499_F4013F39 
X-CRM114-Status: GOOD (  19.47  )
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

The controller programs the dummy phase in clock cycles in the GEN_FIFO,
but the driver converts the legacy dummy byte count itself. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Store the dummy cycle count in a dedicated dummy_cycles field instead of
reusing bytes_to_transfer, which is reserved for byte-oriented transfers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 15e9d3ef8839..6289e33c2807 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -176,6 +176,8 @@ struct qspi_platform_data {
  * @rxbuf:		Pointer to the RX buffer
  * @bytes_to_transfer:	Number of bytes left to transfer
  * @bytes_to_receive:	Number of bytes left to receive
+ * @dummy_cycles:	Number of dummy cycles to insert
+ * @dummy_phase:	Whether the dummy phase is currently executing
  * @genfifocs:		Used for chip select
  * @genfifobus:		Used to select the upper or lower bus
  * @dma_rx_bytes:	Remaining bytes to receive by DMA mode
@@ -198,6 +200,8 @@ struct zynqmp_qspi {
 	void *rxbuf;
 	int bytes_to_transfer;
 	int bytes_to_receive;
+	u32 dummy_cycles;
+	bool dummy_phase;
 	u32 genfifocs;
 	u32 genfifobus;
 	u32 dma_rx_bytes;
@@ -681,8 +685,14 @@ static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
 			transfer_len = xqspi->dma_rx_bytes;
 		else
 			transfer_len = xqspi->bytes_to_receive;
-	} else {
+	} else if (xqspi->txbuf) {
 		transfer_len = xqspi->bytes_to_transfer;
+	} else {
+		/*
+		 * The GEN_FIFO immediate_data field carries a number of
+		 * dummy SCLK cycles, not a byte count.
+		 */
+		transfer_len = xqspi->dummy_cycles;
 	}
 
 	if (xqspi->txbuf)
@@ -832,7 +842,8 @@ static irqreturn_t zynqmp_qspi_irq(int irq, void *dev_id)
 			(mask & GQSPI_IER_GENFIFOEMPTY_MASK))
 		zynqmp_qspi_readrxfifo(xqspi, GQSPI_RX_FIFO_FILL);
 
-	if (xqspi->bytes_to_receive == 0 && xqspi->bytes_to_transfer == 0 &&
+	if (!xqspi->dummy_phase &&
+	    xqspi->bytes_to_receive == 0 && xqspi->bytes_to_transfer == 0 &&
 	    ((status & GQSPI_IRQ_MASK) == GQSPI_IRQ_MASK)) {
 		zynqmp_gqspi_write(xqspi, GQSPI_IDR_OFST, GQSPI_ISR_IDR_MASK);
 		complete(&xqspi->data_completion);
@@ -1109,15 +1120,13 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 		}
 	}
 
-	if (op->dummy.nbytes) {
+	if (op->dummy.ncycles) {
 		xqspi->txbuf = NULL;
 		xqspi->rxbuf = NULL;
-		/*
-		 * xqspi->bytes_to_transfer here represents the dummy circles
-		 * which need to be sent.
-		 */
-		xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
+		xqspi->dummy_cycles = op->dummy.ncycles;
+		xqspi->bytes_to_transfer = 0;
 		xqspi->bytes_to_receive = 0;
+		xqspi->dummy_phase = true;
 		/*
 		 * Using op->data.buswidth instead of op->dummy.buswidth here because
 		 * we need to use it to configure the correct SPI mode.
@@ -1136,6 +1145,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 			xqspi->rxbuf = NULL;
 			xqspi->bytes_to_transfer = op->data.nbytes;
 			xqspi->bytes_to_receive = 0;
+			xqspi->dummy_phase = false;
 			zynqmp_qspi_write_op(xqspi, op->data.buswidth,
 					     genfifoentry);
 			zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST,
@@ -1151,6 +1161,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 			xqspi->rxbuf = (u8 *)op->data.buf.in;
 			xqspi->bytes_to_receive = op->data.nbytes;
 			xqspi->bytes_to_transfer = 0;
+			xqspi->dummy_phase = false;
 			err = zynqmp_qspi_read_op(xqspi, op->data.buswidth,
 					    genfifoentry);
 			if (err)
@@ -1179,6 +1190,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 
 return_err:
 
+	xqspi->dummy_phase = false;
 	zynqmp_qspi_chipselect(mem->spi, true);
 	mutex_unlock(&xqspi->op_lock);
 
@@ -1206,6 +1218,7 @@ static const struct spi_controller_mem_ops zynqmp_qspi_mem_ops = {
 
 static const struct spi_controller_mem_caps zynqmp_qspi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 /**

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
