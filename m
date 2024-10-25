Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA7D149C3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWYPMhV+3SBiF84+9pfetOdo0elAiVDu4R1QjVaPkzs=; b=Kjeck0j36H5pKD
	J0eg/6UiWVgnOOJMXUX12U8Ns8PJZ53ka1Zjk5LoNnw0vV5ipHHGXEXe+DfmGXppROwYg9rBDzdnf
	mCbvbJU2MRcbt7vMiXEvJwGBbln3PZaHh2Q149eyZjO6Ze9vsnTSHC7OqMKrLIGEXubSsy0D6AFI+
	+Tc0lcBoVDdvhH+9GpxbZirnn3SZ6gTr86PSa5IJfu76OvCN1nVj3HJnWNFB8N4wndOHbRIewq2/M
	dhEV+BT/a63IfUIaLRIqO4W/pdHbk65pIB2u6TwA2oqsk9X5Sc6bZ/Dnw2LaqIbeMv/vTvR1zOmty
	2bTACzUVovTHzHqeAOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N14-00000004ONM-3cCs;
	Fri, 25 Oct 2024 16:18:22 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxw-00000004NYQ-49hh
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B20CE000B;
	Fri, 25 Oct 2024 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFZxVOQ/r2YDg2GASorm7X58OaIx5nLZNYaGkN8S2hc=;
	b=bWifIWNMGhOzm/vMfquwTP7zgxTdpFHHCGeukY0hX9SxG1MuhfWxvEIC8k5BoOilU9QWrn
	QYwmIYE/M+nG2XFKL9eOODTy6soZKqxDU0b5PNDUMZ3lmqTy7WznG9DbbAZGGbLpQd/6mb
	GbNO6PJmlteeJYQBmsRvzGvNRflNotrRyO8xCvT9F8CfgrWpBmuJldPWPzzG+SBU+ErODE
	YHZ3dD9w2hvAdtSI67yfr3rTHSkfHMnFjqwGgtQfQqlI36D2gyjhdwEExyw8bJtzWCpRkd
	jQ54uw40l9n8uUgujgc/zsEt8+XNoMJUpivN6vh+pLmlJynydOK/WZXiRAjLXg==
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
Subject: [PATCH 03/24] spi: amd: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:40 +0200
Message-ID: <20241025161501.485684-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091509_417770_B20594F1 
X-CRM114-Status: GOOD (  14.08  )
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

This controller however performed a frequency check, which is also
observed during the ->check_op() phase.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Cc: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index 2245ad54b03a..f58dc6375582 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -368,6 +368,9 @@ static bool amd_spi_supports_op(struct spi_mem *mem,
 	    op->data.buswidth > 1 || op->data.nbytes > AMD_SPI_MAX_DATA)
 		return false;
 
+	if (op->max_freq < AMD_SPI_MIN_HZ)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 
@@ -443,7 +446,7 @@ static int amd_spi_exec_mem_op(struct spi_mem *mem,
 
 	amd_spi = spi_controller_get_devdata(mem->spi->controller);
 
-	ret = amd_set_spi_freq(amd_spi, mem->spi->max_speed_hz);
+	ret = amd_set_spi_freq(amd_spi, op->max_freq);
 	if (ret)
 		return ret;
 
@@ -469,6 +472,10 @@ static const struct spi_controller_mem_ops amd_spi_mem_ops = {
 	.supports_op = amd_spi_supports_op,
 };
 
+static const struct spi_controller_mem_caps amd_spi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int amd_spi_host_transfer(struct spi_controller *host,
 				   struct spi_message *msg)
 {
@@ -521,6 +528,7 @@ static int amd_spi_probe(struct platform_device *pdev)
 	host->setup = amd_spi_host_setup;
 	host->transfer_one_message = amd_spi_host_transfer;
 	host->mem_ops = &amd_spi_mem_ops;
+	host->mem_caps = &amd_spi_mem_caps;
 	host->max_transfer_size = amd_spi_max_transfer_size;
 	host->max_message_size = amd_spi_max_transfer_size;
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
