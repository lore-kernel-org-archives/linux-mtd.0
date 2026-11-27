Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF246070F70
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RimtbY73;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bf+GqsA0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JfWStJCL+StD8JEI6kECEyJqnr8XC/9uMY0erDY+svg=; b=RimtbY73GyH2c/fUXb1O/bonIV
	Vf0z3NWIzeAoDX4sFKTPH+wtJDF87ckjozLqViBKmk/BDD5BogoVmYxXJt0cufrCReFsk93tKtNwP
	B06pw2YV7oyFkqxz19+BcA8jBjNVk/6OYgPnZV3tl4Afyi9ZAWynV96OA6464zxdFF71fVfcCq2cM
	7bUFlh0CfqXguZxOEdwat4cscOIRuwLrUth5JEX6vqkLnz/wGvNp6XXxCtr04CghaeQXIuFM0FSGF
	qMMDYNsjr0y9iQgZ/DEbe2H/sD1t0WXpjLwfeP4b54HgV5onR1NgyYrgGUZjvJ9kvp9vXc1yLK/ew
	CpCtpDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuI-0000000GRgQ-1wx2;
	Fri, 27 Nov 2026 14:26:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwt3-0000000GPYt-3Dzw;
	Fri, 27 Nov 2026 14:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=; b=bf+GqsA0AcDsGwv27gQgTnajBH
	/USLEV7Rbo5ch3lPaNfrY77kGMZoKx5ursWsA+rpSg6rsFFrGhvu/lq+0Set0kRaM+vKnUPMIZiC4
	Y8XTBcdLJcxdQOQk0ecsLHpQTBF4pBx/HeSUySvHwZlwI9ggrkWER1kOxHtGQ6a6cRm5pj4cy2CJ+
	WByYttCo6bY0nuUSzndb/VpMnEBqQH5EtotdxxFUnVmIN4lUqlb+R9C0eXyW2UplHequOKzynyn2r
	maQKEUHA2YRAnfcBOxUs0WPmA943Mb03Wik6CnpBpshe6UBmOK7tk9Sb0P6QyxzwLF2q4JtbSK7Lb
	Pl1uYccg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsu-0000000FYBp-1kSg;
	Fri, 27 Nov 2026 14:25:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A28104E417C9;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EC866049C;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3EAA11E68FF4;
	Fri, 27 Nov 2026 15:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=;
	b=mCPupFMkcRfnTzAr1Spz4Iuoof0rLblYlcTgdlvYugdCRiPEsvTHWNKbhADlCvSGKwJ1Je
	lG5Vz4gbMxFDMXUAKX2zEYbs9SW2y0Jt47OVeQdpx5boCZeYYwietaLpwk2CBCcFzA01od
	hVYZ222UDqBIVsfEuci6NiuPKeuD2ZvKxyVqhraL0Objx+rpc+fqiGjWVnPgNKypPf0fKm
	JBTqjtXV9bIr1kQI/iTrkEOQPe34K0Ljw8c3zBiDtM4FKtg1390PqeJTgE3ARKDWqV77no
	PMvdPfBmyC4s/lrYEyIosPnLrCgIz2+uZdciTN3WxwezM/pZCt3kVrFNO09jVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:35 +0100
Subject: [PATCH RFC v2 13/35] spi: cadence-qspi: Drop redundant checks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-13-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142508_516316_5052A7C9 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

The core already sanitizes the spi-mem operations, these checks are
redundant so let's drop them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index df7c04e0e2d2..97725ffeae93 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -476,9 +476,6 @@ static int cqspi_setup_opcode_ext(struct cqspi_flash_pdata *f_pdata,
 	unsigned int reg;
 	u8 ext;
 
-	if (op->cmd.nbytes != 2)
-		return -EINVAL;
-
 	/* Opcode extension is the LSB. */
 	ext = op->cmd.opcode & 0xff;
 
@@ -1515,11 +1512,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 
 	if (all_true) {
 		/* Right now we only support 8-8-8 DTR mode. */
-		if (op->cmd.nbytes && op->cmd.buswidth != 8)
-			return false;
-		if (op->addr.nbytes && op->addr.buswidth != 8)
-			return false;
-		if (op->data.nbytes && op->data.buswidth != 8)
+		if (op->cmd.buswidth != 8)
 			return false;
 
 		if (cqspi->is_rzn1)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
