Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD8E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTcu8jNQcdtGACTHeVxBVCxLZrwLPKS1RweOKOwu18k=; b=W1VSSO0apx4LO4
	Af8cg+8CYMrgikyKHj7SAWHwp5UXmjy6ltH0tpNXPa0e+cvWhsrSRV4K6GooB1wRWd4qU7OntMwhF
	k4+y0RVcY5u35QHCey+ZOgc/yMiMKcWFAocqhx7UfaEVqmD8BTGgzRmChVWwXjiVX4Z95Arc4qejH
	qq/oDX6+QYQ5FjcFIvxDK/dCrN2wmxtmNSiKvfpK7cmJZJu6ZpOWv7+Ti5LpznChatBuZLhrajmrL
	a3IDmr/ANvXFEdn7MBfJpwRBsP7L9eAknT311dAyQx0z/PVA+yM0PDcKDj8+PT3HUmJn6Lz452FuY
	DhnDv4XhAyHr+yxANqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWITv-0000000GN6Q-0S53;
	Fri, 10 Jan 2025 17:07:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGR-0000000Fg9o-1qsQ;
	Fri, 10 Jan 2025 14:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dplhgiiMhu5lUlvijJ09whzPZ6kRkT4F5CXKBJnyGI0=; b=hylzPrYpz5E+MrZTYYAgQlAvss
	UWVPnvrcQo16Thk81FytKHY1S5bq6LJqmDQ6KiQ0uktQsIZ6sxqXyWLBafEW6Rq9WsI0ZDVvU4VuJ
	cskrAAYKIKHNmIUccZ6NSJBLSYowEEXJCrnCWGjY7nLMK/Edcp6/akVAnZ+nF1WvmlzIzZfA1XLu9
	mAaurBufOyPf8bFh54qwNVLVqTyURqS5z2ubmpXLd8kF7H8enipNdDrxUHk04yi3XTGPM36oy6FYx
	ILHjq+zM9po7rGap5njJkE0kVAs5HaHCs2nCdQDpFv34ZV69BQl9q1SRh0L1u6hp6we65Dyv/acuv
	Ddec+G3Q==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGO-00000009o9B-39jI;
	Fri, 10 Jan 2025 14:45:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27B4CFF806;
	Fri, 10 Jan 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dplhgiiMhu5lUlvijJ09whzPZ6kRkT4F5CXKBJnyGI0=;
	b=PY2OAUb0ukChGfwopJPw5yxfekY09UhFNW75L8Y7tCwOjbIbfVx7fo0Dswgyb3igQ6xWhr
	3KyjlDET81zaWtehYnsXqPAEAFxTno2n9VxbVL5HZxlK2K9XpNWSiPedwRBxRm7zeMIhPc
	kRfrPaNYzwOft0xCq53psN+wTMfxeiZ9rFS4rWpYCNwbYui5sqhxKr6ul+O48UTEGBkbhA
	ywmE8QaTOjhj02EdxOvBnfwTRIXYdWqzWVkC2TCA+J4LtSCzNl9vi/9WAtAXZUuxtHQL09
	pRZb7ONm8IPYsgXgZ0JPZheqTYnG+trhaiHP2Lucbg0X5Px7hoHuy6Y8p5GHdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:07 +0100
Subject: [PATCH v3 05/27] spi: amlogic-spifc-a1: Support per spi-mem
 operation frequency switches
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-5-7ab4bd56cf6e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250110_144528_952895_D7D757F9 
X-CRM114-Status: GOOD (  12.67  )
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
 drivers/spi/spi-amlogic-spifc-a1.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index fadf6667cd51c40a29749b378b82161a337edc62..18c9aa2cbc290d8ac179438ab42c27e1a722d422 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -259,7 +259,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 	size_t data_size = op->data.nbytes;
 	int ret;
 
-	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
+	ret = amlogic_spifc_a1_set_freq(spifc, op->max_freq);
 	if (ret)
 		return ret;
 
@@ -320,6 +320,10 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
 	.adjust_op_size = amlogic_spifc_a1_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps amlogic_spifc_a1_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int amlogic_spifc_a1_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctrl;
@@ -356,6 +360,7 @@ static int amlogic_spifc_a1_probe(struct platform_device *pdev)
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->auto_runtime_pm = true;
 	ctrl->mem_ops = &amlogic_spifc_a1_mem_ops;
+	ctrl->mem_caps = &amlogic_spifc_a1_mem_caps;
 	ctrl->min_speed_hz = SPIFC_A1_MIN_HZ;
 	ctrl->max_speed_hz = SPIFC_A1_MAX_HZ;
 	ctrl->mode_bits = (SPI_RX_DUAL | SPI_TX_DUAL |

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
