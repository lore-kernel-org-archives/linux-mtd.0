Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39C8E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLBrPuBF3BmK/Pa49j7usaSVVZYTzWXWrEhMYFqPUlA=; b=D3Al+D8W7cgsb+
	H685hBZYG377qolrq3n3Wu3VDL7sS2Yyk7uO+U4xYisyxV9ddoTmMRi34Dq07UmT8kw4C6zAJZIOx
	kdN+Cy6028lFKs/JntoTQDptIF9ktQxo+nt/p+X4nOS7FhLgPVD72UFBzm0vr3lSPWjWf/VymS5fQ
	MN2LTmV0QYE9Em9qEAeyBp0IljxSePzuXi86G4OlRGae0t5FFKS4ZZ1+K5v39c8rcg7sxZpUp1+ef
	RCO3RcgnH9h0vjvJdyE4eoVHjA8tMoNkki0ZrQC/KlMv7zwhg5daGlucedsUdxosLhFUmNrWNA7n3
	H2x0rpyDGqpEWR/bTfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8VD-0000000CPyD-0JUJ;
	Tue, 24 Dec 2024 17:15:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8Mz-0000000CMgb-3p0f;
	Tue, 24 Dec 2024 17:06:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D128B40004;
	Tue, 24 Dec 2024 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZ7N9DxFJs+ypWx4tpIWo4afnbo0gO3jjiMo2DbsJnA=;
	b=QeYyN/uiGZhXmqNymhnTAPygPndx1LCwsdLVoUS6KOTxlzVQMSRpzYfmYr3CrafD+soidn
	GIFyL0trjNaPFws7xI5aAPBy0Y/zMKXrmOIzv9d1VR0mL2vKg0ZddGcsjeueZDvzMoURGP
	oOYbbCU545L9qVCcaj/DcSBnJaLoYwHv/9hryJgHcdsemDEXyVABHcXRPOcWf+9I7swFyC
	6b3ovrOap/L/hY7pZFExCeayq8xfEmL0e9Nl5AogDbfsR90nwFDXq9TtZzEzRj7hc8+lyx
	THWAp7i77m4tFwQw9n6KSkAyAgmvJjh/wfZiOMqrwcwjMh1GStlLFjU2e1nMeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:05:52 +0100
Subject: [PATCH v2 07/27] spi: dw: Support per spi-mem operation frequency
 switches
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-7-ad218dbc406f@bootlin.com>
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
X-CRM114-CacheID: sfid-20241224_090658_217073_B8022F4B 
X-CRM114-Status: GOOD (  13.95  )
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-dw-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 431788dd848cea1d854affe0d1fb971f680824a1..3d49b1dbaed4d491c0df659c061582e71f2c514d 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -677,7 +677,7 @@ static int dw_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	 * operation. Transmit-only mode is suitable for the rest of them.
 	 */
 	cfg.dfs = 8;
-	cfg.freq = clamp(mem->spi->max_speed_hz, 0U, dws->max_mem_freq);
+	cfg.freq = clamp(op->max_freq, 0U, dws->max_mem_freq);
 	if (op->data.dir == SPI_MEM_DATA_IN) {
 		cfg.tmode = DW_SPI_CTRLR0_TMOD_EPROMREAD;
 		cfg.ndf = op->data.nbytes;
@@ -894,6 +894,10 @@ static void dw_spi_hw_init(struct device *dev, struct dw_spi *dws)
 		dw_writel(dws, DW_SPI_CS_OVERRIDE, 0xF);
 }
 
+static const struct spi_controller_mem_caps dw_spi_mem_caps = {
+	.per_op_freq = true,
+};
+
 int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
 {
 	struct spi_controller *host;
@@ -941,8 +945,10 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
 		host->set_cs = dw_spi_set_cs;
 	host->transfer_one = dw_spi_transfer_one;
 	host->handle_err = dw_spi_handle_err;
-	if (dws->mem_ops.exec_op)
+	if (dws->mem_ops.exec_op) {
 		host->mem_ops = &dws->mem_ops;
+		host->mem_caps = &dw_spi_mem_caps;
+	}
 	host->max_speed_hz = dws->max_freq;
 	host->flags = SPI_CONTROLLER_GPIO_SS;
 	host->auto_runtime_pm = true;

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
