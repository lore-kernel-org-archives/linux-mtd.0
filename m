Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12190606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CpdaWayy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xUKHApLT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2NfqBPqZOdpMAPrSsVrGyNGufYbrxfy8kIiDRryoUTQ=; b=CpdaWayy7ql1Wsa+7vsrdQSXu5
	7I7XjwxF21YIEzkehKYeZ8qidpfPg7NHC38aNLrRVckKpSzQrtMfTfjK/h9TfyC/33a14nLKeqDje
	IWsMnSMwaa0L7Ysl+ic5ZIBW/zDX5DjNNJzuVb5ruTNrNH0tva98KOGiuZ9hZfw/S7RKNKbJsQwmh
	u75XHV/vy7R7cMwOk1nbEYWFpftS0+00AnTWSERCj7Oh+8qh98EBUTuRfTBA6IoZAyzFjjrWHU9pH
	I8A/FK1UpYyTMpNupnqgaUQoGWPdcWrTtsr65RWvzeHA9A5JBfefjgbw1mv61ip2lbhvldlHlHUnr
	QwbJx24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx1s-0000000GZFM-1Zo2;
	Fri, 27 Nov 2026 14:34:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx1a-0000000GYv4-20T9;
	Fri, 27 Nov 2026 14:34:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B4181A0440;
	Fri, 27 Nov 2026 14:26:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 380A76049C;
	Fri, 27 Nov 2026 14:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67FC511E68FF4;
	Fri, 27 Nov 2026 15:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RkWpdIcMYE1qUrSwQ6cT++4Zmo/YUx2kY/UpVSD4g1U=;
	b=xUKHApLTmpzwZ0shJxRBf3V4t+FY3xbHepnyoQtp1vN/aFk2tnCz/PEUKH/vV/zT/u8Z0r
	fyHpysVFXcZrIkHcEJjMoBZIgRUFAPIh3xO62fcBGZK67KqOrd8v0M7fQ+TnfhhlWZ2j4S
	Vi1+zd91hXkjDpMNV18eGD37J1SYrAuoOW6HxGoNHaXCwzW8LOtSAo0+oFx58pp2+WTmbU
	l7e6q514l4qPFU8+JUnOEc7flUpJlvE4bLUpTXXPcsqGrXgxV6OTFlyG5vookvNpeffMc1
	ExLhV6MDJgeUjiRlbjy/mCu/YMnGDGl6NCwwa5GEeWE3qdLCp7BIAWyLD1laBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:49 +0100
Subject: [PATCH RFC v2 27/35] spi: sn-f-ospi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-27-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_063406_678335_EAF53F74 
X-CRM114-Status: GOOD (  12.20  )
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
 drivers/spi/spi-sn-f-ospi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index f0320e96fe23..2f6d493a1ba4 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -104,7 +104,6 @@
 
 /* Parameters */
 #define OSPI_NUM_CS				4
-#define OSPI_DUMMY_CYCLE_MAX			255
 #define OSPI_WAIT_MAX_MSEC			100
 
 struct f_ospi {
@@ -114,14 +113,6 @@ struct f_ospi {
 	struct mutex mlock;
 };
 
-static u32 f_ospi_get_dummy_cycle(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void f_ospi_clear_irq(struct f_ospi *ospi)
 {
 	writel(OSPI_IRQ_CS_DEASSERT | OSPI_IRQ_CS_TRANS_COMP,
@@ -348,7 +339,7 @@ static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 
 	f_ospi_config_indir_protocol(ospi, mem, op);
 
-	writel(f_ospi_get_dummy_cycle(op), ospi->base + OSPI_DMY_INDIR);
+	writel(op->dummy.ncycles, ospi->base + OSPI_DMY_INDIR);
 	writel(op->addr.val, ospi->base + OSPI_ADDR);
 	writel(op->cmd.opcode, ospi->base + OSPI_CMD_IDX_INDIR);
 
@@ -553,9 +544,6 @@ static bool f_ospi_supports_op_width(struct spi_mem *mem,
 static bool f_ospi_supports_op(struct spi_mem *mem,
 			       const struct spi_mem_op *op)
 {
-	if (f_ospi_get_dummy_cycle(op) > OSPI_DUMMY_CYCLE_MAX)
-		return false;
-
 	if (op->addr.nbytes > 4)
 		return false;
 
@@ -580,6 +568,7 @@ static const struct spi_controller_mem_ops f_ospi_mem_ops = {
 
 static const struct spi_controller_mem_caps f_ospi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int f_ospi_init(struct f_ospi *ospi)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
