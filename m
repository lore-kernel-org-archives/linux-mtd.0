Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8375F606A69A
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpA1w55W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ICPZQFxF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lksJ6qvMohFKnKxqmAUvFfwpUhxUzRaDglPdojOqekY=; b=IpA1w55WCjAx31D37SjPZmb1on
	nv9A1MyJMHOCG7cy26AE/jZz1i+mdmQ89wHZtpnV5QU+2tEccIn+3tfCnFg9hFFMjWiZ5DtT/FKDD
	909Q4wN/Uo+B/Q0nLH5PxVmjTzo2s/ukuBQeGLKTgsqwfx+uJiEUaRVrbDWHi2CNmURohOUXP0wCT
	kl/5WHS8CDX1uBBPdm6o0g6fG0SEzRGMbIruqOCZwTJufZUdXL9aoryvDtbLxkUdcmiM4BzIFo7FL
	yCOHqmCYEpErsHIE25jgidJlzlstTtLzcggrYTCaqI2MxBAdXjoSOzWd59dJMdjMI0dB+NFW7+27k
	XeO1vMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrW-0000000GMxh-119w;
	Fri, 27 Nov 2026 14:23:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrU-0000000GMvk-2aq5;
	Fri, 27 Nov 2026 14:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=; b=ICPZQFxFthd+ZPIfO4rcDdsCe9
	GLzPkekxjpQlxOqv6agaFHZD9UBtdfzoYkc3ckadMmMQFEZI6O8yqyZAKQzxfulwrB/CDpZcKlY29
	E3r6um8itPDsHvPDry0BLcZ8pyYg3/g14DF5nbtnc9coNrrqzL4l9YK6TRqSOJkXwgqN8ZD+WIdXV
	cjYVV5mHxJeILmnUkvudLhHbv7vFPIeEIkKf3LNblCywZtjL/59Vo/e1iUndBaL3hpgv5BnLvHxN8
	u3lAqTBhu/sKkcwEFTQh9HI2prLWNwZFn9FCoBSsAiVTxqVEIl57Moda2LE0zqC0L/jhCtUM3Dv+c
	r5QBz0ow==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrS-00000007mDT-0SB3;
	Fri, 27 Nov 2026 14:23:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 998734E417C8;
	Fri, 27 Nov 2026 14:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663A36049C;
	Fri, 27 Nov 2026 14:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC0E11E69006;
	Fri, 27 Nov 2026 15:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=;
	b=qQwaRkz1NcTtKMJ3rcaD9AaD0G88VYsq9rRXNdRhGxFwrpHJQNa4Qan2umCsy+PgAzkjJi
	YbIeVsEiyfbdLNBIWdd319ntMr1ek7feEq/y0wE2JDkJRgY51bvte2zxJidEhNgWWLyVtt
	5fT4uEQYUESgkzfJYZG1S1+J6VsQWhjPWLBP8TGnXE4GP52SSYhPaagtRkLcR046vEep9V
	/7NBqPAyP0q9YFqATDPFlJR4ttvE+XUEYcuGcu+Tfz1BEYBsfm+/R6dvMss+C4T3MmNQMB
	LK48fjtnD5qHJws2gtwCMBizByQA/gXTJ0ray9Gwg35xbRdb/lRy8A95FuL9CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:24 +0100
Subject: [PATCH RFC v2 02/35] spi: spi-mem: Fix the odd byte count error
 message
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-2-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142338_053855_5A5343CA 
X-CRM114-Status: GOOD (  10.45  )
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

The check rejects odd byte counts but the error message claims that
even byte numbers are not allowed. Fix the wording.

Fixes: 8618271887ca ("spi: spi-mem: Limit octal DTR constraints to octal DTR situations")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 648982350863..f4d71f740163 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -188,7 +188,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			    (op->dummy.nbytes % 2) ||
 			    (op->data.nbytes % 2)) {
 				dev_err(&ctlr->dev,
-					"Even byte numbers not allowed in octal DTR operations\n");
+					"Odd byte numbers not allowed in octal DTR operations\n");
 				return false;
 			}
 		}

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
