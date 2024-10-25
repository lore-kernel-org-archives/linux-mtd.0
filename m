Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F152D149C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4nzcByU7OmoIVYmUQ3Y9HUGQSw1UFU1d8iZWeeD1D0=; b=y7BNgwitY/qX1m
	d2JdqqZRcI1FVH0JtvVPN8FD0GVJflHyHCdi8Wm2YVcZlGVNrQLXJ3PeyF2rrnIK3dNLZ645sjxJu
	HIHRYINR0wzPvVjEkdEvC5cQt7u3/S4wbxKjqYj9YNLQRJAXNCVrCB6HRmqkOIvaQgYtcCEAHEOoB
	w3bma9c68ebhHuRXggDugw0TrMo47YUOaz3X3K4RLsyhekx2JA55DivrpPkHaGM1Gg4ZWJQNB/3Oe
	VCxgi8vrHoC2b0tbeuj90GKV5ayn2q3wVV/+tDo7blZ5/C8zX2qLdYO5tx/s7YsC4koXoI1VVPg1b
	jF+C184CzrN24zr5bveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3T-00000004PCY-2nXQ;
	Fri, 25 Oct 2024 16:20:51 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4My3-00000004Ncn-0KLz
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6E08E0006;
	Fri, 25 Oct 2024 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29SSgGVv0L/MV1x6zWKogOHokK9PmCL1QTWcSrPR3hQ=;
	b=E4rZAhmPb45D1L/mNCtcVFwR11sx7KLibzx0eg9qfXcKfDxOh21ZM6BUyn7mpoGmXDKxsK
	7Y8/N3GJLxjqB25Y7hQ1wpMi+drI6lVNbqzRqqd0UTiqn7HKLI6bS5finZZbkN8SotNxao
	HUpPTFGWJhrGH69wdzwm4rCK35JIl2pXSiOzAf1liwVPp0GrA4JmZ4WW16xBCZ8iGTwD2S
	bxGj+rCZgHyrvG0Hckj1bMVqUZnxYyLaix2b0ea0SEGzs02WB77jibaT6rzl4gIGSwrYZv
	jCRM5JRzJo8PVBAAMLaAGs2ZKLFqep5zARqeii1HtYGmjJ48YIz6b66yss9VPQ==
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
Subject: [PATCH 09/24] spi: mt65xx: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:46 +0200
Message-ID: <20241025161501.485684-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091515_459245_7BB45A4F 
X-CRM114-Status: GOOD (  13.40  )
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

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mt65xx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 36c2f52cd6b8..8b49d1acd73c 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -952,7 +952,7 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
 
 	mtk_spi_reset(mdata);
 	mtk_spi_hw_init(mem->spi->controller, mem->spi);
-	mtk_spi_prepare_transfer(mem->spi->controller, mem->spi->max_speed_hz);
+	mtk_spi_prepare_transfer(mem->spi->controller, op->max_freq);
 
 	reg_val = readl(mdata->base + SPI_CFG3_IPM_REG);
 	/* opcode byte len */
@@ -1113,6 +1113,10 @@ static const struct spi_controller_mem_ops mtk_spi_mem_ops = {
 	.exec_op = mtk_spi_mem_exec_op,
 };
 
+static const struct spi_controller_mem_caps mtk_spi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int mtk_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1151,6 +1155,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	if (mdata->dev_comp->ipm_design) {
 		mdata->dev = dev;
 		host->mem_ops = &mtk_spi_mem_ops;
+		host->mem_caps = &mtk_spi_mem_caps;
 		init_completion(&mdata->spimem_done);
 	}
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
