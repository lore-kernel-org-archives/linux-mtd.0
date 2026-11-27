Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4261606B414
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrKn7fhb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I7lOXtPq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iYhTyubi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h9Nyeg+ccYeMzv/8fvh+d48C28P9PlayK0brPKeQtM4=; b=xrKn7fhbgOMy7hbfQL1yO4KPmq
	CDp8oyM1sAPDmQQpC3VmBAOTXwDlExwlD7Re/klYZfguqQ6qeoBsiCmjG3ugD8txC2mYcX6aO6CIp
	E1NrZeEMqx8ICBs/4UrwiA5x+1KDjh29BydSvVptpOS2xwy5qQNAOh1uKNmKY+P808lzDemqPmtvL
	84QmSlNojfjlRZF34cL4zOgGCkRD+MwvVXB+EG2NjiV0GJ9Du5daaXg4UtM1gtce4UVob5+t2Xgr/
	e+PdK6yR4VWqI7PuhJlNBL2Iz4DYLufpmLWKGj7CvrgJulExlur09+qaVFgFuZz7g1ROD0xg/oaBL
	/MJox+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtm-0000000GQoh-3m0J;
	Fri, 27 Nov 2026 14:26:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwso-0000000GPHC-3tIO;
	Fri, 27 Nov 2026 14:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AyWE+t1jQM06xzjS0D79QahZuOEjGLIi+nV7A0Efk90=; b=I7lOXtPq2DwlkhN6I1dBHImg4X
	Aso5LC/htYuqnpCTlSHFUK+CnJf6TvsQmi0m3/U7dfGDSfkfyGVKw+K/6KR4yqLT48VAW9gtf+syb
	CNWnxTjOAKo0HshLu2XSc4oyoGAeHBvm1w/kvUlz0uYML8enmjmls1RL9bVFQ7lwO9OQpeA8lnWU0
	jGIg3PPiVFqq5esb8/j8sFdM16Z70GeBkpgz6TrDxVid7FeYAdxK3HJQL5lSOPVVb5/T4sdamH59m
	/MYlc/XHNm/xUwyJbizkpQmDpWQRpqig05cKls5uueMM4aM2+fJJ7MrHzzwxHrOAiyTKGRD1uHULF
	ZOsZUJIw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsk-0000000FXsN-2ynO;
	Fri, 27 Nov 2026 14:25:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7683C2AC50;
	Fri, 27 Nov 2026 14:25:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAD216049C;
	Fri, 27 Nov 2026 14:24:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A109311E68FF9;
	Fri, 27 Nov 2026 15:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AyWE+t1jQM06xzjS0D79QahZuOEjGLIi+nV7A0Efk90=;
	b=iYhTyubiDIwXjPh8z4yCi8Tp5QLBms/5mf5UVSazYSfG7jYL8kvX12KYSqelsXHx02ZYgT
	QUFX4RxgyHRmnBa2A2S0U6uaao9ThPkfBUMeVReQAF2aR8YHtVShehVdR4L9DL8S9QTWP3
	As1DHAWm3E360QU3aT/KsOhMve8juKpr+9GFEdSYZ0az+Berg32tUhlTyU8v86yyVD0sXp
	c11lMlR4XwlFjnKDk8Nbs6SuYFQzG632H8b5ifTkv+4ejfU7aIH8u4p+qyWoA1aLewlvnr
	re/icJkPJviqAv7LZLClwO/6crDYnRsotsCyk1QMsR9ZMr+0GzHX83FgXq5k6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:34 +0100
Subject: [PATCH RFC v2 12/35] spi: cadence-qspi: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-12-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142459_050096_0F7A8048 
X-CRM114-Status: GOOD (  15.18  )
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
 drivers/spi/spi-cadence-quadspi.c | 48 +++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 44d96b8cf8f0..df7c04e0e2d2 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -410,20 +410,6 @@ static unsigned int cqspi_calc_rdreg(const struct spi_mem_op *op)
 	return rdreg;
 }
 
