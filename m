Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D8606A338
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ExWHhi2p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oHMOyn3A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pf4YnvL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LOnb8XcfkPToBW8ZU160b0CpbPN7wbRymA2qTravhjE=; b=ExWHhi2pQYJxgt+4iQm8X4EbUr
	FDOI3TbCwc8G3fwxSe9odzfXaeT5btWIYSYPB8yZ6zFnuSmZzPDHGP+mTstAPGCFV/BzK2VVlezPV
	CVUOIgXQnl7GeUJjAee+L32ro+9vrVwsgmMly4fZBoG0CQGRXr8ARkgSlNtXwSdUTrqAN6BvH0K/J
	AAyzeoNlpnaWDhsLjBptF+qVLptOByUGLZn9spDUpn6/9oZeZE9zei11YOfHh2BIrkLIx/7zoJ36o
	Wl8is0VfujYU7ODBuk/EwRJFSiPhwttNyvj3P2Iq8t/AUPIKFTbBcOg4qCWCeE9QdF2K21rU6I9hd
	zPrpkdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBC-0000000Ap9G-3fD0;
	Wed, 25 Nov 2026 17:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAb-0000000Ao5F-0LpX;
	Wed, 25 Nov 2026 17:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/akqnAhi4N7PD9g+GVLxR2YwtuVfsoR7dj296LmnLrw=; b=oHMOyn3AxY1sLMZArIn6CKuI0w
	JY6benRu8tdQCYHijsk7TE65yjLh5GfbTyQJkWnQX0egq1foxWLe1wFQPR+MmetDxvES3LKEfASJx
	+d2i/PWqUNOX9PVN79i5kK9yqZY5syA38CbuNiHl3mk8HjoxAC1k4iieQz8rw0tHpX25z2Nzffa6z
	/c5GWIo/M8CNb5yj4q+IPubSPDoNqAZW54vaOSc4CQMxCjLCojTTxsHdMa0CV2WrtjWoePcCP9nkW
	lAOkWYlA4bpVVBVLE1Z+5oeEnble/mVGd5AMBjwJeXeC+TqfUAXifwtxGaweqhh52/qKee51MYOuO
	wXQlAGNw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAU-00000005bGM-3Zt8;
	Wed, 25 Nov 2026 17:52:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C64451A17FB;
	Wed, 25 Nov 2026 17:52:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90D9560480;
	Wed, 25 Nov 2026 17:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C27511E6B0C5;
	Wed, 25 Nov 2026 18:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/akqnAhi4N7PD9g+GVLxR2YwtuVfsoR7dj296LmnLrw=;
	b=pf4YnvL81dMdsb97g/DQYIk8S9HhrDd4MopcjKOnJrLk++4gDNxi8ouoGlm+etBpI+eNsm
	84kN9Gobi+rboeZZbVRrV9II7pZ3wim23o3nrwLX4Ipr8yV2ZnITsCfsulHi00yvnAdSvT
	4zCDhBrhcLMAb6o7mNIEktEPOxK+Zg2SUvMbAAR1Gr0IjsLPJH6k2GJgzfbwyXJk+3uQ3n
	cc4MJvqLbwDQeN8MWqKkZ01Yl8RwYhiNWZM7HsrHys7d42/5fEo1G+qaHmtgzHXEJ7Es/Z
	TMKEl1nZxy+PDtSa4hopGIy2EW4pfDUzWPMoDQdClp4exUj3CgNW1VFdoBSTyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:22 +0100
Subject: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175233_589898_D3A47E83 
X-CRM114-Status: GOOD (  11.84  )
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

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index d2c2090442f8..a1d6357e3203 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -399,7 +399,7 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes)
 		ret |= fsl_qspi_check_buswidth(q, op->addr.buswidth);
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		ret |= fsl_qspi_check_buswidth(q, op->dummy.buswidth);
 
 	if (op->data.nbytes)
@@ -413,13 +413,12 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
 	 * to fit into a single LUT entry.
 	 */
 	if (op->addr.nbytes +
-	   (op->dummy.nbytes ? 1:0) +
+	   (op->dummy.ncycles ? 1:0) +
 	   (op->data.nbytes ? 1:0) > 6)
 		return false;
 
 	/* Max 64 dummy clock cycles supported */
-	if (op->dummy.nbytes &&
-	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
+	if (op->dummy.ncycles > 64)
 		return false;
 
 	/* Max data length, check controller limits and alignment */
@@ -460,11 +459,10 @@ static void fsl_qspi_prepare_lut(struct fsl_qspi *q,
 		lutidx++;
 	}
 
-	if (op->dummy.nbytes) {
+	if (op->dummy.ncycles) {
 		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
 					      LUT_PAD(op->dummy.buswidth),
-					      op->dummy.nbytes * 8 /
-					      op->dummy.buswidth);
+					      op->dummy.ncycles);
 		lutidx++;
 	}
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
