Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E5606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X0neRz08;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=hMlctCZn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kGsF5AxB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5wv1QDJ38FOl8shsz88s0J8+qq4s0LLdRedOMOUuJdk=; b=X0neRz08N3lqk/jPR8Igvt6EvI
	W6xpLHDy9qh/2HMIX/dDq2Wi1LGK+MMxGgzq2UgiZ+iYV3rtoz9mzpKbGWVcNJDAp9ix0z4HJyuCL
	JnD4sXLZTRh1cG3unKWeivJx7nAOfvYSufYFx1bx1erkreiiuyRxTyshgJxKNuPZR2J9rP0aH+b/n
	g9IimuGE6OO1tXIgrvR6R0k2EgKa7d45kmQKuSokCY8H/ouf3mm2cbUkw6d4RnalNFC3qvplSK4E8
	UZekD+Kr88mN0/2w8Vu8pyCAQ4X6oUqvYlJlqJnJyTA/Dum804A9VlsKSGuBpHn1SF15fkR++SN4T
	aOY2ZKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwta-0000000GQLz-0ihe;
	Fri, 27 Nov 2026 14:25:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsS-0000000GOQF-1r0X;
	Fri, 27 Nov 2026 14:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l/15886dKnKp6gPMgY9uT99zHLf7znFw9ejlkvdaZy0=; b=hMlctCZnuz4JyhEbZypzQH7iQZ
	Rh0UF9Fxvoa1XUBTlqGD6yZvItvLuA8LPwBagw4zZHMqyyAXiUUd04cM5Z4Gxv2tNscbXsf7QFv9a
	l82nYApRVEzuDus4uSCEA673c+oVyoK3diiN1klhDZKcQdZrLy0Y0stTOQHGbZirfi4MqQXRwRjMA
	QeKy+8Kk6Gs+6vq7ZLSjuQPd8cjHyTm+maGU8rxxL9NfSFKrZXUUorS+2YZYFkY2OwvDyPNkdsFh6
	D6ut4BVeDg0PExm05h8Y2xOhxj4/Fd81gKXctLMEgZQ7I1OGnOg6hWqAAB+1hUudzQvREHMsh7P2V
	rULCORHw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsP-0000000FX5Y-05tq;
	Fri, 27 Nov 2026 14:24:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4BC12C2AC50;
	Fri, 27 Nov 2026 14:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7992D6049C;
	Fri, 27 Nov 2026 14:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FBB711E68FFA;
	Fri, 27 Nov 2026 15:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l/15886dKnKp6gPMgY9uT99zHLf7znFw9ejlkvdaZy0=;
	b=kGsF5AxBn8Rt2DEwGlOWei3yUYq4TV1ZPi4qIPPHbmd6eelpv0mn1xbA+O0+dGwhY0pfK7
	O4OwZIp/z2P+n6XRQdP3puDumWjXAMqCKBmsqF6x/5TOzwGL/q4QWJ4HI6NySSUru5UKwg
	/lmJaFMaTkGqeFtOfb5wM3vrtMgyQ1iZU/xGMCDHfOjH2mj6YNkumLoY67HK0nKH9MNB3x
	wMZf/+++3cDKfUD9EroH9uwfH/ZLm4l6uVDLmUzCFpknODt6ftJJ5V1MtDj37SJBWArfUE
	aVRxGvdI57fv+avy18hAS2Kd2HzRYepJF/CDBRtDl5803yDLPE5CswKuWXlyew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:31 +0100
Subject: [PATCH RFC v2 09/35] spi: amlogic-spifc-a4: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-9-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142437_155140_AD5C4B51 
X-CRM114-Status: GOOD (  12.26  )
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
 drivers/spi/spi-amlogic-spifc-a4.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 16346f50c7d9..9b658ed1a580 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -148,7 +148,6 @@
 #define SFC_MAX_CS_NUM			2
 
 /* SPI-FLASH R/W operation cmd */
-#define SPIFLASH_RD_OCTALIO		0xcb
 #define SPIFLASH_RD_OCTAL		0x8b
 #define SPIFLASH_RD_QUADIO		0xeb
 #define SPIFLASH_RD_QUAD		0x6b
@@ -334,23 +333,9 @@ static int aml_sfc_send_addr(struct aml_sfc *sfc, const struct spi_mem_op *op)
 	return 0;
 }
 
-static bool aml_sfc_is_xio_op(const struct spi_mem_op *op)
-{
-	switch (op->cmd.opcode) {
-	case SPIFLASH_RD_OCTALIO:
-	case SPIFLASH_RD_QUADIO:
-	case SPIFLASH_RD_DUALIO:
-		return true;
-	default:
-		break;
-	}
-
-	return false;
-}
-
 static int aml_sfc_send_cmd_addr_dummy(struct aml_sfc *sfc, const struct spi_mem_op *op)
 {
-	u32 dummy_cycle, cmd;
+	u32 cmd;
 	int ret;
 
 	ret = aml_sfc_send_cmd(sfc, op);
@@ -361,13 +346,8 @@ static int aml_sfc_send_cmd_addr_dummy(struct aml_sfc *sfc, const struct spi_mem
 	if (ret)
 		return ret;
 
-	if (op->dummy.nbytes) {
-		/*  Dummy buswidth configuration is not supported */
-		if (aml_sfc_is_xio_op(op))
-			dummy_cycle = op->dummy.nbytes * 8 / op->data.buswidth;
-		else
-			dummy_cycle = op->dummy.nbytes * 8;
-		cmd = CMD_DUMMY(sfc->cs_sel, dummy_cycle - 1);
+	if (op->dummy.ncycles) {
+		cmd = CMD_DUMMY(sfc->cs_sel, op->dummy.ncycles - 1);
 		return regmap_write(sfc->regmap_base, SFC_CMD, cmd);
 	}
 
@@ -803,7 +783,7 @@ static int aml_sfc_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	dev_dbg(sfc->dev, "cmd:0x%02x - addr:%08llX@%d:%u - dummy:%d:%u - data:%d:%u",
 		op->cmd.opcode, op->addr.val, op->addr.buswidth, op->addr.nbytes,
-		op->dummy.buswidth, op->dummy.nbytes, op->data.buswidth, op->data.nbytes);
+		op->dummy.buswidth, op->dummy.ncycles, op->data.buswidth, op->data.nbytes);
 
 	ret = aml_sfc_pre_transfer(sfc, DEFAULT_PULLUP_CYCLE, CS_SETUP_CYCLE);
 	if (ret)
@@ -1057,6 +1037,7 @@ static int aml_sfc_ecc_finish_io_req(struct nand_device *nand,
 
 static const struct spi_controller_mem_caps aml_sfc_mem_caps = {
 	.ecc = true,
+	.dummy_cycles = true,
 };
 
 static const struct nand_ecc_engine_ops aml_sfc_ecc_engine_ops = {

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
