Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75D606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Or0ZjMUe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QCOlme88;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Egy4qVAKioH1rNYDdk/QAfhalENRq4k3mrY5iCb3HP4=; b=Or0ZjMUeR2j/idGp6mkaXwyV4A
	mBNtURh4UIduzNmNFCFerD5vFPswHmmflQ7fTIqxcQJkOr69s63Qi6+lSBGZZHkbQNhv+zzyBCEoS
	KfWwjCOLgynDp5bgY4pp5K5iIVMcxlgkquqFYykbQwTgMc8wZy8IZ7ozRdSzIT4Zbx+ABTA49m643
	kpiQ5RCXqdMi324iA+HN+tozUoSolM281tTqgG5Ur+YVzYu3+tby7ImvTsTfVk7+N5IG3r+AAzceA
	wln+Rfl/1meGOQq9CkMJYFI9s4FyU5hA4tjax8P9Uy8YAnO3BXTaITtXlfKhMVY/zqf3Y+A1MZuLx
	1QtwRqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuy-0000000GT4O-2hSn;
	Fri, 27 Nov 2026 14:27:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtj-0000000GQex-2HlR;
	Fri, 27 Nov 2026 14:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=; b=QCOlme88uxRBhKtyzUkHaUDOxb
	kvfIKIodyxwZhcOqf4V+1QfgML4P+O2jzBGWRF4eWcMrECoL6dwf2IZ+qNf5EzHoafDKcW53s95Re
	ztSJQZgJdBpPfbCVwII+6zTnVow1fwDEj2WM/SBJKkP7PQWHESahLnPEym/hrFa1Cn2wRXu5LTmGU
	iCX/Zy6ud92W/3bckgwkUdjcpj3dYFYEwZJZkWflljp/HDwf0LwKsbBBmm9aSgNza8aH6/tMgGrNR
	yknS5lRzkzbHWBfzjzrdbDtZEFbAK2fWxpIaIMjYjycW+zp4G45nIJLK+XwrNInmTuu+0c4XaNvUs
	0yHXmWaA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtf-0000000FZ9v-3iRd;
	Fri, 27 Nov 2026 14:25:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 279B91A1838;
	Fri, 27 Nov 2026 14:25:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E40556049C;
	Fri, 27 Nov 2026 14:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4691111E68FF9;
	Fri, 27 Nov 2026 15:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=;
	b=ARVAU9R2xy9uuRKVkdmefjQoskOgHFe8fpI2N2Kov/njbz9iRUs6eTvn8rw5VXuBZfOrkf
	8orW/O6YvvntEFXT5BlcZGMtPYyPT0c21XToq9cTbVnwkrxrDpffYfFBzezjEGK4vFIpgo
	GudppOKqbE1uqFaEUuumhvwQsIi+o4BHIumyGVTmd6mzmCuOwRy/jEOXdH4J0L59TEniRd
	FWdBuytjzdpL/mKJxUexfL3MglNvAUZhnLXvSwWMsOdGP9NewhS2owG5RrDxU0WnZDSMkS
	pTrZqtldbTss89snDMycmGpBcOUD578uKhrbSholrl8JGrhfxdyuiF0qdS2e7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:41 +0100
Subject: [PATCH RFC v2 19/35] spi: nxp-fspi: Reject mixed DTR modes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-19-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142555_942971_1777AC0F 
X-CRM114-Status: UNSURE (   9.80  )
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

The controller only supports operations where all phases use the same
DTR mode. The mode selection in nxp_fspi_select_mem() assumes either an
all-DTR or an all-SDR operation; mixed DTR operations would be
misconfigured.

Reject mixed DTR operations from ->supports_op().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-fspi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index e6fdded67a00..04999369dd1b 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -536,8 +536,18 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct nxp_fspi *f = spi_controller_get_devdata(mem->spi->controller);
+	bool all_true, all_false;
 	int ret;
 
+	all_true = op->cmd.dtr &&
+		   (!op->addr.nbytes || op->addr.dtr) &&
+		   (!op->data.nbytes || op->data.dtr);
+
+	all_false = !op->cmd.dtr && !op->addr.dtr && !op->data.dtr;
+
+	if (!all_true && !all_false)
+		return false;
+
 	ret = nxp_fspi_check_buswidth(f, op->cmd.buswidth);
 
 	if (op->addr.nbytes)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
