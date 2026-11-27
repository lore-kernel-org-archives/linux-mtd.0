Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC949606C2D9
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gEBoxo4T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fgv+QF4p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Fpmteki0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=idplif8m5ZBW0d7Y5dvLACNe5pbJ2twfA5UlbZbzm+Q=; b=gEBoxo4TIPg2sgFcvQi4xSKmWI
	l4vntJEEncskbfRdB+5rt2gVmI6yKpupDyRyVZL6gwRieFZOeTtN6IEQk1i6cTS+h4zev9g1NunLN
	MdLIH20fCy/JQ4Jmnqm9AqKztp8YIe+oZbKHLCdIUpsxyavtsgrigK9LV46PldcunpyDo1E55eu7F
	IYgUlnaYv7/UQ6pCSLLnBPir3iQPJW4JjXwdM8P6m+bqUbZN3HHaYMvq0uTPCgm6E4zBhPvtzhvZM
	yDd02JEO/+GziAYvd7mkgw+g2EK+bMlZCPVN83SXumkNmYEFisz4lQso/MRw8O2ObalN+GYb9HTKy
	yNQRB5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvN-0000000GUCO-3W7v;
	Fri, 27 Nov 2026 14:27:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuV-0000000GS01-1yuh;
	Fri, 27 Nov 2026 14:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=YzT25YrXhPdhGBX2h17WLtbdgvi9pFvDHL3L6j1EVv0=; b=fgv+QF4p8d2JdnLQukKXbJpl0k
	Nuy1sRnF7jmbP+eVIo4DrdEgLDL0g1efpWZBKMUMQvLNI8gcZYT8weM7yV0729SaHDc1FK+WKTdak
	H3lsYO7BzPrOv7WjsoELDLuyttg9EQu+2In5NG2RFmaYNSRfXic/3utvqvr6+7griTelj+cXFhKAh
	JRavF9IavUsZ/GaFfe1psMLpgN5hXNBYNhjREQVVjqwgVbI8rXp61XZeYnf8fTnvDJG9RVUg06pIw
	aYomAwSYZPNW3nvJ9q5mDrYNVbJ7sRpxtCqOd1wN1/emBcqLzI1PWn1D2NeqwgOfLJwwG3NaqHXDE
	fdaGHLJQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuS-0000000FaXP-1F4O;
	Fri, 27 Nov 2026 14:26:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37420C6223B;
	Fri, 27 Nov 2026 14:26:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CC336049C;
	Fri, 27 Nov 2026 14:26:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6DEE11E68FF9;
	Fri, 27 Nov 2026 15:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YzT25YrXhPdhGBX2h17WLtbdgvi9pFvDHL3L6j1EVv0=;
	b=Fpmteki0Aybr9vK6i02FZbrrKdnKXnJriXCr7U+IqKfAZ+ZjARQAf3xSYHOufNwk9Rtc9G
	0U9FU7sdV2u3iUKwF9SkItBvexDSdndISg8xQAuGppSnxwgLIf7RjhPFxB8d6RXjWBEXWd
	BRqr3WMPnugTa/fqFQqaFZuoEhWNtUzBGo/muuF1v2VfinijqfNEKS6kqJthwVs6wSmJuL
	lh+xQECYOHTiNJR+Exz8PAa+QNd+hO4XarM4R5aVNW7PKWoNVgUtTX++m7GU7/Zy9/isK2
	5KXRHbiNhYEvdhJBmynuf2j/6oZiL4WhEcBkz6epU+W7pFASnm61iljlbdDSvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:47 +0100
Subject: [PATCH RFC v2 25/35] spi: rtk-nor: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-25-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142644_442500_F6F22D3F 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: -2.1 (--)
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

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-rtk-nor.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
index 55ea7c371854..28fafa69cfbd 100644
--- a/drivers/spi/spi-rtk-nor.c
+++ b/drivers/spi/spi-rtk-nor.c
@@ -92,18 +92,10 @@ struct rtk_spi_host {
 	size_t			dirmap_size;
 };
 
-static u32 rtk_spi_calc_dummy_cycles(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op *op)
 {
 	u32 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	if (op->data.buswidth == 2)
 		opcode |= DUAL_MODE_EN;
@@ -113,10 +105,8 @@ static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op
 	val = readl(host->regbase + SFC_CTL);
 	val |= RW_DATAEN | ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-
 	val &= ~SFC_CTL_DMYCNT_MASK;
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op->dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	readl(host->iobase);
@@ -192,7 +182,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	size_t len = op->data.nbytes;
 	loff_t offset = op->addr.val;
 	u8 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	writel(opcode, host->regbase + SFC_OPCODE);
 
@@ -203,8 +193,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	if (op->addr.nbytes > 0)
 		val |= ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op->dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	return rtk_spi_byte_transfer(host, offset, len, op->data.buf.in, true);
@@ -346,8 +335,8 @@ static bool rtk_spi_supports_op(struct spi_mem *mem,
 	if (!op->addr.nbytes && op->data.nbytes > 1)
 		return false;
 
-	if (op->dummy.nbytes != 0) {
-		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
+	if (op->dummy.ncycles) {
+		if (op->dummy.buswidth > 1 || op->dummy.ncycles > 7 * BITS_PER_BYTE)
 			return false;
 	}
 
@@ -464,6 +453,10 @@ static const struct spi_controller_mem_ops rtk_spi_mem_ops = {
 	.adjust_op_size = rtk_spi_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps rtk_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rtk_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -535,6 +528,7 @@ static int rtk_spi_probe(struct platform_device *pdev)
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &rtk_spi_mem_ops;
+	ctrl->mem_caps = &rtk_spi_mem_caps;
 	ctrl->num_chipselect = 1;
 	ctrl->auto_runtime_pm = true;
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
