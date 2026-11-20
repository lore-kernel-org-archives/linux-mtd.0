Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5768960A2608
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oEmWCl7P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wyZRYaA7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pNTlIVbOsiY7znK66YJFmnEhBFRBmP4eYdlDAwNja88=; b=oEmWCl7PXFsS9aN+3K6EtJGwX7
	nutrW1/KKlNMIMMkWXyraNE8upfgiW2ro+rMNr0Sm4aveN8/BYJhDgOSU2XNSJy4pzaGoNHkQ9W4r
	+U/DGOgnSauO0q6dAaihpgFPXSYIptXRRiWxXPSTqCB7gOIMCsLihQHf3/C8WXgyoCemAiGiOs4Kh
	ANTudptJYI4YIGl/ZKvRkhZIlhbJDk/87zjoon4w0ml5xkQZQ26PumITuwGwPkBW4JPvsAGV8M0SF
	1aFFssRjUGl5oXLTyEKd5ikk1dUn6Mgg9fS4YOIl34JAFlvFf245UlV5NdmLr4DnJAumNz9ZBbzUJ
	nUIY1coA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCX-0000000Fe8J-0IoW;
	Fri, 20 Nov 2026 17:15:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCL-0000000Fdzm-12w6
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:14:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B518C1A175A;
	Fri, 20 Nov 2026 17:14:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A0A0601B9;
	Fri, 20 Nov 2026 17:14:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 015A511BC0500;
	Fri, 20 Nov 2026 18:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lJI13tJYjzjGtIHD9Wd2cBZDEmFMRj8+hARz6pmVykE=;
	b=wyZRYaA7rdUucPHhAgRe3w46AtJR27dhbOgZmFrDyPf3Qj9Z2yWMvm35Jzj/Ce+EcEIhA/
	AUMvShEeawcwrFFZFNmpmKPlkrrCeUjtXBjfcWGZEPNJLCUs0KSi8cvX6el/rKF64hWQ8p
	yWNeA0doxrInbs7qQmBIb0VFVf6i1XRm4meS+c3CRVXjpYQS7TJhclXFp9A6V7Ra377TW1
	LTWwhqSM0yZB9CTnbXAvIfHhrTMYocVLcyCI8zsQyXUZ7Qu0REy7y8Jw0iDU76AKzISD0v
	kTpcZlFbWooysaos0m7hhq6p03SF9ZFaK+aC60cbcoZZt0OcCe3sHZz5jyXsEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:32 +0100
Subject: [PATCH v4 06/11] spi: cadence-quadspi: Advertise DQS support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-6-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091453_570809_83B6EAB9 
X-CRM114-Status: GOOD (  11.15  )
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

The Cadence QSPI controller supports DQS read data capture. Advertise this
capability in the controller memory capabilities so that
spi_mem_dqs_is_usable() reports DQS as usable when the memory supports it
and the DQS line is wired.

This lets memory drivers enable the DQS output only when the controller is
able to make use of it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 2982df7fd092..72a5101c4a8c 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -3770,12 +3770,14 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
+	.dqs = true,
 };
 
 static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.no_cs_assertion = true,
+	.dqs = true,
 };
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
