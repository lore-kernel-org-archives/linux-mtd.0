Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12490D149C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mQioxF1WpCZBqxj/b5d+mCyp/+H7O8OD5k5SRydA8Q=; b=TtgMTLcmzT6ew0
	1mEUG99noQzjyF1nh9Z4TCTtNd/P8cZsPIAE3JOlViXr9QBb7IowNxibSVBnwZUgd9w8viA6lfeqh
	Pn5L6dSik1j05AxjPnIVOAlD7S0Z6Owk+D1QaKO6xDiVMLKC58JViKx75gQjP5iUl9lComz5hlRMe
	5HCYVuj1exyWhVAnO6u4YMBJDHVbXo7ZhCIyyWZyr3Dq365Wtt5k8m4swKk7OX3yCnASH1L5UYMk3
	Q92NKtRoPXi/VKTDgAmTVprLcIpShWfexYxE6DjTJpiQIMFSuso5CL3fCkd4CZpji9578njeJNZrl
	8Lpq/mwoofrykkifwDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N16-00000004OOH-1p4t;
	Fri, 25 Oct 2024 16:18:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxy-00000004NZq-3nWR
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D3BCE000D;
	Fri, 25 Oct 2024 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYK6G3Uspykcq9GsoHcgs9KWx8g7DS/IoXmWj78hfcQ=;
	b=kJFG5rf6Rl23MrFRsruvJA05T6GGbMRR2QX4iOj3B6uYXL7roopN42y5lJm0lB7v4N9aXQ
	sDZf3FjR7s5ugcD+d6RUnHIfFJrfdkzr+Y8vvLyS04cg8f6erULdLMV8USedGaUatpcJeN
	wmUYD3usPmkXWXhxb9xBGctoNiCzTozixdpi6FmuymZeG3wF5QfkLxzmr7asup93ePCL8e
	3N5GGT5s5xdto0rQhbF3tsnD/7KDonyaYGv6PPKvvWn/MZ3YDfQTEilUaI4d0UnsaCfpgf
	OC1EJdjTzKT8wDWZyC/Ht19mQrTAotZx+mJrm7ZU0WBGe3YiK0LbW9fmRo+y8w==
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
Subject: [PATCH 05/24] spi: cadence-qspi: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:42 +0200
Message-ID: <20241025161501.485684-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091511_128535_51F2D844 
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
 drivers/spi/spi-cadence-quadspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 05ebb03d319f..d285c7698291 100644
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
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
