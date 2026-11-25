Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A0660A260A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A0zvAnh4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OnLpYGEh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=08jSwX/q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Td7J3jsZqrZ3uXY2W1mRK+W/ynRc84bAkshI6B59QtM=; b=A0zvAnh4TXIROzrcSj0MT5hPsI
	MCqZvdK+8revz4TYWjnsVgaja41Ymb9rIM8CoH7OIT1FnFrqtdha6DKovBaAp3GopG5mcJVlqKg0j
	1uk/dKW8nzyLl9KEnxFjEbMqq2DEfAeMGBSLm67CrkhKLYoVkkhYgB9l+8azraBbdbUFL1iIoaMn3
	CNZmqreGYF+Lh3E68lDeTMenoZrNCFRoOPHfLgpZcNfVbiVwb8AHvhpZXwiK7Wzw0xKCRqZWj/Ccq
	5uIhfCbe2UdnScOmf7jKxTpO6sg2rxKHpaH/prjSu67nqazgewZ+ilRcTpH/nML9+X8IaoRxqcHAV
	g+SuBkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHB2-0000000AolQ-2OnT;
	Wed, 25 Nov 2026 17:53:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAQ-0000000Anvh-3wgH
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jCUxGWBmv4RksFsXo6xHOnvrHIscL64ZTXdKjZ8tDac=; b=OnLpYGEhPEoTh2hzrEyZPUUpt+
	XLjvAWftolYBJAMPolvdCmDQjKN8Hz+39ly/gXL1E8GoRuuAjprbWLhz9v8GgTm0ANpCkbKla0ZCQ
	IoKg8uWTneP1vbjKff+sBK01RZE8Jj8eqWGIOduWHy+1zN9O/K1CayzedJOER7e+Ur54q/rkgHWCK
	378RDei8O4/lVGAlUPAHzeQLxV8XheCtLw8wn8TJWef7jgEI+gaZYOoddrsPSENWyZkOUrM49+fGV
	Jk7Wb91ed4vVv8kxZZWIAq+3Pw70FsyxF/i0TvuaqYyuo5A1wQ2uVBuommuPmgPEOMF2d+ckxL3lD
	doonCNew==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAN-00000005bCQ-2P1F
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CBA574E41786;
	Wed, 25 Nov 2026 17:52:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D9EB604C0;
	Wed, 25 Nov 2026 17:52:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FDE611E6B0D4;
	Wed, 25 Nov 2026 18:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jCUxGWBmv4RksFsXo6xHOnvrHIscL64ZTXdKjZ8tDac=;
	b=08jSwX/qrR/kl/IHIopVYsD4umanGbaUHFOUFuPFYhXk3Rc9rYtqlCQp/g9E/fSdJrLTBW
	gA00YXONY/bkZ8UYpTtaGxtquhleGOgvbhdESAcGRCj467v9FTPYTchbUoor4ObhwAg9DD
	vPxmP+lhzsgnETi0W5QrmZh0AxHYEtJA8epjSK7IapKp09DPeio5MaqYNP3YSX8knLN73l
	Qw6p9V6J9fE7VBNp3vh04Fb0ZpR3FSYnz2h8wkALFafNkGYRL80xCJ2bVA3+vXzEt9y30R
	TZ12USBkg1BH4H5n30eYV15FAOqpQYmn/pjN7q38ILpeewkK+DE1flD6vTh7mg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:21 +0100
Subject: [PATCH RFC 07/16] spi: cadence-qspi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-7-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175223_617248_049D18C1 
X-CRM114-Status: GOOD (  14.26  )
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

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 44d96b8cf8f0..1bf21cadd1da 100644
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
@@ -1528,7 +1509,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 	 */
 	all_true = op->cmd.dtr &&
 		   (!op->addr.nbytes || op->addr.dtr) &&
-		   (!op->dummy.nbytes || op->dummy.dtr) &&
+		   (!op->dummy.ncycles || op->dummy.dtr) &&
 		   (!op->data.nbytes || op->data.dtr);
 
 	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
@@ -1739,12 +1720,14 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
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
