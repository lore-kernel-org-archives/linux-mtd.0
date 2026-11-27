Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7260746B5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1e2o6NHt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I3c55P+a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X29ww44l6exJUzfBDxgdfsmz5+BJe8gHxdTppMSkk4U=; b=1e2o6NHtXrtUG7/DbwqBN0f0HY
	juWhi2WPun3nbcZp4QijKnsghU6n5av0USo2bGLlfjGyd01I4IqzTMgJbzD13LwFZjTs5JfXHP16S
	wPAvIE0uxqkcXtxiDQC7pqUsGiSnzNlKevZhr3QEaRlFxgyznQ+/8HIrt9rRXDU1bVnHSW8L0USrD
	dRYbMMcdJxOcfGj8S/TCyU4xlVLuysWnwrpFh5Z2/Ba+3kjtTj8Vu4ot2BBBrdAAJXkJ/L9MWeLpH
	43o3DGFdtsKc9BT8Ksi4yOgzt9mZk0U2POFuQCYvvDNao5HYV7+vxm18JKjspqKzhQ/UTYo9Q7gqR
	GfSkV23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwx4-0000000GW3v-0XJy;
	Fri, 27 Nov 2026 14:29:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvG-0000000GTr7-3vbK;
	Fri, 27 Nov 2026 14:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=; b=I3c55P+aqrUA/TzJ75xi4O4Ztn
	GxIRYwDdk9WqAQ1o1nkInS5Omy9FYa5qh5DwfC6xZCiXyXrO8kJwVfC5EzbPpEVduM+/CeA05VA7Y
	WV2sJ6t85LQ7Zu3AV54iVNp1jEMcT6btRJ6NUtzOCmU4MgqqqEwaGHP13Us2o+k6ZnxEeye4smIi2
	mJ8C7aQWg5RSer0waSVQBdxpD5Sd0/Swhmi2F5ZuRLEZW4k26ZK8xOmM4NzYNGi2mFwN8QCdgEu0D
	E+iOnmz3xKZW/dcnURDHc42PZiCXvuxO8OBG0x3C9hsgOwj9Wij3osLLi0zdfCG/91F0pGOVr2JSG
	K7R6tSPA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwv9-0000000Fbik-13k7;
	Fri, 27 Nov 2026 14:27:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D88FC2AC50;
	Fri, 27 Nov 2026 14:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 825CB6049C;
	Fri, 27 Nov 2026 14:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04CC211E69021;
	Fri, 27 Nov 2026 15:27:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=;
	b=udHo41LZ9pUYk5V1GKFBsW+tpcv8NEvbhIdv1MV7PCqO9109uFbTupw+GGlpLp4jY0jUNc
	8m+eKM5zExD2ih/EIGrU3+JoJ8HjqcVBNvsxBzTVSoYjikEcax9o94bun1EBRzj4Dgl9er
	R3Ne/Rmgyh9Z1UEMsL8hTkFQ97NmuwtSmKbPC7xpSOXEHWHiLiPE6vAWniqV6lCW7PrzpP
	fQuJovv/7NBZYLkytUwsR+IF9dlAnOdttrpygKXOk/aBWIRzzizFgPBE/seqiHsrVXAUoC
	fp89ZOlDp0u7aUFZRg9hxGo1GrSFPklJCBEECRWRTrr2cxGxVvNCqgFX8wppLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:52 +0100
Subject: [PATCH RFC v2 30/35] spi: stm32-ospi: Reject excessive dummy cycle
 counts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-30-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142727_371221_9D4AA6C1 
X-CRM114-Status: UNSURE (   9.59  )
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

The controller stores the number of dummy cycles in a 5-bit field.
Prevent field corruption by adding a proper ->supports_op() callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-ospi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index bf42f46ce194..30d48ee1be21 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -772,11 +772,17 @@ static int stm32_ospi_setup(struct spi_device *spi)
 	return 0;
 }
 
-/*
- * No special host constraint, so use default spi_mem_default_supports_op
- * to check supported mode.
- */
+static bool stm32_ospi_supports_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(TCR_DCYC_MASK))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
+	.supports_op	= stm32_ospi_supports_op,
 	.exec_op	= stm32_ospi_exec_op,
 	.dirmap_create	= stm32_ospi_dirmap_create,
 	.dirmap_read	= stm32_ospi_dirmap_read,

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
