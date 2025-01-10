Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6AAE7719D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SN5QfbJwbvXHPgCJ6kX0Peo0QRmGxzL09h4cKtRBTtU=; b=seIo229QHneDcW
	NhJrKH1GFtwZJatjH+nthEY+xXMKGphIwRpfS/pOi+Ghz6cd1Y0r0/iIsip1pKy2Yd+gmlCr1bgqj
	80nZcyMEA0g4eGVnHRln4l1CBUfhH/9rhiUK7BkBg++5CwzNK8maGmwolE/NzNnMN6kD5z4o5f7Rh
	yfO8UlwtudxO9P6NYsWaUgQP6WLA7WOlaa2zwWEIeOX2ikxkoJgwIur5Fh9gj5Psy1F71zhMk7Kn/
	Ar4A/c+YMZCrcLhmxGXcT8aq9S2ODDrBpqB0YFa4gmBzJYhfpAPFerJJjQXStUgX/uf2jdgDMHyVK
	UHSMzlwS1rtV8VJ0p4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGar-0000000Fng4-2rpA;
	Fri, 10 Jan 2025 15:06:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGm-0000000FgJz-0bKI;
	Fri, 10 Jan 2025 14:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nrGU5YmafXBcwzax7Dz7/fkc5aKf/Lo+6Qt8hqq78ww=; b=TpfLoYKwteem9uoblh0s8hLTKl
	0bNxzYcgU3lus8FH6k+YyulSeOiOv+tx8NwlIXpSIK+AC+OEzEQFIAXCcGxNew20y+JXbh91zb5Pt
	2K2TqdpmTflafQ1BISikUcABJ5HdgIGURudCrXl7pvsVunQRcKmKqxbJjt/MZ35ABJ9qOXutsVUm+
	hp8EAOi1IC8uKGylrNXpAlfHierCF/QX58MtAl/TIfejzoTeehMfx5uMX5XeHuBX9HEVaA5Ayet2x
	x9FYUA15jt6H8ks/fObHJH6PrdS9DT4u0XK9ME+rJy3aKMTSNAkrBcuE5NlKphtHDzBZ/GIjAS7Re
	x/dAZYPg==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGj-00000009oC3-1LHC;
	Fri, 10 Jan 2025 14:45:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F4B2FF812;
	Fri, 10 Jan 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrGU5YmafXBcwzax7Dz7/fkc5aKf/Lo+6Qt8hqq78ww=;
	b=mXNtPLRn5uwUKinY/wD1bnD54in2virqEd4lhmdpeKyKGIpRNU9UCbUDEJ1klyI6/MFi2O
	TU3tIcuL7gU4wgZEWqKGY7HDpCi5tHoLT3E5bysmFsMKD1UZAlSPCJ37Nyp2ewakaz9ENz
	egSm0DE/nWjY5uLxQGn4C/jc3/+HfsAq0jDpdIJHvSDGSrkEzQRafREiDTS616VHdu43aD
	1V2uJ8BNLy2xQ96NAeroF3cUEzRkjp6hDydBowvSFWKySCP2qfl+tmzmrhUnlx4KRWz1mT
	l/gEVc5rcWP0GEHOOfYp2rSE17MPFT5Ulp/fjyfDXsr61NtAvglyBgx7xVw5Ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:18 +0100
Subject: [PATCH v3 16/27] spi: zynq-qspi: Support per spi-mem operation
 frequency switches
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-16-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_144549_517961_13884532 
X-CRM114-Status: GOOD (  16.27  )
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

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-zynq-qspi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index dee9c339a35e74c86fe1c768990a3f870b0a1b9d..f3cacb01e25b97892f9fbefc6e5cf43b9722ae4d 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -318,6 +318,7 @@ static void zynq_qspi_chipselect(struct spi_device *spi, bool assert)
  * zynq_qspi_config_op - Configure QSPI controller for specified transfer
  * @xqspi:	Pointer to the zynq_qspi structure
  * @spi:	Pointer to the spi_device structure
+ * @op:		The memory operation to execute
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -331,7 +332,8 @@ static void zynq_qspi_chipselect(struct spi_device *spi, bool assert)
  * controller the driver will set the highest or lowest frequency supported by
  * controller.
  */
-static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi)
+static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi,
+			       const struct spi_mem_op *op)
 {
 	u32 config_reg, baud_rate_val = 0;
 
@@ -346,7 +348,7 @@ static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi)
 	 */
 	while ((baud_rate_val < ZYNQ_QSPI_CONFIG_BAUD_DIV_MAX)  &&
 	       (clk_get_rate(xqspi->refclk) / (2 << baud_rate_val)) >
-		spi->max_speed_hz)
+		op->max_freq)
 		baud_rate_val++;
 
 	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
@@ -534,7 +536,7 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 		op->dummy.buswidth, op->data.buswidth);
 
 	zynq_qspi_chipselect(mem->spi, true);
-	zynq_qspi_config_op(xqspi, mem->spi);
+	zynq_qspi_config_op(xqspi, mem->spi, op);
 
 	if (op->cmd.opcode) {
 		reinit_completion(&xqspi->data_completion);
@@ -620,6 +622,10 @@ static const struct spi_controller_mem_ops zynq_qspi_mem_ops = {
 	.exec_op = zynq_qspi_exec_mem_op,
 };
 
+static const struct spi_controller_mem_caps zynq_qspi_mem_caps = {
+	.per_op_freq = true,
+};
+
 /**
  * zynq_qspi_probe - Probe method for the QSPI driver
  * @pdev:	Pointer to the platform_device structure
@@ -706,6 +712,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 	ctlr->mode_bits =  SPI_RX_DUAL | SPI_RX_QUAD |
 			    SPI_TX_DUAL | SPI_TX_QUAD;
 	ctlr->mem_ops = &zynq_qspi_mem_ops;
+	ctlr->mem_caps = &zynq_qspi_mem_caps;
 	ctlr->setup = zynq_qspi_setup_op;
 	ctlr->max_speed_hz = clk_get_rate(xqspi->refclk) / 2;
 	ctlr->dev.of_node = np;

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
