Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADECE7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3U2IN68xh0WoOJvPvt8nTX2EI50+/3tiM7xSMNawZg=; b=Z8oQ05bz6Vg/tg
	2QDfulboF0UhjdS5ypZrShKjn+LZPIbKdlLqG9EbsYhlcWo/xONNZieTWJHDYiTy3U9nqLYEa6Mje
	LvZTVTvfW13oRs1f/dd1ZSS0HA2NMhkTLrsxWSZI4gfa8Wxu+D6GEP7paTarcPsHOhAv2oTZDeVcO
	IZIfa8GchiHPhCHRG/n2ErUN6OocDGge8hd0NFLDUKGNojKXZkgv7MIS/FY4J9gm+qs4fuVQyy/f4
	fnKnt9jqfkLzIp0Nx+2fmiF7obb+d8xW4BxHBrjLh3pmJOTSMs93vdqRhkGTyKfk6eic98OlCVC+a
	W5RcZP8QrOrruvB9hHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8bR-0000000CS5Z-1ZEN;
	Tue, 24 Dec 2024 17:21:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8NR-0000000CMnv-1FcV;
	Tue, 24 Dec 2024 17:07:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E12540006;
	Tue, 24 Dec 2024 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lEtesl+ZX1jKYhDEYl+ivyiJHI5wxENJqdJo8H/qVyg=;
	b=DaW6nsGtxuL+VYTH1qyP+YcJ77RsDjocTmrTX77zhswDh2dpoPQ7dTfszm/J3jjEBRY5KB
	aooxCYrkpL4fX16VawH5/5KqUNJsk9aqS6BGmvbz6ObcpbsaFmYgLZQlEx+Bodnu5oWR3P
	KRIBVH9kiSLknUd3N6A1zOWiFvQJcEbXzqEt+ITzV+92bY3YGH7x1qw0+MyPohznFDJNlN
	GdNaNe4cJbRvKcA6QWHpdfUlnJpsIWl8PP66NbhgGyxBAfnD5YdxpCi8r3QWvEUomyv2XN
	hVZ22K0QC0AyukvmC4TpqJTrn8KHwL5hqbww3Eea1wOCIfneUyUkesAjY9jKHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:05:58 +0100
Subject: [PATCH v2 13/27] spi: rockchip-sfc: Support per spi-mem operation
 frequency switches
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-13-ad218dbc406f@bootlin.com>
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
X-CRM114-CacheID: sfid-20241224_090725_603986_D05A6D7E 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Haibo Chen <haibo.chen@nxp.com>
Cc: Yogesh Gaur <yogeshgaur.83@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-rockchip-sfc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 69d0f21755684a8a01724c29eb97123044dcf6ae..a8163fbc18923f8a96114785e46623476cf97d04 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -491,11 +491,11 @@ static int rockchip_sfc_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op
 	u32 len = op->data.nbytes;
 	int ret;
 
-	if (unlikely(mem->spi->max_speed_hz != sfc->frequency)) {
-		ret = clk_set_rate(sfc->clk, mem->spi->max_speed_hz);
+	if (unlikely(op->max_freq != sfc->frequency)) {
+		ret = clk_set_rate(sfc->clk, op->max_freq);
 		if (ret)
 			return ret;
-		sfc->frequency = mem->spi->max_speed_hz;
+		sfc->frequency = op->max_freq;
 		dev_dbg(sfc->dev, "set_freq=%dHz real_freq=%ldHz\n",
 			sfc->frequency, clk_get_rate(sfc->clk));
 	}
@@ -535,6 +535,10 @@ static const struct spi_controller_mem_ops rockchip_sfc_mem_ops = {
 	.adjust_op_size = rockchip_sfc_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps rockchip_sfc_mem_caps = {
+	.per_op_freq = true,
+};
+
 static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)
 {
 	struct rockchip_sfc *sfc = dev_id;
@@ -567,6 +571,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	host->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	host->mem_ops = &rockchip_sfc_mem_ops;
+	host->mem_caps = &rockchip_sfc_mem_caps;
 	host->dev.of_node = pdev->dev.of_node;
 	host->mode_bits = SPI_TX_QUAD | SPI_TX_DUAL | SPI_RX_QUAD | SPI_RX_DUAL;
 	host->max_speed_hz = SFC_MAX_SPEED;

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
