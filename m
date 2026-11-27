Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932160A6F4E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TOlslCyD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H1gR3AbY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ajxc6hVGPPTvCr+WG+EgTKcVVa6cauQOzmpgevD10zk=; b=TOlslCyDzD9cKTPbE6SglkkttV
	NOW9iKcdDQtG9pWFFWxLxTRBdknI4+H0VbU9ltm55AhyXexEvUwsXW13jZxT2+EqumKi5Go1ctjAm
	OML0bD27UbmdvvPynvmR70y/fkFlRmWdMYaosn3Vccl4x1GV6B8lDikn2yZyHQrHtdfe2cgZ/2JQo
	QTOZNNjT89uktJ7BBA0tVBw30bcd2YEenFagkVBQn1Ic1c2eBg+S3F3qTWbKPi+PqD78UHGiIkH2v
	UV9vfZ9Az2Hmdkmr/t1Dv/n+HwGrUVF5XTr1tYpcW50nnAWqAEDYqx5WaXiZn79jlWiV7Ezmg2cWU
	Cv7wFnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvL-0000000GU6m-3n7R;
	Fri, 27 Nov 2026 14:27:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuR-0000000GRqu-15PU;
	Fri, 27 Nov 2026 14:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=; b=H1gR3AbYPCvMaM5xNR2GgRkeLp
	diZgLNyiW+SRuVkmp/vM56BUoSqVC9KhOJtuTSI9DOiMsWOXq5yMBfSkIbgAQV2YaKgBOiHtozrtQ
	Kly7joYJLeZNdZAYe7jFVDjxEaUI78MgmhFcMou9T78wJpqswPONwLpLdCQg1usx8ylfiLOTtzan2
	/TGtxXt82wOSCqb+CcUbUFK7fqlClsl14iVI9Cmn5uhZubGOwDZomtEdu009nTfj8AMLp1b4TuaGU
	CQ+nkZJz7xRphVPPVvXqGeFP8pQMal3D2Vdb+E0u3UH2d2LRMRIfhT+MWuymeNDEykFbY16q7F65G
	8zef6DbQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuN-00000007ncz-2kU2;
	Fri, 27 Nov 2026 14:26:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3ADFA1A183A;
	Fri, 27 Nov 2026 14:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 064DA6049C;
	Fri, 27 Nov 2026 14:26:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B1111E68FD9;
	Fri, 27 Nov 2026 15:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=;
	b=F5FxOjCNucjObr+WpOHDrEhkZVlYHLQEzVZPxyFtxTgV4dEIzIKnUN7gxonuOrhSqt9p9e
	SZgyMm5WF9oF5//bprUzP0wEVKjkXBG8brJ9Lpd2+pqj7JZf5RyAYk4IBBgvnOSkZuJsQR
	2T8fXKyTJ3NMrC9KryISZCkIhYemuPGhB55+OmsKA+n2yJRZLtZ27dyJXEsPCQDPyK5EBm
	U1IeQDQJvLpcLC73J9fuABHcni2av3M+s1RZs+HuC62rl4UkR6N3788pNG1i5gujetnks9
	6qTztonu2XIu+6i9c9N81L82lXcEsgVWSBH5jwUUiIgRSrss6FuwJ4DWNqf6PQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:46 +0100
Subject: [PATCH RFC v2 24/35] spi: rpc-if: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-24-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142639_550663_F09FB62C 
X-CRM114-Status: GOOD (  13.83  )
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
 drivers/spi/spi-rpc-if.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 9a740342d0f7..fb27ee6064c2 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -32,10 +32,9 @@ static void rpcif_spi_mem_prepare(struct spi_device *spi_dev,
 		rpc_op.addr.val = spi_op->addr.val;
 	}
 
-	if (spi_op->dummy.nbytes) {
+	if (spi_op->dummy.ncycles) {
 		rpc_op.dummy.buswidth = spi_op->dummy.buswidth;
-		rpc_op.dummy.ncycles  = spi_op->dummy.nbytes * 8 /
-					spi_op->dummy.buswidth;
+		rpc_op.dummy.ncycles = spi_op->dummy.ncycles;
 	}
 
 	if (spi_op->data.nbytes || (offs && len)) {
@@ -141,6 +140,10 @@ static const struct spi_controller_mem_ops rpcif_spi_mem_ops = {
 	.dirmap_write	= xspi_spi_mem_dirmap_write,
 };
 
+static const struct spi_controller_mem_caps rpcif_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rpcif_spi_probe(struct platform_device *pdev)
 {
 	struct device *parent = pdev->dev.parent;
@@ -167,6 +170,7 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &rpcif_spi_mem_ops;
+	ctlr->mem_caps = &rpcif_spi_mem_caps;
 
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_QUAD | SPI_RX_QUAD;

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
