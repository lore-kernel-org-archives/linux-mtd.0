Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6B6071E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCXwxjGf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CjxQOQkY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Nbd+2k2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fxRe824dqwMwPPB6hb0+bAjtzGzFczrVZNr8SmnbwNY=; b=GCXwxjGfEHybhCGpJ+XhgcZQZR
	Xsiy7aOMnuf3NDG+tWZSt7uQ+g693ydvCoNqRUTHymvDgdnBq+GxghHosluvHhdJu9jG2fk6s/FUm
	dvKr2u1X2M1ko+8L1iZ96lvt6t8hAI30HCEWYyxwK6YMbsONUR5JsDl27sQS0ItflmvzvSDahpSw2
	o/tpGNisuRomIQqmljl66iaYxbTuwPYgdoJd/kK962Wg9z1FAg5vTjmqGtjiS3udWhuvOOsmECDWO
	QRdamEFfHuAHLIqv3Y9JNWxF0WGLe+DhNK1xcXjNR4+AdsEz4b2IPOU2IEyhnGOQKWpYNrYQAojtv
	Rjuf1/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuQ-0000000GRq7-16eM;
	Fri, 27 Nov 2026 14:26:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtP-0000000GQ1p-3kkj
	for linux-mtd@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oIP6YsVJ0tzemJtkR4/F0RGkjUMxie6otevjRQEs/Zw=; b=CjxQOQkYYY1keBMsOslE/hnf0c
	JNSyKt5iEBjaPK9wVYbT5K/pIx/111NUqbDJbxCZ4f6j1H00IaSiA0TnJrUYmEJv9t+UJv9c5KyDF
	tiGcVwKoexeR3Q7kUZ0YPlmWlCez8m9nJT8nkT/RhVWlB5yvTVY8Tk8jVn64c0dbar4fEP8406ESC
	Sl1IrxySNT0sQejyOHxGF0Rez29ht9GiixoFsGgkHj6x3FoYcDDix5qBoVgx0klfMopIV9oTlWeUr
	C/fvqzEvHO1XIzprZzn8V6Ub15GzL4EhHXQNOpHu0nI9ytpDXRFokw94bhlU8AVhDBtQp02eeRx4W
	4HagD6Ug==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtL-00000007n63-2mdV
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 14:25:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49B35C6223B;
	Fri, 27 Nov 2026 14:25:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B116049C;
	Fri, 27 Nov 2026 14:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 026A611E68FF4;
	Fri, 27 Nov 2026 15:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oIP6YsVJ0tzemJtkR4/F0RGkjUMxie6otevjRQEs/Zw=;
	b=Nbd+2k2zRxfdX4N7PZuOesTe7y9uTS4XxFCrwjSo3LlykwttKnd2QBPXS7PTjAeHu+DGsh
	ub3eIakOiP6Hwf4eE4KcQ6YASWe65YaVejiDLnN5qvyijvuYpqqX5380WkqD+LdzgSxTeG
	hHVt7tbvP1wXmxEl3y3Xj1L7/yArHiTLqkQjyFNFVzowU47sJHCqDoz7MDVHrXwR9Q6Ng6
	cFg4OluANdGXIR+2n8CHr79haJq9g91aU7IpYD0AKFqSBfvfRvX+SutHyxGkqrS9FR19y+
	EaljxuCCa79rQSzyVe7u74NkZpnNJezBU/S5NAko5jt+NEUgcla3e/xg4+kB9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:38 +0100
Subject: [PATCH RFC v2 16/35] spi: microchip-core-qspi: Consume dummy
 cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-16-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142535_778648_38E3FDDE 
X-CRM114-Status: GOOD (  13.96  )
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

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index c0ea65014d2e..80481011b83e 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -420,7 +421,6 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 
 static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
-	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
 
 	cmd_bytes = op->cmd.nbytes + op->addr.nbytes;
@@ -459,11 +459,7 @@ static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi
 	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
 	frames = total_bytes & BYTESLOWER_MASK;
 	frames |= cmd_bytes << FRAMES_CMDBYTES_SHIFT;
-
-	if (op->dummy.buswidth)
-		idle_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
-
-	frames |= idle_cycles << FRAMES_IDLE_SHIFT;
+	frames |= op->dummy.ncycles << FRAMES_IDLE_SHIFT;
 	ctrl = readl_relaxed(qspi->regs + REG_CONTROL);
 
 	if (ctrl & CONTROL_MODE12_MASK)
@@ -561,6 +557,9 @@ static bool mchp_coreqspi_supports_op(struct spi_mem *mem, const struct spi_mem_
 	if (!spi_mem_default_supports_op(mem, op))
 		return false;
 
+	if (op->dummy.ncycles > FIELD_MAX(FRAMES_IDLE_MASK))
+		return false;
+
 	if ((op->data.buswidth == 4 || op->data.buswidth == 2) &&
 	    (op->cmd.buswidth == 1 && (op->addr.buswidth == 1 || op->addr.buswidth == 0))) {
 		/*
@@ -601,6 +600,7 @@ static const struct spi_controller_mem_ops mchp_coreqspi_mem_ops = {
 
 static const struct spi_controller_mem_caps mchp_coreqspi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int mchp_coreqspi_unprepare_message(struct spi_controller *ctlr, struct spi_message *m)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
