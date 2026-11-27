Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC88606C721
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o1wHDPiv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QmfwNz18;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hnB3HhFJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MGayGcCgjSTMvSgzzQhO3O4Zh8DQYHqWdwJBBK+R+dk=; b=o1wHDPivEEIKNSHdESrqhYyt8M
	9TEZjYEh/Ot70Hwj4SMMbMrXhniu88YqA8IR3hGuW3Ox+k8hI0NTHnpqElemAZSjvSITTBlqQamfU
	j36cS1XGAjDYlBWGuEej34pQAliXzfoA5pzXecDY8yDGSxtviXskay6AJ+5U9/hhhunzMfamSXC1d
	McdNbJBx9Wc4Or3CA3ZMOjRZt105hu97JlFD22hFe2NBOSUXG6O5K/F0Rucm25dTsFIrSRGQwzddh
	QbLE1GQsrBT1JkobcQKUqOBOsSaxy6oLvxJ69Ea1zUcXI3TBzpO44/ePQPhjVawWPzoY4IXEN6QYs
	tE58x3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwv7-0000000GTQC-0LB3;
	Fri, 27 Nov 2026 14:27:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtw-0000000GR9U-15sc
	for linux-mtd@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PiBNWoqH2zie2QW5L9CTTLxi83g0iqOaBLwfJeY29Ck=; b=QmfwNz18IuBt0V2LDu9bB72GUd
	VDRGylIc0/n+LqzgkarkiVJ88LAwKzokp1zCF/QkRjTgCPHovru2PWCsrE9PlW+KIW/rzW71lJCGI
	oF5xR5uIFST5GVCMgGUZ0QXj5yidpKpM227/EKAKMg3YAEK132RXXpjWncPaWB+XtbPzIKyzZ5HfU
	M25pysl2pXsYArdFdnpcQWm0gYd6hR1d+jrUlwRRF8AsGYjVSpOrLNgUOiSzCGwFEaWJZ/SUNaslq
	s9VAWVixMGTokKVrI2dDnxa0HsO0dj4GkuxNlmYNcg0Bze5eGWg8onfvdK6loJbwQkPuhllNl0dBp
	+u8VFvOQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtn-0000000FZP1-07Fb
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 14:26:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00E604E417C9;
	Fri, 27 Nov 2026 14:26:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFDAA6049C;
	Fri, 27 Nov 2026 14:26:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90ACC11E68FDF;
	Fri, 27 Nov 2026 15:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PiBNWoqH2zie2QW5L9CTTLxi83g0iqOaBLwfJeY29Ck=;
	b=hnB3HhFJhf4zGU0zpC6VqpiHx+byjW2HUGZCf4Qyaq1vE/bjZJhYoFxanpA2wmLeIrbuaG
	0Xx7wq1gSL2Ft8dveHN+EYbUNnuICpHAlMEKo/SP3mprwK7EsXZk6KdaGh5YT4DoVZQAxg
	Pwm58K0Dc4IIUZx5vsvKa4FT3K96uoFf2GuP6560wYeNZFiQkLjPUdBcv2ZKIyGbkUqi8e
	6S+9NtIGqz2OmATyF4t1N2WM8rpfZchUtih5TEG9xA1wb5bAvvN8/vQWfSiT17o96r7TPV
	0AtxLT9qRF5M1a3Ge0N6Ge/deHqomKtoIDPvmRrseP2zuYDUjqirHpQYfujKFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:42 +0100
Subject: [PATCH RFC v2 20/35] spi: nxp-xspi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-20-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142603_111877_3D38BCF0 
X-CRM114-Status: GOOD (  10.55  )
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
 drivers/spi/spi-nxp-xspi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 38c8d6269aad..8b836662a5da 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -392,7 +392,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes)
 		ret |= nxp_xspi_check_buswidth(xspi, op->addr.buswidth);
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		ret |= nxp_xspi_check_buswidth(xspi, op->dummy.buswidth);
 
 	if (op->data.nbytes)
@@ -408,8 +408,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 		return false;
 
 	/* Max 32 dummy clock cycles supported */
-	if (op->dummy.buswidth &&
-	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
+	if (op->dummy.ncycles > 64)
 		return false;
 
 	if (needs_ip_only(xspi) && op->data.dir == SPI_MEM_DATA_IN &&
@@ -453,12 +452,10 @@ static void nxp_xspi_prepare_lut(struct nxp_xspi *xspi,
 	}
 
 	/* Dummy bytes, if needed */
-	if (op->dummy.nbytes) {
+	if (op->dummy.ncycles) {
 		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
 					      LUT_PAD(op->data.buswidth),
-					      op->dummy.nbytes * 8 /
-						/* need distinguish ddr mode */
-					      op->dummy.buswidth / (op->dummy.dtr ? 2 : 1));
+					      op->dummy.ncycles);
 		lutidx++;
 	}
 
@@ -1307,6 +1304,7 @@ static const struct spi_controller_mem_caps nxp_xspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.swap16 = true,
+	.dummy_cycles = true,
 };
 
 static void nxp_xspi_cleanup(void *data)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