-static unsigned int cqspi_calc_dummy(const struct spi_mem_op *op)
-{
-	unsigned int dummy_clk;
-
-	if (!op->dummy.nbytes)
-		return 0;
-
-	dummy_clk = op->dummy.nbytes * (8 / op->dummy.buswidth);
-	if (op->cmd.dtr)
-		dummy_clk /= 2;
-
-	return dummy_clk;
-}
-
 static int cqspi_wait_idle(struct cqspi_st *cqspi)
 {
 	const unsigned int poll_idle_retry = 3;
@@ -549,7 +535,6 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 	size_t n_rx = op->data.nbytes;
 	unsigned int rdreg;
 	unsigned int reg;
-	unsigned int dummy_clk;
 	size_t read_len;
 	int status;
 
@@ -574,12 +559,11 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 	rdreg = cqspi_calc_rdreg(op);
 	writel(rdreg, reg_base + CQSPI_REG_RD_INSTR);
 
-	dummy_clk = cqspi_calc_dummy(op);
-	if (dummy_clk > CQSPI_DUMMY_CLKS_MAX)
+	if (op->dummy.ncycles > CQSPI_DUMMY_CLKS_MAX)
 		return -EOPNOTSUPP;
 
-	if (dummy_clk)
-		reg |= (dummy_clk & CQSPI_REG_CMDCTRL_DUMMY_MASK)
+	if (op->dummy.ncycles)
+		reg |= (op->dummy.ncycles & CQSPI_REG_CMDCTRL_DUMMY_MASK)
 		     << CQSPI_REG_CMDCTRL_DUMMY_LSB;
 
 	reg |= BIT(CQSPI_REG_CMDCTRL_RD_EN_LSB);
@@ -696,7 +680,6 @@ static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
-	unsigned int dummy_clk = 0;
 	unsigned int reg;
 	int ret;
 	u8 opcode;
@@ -714,13 +697,11 @@ static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
 	reg |= cqspi_calc_rdreg(op);
 
 	/* Setup dummy clock cycles */
-	dummy_clk = cqspi_calc_dummy(op);
-
-	if (dummy_clk > CQSPI_DUMMY_CLKS_MAX)
+	if (op->dummy.ncycles > CQSPI_DUMMY_CLKS_MAX)
 		return -EOPNOTSUPP;
 
-	if (dummy_clk)
-		reg |= (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
+	if (op->dummy.ncycles)
+		reg |= (op->dummy.ncycles & CQSPI_REG_RD_INSTR_DUMMY_MASK)
 		       << CQSPI_REG_RD_INSTR_DUMMY_LSB;
 
 	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
@@ -1523,16 +1504,14 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 	bool all_true, all_false;
 
 	/*
-	 * op->dummy.dtr is required for converting nbytes into ncycles.
-	 * Also, don't check the dtr field of the op phase having zero nbytes.
+	 * The controller only supports operations where all phases use the
+	 * same DTR mode.
 	 */
 	all_true = op->cmd.dtr &&
 		   (!op->addr.nbytes || op->addr.dtr) &&
-		   (!op->dummy.nbytes || op->dummy.dtr) &&
 		   (!op->data.nbytes || op->data.dtr);
 
-	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
-		    !op->data.dtr;
+	all_false = !op->cmd.dtr && !op->addr.dtr && !op->data.dtr;
 
 	if (all_true) {
 		/* Right now we only support 8-8-8 DTR mode. */
@@ -1550,6 +1529,13 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		return false;
 	}
 
+	/*
+	 * The controller has no separate dummy buswidth: the dummy phase is
+	 * clocked with the address buswidth.
+	 */
+	if (op->dummy.ncycles && op->dummy.buswidth != op->addr.buswidth)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 
@@ -1739,12 +1725,14 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.no_cs_assertion = true,
+	.dummy_cycles = true,
 };
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
