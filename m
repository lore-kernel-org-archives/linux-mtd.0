Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3580410A88E0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWCrlpAp+xZ8Fd8BQBWyafS7CNtEa7SAZRCudJ5zDOE=; b=K9v2s35r/Nuymz
	BIMbV1XOYIM/ANQcco1+5Wp7mHDM5hB0k/Ke32qxm+sSMZ4ThQLn6MBnNP7/+tKYwe2NmRi18sShP
	fRje7OYIdvNKMx+I8fIILa76mrcgw2RhMnVjMLS58/urhpwdTxZBGENFQGl8jmz5dU8I05dumjsGF
	9gsdwwTtXaxYIsF5Q3RZOqMRkDv6O3+YV7Dni3WDzZwsQ235l+Qv33u/LYs6fOV9rEecqU5/m7+OJ
	akL8rhLTCuXi0Yp+UgCP0I/g50UKlw0zpSDVgztAV9FUsqhG/ceofSP7S6W35fiDtRvxn9fTgqzVr
	GbptBOjXt3R1wOhHEa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrz-00000005svj-4BFs;
	Thu, 26 Mar 2026 16:47:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrt-00000005sq6-07Ac
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:47:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C828CC566BF;
	Thu, 26 Mar 2026 16:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 840E8601FA;
	Thu, 26 Mar 2026 16:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D95F10450CCF;
	Thu, 26 Mar 2026 17:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774543654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oi9vHPgZ6TQ8sWVxiBtvclwkIMonxdZq7gPFy31C+DI=;
	b=f13qncoxoULR4Z6zD7IG2dWYwE0ImXS4pJrZVzifYdfpGuM2TAObnWGnhtHJLZhxhbbAF1
	kKxdYaV9LMajndQnLm5arTfIjj8xeDw9bfEEEq4h87fqCrzrg1ewe10XOVUFfBT3cQw9gt
	+RqUbj+zOCz6qgFQn8mJClzvsNZIygZfTGt8uqSk3dK692h+eRx/nXkLtZsM/5fdY4hByE
	8hYCgxpeqXeCtrzzWUL7uW/rfigawivze800C8LqWXyOIwyB/BxRhbeuFHnejfJDiJyqgC
	aWYf46VKmIwUnFgEHUVBmdL9tiydFMZnoFNIP3+4wx8BeCn3CMLK0oEOlHHN2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:47:18 +0100
Subject: [PATCH 4/4] spi: cadence-qspi: Prevent SPI NAND continuous reads
MIME-Version: 1.0
Message-Id: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-4-0d626e1dfb2b@bootlin.com>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Steam Lin <STLin2@winbond.com>, 
 Santhosh Kumar K <s-k6@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094737_211487_941C1039 
X-CRM114-Status: GOOD (  17.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TI AM62Ax errata i2351, entitled "OSPI: Direct Access Controller (DAC)
does not support Continuous Read mode with NAND Flash", explains that
the CS can be deasserted almost at any time during a transfer (basically
there is an interconnect arbitration every 1023 byte). This is an
expected internal behaviour of the controller, but this leads to
spurious CS deasserts. These are totally forbidden during SPI NAND
continuous read transfers, because they indicate an end of transfer and
the continuous read is then stopped on the flash side.

I initially tried to query the flash type and geometry to decide whether
to apply a spi message size limit (there is a spi helper for that) but
we cannot reliably get up to the MTD structure to discriminate if it is
a NOR or a NAND we are playing with (it is not relevant to limit SPI NOR
transfers, they are not affected). If we actually take this path, what
limitation shall we enforce? The errata mentions 1023B, this is super
low, less than a typical page size (about 2k or 4k, for most of them),
so this is not usable. On my side, I only observed this problem on a
2-page read in octal DTR mode with more than 12 dummy cycles. The
writesize summed with the oobsize could be a relevant boundary, but it
is still quite arbitrary. Hence, I opted for implementing a controller
capability flag, which then is used to decide whether the SPI NAND
continuous read feature can be enabled.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I do not know if all flavours of this controller have the same
limitation, or whether it is integration specific. As I only found
mention of this errata for the AM62 processor, I opted for limiting the
flag to a single compatible.
---
 drivers/spi/spi-cadence-quadspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 649ff55333f0..9f9b3013aa5d 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1740,6 +1740,12 @@ static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.per_op_freq = true,
 };
 
+static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
+	.dtr = true,
+	.per_op_freq = true,
+	.no_cs_assertion = true,
+};
+
 static int cqspi_setup_flash(struct cqspi_st *cqspi)
 {
 	struct platform_device *pdev = cqspi->pdev;
@@ -1797,6 +1803,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	host->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
 	host->mem_ops = &cqspi_mem_ops;
 	host->mem_caps = &cqspi_mem_caps;
+	if (of_device_is_compatible(pdev->dev.of_node, "ti,am654-ospi"))
+		host->mem_caps = &cqspi_am654_mem_caps;
 
 	cqspi = spi_controller_get_devdata(host);
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi"))

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
