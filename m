Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87DFD149C7
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qnSPAkrebiVP9iNET+TNjdlhsAOq1Rzka4EEwx7oAg=; b=Hbgmdn1fNckfzu
	W1Tyvv0UYC+4ukzz4AJEhewn7d1gyNjCTe4ySL5LdzRo+kX4NMzmk8Nrc59+mG18TpXNurS5nMN1v
	TXvtothQN3B9zue2vGkf48UUTScR90ydlWBsUGpItylbP39uIM6pP218EPNzs+vpiqsdDRH2hqRdN
	/Qjc8INjplPgslLxpfsyM+67wPnnkKATZeyidip9msUg68+luU2+U+hJ3FkHme5IfTIG/cXEirxiz
	X3LfCXHCXiXvX5DMH3bicYhe3QsNgEKBKoIxhmif8ebF0fpex54Lwmc07vP0JjEoMff2ILURcTxra
	McRAVY4J0ogyInG+Zy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3W-00000004PEJ-1FVx;
	Fri, 25 Oct 2024 16:20:54 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4My7-00000004Nfr-2INV
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20218E0005;
	Fri, 25 Oct 2024 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4t+dl7gmNqGkztIaVCZ8ld2RWttPHaiN3Tjvzd9pcg=;
	b=nZ/w4Jbqp6BrAgG/r8hqYAPw+c7bcWRlFy+CBq9HHvWxggqA6d5bit1S9icyUqYYJeE4EN
	erjbUA1/EWNdr0h9vWxGzYfj1XH0El/gs+OFRSQzCp8TJrUQFfmlsbSyls6PfmUBEjzcUR
	0N2wJGbLQdgtvEzo/RJ2Ly1tZQWckRxdRivukVhPX4RLp/tneV6jQtEUIc2PpzAW6QNAxb
	aqbn3fE2xYJpfI6+Vhdj+SAmufA8GYiArzIH4qHNuPpEujCVaDeApcluhEKwwup5rG6Q/w
	Yp0CJYBHkedpgDOtKYN+Xtg3X/ljQILAjejMTHLfTyA1fWIivL/8D6A1fGQuqQ==
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
Subject: [PATCH 13/24] spi: spi-sn-f-ospi: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:50 +0200
Message-ID: <20241025161501.485684-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091520_006976_D5489C71 
X-CRM114-Status: GOOD (  13.93  )
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
 drivers/spi/spi-sn-f-ospi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index a7c3b3923b4a..6a999a103208 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -335,7 +335,6 @@ static void f_ospi_config_indir_protocol(struct f_ospi *ospi,
 static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 				   const struct spi_mem_op *op)
 {
-	struct spi_device *spi = mem->spi;
 	u32 irq_stat_en;
 	int ret;
 
@@ -343,7 +342,7 @@ static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 	if (ret)
 		return ret;
 
-	f_ospi_config_clk(ospi, spi->max_speed_hz);
+	f_ospi_config_clk(ospi, op->max_freq);
 
 	f_ospi_config_indir_protocol(ospi, mem, op);
 
@@ -577,6 +576,10 @@ static const struct spi_controller_mem_ops f_ospi_mem_ops = {
 	.exec_op = f_ospi_exec_op,
 };
 
+static const struct spi_controller_mem_caps f_ospi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int f_ospi_init(struct f_ospi *ospi)
 {
 	int ret;
@@ -614,6 +617,7 @@ static int f_ospi_probe(struct platform_device *pdev)
 		| SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL
 		| SPI_MODE_0 | SPI_MODE_1 | SPI_LSB_FIRST;
 	ctlr->mem_ops = &f_ospi_mem_ops;
+	ctlr->mem_caps = &f_ospi_mem_caps;
 	ctlr->bus_num = -1;
 	of_property_read_u32(dev->of_node, "num-cs", &num_cs);
 	if (num_cs > OSPI_NUM_CS) {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
