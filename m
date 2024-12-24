Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A32E7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9y6e+o2DQseORq0tu7lYbPvErO+X5L3hj1TjuonF2b4=; b=wWW27H2eQn/Ykl
	wTXK+n2ROqYRrxhxMDOWKTe768V6a+MSA5BSut4J6Pzw4dmfMoQt7xHvCec4KKgKZG/SNK8Fyfv7i
	JzPIqPKW3fgnD3OH5Z3jawIAjL3FS8Fg0jfQLcqPAn2W7pDbfYOpKEdAIymiSgypzCqSllxvzGBMT
	YhHs2/NXF/RlKj8EZdGLfVyzG0qBA+vq9CguG3lEjqE5pXwKgk0zNzAMYYG/nZrj8Sho9XtrdQYkl
	ttvNmPY5Z1Jd2AFcemhTOKTusxV6STbkmem7FVnJhQpVBXeOk6oZLm78wcBDZr0Dq52MIr7IxIXy2
	+NY5WShjA91YhPcOvFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8cc-0000000CSRc-0dKE;
	Tue, 24 Dec 2024 17:23:06 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8NW-0000000CMor-2LrM;
	Tue, 24 Dec 2024 17:07:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 855D640005;
	Tue, 24 Dec 2024 17:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOM20MlWPFKmxw5KkK0hLotjF6wgAi7LSWkedeOSHRU=;
	b=WEqy7wuq6RwMz+PAePa2DV0UWxNA0CjDFyyhPIa1ok9AYXUxtSOC5LaKKkX2kgjgZDZJff
	HE3uP6Iw/75aAKHbYo99Erji2n5j6ZaGIofgAqWasIkveKsnzJRP/DAYDmELBUwX5t2yRi
	BlSzXZrvixFO58BqCjd479+atWiy6dSink1AV0QWhBJZcoOp8O3VeO5gWwONxPYoxO3J1J
	Zw+6/wxJMELASkiOjTs1mg/wVULXVib/3zHvq1BEVhlXwbEb7bYdEdaMX2d5kiTlhQqM95
	FKq3UjonETDWNu0XJDW+rogVeCwX+eJW33u5+C5XScMnSSHgQX+cK3w8YCNUUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:05:59 +0100
Subject: [PATCH v2 14/27] spi: spi-sn-f-ospi: Support per spi-mem operation
 frequency switches
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-14-ad218dbc406f@bootlin.com>
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
X-CRM114-CacheID: sfid-20241224_090730_906860_6571B71E 
X-CRM114-Status: GOOD (  13.60  )
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
index adac645732fedfe6e33a5a0979ba43d5d203bfce..6ad4b729897e3909a5e22b33aa47b812219a6ee5 100644
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
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
