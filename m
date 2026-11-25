Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120E606A6BC
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4DxB7eaQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BBLmIaeq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xS9v9bc9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wwLnE0eF/q1sIiUDC9xqbMw9WBwc2zbuRBjdLcrUYyM=; b=4DxB7eaQOA69B3DXRpvJSwU/OG
	VAuIDxS1xKfUyzG+YnRr0PG1QdlyS0W68ixnbscAAasvTxAR3B4puY2tbLv75Qnc/nWTwEOcXVriS
	LnK89r6AoCNQ3Qs6aO63CCuYJXYFA4eC6ilTzfLNqZI5L+OOSj8qNcw+e5wh7sFNv3oQcY7wMlnhu
	HWlcn8Ze5r4xR4eV6M5kVExA/9X1fpu8pYbrovgVzWlPuJZO1eIUlbMUPWOo/29XwPhMBiI7gsIoL
	/V7ND52OuUCbMe/3YeRO+cq9A/AVkHpK2NIHoQA44YH5ZvAZX7pEZMh56VyKyleUni9GsN8UbKFp5
	V9rEODIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBq-0000000AqCO-2S67;
	Wed, 25 Nov 2026 17:53:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAl-0000000AoFI-3g23
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1pBgsX7SEhiUyvzBszeDzEbYO5y9r9uClK7rqjgYFvg=; b=BBLmIaeqLcXLAdXkTPV77Dc4Bt
	hG92IHT4/T888SVIEWjUk+h/UM1PUKoK0KiVsBb6gRjTJm/gFuRXyCWCggG9oOZAAX9MKtFfCk6kg
	f0bOatslqR3p4rwthAnwNzUsVIYGMcBgWLVKpyWR7QYcw9b1LAqglhy97TzQLh5vcPPidHcLGc+kF
	MoMRMctMpJrE1lTLQ/G0hvlaysDPpy07sLfMlN5MHVZHSCdb6wvpuDwj4ZpsqBBqWZz2ZQr+AGPhf
	fUyuG4HQNkbENocWgQzX72Pb6/ivZJJ9OhSTrYHukJWHWDoJqBSI/h0kVgheQra4sFERBVtpCckOi
	4siRsH7A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAh-00000005bM9-17ka
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4EDDE4E41785;
	Wed, 25 Nov 2026 17:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19CF860480;
	Wed, 25 Nov 2026 17:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBFD611E6B0C5;
	Wed, 25 Nov 2026 18:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1pBgsX7SEhiUyvzBszeDzEbYO5y9r9uClK7rqjgYFvg=;
	b=xS9v9bc9yVgyTnhOEc5GrZbH5tv5Lk9cwg3hUTHKMznf3BHRgoTOmPwLVnmwSsKF3jRcQn
	kqhWk6bPV1QHLICPk1tlaURZX5g2/bboIR1oQQzKHg+fyXzMTlcYVoaPqGu6XlsbMjtUF1
	zfECYzuJll7bZdiUI2axOVWVzNOO7Leju5Gy5xEJZfG6WPcaE6hIxir4VNMScpA5fO/RfX
	9HZKyGuliTMohmOvM976vUzeV8aw/8/A/0uDA1YdR4gYQ14kAel1AvlKLsyS4CXl2Ibbf0
	uRzi5JhkNr0JbDcXLvYW6nMGEQXd14XQurizoNBM1hLgqjnvVOMct679vd0S5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:25 +0100
Subject: [PATCH RFC 11/16] spi: nxp-xspi: Fix a comment
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-11-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175245_195805_C47C37B8 
X-CRM114-Status: GOOD (  12.56  )
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

Looking at the i.MX952 TRM which is I believe one of the SoCs with this
controller inside, the maximum number of supported dummy clock cycles is
64 and not 32, so the code seems more accurate than the comment, which
needs fixing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-xspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 8b836662a5da..ccd00c744d18 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -407,7 +407,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 4)
 		return false;
 
-	/* Max 32 dummy clock cycles supported */
+	/* Max 64 dummy clock cycles supported */
 	if (op->dummy.ncycles > 64)
 		return false;
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
