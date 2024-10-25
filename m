Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B55D149C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Er9vVoQ/gCo1DyiU8snxg87/JWLf1fEYaqTREThNOIU=; b=voT3b+H+hC7vqW
	+ZwWdvm/N058tsl44gmeJAsVmcktc4CplVGbuCOuARFiRBc0bJAbnuQnE6wp0JusUh3PwdbPEAU2N
	+6l7G5EZ+tYAFsyJqNSgGMrSZ7vBMzDDq4khcGWlRXI386gPWWMhyyfTj9/cUek9inFjMxHZAjKM+
	mokGapGn0Jq5Db/EbK/jihVL+/5Fxq6O/K7AsLAtCAKHYSuSghVAEl0L2vXql47kLsWKcVti1SS8l
	zERQ8ATeZ6XXVModELrChvpLODaL0EeEfrGiPU5doo3SW6I7gAt/E0jALxKpzdtRfzPEllB0VqtqN
	FGJBD+Nnx7DuM+lLnO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N17-00000004OPe-3vWb;
	Fri, 25 Oct 2024 16:18:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxz-00000004NaU-2xSr
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74330E000E;
	Fri, 25 Oct 2024 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMsFHAzz3BDIa3jh58A/QFESYBN3TOR1mtnE+yzOx0w=;
	b=jW/rDbNNQRKcrsbsAdlhr7jWig/EFkJMO35TA0TJke7gVLuzhro6aBBoNt4FNsedDi7D8f
	NLSG/NimUmXzDF4ELSjUr1B4q1dP4h+zFuWGS/IAXv+JCWq3njLtnArV+irE7ZbKSwuD5q
	IaYTtcfTeEFpQNSW3G9lmpKfRT4SgvgKYteCz52FM6EpRFSnBwNlAJDPYhAaSMkABXLLb0
	CMcsq3XREnkOAskbHG0QuLUPWVXeL62Kh6EsBv8tlgPMUJrKKq7BVnZ52cc3MiWpRLhYay
	SfxBLNS9o4di6wy0buYE/3aat5Ake/ETqdwiNlO+VdoSuq31ZJHCDW8OmUwwig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 06/24] spi: dw: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:43 +0200
Message-ID: <20241025161501.485684-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091512_025633_0705BEB4 
X-CRM114-Status: GOOD (  14.41  )
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
index 431788dd848c..3d49b1dbaed4 100644
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
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
