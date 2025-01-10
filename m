Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3193EE7719D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDDrhaFMrXIaodOOWpuYTwKBjzFOerYk5Vb+4f4vKik=; b=pjaFvOqgb+DZkb
	nOOv0wo835NUvEElksr8xsBpN5wK3Zynf6/59iurnmEi7IBha+jrOydEuATYCnWxsjuVGtrm3vGkp
	cFymNcm+egmKw8rI9KLhRd7g6izcIrC2ibIKb6es+dcfr/xZATEj9GaBill8DhuN++TZZXRDl56f0
	IcP9zOj/U4gsdRd9ZCePjvYDOsLGGw2Wa1YauUqtnq3bRnQdUa1eokhX8lXemfVKwuDJHjdRZDE3o
	JPHO04AwDMvqK/K0RcImXXkz6XPZbkVjneX7Gq0rSCqBoO7mZxuMz96KKJjUn0y8VgsX8/HGzBvi1
	3MV6ozNDpt309VpWLbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGOk-0000000Fjcx-0adM;
	Fri, 10 Jan 2025 14:54:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGT-0000000FgAy-2kw9;
	Fri, 10 Jan 2025 14:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GhS+zZ6UEvQnr62N11JkbnpzTV68YUYjNDNf+0QneiY=; b=lQCAq9tmaytHfOHgUX7SuJdgZx
	/LnNuCJkNHOMw/vzBqA7L9TTkfkqG4fIxOPBQ4PA9xTBGE5fEh5f5kuJmZ/PuVnre8xx602RzNrRZ
	XZlxizMkz/SWvD7GHynYcZj/us9xFi0Lug620NHgf+CoE3tN7MPLUxqQ9/VzPVvhSBMoGfg7/EII9
	OzMnGV/8n7A69Wzl0hVMpdCZOQJuV5WJQ5PrWbvmExTq2InxBlUSAa/soPG5BMa+BSeQEHrfIppC7
	wfcuBgSgdchnwgwknKL6/2B+ip1hls5jyTBhyxAaN0Yedn5BdCSMrNPgUkEXvCBBQ/ZH7XGjm5JbC
	h1QVGPlw==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGQ-00000009o9j-3Udn;
	Fri, 10 Jan 2025 14:45:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECB1FFF812;
	Fri, 10 Jan 2025 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhS+zZ6UEvQnr62N11JkbnpzTV68YUYjNDNf+0QneiY=;
	b=LcezGNMPmEnw05xTEbkoOqdWGVZTokjwKVxahZCCZYKJPefI99KZ3Q6ehj8wqwo01LJl7Q
	yWvp6KrH23P/i9dd6Zgz6QKQ1JO1/MVVUujAnmIeUVZgI5ajoDdAEwuD24R/+SNjpdm0Q0
	F9hPlOkcptS67DxjsLwX0YK9QESO2iEABXsiA0VMSsSlzQPG2eRqYGCLuE4t64XHgg9u+a
	+kmfkCT66Ic3A5wtJ9gdKRm75Cs6k7x3W8CLB6niIFsVyVAQsZ7gNEMCs2H1jsvPRIY1B9
	pNQWQjXfmJigrQaQ5Icv9N/sJL2lswHWdq01UE/cfefcQ9Mvc04XE3M5eaZSuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:08 +0100
Subject: [PATCH v3 06/27] spi: cadence-qspi: Support per spi-mem operation
 frequency switches
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-6-7ab4bd56cf6e@bootlin.com>
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
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_144531_200391_33783019 
X-CRM114-Status: GOOD (  13.10  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 0b45b7b2b3ab30951d94ea2ce57dcba3a2600847..e4862163252ed35053f743c74f1175e033940b17 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1407,7 +1407,7 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 	struct cqspi_flash_pdata *f_pdata;
 
 	f_pdata = &cqspi->f_pdata[spi_get_chipselect(mem->spi, 0)];
-	cqspi_configure(f_pdata, mem->spi->max_speed_hz);
+	cqspi_configure(f_pdata, op->max_freq);
 
 	if (op->data.dir == SPI_MEM_DATA_IN && op->data.buf.in) {
 	/*
@@ -1655,6 +1655,7 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
+	.per_op_freq = true,
 };
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi)

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
