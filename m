Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFEB606C73B
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u2X1AZz9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VZeydGSv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qbitKIHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d4YZQjSnUK+AYudmxW7PShmrm7hvKdB4nIYku3OAYjk=; b=u2X1AZz9KuRGRJW8tlkeJVahf8
	1w2QWgj7Hce/DyAdT0p1DL6gW+mYbRTCxwrkI2pkuKW21QFImvvrndGzD4n+sAjIHwlIC4svT3Iku
	xDuIrhdJaut4gYH9Fk10bPFdBnJoE6YSS+MzdYHSBlxZa7x4n9niog8WvukqpTFb1AtTmYGMCCMJ7
	ln7V+G9ehADns/dWGvvxRaLeolm5XEHabDuUDELHs1XD3CWk71D4rTDxpCzy9w9THaMF8u02izKed
	T79blktFfwLI/ym1w1ayilaZeXosxEr6baswjmgCittKK3FCcAjU9bMpp6bajv1qk0yXAsm+XO+gn
	UxUN0WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvB-0000000GTfd-3XWc;
	Fri, 27 Nov 2026 14:27:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuG-0000000GRda-23Gs;
	Fri, 27 Nov 2026 14:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+5J6Vj21k2iCMRlv7+I2xt+eX5HWFZ+N3D4FDSD3N6s=; b=VZeydGSvsKv8RLFjpRCk8xoSqv
	GidQygCRV8TIufuwWdltWAqAU6b/0rm9b4hfqGg1hTEooGqWXNp9qSoGV4JQyJgzllOMH4aKIP7ik
	5sEEihDwwZ/v9UMIi96NEJO/Srdk40mdXvxw96b91/18vYV2W1vGJ4I5en5COqjmVxlYUMd0Z1/cS
	oU0PJjvx9/DCrrjsuIWlCxSuW0VmgVmZgvkSy418M6BuM8cUN2d8BqBj0HVK817IBBT0zr1Mdg0QR
	QQgI3agjuKUKDgjNXOkrKs16PHs7qJgkUWYScmXdiq2kVtQDk1FovC1oAYaSdiFGtFMYzGZaKvls/
	HATfB1mA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuA-00000007nW5-3stK;
	Fri, 27 Nov 2026 14:26:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DDCCD1A0440;
	Fri, 27 Nov 2026 14:26:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF40A6049C;
	Fri, 27 Nov 2026 14:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1BA211E6900C;
	Fri, 27 Nov 2026 15:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+5J6Vj21k2iCMRlv7+I2xt+eX5HWFZ+N3D4FDSD3N6s=;
	b=qbitKIHMBo7JeSA9tv7PrthCAxceGYnOkYVFxh3VzX9NhCk+/mp8UTJjR5xfvMinznzFHM
	GVLflZTyfHkJ1emb3sTNL4lpUVe5cIxRD/jlFecbpswD/HdHbL1wlTYiwjRCj3pLd7jVOc
	PG67VSW7pRkdoxAHRm6YAFT2iqctzn5AgLhouaUrCJxCYu1iYmALl4mrk5emTwREmwSTn6
	vnd5sAgUeANKiJJsWPUGLS10MBgwQJ7sGJiF1k6VoNZdfaOB8VP3sT4IUfjG11v55PIODr
	7eGteqQuvq2buyDMr/96s/fNWfLq3XgsGhzsZAtWj9oKcwNpcRpARJCn9OTWkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:44 +0100
Subject: [PATCH RFC v2 22/35] spi: nxp-xspi: Reject mixed DTR modes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-22-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142626_817378_51D11236 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

The controller only supports operations where all phases use the same
DTR mode. The mode selection in nxp_xspi_select_mem() assumes either an
all-DTR or an all-SDR operation; mixed DTR operations would be
misconfigured.

Reject mixed DTR operations from ->supports_op().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-xspi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index ccd00c744d18..f2a847b5fd27 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -385,8 +385,18 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct nxp_xspi *xspi = spi_controller_get_devdata(mem->spi->controller);
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
 	ret = nxp_xspi_check_buswidth(xspi, op->cmd.buswidth);
 
 	if (op->addr.nbytes)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
