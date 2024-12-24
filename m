Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C993E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Unh8QyVJaQSlck3TTH7b9tY4YDRGhXg+3r8mRyJAVjs=; b=a7WzpSV0/JijLM
	oRNfF2mk/OtHq0MmPsiS/0BItAiLcaHV5Gtr6b7b+bUxDdCZkslr9QNX6yvEgBIobw/9dh6dGYw9U
	nKpUws+IcwAndPtVlFQfcwYRLHFI/eime1OmOZgHzJ8eeFQxEmoCOvLxffcpgpqcHoPeFu8D3A1Xb
	kdq0UlzG+EbCyu4xBF67RYSSWQ/htaQyWwRwj3f4tWo8rQWNN8Uk9G9+A+LpUPa9RLHscqJor/X5s
	5rplJxnyOS7LUdqjgR3qBmNwy8HFIwIAGCp92yT2CI/IP3iUGRP3W7nWSXiGbY1xAXLXxWYPpjeSA
	gju+8a2/RA1Fe+UcL/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8VO-0000000CQ91-12Nb;
	Tue, 24 Dec 2024 17:15:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8N4-0000000CMhj-1GeF;
	Tue, 24 Dec 2024 17:07:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3470140003;
	Tue, 24 Dec 2024 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrcFdkL7v8hevVCz++URbVmucpyX6fBOW8nqTnbI9/s=;
	b=kTWXaOPzzt1n8GnCYOS5frwghRr0Z8Y3UTN7TxOoJ8Baz1n++H+4bZPUQ1zsGguKewtTZa
	vnDdnIpGFK+Gb7t9YpYjxhWzBP1K0pa+Ps6j4BIfmJZnTZvd5n6T+TjdHxw//N0Cr6SwOp
	dsfRL6xiEk8Xy/g9dUzcRjirgLX/ujrzp3uQ+l7Tl+OVPt+H8fkRBywAUnvbJAU80IjTN+
	nG19PCo2IOI9eoLW3VxY1rinXDX88gnXej2E7tAACk2UC0EY3Y/X6OfGyApXl1xXXWU9c9
	xTHgAxgg9xIgjAsuV3Qo13B6tsVSmX3hO9hpAmhffZFCkfzdHz+GhzLv9SRWSg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:05:53 +0100
Subject: [PATCH v2 08/27] spi: fsl-qspi: Support per spi-mem operation
 frequency switches
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-8-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
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
X-CRM114-CacheID: sfid-20241224_090702_607674_932F0E78 
X-CRM114-Status: GOOD (  13.54  )
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

Cc: Han Xu <han.xu@nxp.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 9ec53bf0dda8ead27bc7a11a9bb09a08efe2ea05..355e6a39fb41896f460e2474a90b8f0b42068ff3 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -522,9 +522,10 @@ static void fsl_qspi_invalidate(struct fsl_qspi *q)
 	qspi_writel(q, reg, q->iobase + QUADSPI_MCR);
 }
 
-static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi)
+static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
+				const struct spi_mem_op *op)
 {
-	unsigned long rate = spi->max_speed_hz;
+	unsigned long rate = op->max_freq;
 	int ret;
 
 	if (q->selected == spi_get_chipselect(spi, 0))
@@ -652,7 +653,7 @@ static int fsl_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	fsl_qspi_readl_poll_tout(q, base + QUADSPI_SR, (QUADSPI_SR_IP_ACC_MASK |
 				 QUADSPI_SR_AHB_ACC_MASK), 10, 1000);
 
-	fsl_qspi_select_mem(q, mem->spi);
+	fsl_qspi_select_mem(q, mem->spi, op);
 
 	if (needs_amba_base_offset(q))
 		addr_offset = q->memmap_phy;
@@ -839,6 +840,10 @@ static const struct spi_controller_mem_ops fsl_qspi_mem_ops = {
 	.get_name = fsl_qspi_get_name,
 };
 
+static const struct spi_controller_mem_caps fsl_qspi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int fsl_qspi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
@@ -923,6 +928,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = 4;
 	ctlr->mem_ops = &fsl_qspi_mem_ops;
+	ctlr->mem_caps = &fsl_qspi_mem_caps;
 
 	fsl_qspi_default_setup(q);
 

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
