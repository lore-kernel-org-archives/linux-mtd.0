Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A746071E5E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/QElZwe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AkRmFTKHdylSRpNk/BFpUoU6ytAVCTMg/U59V9ZWhxI=; b=f/QElZwehOq63lLh625bV7q5S5
	LSEqLj4eFhwvnRuyKtOdaB8162TsDbXepcV/m8QHGEOjHIytmmFKIZ/NKE1vFo7mX+JUQDswHtGdh
	eequUItIbMLBYsIzGqHcMxzjU42u41grOaeJhJ8mYCsm9+c02kg01p2+HyXDuvXKi+sZXEqTxsqYE
	6EQigRoBhQUlzF3Bl2kHzsVHr9FSAG7gh1W2oR3feUENBJw+/0T0sSpfV0GIiQRjpXnxyC9lgFYsi
	s/aMOO8RWZevwfOSW4gZCmzNGlhcpc0WfRk4WZfzXOfEU9Kv+085dNZKH0mmsCRqlNwnc7WSjppDl
	iATLVFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuT-0000000GRvn-0tzI;
	Fri, 27 Nov 2026 14:26:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwt3-0000000GPWw-2Ae8;
	Fri, 27 Nov 2026 14:25:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20B2F1A1840;
	Fri, 27 Nov 2026 14:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1F2A6049C;
	Fri, 27 Nov 2026 14:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CE7911E68FF9;
	Fri, 27 Nov 2026 15:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jwWNjtl5ORcZ1deftfr5RsBJJtV3zrm7nwySNJ1wAXA=;
	b=UGbmJbOdcNVCi3ELelQsVl1jbj/ViXJ795sQ5pB3eqnkHRfW37/lv0w4DTEUZsimBvjKCZ
	bwLNRPX6CT6PCRoWg4O8d0RqL8UAZjsezDbumzXw1CxZHA6jNaFMZm96NIyled1ziyLbto
	EDofliexKT20UNgI/5pJY4LUYzTNFdlI8Y+PHZ1gbd+CdwFHrEYUQSkSfi+aUFjpRu06Tk
	zbPC6kZLAYg0sGkrMBcyaw6bKjWtQzrQOmpW4Ka+gZ/Hgi5+nlbcUbjGZ5pzPxjrE2Wasr
	ysa9IYTRL1ou53CorKfDhH/uN5bAQr9L6imMuj7CJS7cODFKpnbgndqbzELLtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:36 +0100
Subject: [PATCH RFC v2 14/35] spi: cadence-qspi: Drop now useless checks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-14-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_062518_973783_54472900 
X-CRM114-Status: UNSURE (   8.98  )
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

The controller programs the dummy phase in clock cycles, so the dummy
buswidth is no longer used. Drop the check requiring it to match the
address buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 97725ffeae93..d52e0aa1ea41 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1522,13 +1522,6 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		return false;
 	}
 
-	/*
-	 * The controller has no separate dummy buswidth: the dummy phase is
-	 * clocked with the address buswidth.
-	 */
-	if (op->dummy.ncycles && op->dummy.buswidth != op->addr.buswidth)
-		return false;
-
 	return spi_mem_default_supports_op(mem, op);
 }
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
